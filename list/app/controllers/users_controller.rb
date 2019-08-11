class UsersController < ApplicationController

  layout false

  def new
    @user = User.new
  end

  def create

    puts "Creating User"

    @user = User.new(user_params)

    if @user.save
      redirect_to(:controller => 'public', :action => 'sign_in')
    else
      render('new')
    end

    # If username already exists then render create_account with username already exists error
    # If username is empty or isn't alphanumeric render create_account with username invalid error
    # If password empty or contains non-alphanumeric characters then render create_account with invalid password error
    # If email is invalid render create_account with invalid email error ???
    # User.create(:variable => field)
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
