class UserMailer < ApplicationMailer
  def new_user_account user
    @email = user.email
    @password = user.password
    mail to: @email, subject: t(".new_user_account_subject")
  end
end
