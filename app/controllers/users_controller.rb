class UsersController < ApplicationController
  before_action :logged_in_user
  before_action :load_user
  before_action :correct_user

  def show; end

  def edit; end

  def update
    if @user.update_attributes user_params
      flash[:success] = t "update_successfully"
      redirect_to @user
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end

  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    render file: "public/404.html", status: :not_found, layout: false
  end

  def correct_user
    return if current_user.admin? || current_user?(@user)
    flash[:danger] = t "access_denied"
    redirect_to root_url
  end
end
