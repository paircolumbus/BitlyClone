require 'digest'

class UsersController < ApplicationController

	def index
		@users = User.all
	end

  def generate_salt(length=64)
    
    alphabet = ('a'..'z').to_a + ('0'..'9').to_a
    alphabel_length = alphabet.count
    salt = ''
    
    length.times do
      char = alphabet[rand(alphabel_length)]
      salt += char
    end
    
    salt
  
  end

  def create
    
    chosen_username = params[:username]
    chosen_password = params[:password]

    if chosen_password != params[:password_confirmation]
      flash[:signup_error] = "Confirmation password didn't match"
      render :login
      return
    end

    # check if a user already exists with that username
    username_taken = User.exists?(['username = ?', chosen_username])

    if username_taken
      flash[:signup_error] = "The username #{chosen_username} is already taken"
      render :login
      return
    end

    user = User.new
    user.username = chosen_username
    user.salt = generate_salt
    user.password_hash = Digest::SHA256.hexdigest(chosen_password + user.salt)
    user.is_admin = false # a user can be only made an admin by the dba
    
    if user.save
      session[:user] = user
    else
      flash[:signup_error] = "Could not create new user"
      render :login
    end

  end

  def logout
    reset_session
  end

  def show_login_signup
    render :login
  end

  def login
    
    if login_user(params[:username], params[:password])
      redirect_to(:controller => 'urls', :action => 'index')
      return  
    else
      flash[:login_error] = 'Invalid username and password combination!'
      redirect_to(:action => 'show_login_signup')
      return
    end

  end

  def login_user(username, password)
    
    user = User.where(:username => username).first
    
    if !user
      return false
    end

    hash = Digest::SHA256.hexdigest(password + user.salt)

    if hash == user.password_hash
      session[:user] = user
      return true
    else
      return false
    end

  end

end
