module ApplicationHelper
  # Sets the page title variable
  def title(title = nil, append_company = false)
    @title = title.present? ? title.to_s : 'Gnomeslab'
    @title << ' | Gnomeslab' if append_company
    @title
  end

  # Returns the content page title for a given text as a raw html string.
  #
  # Note: If the provided title is not HTML safe you will endanger the site's security!
  def content_title(title)
    raw("<h2 class='border'>#{title}</h2>")
  end
end
