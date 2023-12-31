class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:create]

    def create 
        Rails.logger.debug "Received params: #{params.inspect}"
        user = User.new(user_params)
        if user.save
            render json: { status: 'User created successfully'}, status: :created
        else
            render json: { errors: user.errors.full_messages}, status: :bad_request
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end
