class SessionsController < ApplicationController
  before_action :not_logged_in, only: :new

  def new; end

  def create
    user = User.find_by email: params[:session][:email].downcase

    if user&.authenticate(params[:session][:password])
      log_in user
      redirect_to root_url
    else
      flash.now[:danger] = t "invalid_email_or_password"
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

  private

  def not_logged_in
    return unless logged_in?
    flash[:danger] = t "already_logged_in"
    redirect_to root_url
  end
end
