Swagger::Docs::Config.register_apis({
    "1.0" => {
      # the extension used for the API
      :api_extension_type => :json,
      # the output location where your .json files are written to
      :api_file_path => "public/api/",
      # the URL base path to your API
      :base_path => "http://localhost:3000",
      # if you want to delete all .json files at each generation
      :clean_directory => false,
      # Ability to setup base controller for each api version. Api::V1::SomeController for example.
      :parent_controller => Api::ApplicationController,
      # add custom attributes to api-docs
      :attributes => {
        :info => {
          "title" => "API Fastbilling",
          "description" => "Api utilizada para la comunicación con la aplicación android.",
          "termsOfServiceUrl" => "",
          "contact" => "",
          "license" => "",
          "licenseUrl" => ""
        }
      }
    }
  })