class V1::ApplicationController < ApplicationController

  protect_from_forgery with: :null_session

  def authenticate_api_user!
    if request.headers['X-User-Email'] and request.headers['X-User-Token']
      email = request.headers['X-User-Email']
      token = request.headers['X-User-Token']
      user = User.find_by_email(email)
      if user != nil
        if user.token != token
          render json: {
                     error: 'Authentication Failed'
                 }
        end
      else
        render json: {
                   error: 'Authentication Failed'
               }
      end
    else
      render json: {
                 error: 'Authentication Failed'
             }
    end
  end

end