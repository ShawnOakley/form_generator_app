class EntriesController < ApplicationController

  def destroy
    @entry = Entry.find(params[:id])
    @form_id = @entry.form_id
    if @entry.destroy
      redirect_to edit_form_url(@form_id)
    else
      fail
    end
  end
end
