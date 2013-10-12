class UsersController < ApplicationController
  before_filter :require_current_user!, :except => [:create, :new]

  def create
    @user = params[:user] ? User.new(params[:user]) : User.new_guest

    if @user.save
      self.current_user.move_to(@user) if current_user && current.user.guest
      session[:user_id] = @user.id
      redirect_to user_url(@user)
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
