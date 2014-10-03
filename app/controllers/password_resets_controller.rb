class PasswordResetsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user
      user.generate_password_reset_token!
      Notifier.password_reset(user).deliver
      flash[:success] = "Password reset instructions sent! Please check your email."
      redirect_to login_path
    else
      flash.now[:notice] = "Email not found."
      render action: 'new'
    end
  end

  def edit
    @user = User.find_by(password_reset_token: params[:id])
    if @user

    else
      render file: 'public/404.html', status: :not_found
    end
  end

  def update
    @user = User.find_by(password_reset_token: params[:id])
    if @user && @user.update_attributes(user_params)
      @user.update_attribute(:password_reset_token, nil)
      session[:user_id] = @user.id
      redirect_to todo_lists_path, success: "Password updated."
    else
      flash.now[:notice] = "Password reset token not found."
      render action: 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
