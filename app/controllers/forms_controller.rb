class FormsController < ApplicationController


  def new
    render :layout => false
  end

  def create


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

  def destroy

    @form = Form.find(params[:id])
    # @user = @form.owner_id
    if @form.destroy
      redirect_to new_user_form_url(current_user.id)
    else
      fail
    end
  end


  def update
    @input_params = params[:field].reject{|k,v| v==""}

    @input_params[:form_id] = params[:id]

    @entry = Entry.new(@input_params)

    if @entry.save
      redirect_to edit_form_url(params[:id])
    else
      fail
    end
  end

end
