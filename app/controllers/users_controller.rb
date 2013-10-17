class UsersController < ApplicationController
  before_filter :require_current_user!, :except => [:create, :new]


  def create
    @user = params[:user] ? User.new(params[:user]) : User.new_guest

    if @user.save
        self.current_user.move_to(@user) if current_user && @user.guest
        UserMailer.welcome_email(@user).deliver unless @user.guest
        session[:session_token] = @user.session_token
        redirect_to user_url(@user), notice: "Signed up Sucessfully"
    else
      flash[:error] = @user.errors.full_messages
      redirect_to new_session_url
    end
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(self.current_user.id)
  end
end
