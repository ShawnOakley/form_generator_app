class FormsController < ApplicationController


  def new
    render :layout => false
  end

  def create

    params[:header][:owner_id] = current_user.id

   @form = Form.new(params[:header])
     if @form.save
       render @form
     else
      fail
    end
  end
end
