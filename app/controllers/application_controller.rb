class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'
  
  # Tag cloud, gets the tag counts on tag type "tag" (default) from all posts.
  # returns [#<ActsAsTaggableOn::Tag id: 1, name: "rails">]
  #
  # example:
  # <% tag_cloud($cloud_tags, %w(tag-size1 tag-size2 tag-size3 tag-size4 tag-size5 tag-size6 tag-size7)) do |tag,
  #                                                                                                      css_class| %>
  #   <%= link_to tag.name, post_tags_path(tag.name), :class => css_class %>
  # <% end %>
end
