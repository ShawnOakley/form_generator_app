module StyleHelper

  # STYLE TAG GENERATION SECTION

  def color_translate(color_identifier)
      case color_identifier
        when "Color 1"
        ".export-style-color-li{background-color: #49A8A8;}

        .export-style-color-header{background-color: #49A8A8;}

        .export-style-color-ul{
        background-color: #5772AF;
        padding:10px;
        border: 2px solid black;
        }"

      when "Color 2"
        ".export-style-color-li{
          background-color: #B4A381;
        }

        .export-style-color-header{
            background-color: #B4A381;
          }

        .export-style-color-ul{
          background-color: #694242;
          padding:10px;
          border: 2px solid black;
        }
        "
      when "Color 3"
        ".export-style-color-li{
          background-color: #9D74A1;
        }

        .export-style-color-header{
          background-color: #9D74A1;
        }

        .export-style-color-ul{
          background-color: #5C3946;
          padding:10px;
          border: 2px solid black;
        }
        "
      when "Color 4"
        ".export-style-color-li{
          background-color: #E8C5B1;
        }

        .export-style-color-header{
          background-color: #E8C5B1;
        }

        .export-style-color-ul{
          background-color: #5E8B7F;
          padding:10px;
          border: 2px solid black;
        }
        "
      when "Color 5"
        ".export-style-color-li{
          background-color: #FFFEFE;
        }

        .export-style-color-header{
                background-color: #FFFEFE;
              }

        .export-style-color-ul{
          background-color: silver;
          padding:10px;
          border: 2px solid black;
        }
        "
      when "Clear Color"
        ".export-style-color-li{
          background-color: #FFF9F9;
        }

        .export-style-color-header{
          background-color: #FFF9F9;
        }

        .export-style-color-ul{
          background-color: #292323;
          padding:10px;
          border: 2px solid black;
        }
        "
      else
          ""
    end

  end

  def layout_translate(layout_identifier)

      case layout_identifier
      when "Layout 1"

      ".export-style-layout-header {
        font-family: 'Raleway', Helvetica, Arial, sans-serif;
        text-align: center;
        border: 2px solid black;
        width:100%;
      }

      .export-style-layout-ul {
        padding-top: 15px 0;
        border: 2px solid black;
      }


      .export-style-layout-li {
        list-style:none;
        padding:10px;
        border-bottom: 2px solid black;
        font-family: 'Goudy Bookletter 1911', Georgia, Times, serif;
      }"

    when "Layout 2"

      ".export-style-layout-header {
        font-family: 'Allerta', Helvetica, Arial, sans-serif;
        text-align: center;
        border: 2px solid black;
        width:100%;
      }

      .export-style-layout-ul {
        padding-top: 15px 0;
        border: 2px solid black;
      }


      .export-style-layout-li {
        font-family: 'Crimson Text', Georgia, Times, serif;
        list-style:none;
        padding:10px;
        border-bottom: 2px solid black;
        }"

    when "Layout 3"

      ".export-style-layout-header {
        font-family: 'Allan', Helvetica, Arial, sans-serif;
        text-align: center;
        border: 2px solid black;
        width:100%s
      }

      .export-style-layout-ul {
        padding-top: 15px 0;
        border: 2px solid black;
      }


      .export-style-layout-li {
        font-family: 'Cardo', Georgia, Times, serif;
        list-style:none;
        padding:10px;
        border-bottom: 2px solid black;
      }"

    when "Layout 4"

      ".export-style-layout-header {
        font-family: 'Molengo', Georgia, Times, serif;;
        text-align: center;
        border: 2px solid black;
        width:100%;
      }

      .export-style-layout-ul {
        padding-top: 15px 0;
        border: 2px solid black;
      }


      .export-style-layout-li {
        font-family: 'Lekton', Helvetica, Arial, sans-serif;
        list-style:none;
        padding:10px;
        border-bottom: 2px solid black;
      }"

    when "Clear Layout"

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