class Usuario < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  acts_as_token_authenticatable

  belongs_to :perfil
  has_one :empleado
	validates :email, uniqueness: {message: "Nombre de usuario ya se encuentra registrado"}

  def ensure_authentication_token
    if authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end

   def reset_authentication_token!
     self.authentication_token = generate_authentication_token
     self.save
   end

  private
  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless Usuario.where(authentication_token: token).first
    end
  end

end
