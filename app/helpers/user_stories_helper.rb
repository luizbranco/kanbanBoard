module UserStoriesHelper

  def highlight_user_story(text)
    highlighter = '<mark>\1</mark>'
    matchers = [/(In order to)/, /(As an?)/, /(I want to)/]
    matchers.each do |matcher|
      text.gsub!(matcher, highlighter)
    end
    simple_format(text, {},:sanitize => false)
  end

  # For AJAX CRUD

  def status_list
    "td#status_#{@user_story.status.id} ul"
  end

  def user_story_item
    "li#user_story_#{@user_story.id}"
  end

end
