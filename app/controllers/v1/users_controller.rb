class V1::UsersController < V1::ApplicationController

  def login
    user = User.find_by_email(params[:user][:email])
    if user and user.valid_password?(params[:user][:password])
      user.update(token: SecureRandom.hex(10))
      render json: {
                 user: {
                     email: user.email,
                     token: user.token
                 }
             }
    else
      render json: {
                 error: 'Authentication Failed'
             }
    end
  end

end