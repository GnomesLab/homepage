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

  # Generates a top menu navigation link based on the current request, as well as the defined routes.
  #
  # TODO: refactor
  def top_menu_link(destination = :home)
    text = destination.to_s.humanize.capitalize
    route_name = destination == :home ? :root.to_s : destination.to_s
    dispatcher_route = Rails.application.routes.routes.select { |route| route.name.to_s == route_name }.first
    path = dispatcher_route.path.gsub(/\(.:format\)/, '')

    if params[:controller] == (destination == :contact ? 'enquiries' : destination.to_s) ||
        params[:controller] == 'static_pages' && params[:action] == destination.to_s ||
          params[:controller] == (destination == :blog ? 'posts' : destination.to_s)
      link_to text, path, :class => 'active'
    else
      link_to text, path
    end
  end
end
