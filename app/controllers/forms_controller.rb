class FormsController < ApplicationController


  def new_coder
    @coder = HTMLEntities.new
  end

  helper_method :new_coder

  def new
    render :layout => false
  end

  def create

   @form = Form.new(params[:header])
     if @form.save
       redirect_to edit_form_url(@form.id)
     else
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
