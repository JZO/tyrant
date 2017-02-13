require 'reform'
require 'reform/form/dry'

module Tyrant::Contract
  class GetEmail < Reform::Form 
    feature Reform::Form::Dry

    property :email, virtual: true

    validation do
      configure do
        option :form
        config.messages_file = Config.error_messages_path

        def user_exists?
          return User.find_by(email: form.email) != nil
        end
      end
      required(:email).filled

      validate(user_exists?: :email) do
        user_exists?
      end
    end
  end
end