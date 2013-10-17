class FormsController < ApplicationController

  def new

  end

  def create
    @form = Form.new(params[:header])
    @header_text = generate_header(@form)
    @form[:header_text] = @header_text
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

  end

  def destroy
    @form = Form.find(params[:id])
    @form.destroy
    respond_to do |format|
        format.json {redirect_to user_forms_url(current_user.id)}
        format.html {redirect_to user_forms_url(current_user.id)}
      end
  end

  def index
  end

  def update

    unless params[:form].nil?
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
    redirect_to user_forms_url(current_user.id)
  end

  def rendered_mail()
    @form = Form.find(params[:form_id])
    @user = User.find(@form.owner_id)
    UserMailer.rendered_email(@user, @form).deliver
    redirect_to user_forms_url(current_user.id)
  end

  def code_mail()
    @form = Form.find(params[:form_id])
    @user = User.find(@form.owner_id)
    UserMailer.code_email(@user, @form).deliver
    redirect_to user_forms_url(current_user.id)
  end


  #The following two methods assist in creating targetted mass mailings.  The first redirects to the input page.  The second takes the user's input and creates the mass mailing.

  def email_input
    @form = Form.find(params[:form_id])
  end

  # Uses a regex to check for valid email addresses.  Returns an error message if any of the addresses are invalid and notifies user of invalid addresses.  Otherwise parses the text and sends to all listed users.

  def targetted_mail()
    @additional_info = [params[:subject_line], params[:additional_text]]
    @email_array = params[:email_list].split(' ')
    @valid_emails = @email_array.select{|string| string =~ /^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/}
    @invalid_emails = @email_array.reject{|string| string =~ /^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/}

    if @email_array.size > @valid_emails.size
      flash[:error] = "The following email addresses are invalid:" + @invalid_emails.to_s
      redirect_to form_email_input_url(params[:form_id])
    elsif @email_array.size == 0
      flash[:error] = "Please enter email recipients."
      redirect_to form_email_input_url(params[:form_id])
    else
      @form = Form.find(params[:form_id])
      @user = User.find(@form.owner_id)
      UserMailer.targetted_email(@user, @form, @email_array, @additional_info).deliver
      redirect_to user_forms_url(current_user.id)
    end
  end



end
