<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
{% include "SiteHeader" %}
</head>

<body{% if editmode %} class="editmode"{% endif %}>

	<div id="wrap">

   {% include "Languagemenu" %}

    <div id="container">

      <div id="header">

        {% include "Mainmenu" %}
        {% include "Search" %}

      </div> <!-- //header -->

      {% include "submenu" %}

      <div id="content">

        <div id="content_left">

          <div id="slogan">
            <table>
              <tr>
                <td class="clearfix">
                   {% editable site.header %}

                </td>
              </tr>
            </table>
          </div> <!-- //slogan -->

          <div id="content_left_inner">
            <div id="content_left_inner2" class="clearfix" data-search-indexing-allowed="true">
            {% content %}
            </div>
          </div> <!-- //content_left_inner -->

        </div> <!-- //content_left -->

        <div id="content_right" class="clearfix">

          {% include "News" %}


          <div id="darkbox">

            <div id="darkbox_inner">
              <div id="darkbox_inner2" class="clearfix">
              {% content name="product" xpage="true" %}
              </div>
            </div> <!-- //darkbox_inner -->

            <div id="blackbox">
                    <div id="blackbox_inner" class="clearfix">
                    {% content name="product-inner" xpage="true" %}
              </div>
            </div> <!-- //blackbox -->
          </div> <!-- //darkbox -->

        </div> <!-- //content_right -->

        <div class="clearer"></div>

      </div> <!-- //content -->

    </div> <!-- //container -->

  </div> <!-- //wrap -->

  <div id="footer">

    <div id="footer_inner" class="clearfix">{% content name="footer" xpage="true" %}</div>

    <div id="edicy">
      {% loginblock %}{{ "footer_login_link" | lc }}{% endloginblock %}
    </div>

  </div> <!-- //footer -->
  {% include "JS" %}
</body>
</html>
