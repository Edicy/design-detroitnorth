<div id="news">{% for article in site.latest_articles limit:1 %}&nbsp;
  <h1>{{"news"|lc}}</h1>
    <table>
      {% for article in site.latest_4_articles %}
        <tr>
          <td class="first">{{ article.created_at | date:"%d.%m" }}</td>
          <td><a href="{{ article.url }}" class="newslink">{{ article.title }}</a></td>
        </tr>
      {% endfor %}
      <!-- tr>
        <td></td>
        <td><a href="{{site_path}}/blog">{{ "older_news" |lc }}</a></td>
      </tr -->
    </table>
      {% endfor %}
</div> <!-- //news -->