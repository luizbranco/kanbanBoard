<% if @issue.errors.any? %>
  $('div#form ul#error_messages').remove()
  $('div#form').prepend("<%= escape_javascript(render :partial => 'shared/error_messages', :locals => {:object => @issue}) %>")
<% else %>
  $('div#form').dialog('close')
  $("<%= user_story_item %>").fadeOut 'fast', ->
    user_story = $("<%= escape_javascript(render(:partial => 'user_stories/user_story', :locals => { :user_story => @user_story, :project => @project })) %>").hide()
    $(this).replaceWith(user_story)
    $(user_story).fadeIn('fast')
<% end %>
