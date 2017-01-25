require 'reform'
require 'reform/form/dry'

module Tyrant::Contract
  class GetEmail < Reform::Form 
    feature Reform::Form::Dry

    property :email, virtual: true

    validation do
      configure do
        option :form
        config.messages_file = 'lib/config/error_messages.yml'

        def user_exists?
          return User.where(email: form.email).size == 1
        end
      end
      required(:email).filled

      validate(user_exists?: :email) do
        user_exists?
      end
    end
  end
end