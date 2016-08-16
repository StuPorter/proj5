class ScoresController < ApplicationController
  
  get '/?' do
    @message = "Sign Up"
    @page_title = "Divot - Register"
    erb :score
  end
end
