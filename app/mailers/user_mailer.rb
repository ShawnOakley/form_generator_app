class UserMailer < ActionMailer::Base
  default from: "shawn@example.com"
  add_template_helper(SessionsHelper)

  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(address: 'localhost', to: user.user_email, subject: 'Welcome to My Awesome Site')
  end

  def rendered_email(user, form)
    @user = user
    @form = form
    @url  = 'http://example.com/login'
    mail(address: 'localhost', to: user.user_email, subject: 'Here is your rendered form')
  end

  def code_email(user, form)
    @user = user
    @form = form
    @url  = 'http://example.com/login'
    mail(address: 'localhost', to: user.user_email, subject: 'Here is your code')
  end

  def both_email(user, form)
    @user = user
    @form = form
    @url  = 'http://example.com/login'
    mail(address: 'localhost', to: user.user_email, subject: 'Here is both the form and the code')
  end

end
