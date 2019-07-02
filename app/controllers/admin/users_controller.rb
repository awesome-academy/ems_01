class Admin::UsersController < Admin::BaseController
  def destroy; end

  def new
    @user = User.new
  end

  def create
    password = SecureRandom.urlsafe_base64(4)

    @user = User.new user_params
    @user.password = password
    @user.password_confirmation = password
    @user.role = 1 if params[:role] == "supervisor"

    if @user.save
      flash[:success] = t "create_successfully"
      redirect_to root_path
    else
      render :new
    end
  end

  def index; end

  private

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end
end
