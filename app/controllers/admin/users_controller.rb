class Admin::UsersController < Admin::BaseController
  before_action :load_user, only: :destroy

  def index
    @users = User.sort_created_desc.paginate page: params[:page],
      per_page: Settings.user_per_page
  end

  def new
    @user = User.new
  end

  def create
    password = SecureRandom.urlsafe_base64(4)

    params[:user][:role] = params[:user][:role].to_i
    @user = User.new user_params
    @user.password = password
    @user.password_confirmation = password

    if @user.save
      @user.send_account_info_email @user
      flash[:success] = t "create_successfully"
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = t "delete_successfully"
    else
      flash.now[:danger] = t "error_message"
    end
    redirect_to admin_users_path
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :role, :password,
      :password_confirmation
  end
end
