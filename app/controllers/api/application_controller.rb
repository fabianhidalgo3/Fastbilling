class Api::ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session, :if => Proc.new { |c| c.request.format == 'application/json' }

  before_action :authenticate_user_from_token!
  acts_as_token_authentication_handler_for Usuario

  # Apply strong_parameters filtering before CanCan authorization
  # See https://github.com/ryanb/cancan/issues/571#issuecomment-10753675
  before_action do
    resource = controller_name.singularize.to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end

  private
    def authenticate_user_from_token!
        user_email = params[:user_email].presence
        user       = user_email && Usuario.find_by_email(user_email)

        # Notice how we use Devise.secure_compare to compare the token
        # in the database with the token given in the params, mitigating
        # timing attacks.
        if user && Devise.secure_compare(user.authentication_token, params[:user_token])
            sign_in user, store: false

        #else
        #    respond_to do |format|
        #        msg = { :status => "error", :message => "Token invalido" }
        #        format.json  { render :json => msg } # don't do msg.to_json
        #    end
        end
    end

end
