class UsersController < ApplicationController
  

  #
  # GET /users/
  ####
  get '/?' do
    # Return list of all users
    users = User.all 

    if users 
      users.to_json
    else 
      { status: "error", message: "error loading users"}
    end
  end

  #
  # POST /users/
  ######
  post '/?' do
    user = User.find_by username: params["username"]
    if user 
      @message = "username already exists"
      @page_title = "Divot - Register"
      erb :register
    else
      if params["password"] != params['password_confirmation']
        @message = "password fields do not match"
        @page_title = "Divot - Register"
        erb :register
      else 
         # Create new user
        password = BCrypt::Password.create(params["password"])
        p '-----------------------------------------'
        p params
        p '-----------------------------------------'
        user = User.create username: params["username"], password: password, fullname: params["fullname"], email: params["email"], homecourse: params["homecourse"], img: params["img"]
        if user 
          # if user created, save user to session, render the profile page
          session[:is_logged_in] = true
          session[:user_id] = user.id
          # @page_title = "Divot - Profile"
          # @message = "new user created"
          # erb :profile
          redirect '/'
        else
          # { status: "error", message: "could not create user"}.to_json
          @message = "could not create user"
          @page_title = "Divot - Register"
          erb :register
        end
      end
    end 
  end
end
