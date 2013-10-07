class FormsController < ApplicationController


  def new
    render :layout => false
  end

  def create

    params[:header][:owner_id] = current_user.id

   @form = Form.new(params[:header])
     if @form.save

       redirect_to edit_form_url(@form.id)
     else
      fail
    end
  end

  def edit
    render :layout => false

  end
end
