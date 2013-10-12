class UserMailer < ActionMailer::Base
  default from: "shawn@example.com"

  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(address: 'localhost', to: user.user_email, subject: 'Welcome to My Awesome Site')
  end

  def reminder_email(user)

  end
end
