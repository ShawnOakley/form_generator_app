module SessionsHelper


  # CURRENT USER SECTION

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

  def generate_style(color_identifier, layout_identifier)
    "<style type='text/css'>" + color_translate(color_identifier) + layout_translate(layout_identifier) + "</style>"
  end

  def generate_header(header)

    " <head id='header' class='info class='export-style-color-header export-style-layout-header'>
#{generate_style(header.color_css, header.layout_css)}
</head>
<h2>#{header.form_name}</h2>
<div>#{header.description}</div>
<form id='form' name='#{header.form_name}' class='top page' autocomplete='off' enctype='multipart/form-data' method='post' novalidate action='#{header.target_site}'>"

  end



# PARSING FORM TAG SECTION


  def generate_choice(value)

    "<input type='text' class='select_tag_multiple check_box_tag select_tag' name='field[collection][]' value='#{value}'>
      <button class='delete-button' type='button'>Delete this choice</button>"

  end

  def generate_submit

    '<input type="submit" class="submit-button">
    </form>'

  end

  def collection_parse(input_header)

      @choices = input_header[3][:options]['collection'].flatten.reject { |val| val=="" || val==" "}


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

  def parse_checkboxes(input_header, options)

    #parse checkbox data and adds divs to group them together.  Calls send on form_for builder once parameters are in the correct format


    input_header[2] = input_header[2]+"[]"
    concat "<div class='checkboxes'>".html_safe

    @collection = input_header[3][:options]["collection"][0]

    @display_rows = input_header[3][:options]["display_rows"].first.to_i

    @break_count = @collection.size/(@display_rows + 1)


    @collection.each_with_index do |item, index|

      concat send(:label, item, item.to_s)
      concat send(input_header[0], input_header[2], item, false, id:(item+'_'+item))

      concat "<br>".html_safe if ((index+1) % (@break_count+1)==0)


    end

    concat "</div>".html_safe
  end


  def parse_multiple_choice(input_header, options)

    # parses multiple choice data. Calls send on form_for builder once parameters are in the correct format

    input_header[0] = 'select_tag'
    input_header[2] = input_header[2]+"[]"
    input_header[3][:options][:multiple] = true;

    concat send(input_header[0], input_header[2], raw(collection_parse(input_header)), options)

  end

  def parse_select(input_header, options)

    #parses select box data. Calls send on form_for builder once parameters are in the correct format

    input_header[2] = input_header[2]+"[]"

    concat send(input_header[0], input_header[2], raw(collection_parse(input_header)), options)

  end



  def form_gen(form_info_hash)

    # Designed to generate a form based on parameterized tag values
    # Still need to make the header creation dynamic.  Should probably abstract that into another helper method.

    capture do
      form_tag("/search", :method => "get") do |f|

        @form_check = form_info_hash


          input_header = fetch_header_info(form_info_hash)

          add_options_hash(input_header, form_info_hash)
          options = input_header.size > 3 ? input_header[3][:options] : {}

          options["class"] = options["klass"] unless options["klass"].nil?

        unless options['class'].nil?
          options["class"][0] = options["class"][0].concat(" #{input_header[0]}-css")
          options.delete("klass")
        end

        if (input_header.first == "check_box_tag")

          parse_checkboxes(input_header, options)

        elsif (input_header.first == "select_tag_multiple")

          parse_multiple_choice(input_header, options)

        elsif (input_header.first == "select_tag")

          parse_select(input_header, options)

        else

          concat send(input_header[0], nil, input_header[2], options)

        end
      end
    end
  end

  def html_to_input_params(entries)
    entries.to_json
  end


  # STYLE TAG GENERATION SECTION



  def color_translate(color_identifier)
      case color_identifier
        when "color1"
        ".export-style-color-li{
          background-color: #49A8A8;
        }

        .export-style-color-header{
          background-color: #49A8A8;
        }

        .export-style-color-ul{
          background-color: #5772AF;
          padding:10px;
          border-radius:25px;
          border: 2px solid black;
        }
        "
      when "color2"
        ".export-style-color-li{
          background-color: #B4A381;
        }

        .export-style-color-header{
            background-color: #B4A381;
          }

        .export-style-color-ul{
          background-color: #694242;
          padding:10px;
          border-radius:25px;
          border: 2px solid black;
        }
        "
      when "color3"
        ".export-style-color-li{
          background-color: #9D74A1;
        }

        .export-style-color-header{
          background-color: #9D74A1;
        }

        .export-style-color-ul{
          background-color: #5C3946;
          padding:10px;
          border-radius:25px;
          border: 2px solid black;
        }
        "
      when "color4"
        ".export-style-color-li{
          background-color: #E8C5B1;
        }

        .export-style-color-header{
                background-color: #E8C5B1;
              }

        .export-style-color-ul{
          background-color: #5E8B7F;
          padding:10px;
          border-radius:25px;
          border: 2px solid black;
        }
        "
      when "color5"
        ".export-style-color-li{
          background-color: #FFFEFE;
        }

        .export-style-color-header{
                background-color: #FFFEFE;
              }

        .export-style-color-ul{
          background-color: #000000;
          padding:10px;
          border-radius:25px;
          border: 2px solid black;
        }
        "
      when "color6"
        ".export-style-color-li{
          background-color: #FFF9F9;
        }

        .export-style-color-header{
                background-color: #FFF9F9;
        }

        .export-style-color-ul{
          background-color: #292323;
          padding:10px;
          border-radius:25px;
          border: 2px solid black;
        }
        "
      else
          ""
    end

  end

  def layout_translate(layout_identifier)

      case layout_identifier
      when "layout1"

      ".export-style-layout-header {
        text-align: center;
        font-family: 'Raleway', Helvetica, Arial, sans-serif;
        text-decoration: underline;
        border-radius: 25px;
        padding: 5px 0;
        border: 2px solid black;
      }

      .export-style-layout-ul {
        padding-top: 15px 0;
        border: 2px solid black;
        border-radius: 10px 10px;
      }


      .export-style-layout-li {
        list-style:none;
        padding:10px;
        border-bottom: 2px solid black;
        font-family: 'Goudy Bookletter 1911', Georgia, Times, serif;
      }"

    when "layout2"

      ".export-style-layout-header {
        font-family: 'Allerta', Helvetica, Arial, sans-serif;
        padding-bottom: 20px;
        padding-top:10px;
        border: 1px solid black;
        float:right;
        width:30%;
        height:auto;
        border-radius: 10px 10px;
        text-align:center;
      }

      .export-style-layout-ul {
        padding: 10px;
        border: 2px solid black;
        border-radius: 10px 10px;
        width:auto;
      }


      .export-style-layout-li {
        list-style:none;
        padding:10px;
        border-bottom: 2px solid black;
        font-family: 'Crimson Text', Georgia, Times, serif;
        width:auto;
        float:left;
        }"

    when "layout3"

      ".export-style-layout-header {
        font-family: 'Allan', Helvetica, Arial, sans-serif;
        border-radius: 25px;
        padding: 5px 0;
        border: 2px solid black;
        text-decoration: underline;
        width:30%;
        height:380px;
        padding:5px;
        margin-top:10px;
        padding-bottom:auto;
      }

      .export-style-layout-ul {
        border: 2px solid black;
        border-radius: 10px 10px;
        height:100%;
        width:55%;
        padding: 0 5px;
        padding-bottom:auto;
        padding-top:auto;
      }


      .export-style-layout-li {
        list-style:none;
        padding:10px;
        border-bottom: 2px solid black;
        font-family: 'Cardo', Georgia, Times, serif;
      }"

    when "layout4"

      ".export-style-layout-header {
        font-family: 'Molengo', Georgia, Times, serif;;
        border-radius: 25px;
        padding: 5px 0;
        border: 2px solid black;
        text-decoration: underline;
        float:right;
        clear:both;
        width:30%;
        height:380px;
        clear:left;
        padding:5px;
        margin-top:10px;
        padding-bottom:auto;
      }

      .export-style-layout-ul {
        border: 2px solid black;
        border-radius: 10px 10px;

        height:100%;
        width:55%;
        padding: 0 5px;
        padding-bottom:auto;
        padding-top:auto;
      }


      .export-style-layout-li {
        list-style:none;
        padding:10px;
        border-bottom: 2px solid black;
        font-family: 'Lekton', Helvetica, Arial, sans-serif;
      }"

    when "layout5"

      ".export-style-layout-header {
        font-family: 'Allerta', Helvetica, Arial, sans-serif;
        width:50%;
        height:80px;
        text-align:center;
        position:relative;
        top:120px;
        padding-right:20px;
        padding-left:20px;
        padding-bottom:20px;
        border-bottom: 1px solid black;
        border-right: 1px solid black;
        border-top: 1px solid black;
        margin-right: 20px;

      }

      .export-style-layout-ul {
        width:90%;
        padding-top:20%;

      }


      .export-style-layout-li {
        list-style:none;
        border-bottom: 2px solid black;
        font-family: 'Crimson Text', Georgia, Times, serif;
        width:auto;

      }"

    else
      ""
    end
end

end
