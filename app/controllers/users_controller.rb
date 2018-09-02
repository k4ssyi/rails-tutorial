class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)    # 実装は終わっていないことに注意!
    if @user.save # => Validation
      flash[:success] = "Welcome to the Sample App !"
      redirect_to @user
                  # => user_url(@user)
                  # => user_url(@user.id)
                  # => "/users/#{@user.id}"
    else
      render 'new'
    end
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :password,
                    :password_confirmation)
  end
end
