module PostsHelper

  # In the presence of records for a given model it draws the archive tree. Otherwise, returns an empty string
  #
  # This method relies on the following private methods:
  #   * +draw_years+
  #   * +draw_months+
  #
  # Default behavior
  #   * It will attempt to create a tree of your Post model
  #   * Will use the post_published_at_path route
  #
  # Example using the default settings:
  #   <%= draw_archive_tree %>
  #
  # Overriding the defaults example:
  #   <%= draw_archive_tree :archive, :archive_published_at_path %>
  def draw_archive_tree(model_sym = :post, route = :post_published_at_path)
    model = model_sym.to_s.capitalize.constantize
    route = :post_published_at_path unless self.respond_to? route

    raw model.count > 0 ? draw_years(model_sym, route) : ""
  end # draw_archive_tree

  private

    def draw_years(model_sym, route) # :nodoc:
      model = model_sym.to_s.capitalize.constantize

      content_tag :ul do
        ul_body = ""

        model.archived_years.each_key do |year, count|
          ul_body << content_tag(:li, :class => year == Time.now.year ? 'active' : 'inactive') do
            link_to("[ + ]", "#", :class => "toggle") + " " +
              link_to(year, self.send(route, year)) +
              draw_months(model_sym, route, year)
          end
        end

        ul_body
      end
    end

    def draw_months(model_sym, route, year) # :nodoc:
      model = model_sym.to_s.capitalize.constantize

      content_tag :ul do
        ul_body = ""

        model.archived_months(:year => year).each_pair do |month, count|
          ul_body << content_tag(:li, link_to("#{Date::MONTHNAMES[month]} (#{count})",
                                              self.send(route, year, month < 10 ? "0#{month}" : month)))
        end

        ul_body
      end
    end

end # PostsHelper
