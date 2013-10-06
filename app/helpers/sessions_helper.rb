module SessionsHelper

  def current_user=(user)
    @current_user = user
    session[:session_token] = user.session_token
  end

  def current_user
    User.find_by_session_token(session[:session_token])
  end

  def logout_current_user!
    current_user.reset_session_token!
    session[:session_token] = nil
  end

  def require_current_user!
    redirect_to new_session_url if current_user.nil?
  end




  def form_gen(form_info)
    # Designed to generate a form based on parameterized tag values
    # Still need to make the header creation dynamic.  Should probably abstract that into another helper method.
    capture do
      form_tag("/search", :method => "get") do |f|
        form_info.each do |form_info_hash|
          # input_header_array = form_info_hash.select do |k,v|
          #   {k,v}
          # end
          input_header = []
          input_header << form_info_hash.shift
          input_header << form_info_hash.shift
          input_header << form_info_hash.shift
          input_header_array = input_header.map{ |pair| Hash[*pair].values }.flatten
          concat send(input_header_array[0], input_header_array[1], input_header_array[2])
          # concat html{size: "24x6"}
        # concat password_field_tag(:password, "test")
        # concat hidden_field_tag(:parent_id, "5")
        # concat search_field(:user, :name)
        # concat telephone_field(:user, :phone)
        # concat url_field(:user, :homepage)
        # concat email_field(:user, :address)
        concat submit_tag("Submit")
        end
      end
    end
  end
end
