class UsersController < ApplicationController
  before_filter :require_current_user!, :except => [:create, :new]

  def create
    @user = User.new(params[:user])

    if @user.save
      self.current_user = @user
      redirect_to user_url(@user)
    else
      flash[:error] = "Username already taken."
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
