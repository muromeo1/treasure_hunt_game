module Api
  module V1
    class UsersController < ApplicationController
      skip_before_action :authorize, only: %i[create authenticate]

      def create
        result = Users::Create.call(user_params)

        if result.success?
          render_json(status: 'ok', token: result.token)
        else
          render_json(status: 'error', description: result.error)
        end
      end

      def authenticate
        result = Users::Authenticate.call(user_params)

        if result.success?
          render_json(status: 'ok', token: result.token)
        else
          render_json(status: 'error', description: result.error)
        end
      end

      private

      def user_params
        params.permit(
          :name,
          :email,
          :password,
          :password_confirmation
        )
      end
    end
  end
end
