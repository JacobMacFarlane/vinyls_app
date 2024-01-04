class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:create, :destroy]

    def create
        user = User.find_by(email: params[:email])
    
        if user&.authenticate(params[:password])
          session[:user_id] = user.id  # Store user ID in session
          render json: { message: 'Logged in successfully', user_info: "#{user.username} vinyls" }
        else
          render json: { error: 'Invalid email or password' }, status: :unauthorized
        end
    end

    def destroy
        # Implement logout logic
        # For example, if you're storing the user's ID in the session:
        session.delete(:user_id)
        session[:user_id] = nil  # Clear the session
        render json: { message: 'Logged out successfully' }
      end
end
