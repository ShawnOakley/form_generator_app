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

  def direct_tag_conversion(value_hash_array)
    '<' + value_hash_array.map{|k, v| "#{k} = '#{v}'"}.join(' ') + '>'
    #NOTE, chain additional forms on the end for other tags (e.g., styling, buttons)
  end

  def generate_header(header)
    "<!DOCTYPE html><html><head> <title>#{header.form_name}</title><meta charset='utf-8'><form id='form' name='#{header.form_name}' class='top page' autocomplete='off' enctype='multipart/form-data' method='post' novalidate action='#{header.target_url}'> <header id='header' class='info'>
<h2>#{header.form_name}</h2>
<div>#{header.description}</div>
</header>"

  end

  def form_gen(form_info_hash)

     # options = options_for_select([['Lisbon', 1], ['Madrid', 2], 2])
     # collection  = collection_select("name", "id", options, "id", 'x')
     #
     # fail
    #
    # string = direct_tag_conversion(form_info)

    # return string.html_safe

    # Designed to generate a form based on parameterized tag values
    # Still need to make the header creation dynamic.  Should probably abstract that into another helper method.
    capture do
      form_tag("/search", :method => "get") do |f|

        @form_check = form_info_hash

          input_header = []
          input_header << form_info_hash.fetch("input_tag_type")
          form_info_hash.delete("input_tag_type")
          input_header << form_info_hash.fetch("id")
          form_info_hash.delete("id")
          input_header << form_info_hash.fetch("name")
          form_info_hash.delete("name")
          # input_header_array = input_header.map{ |pair| Hash[*pair].values }.flatten
          options_hash = {}
          options_hash[:options] = []
          form_info_hash.size.times{options_hash[:options] << form_info_hash.shift}

          options_hash[:options].map!{|pair| Hash[pair[0], [pair[1]]]}.join
          options_hash[:options] = options_hash[:options].reduce (:merge)
          input_header << options_hash



          # concat label_tag(input_header[1] + '_' + input_header[2], input_header[0])
          options = input_header.size > 3 ? input_header[3][:options] : {}
          concat send(input_header[0], input_header[1], input_header[2], options)


    #
    #     # concat password_field_tag(:password, "test")
    #     # concat hidden_field_tag(:parent_id, "5")
    #     # concat search_field(:user, :name)
    #     # concat telephone_field(:user, :phone)
    #     # concat url_field(:user, :homepage)
    #     # concat email_field(:user, :address)

                concat submit_tag("Submit")
      end
    end
  end
end
