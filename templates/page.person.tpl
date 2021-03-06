{% extends "base.tpl" %}

{% block content %}
  
  <h1>{{ id.title }}</h1>
  
  <p class="summary">
    {{ id.summary }}
  </p>
  
  {{ id.body|show_media }}

  <p>
    {% if id.is_me %}
      {% button text=_"Create a new Project" 
         action={dialog_open title=_"Create Project" template="_dialog_create_project.tpl" target="projects"} 
      %}
    {% endif %}
    <br />
  </p>  

  <p>
    <h2>Projects</h2>
    <ul id="projects">
      {% for p in id.s.project_member %}
        {% include "_project_list_entry.tpl" id=p %}
      {% empty %}
        {{ id.title }} is not a member of any projects.
      {% endfor %}
    </ul>
  </p>   
{% endblock %}
