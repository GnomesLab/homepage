# encoding: UTF-8

module NavigationHelpers

  def path_to(page_name)
    case page_name
    when /the home\s?page/
      root_path
    when /the blog\s?page/
      blog_path
    when /^(.*) profile section$/i
      "#{about_us_path}##{$1.downcase.split.join('_')}"
    when /the about page/
      about_us_path
    when /the view post page/
      post_path(Post.first)
    when /the friendly url post page/
      friendly_post_path Post.published[0]
    when /registration page/
      '/users/new'
    when /profile page/
      '/users/edit'
    when /the login page/
      new_user_session_path
    when /the tags page/
      post_tags_path(Post.last.tag_list.first)
    when /the edit post page/
      edit_post_path(Post.last)
    when /the posts page via rss/
      posts_url(:format => :rss)
    when /the view unpublished post page/
      post_path(Post.last)
    when /an invalid post url/
      post_path(0)
    when /the archive of year (\d{4})/
      post_published_at_path(:year => $1)
    when /a empty month archive/
      published_date = Post.last.published_at
      post_published_at_path(:year => published_date.year, :month => (published_date - 1.month).month)
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
