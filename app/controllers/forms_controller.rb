class FormsController < ApplicationController

  def new
    render :layout => false
  end

  def create
    @form = Form.new(params[:header])
    @header_text = generate_header(@form)
    @form.header_text = @header_text
    @closing_text = generate_submit

    @form.closing_text = @closing_text

     if @form.save
       redirect_to edit_form_url(@form.id)
     else
       flash[:error] = "Fail saved!"
       redirect_to new_user_form_url(current_user.id)
    end
  end

  def edit
    render :layout => false
  end

  def destroy
    @form = Form.find(params[:id])
    @form.destroy
    respond_to do |format|
        format.json {redirect_to "/users/#{current_user.id}/forms/new"}
        format.html {redirect_to "/users/#{current_user.id}/forms/new"}
      end
  end

  def index
    render :layout => false
  end

  def update

    unless params[:form][:color_css].nil?
      params["header"] = {}
      params["header"][:color_css] = params[:form][:color_css]
    end

    unless params[:form][:layout_css].nil?
      if params["header"].nil?
        params["header"] = {}
      end
      params["header"][:layout_css] = params[:form][:layout_css]
    end

    @form = Form.find(params[:id])

    if @form.update_attributes(params["header"])
      redirect_to edit_form_url(params[:id])
    else
      flash[:error] = "Fail saved!"
      redirect_to edit_form_url(params[:id])
    end
  end

  # The following three methods makes calls to ActionMailer, creating the three types of emails users can generate for themselves.

  def both_mail()
    @form = Form.find(params[:form_id])
    @user = User.find(@form.owner_id)
    UserMailer.both_email(@user, @form).deliver
    redirect_to new_user_form_url(current_user.id)
  end

  def rendered_mail()
    @form = Form.find(params[:form_id])
    @user = User.find(@form.owner_id)
    UserMailer.rendered_email(@user, @form).deliver
    redirect_to new_user_form_url(current_user.id)
  end

  def code_mail()
    @form = Form.find(params[:form_id])
    @user = User.find(@form.owner_id)
    UserMailer.code_email(@user, @form).deliver
    redirect_to new_user_form_url(current_user.id)
  end



end
