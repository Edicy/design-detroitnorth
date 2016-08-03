<div id="news">
  {% if site.has_articles? %}
    <h1>{{ "news" | lc }}</h1>

    <table>
      {% for article in site.latest_4_articles %}
        <tr>
          <td class="first">{{ article.created_at | date: "%d.%m" }}</td>
          <td><a href="{{ article.url }}" class="newslink">{{ article.title }}</a></td>
        </tr>
      {% endfor %}
    </table>
  {% endif %}
</div> <!-- //news -->
