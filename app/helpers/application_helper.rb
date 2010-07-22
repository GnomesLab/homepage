module ApplicationHelper
  # Returns the content page title for a given text as a raw html string.
  #
  # Note: If the provided title is not HTML safe you will endanger the site's security!
  def content_title(title)
    raw("<h2 class='border'>#{title}</h2>")
  end
end
