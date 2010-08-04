module NavigationHelpers

  def path_to(page_name)
    case page_name
    when /the home\s?page/
      root_path
    when /the blog\s?page/
      root_path # FIXME: posts_path
    when /^(.*) profile section$/i
      "#{about_us_path}##{$1.downcase.split.join('_')}"
    when /the about page/
      about_us_path
    when /the view post page/
      post_path(Post.first)
    when /the login page/
      new_user_session_path
    else

      begin
        page_name =~ /the (.*) page/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue Object => e
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end # path_to

end # NavigationHelpers

World(NavigationHelpers)
