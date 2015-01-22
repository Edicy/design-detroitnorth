<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="{{ page.language_code }}" lang="{{ page.language_code }}">

<head>
{% include "SiteHeader" %}
{{ blog.rss_link }}
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
            <div id="content_left_inner2" class="clearfix">
            <div class="blog clearfix">

              <div class="blog_heading">
                <h1>{% editable article.title plain="true" %} <span>{{ article.created_at | format_date:"short" }}</span></h1>
                <span>
                  <span>{{ article.author.name }}</span> &nbsp;
                </span>

                <div class="clearer"></div>
              </div>
              <div class="excerpt" data-search-indexing-allowed="true">{% editable article.excerpt %}</div>
              <div style="padding-top:5px" data-search-indexing-allowed="true">
              {% editable article.body %}

              {% if editmode %}
                <div class="article-tags" data-search-indexing-allowed="false">
                    <div class="article-tag-icon"></div>
                    {% editable article.tags %}
                </div>
              {% else %}
                {% unless article.tags == empty %}
                    <div class="cfx article-tags" data-search-indexing-allowed="false">
                        <div class="article-tag-icon"></div>
                        {% for tag in article.tags %}
                            <a href="{{ article.page.url }}/tagged/{{ tag.path }}">{{ tag.name }}</a>{% unless forloop.last %}, {% endunless %}
                        {% endfor %}
                    </div>
                {% endunless %}
            {% endif %}

              </div>
              <div class="comment">
{% unless article.new_record? %}
                <a name="comments"></a>
                <h1>{{"comments_for_count"|lc}}: <span class="edy-site-blog-comments-count">{{ article.comments_count }}</span></h1>

{% endunless %}
{% for comment in article.comments %}



                  <div class="comment_inner edy-site-blog-comment">
                    {{ comment.body_html }}
                    <br />
                    <span><span>{{ comment.author }}</span> &nbsp;|&nbsp; <span>{{ comment.created_at | format_date:"long" }}</span></span>{% removebutton %}
                  </div> <!-- //comment_inner -->



{% endfor %}
</div> <!-- //comment -->

               {% commentform %}
{% unless comment.valid? %}<ul>
{% for error in comment.errors %}
<li>{{ error | lc }}</li>
{% endfor %}
</ul>{% endunless %}
               <div>
                    <h2>{{"add_a_comment"|lc}}</h2>

                    <table>
                      <tr>
                        <td style="width: 90px;">{{"name"|lc}}:</td>
                        <td><input type="text" name="comment[author]" class="textbox" value="{{comment.author}}" /></td>
                        <td style="text-align: right;">{{"email"|lc}}: &nbsp;&nbsp;&nbsp;</td>
                        <td class="form_td_input" style="width: 131px;"><input type="text" name="comment[author_email]" class="textbox" value="{{comment.author_email}}" /></td>
                      </tr>
                    </table>
                    <table>
                      <tr>
                        <td style="vertical-align: top; width: 90px;">{{"comment"|lc}}:</td>

                      <td class="form_td_textarea" ><textarea
cols="20" name="comment[body]"
rows="5">{{comment.body}}</textarea></td>
                      </tr>
                      <tr>

                      <td colspan="2" style="text-align:
right;"><input type="submit" class="submit"
value="{{"submit"|lc}}" /></td>
                      </tr>
                    </table>
                </div>
              {% endcommentform %}
            </div> <!-- //blog -->
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
