class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create

    puts "Creating User"

    @user = User.new(user_params)
    @user.default_lists << DefaultList.create(:name => @user.username)

    if @user.save
      redirect_to(:controller => 'public', :action => 'sign_in')
    else
      render('new')
    end

    # If username already exists then render create_account with username already exists error
    # If username is empty or isn't alphanumeric render create_account with username invalid error
    # If password empty or contains non-alphanumeric characters then render create_account with invalid password error
    # If email is invalid render create_account with invalid email error ???
  end

  def login
    user = User.find_by_email(params[:email])

    if(user)
      if(user.password === params[:password])
        redirect_to( user_path(user) )
      else
        redirect_to(:controller => 'public', :action => 'sign_in', :error => 'p')
      end
    else
      redirect_to(:controller => 'public', :action => 'sign_in', :error => 'e')
    end
  end

  def show
    @new_item = ListItem.new
    @list_items = User.find(params[:id]).default_lists[0].list_items
    @list_name = User.find(params[:id]).default_lists[0].name
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
