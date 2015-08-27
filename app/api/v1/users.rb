module V1
  class Users < Grape::API
  include V1::Defaults
  version 'v1'
  format :json

    resources :users do
      desc "Create new user"
      params do 
        requires :name, :type => String, :desc => "Username"
        requires :email, :type => String, :desc => "Email"
        requires :password, :type => String, :desc => "Password"
        requires :password_confirmation, :type => String, :desc => "Password Confirmation"
      end
      
      post do
        name = params[:name]
        email = params[:email]
        password = params[:password]
        password_confirmation = params[:password_confirmation]

        user = User.new(name: name, email: email, password: password, password_confirmation: password_confirmation)

        if !user.valid?
          error!({:error_code => 404, :error_message => user.errors.messages}, 401)
          return
        else
          new_user = user.save

          status(200)
          {
            status: 'User created successfully',
            user: user
          }
        end
      end
    end
  end
end