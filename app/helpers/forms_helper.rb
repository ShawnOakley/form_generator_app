module FormsHelper

  def generate_form(form)

    @form = form
    @html_string = ""

    @html_string += generate_header(@form).html_safe
    @html_string += '<br>'.html_safe

    @form.entries.each do |entry|

      @html_string +=  "<li>".html_safe

      @label = entry.as_json["label"]

      @html_string += @label.html_safe
      @html_string += "<br>".html_safe
      @html_string += ("Instructions for " + (@label || "this entry") + ": " + entry.as_json["instructions"] + "<br>").html_safe
        @form_hash  = entry.as_json.reject {|k,v| v==nil}.reject{|k,v| k=="created_at" || k=="updated_at" || k=="instructions" }

      @html_string += (strip_nested_form_tags(form_gen(@form_hash)) + "</li>").html_safe

    end

    @html_string += @form.closing_text.html_safe

    @html_string

  end

  def direct_tag_conversion(value_hash_array)
    '<' + value_hash_array.map{|k, v| "#{k} = '#{v}'"}.join(' ') + '>'
    #NOTE, chain additional forms on the end for other tags (e.g., styling, buttons).  Currently not used, but could be useful as a helper method.
  end

  def generate_style(color_identifier, layout_identifier)
    "<style type='text/css'>" + color_translate(color_identifier) + layout_translate(layout_identifier) + "</style>"
  end

  def generate_header(header)

    # Generates standard header text for form

    " <head id='header' class='info class='export-style-color-header export-style-layout-header'>#{generate_style(header.color_css, header.layout_css)}</head><h2>#{header.form_name}</h2><div>#{header.description}</div><form id='form' name='#{header.form_name}' class='top page' autocomplete='off' enctype='multipart/form-data' method='post' novalidate action='#{header.target_site}'>"

  end



# PARSING FORM TAG SECTION


  def generate_choice(value)

    # Generates choice html for dynamic addition/deletion of choices

"<input type='text' class='select_tag_multiple check_box_tag select_tag' name='field[collection][]' value='#{value}'><button class='delete-button' type='button'>Delete this choice</button>"

  end

  def generate_submit

    # Generates submit tag for insertion into form

'<input type="submit" class="submit-button"></form>'

  end

  def collection_parse(input_header)

    # Formats multiple-choice/select options

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

  def strip_nested_form_tags(input_text)

    # strips nested form tags so that individual entry components can be integrated into form

    input_text.gsub!(/<form>/,"")
    input_text.gsub!(/<form accept-charset="UTF-8" action="\/search" method="get">/, "")
    input_text.gsub!(/<\/form>/, "")


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

end
