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
        format.json { redirect_to "/users/#{current_user.id}/forms/new" }
        format.html {redirect_to "/users/#{current_user.id}/forms/new"}
      end
  end



  def index

  end


  def update

    @form = Form.find(params[:id])


    if @form.update_attributes(params["header"])
      redirect_to edit_form_url(params[:id])
    else
      flash[:error] = "Fail saved!"
      redirect_to edit_form_url(params[:id])
    end
  end

end
