class UserMailer < ActionMailer::Base
  default from: "rystakei@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup_confirmation.subject
  #
  def signup_confirmation(user)
    @user = user
    mail(:to => "#{@user.name} <#{@user.email}>", :subject => "Welcome to Ativa! | MakerSquare")
  end

  def admin_confirmation(potential_admin)
    @potential_admin = potential_admin
    @generated_number = potential_admin.generated_number
    mail(:to => "#{@potential_admin.email}", :subject => "Welcome to Ativa! | MakerSquare. You are a potential admin") 
  end
end
