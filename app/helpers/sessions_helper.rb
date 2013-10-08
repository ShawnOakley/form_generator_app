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

  def collection_parse(input_header)

    @choices = input_header[3][:options]['collection'].flatten.reject { |val| val=="" }

    @text_string = @choices.map { |choice| '<option>' + choice.to_s + '</option>' }.join('')



  end

  def fetch_header_info(form_info_hash)

    # Fetches input_tag_type, id, and name from info_hash, stores them in proper format for send call to input_tag_type, deletes from form_info_hash so that it can later be processed for use as an options_hash

    input_header = []

    input_header << form_info_hash.fetch("input_tag_type")
    input_header << form_info_hash.fetch("id")
    input_header << form_info_hash.fetch("name")

    form_info_hash.delete("input_tag_type")
    form_info_hash.delete("id")
    form_info_hash.delete("name")

    input_header

  end

  def add_options_hash(input_header, form_info_hash)

    #parses form_info_hash for options values, stores them all in a single hash and places them in input header

    options_hash = {}
    options_hash[:options] = []
    form_info_hash.size.times{options_hash[:options] << form_info_hash.shift}

    options_hash[:options].map!{|pair| Hash[pair[0], [pair[1]]]}.join
    options_hash[:options] = options_hash[:options].reduce (:merge)
    input_header << options_hash

  end

  def form_gen(form_info_hash)

    # Designed to generate a form based on parameterized tag values
    # Still need to make the header creation dynamic.  Should probably abstract that into another helper method.

    capture do
      form_tag("/search", :method => "get") do |f|

        @form_check = form_info_hash

          input_header = fetch_header_info(form_info_hash)

          # input_header_array = input_header.map{ |pair| Hash[*pair].values }.flatten

          add_options_hash(input_header, form_info_hash)

          # concat label_tag(input_header["label"])
          options = input_header.size > 3 ? input_header[3][:options] : {}

          if input_header.first == "select_tag"
            concat send(input_header[0], input_header[2], raw(collection_parse(input_header)), options)
          else

            # NOTE:  Need to fix how this parses id and name
            concat send(input_header[0], nil, input_header[2], options)
          end

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
