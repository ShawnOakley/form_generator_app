class UserMailer < ActionMailer::Base
  default from: "shawnoakley@gmail.com"
  add_template_helper(SessionsHelper)
  add_template_helper(FormsHelper)
  add_template_helper(StyleHelper)
  include SendGrid

  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: user.user_email, subject: 'Welcome to My Awesome Site')
  end

  def rendered_email(user, form)
    @user = user
    @form = form
    @url  = 'http://example.com/login'
    mail(to: user.user_email, subject: 'Here is your rendered form')
  end

  def code_email(user, form)
    @user = user
    @form = form
    @url  = 'http://example.com/login'
    mail(to: user.user_email, subject: 'Here is your code')
  end

  def both_email(user, form)
    @user = user
    @form = form
    @url  = 'http://example.com/login'
    mail(to: user.user_email, subject: 'Here is both the form and the code')
  end

  def targetted_email(user, form, targets, additional_info)
    @additional_info = additional_info
    @user = user
    @form = form
    @url = 'http://example.com/login'
    fail
    targets.each do |target|
    mail(to: target, subject: additional_info[0].nil? ? "Please take a moment to fill out the attached form" : additional_info[0])
    end
  end

end
