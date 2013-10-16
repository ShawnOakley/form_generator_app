class EntriesController < ApplicationController

  def destroy
    @entry = Entry.find(params[:id])
    @form_id = @entry.form_id

    respond_to do |format|
      if @entry.destroy
        format.html { redirect_to edit_form_url(@form_id) }
        format.json { head :ok}
      else
        format.html { redirect_to edit_form_url(@form_id), notice: "Delete Unsuccessfuly" }
        format.json { render json: @entry.errors }
      end
    end
  end

  def edit

    @entry = Entry.find(params[:id])

  end

  def update

    @entry = Entry.find(params[:id])


    if @entry.update_attributes(params["field"])
      flash[:message] = "Update saved!"
      redirect_to edit_form_url(@entry.form_id)
    else
      flash[:error] = "Save failed!"
      redirect_to edit_form_url(params[:id])
    end
  end





  def create
    params["field"]["collection"].reject!{|v| v=="" || v==" "}
    @input_params = params["field"].reject{|k,v| v=="" || v==" " || v.empty?}

    @input_params[:form_id] = params[:form_id]

    @input_params.each{|k,v| @input_params[k] = v.html_safe if v.class.to_s != "Array"}


    @entry = Entry.new(@input_params)


    if @entry.save
      redirect_to edit_form_url(params['form_id'])
    else
      flash[:parameter_error] = "Entry save failed!"
      redirect_to edit_form_url(params['form_id'])
    end
  end

end
