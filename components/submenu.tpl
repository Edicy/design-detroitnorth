{% for item in site.all_menuitems %}
	{% if item.selected? %}
  {% if editmode %}
   <ul id="submenu">
   {% for level2 in item.visible_children %}
    <li><a href="{{ level2.url }}"{% unless level2.translated? %} class="untranslated fci-editor-menuadd"{% endunless %}{% if level2.selected? %} class="active"{% endif %}>{{ level2.title }}</a></li>
   {% endfor %}
   <li>{% menubtn item.hidden_children %}</li>     
   <li>{% menuadd parent="item" %}</li>
  </ul>
  {% else %}
   {% if item.children? %}
    <ul id="submenu">
    {% for level2 in item.children %}
     <li><a href="{{ level2.url }}"{% if level2.selected? %} class="active"{% endif %}>{{ level2.title }}</a></li>
    {% endfor %}
    </ul>
   {% endif %}
  {% endif %}
	{% endif %}
{% endfor %}