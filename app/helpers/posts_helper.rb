module PostsHelper

  # In the presence of records for a given model it draws the archive tree. Otherwise, returns an empty string
  #
  # This method relies on the following private methods:
  #   * +draw_years+
  #   * +draw_months+
  #
  # View example:
  #   <%= draw_archive_tree :post %>
  def draw_archive_tree(model_sym = :post)
    model = model_sym.to_s.capitalize.constantize

    raw model.count > 0 ? draw_years(model_sym) : ""
  end # draw_archive_tree

  private

    def draw_years(model_sym) # :nodoc:
      model = model_sym.to_s.capitalize.constantize

      content_tag :ul do
        ul_body = ""

        model.archived_years.each_key do |year, count|
          ul_body << content_tag(:li, :class => year == Time.now.year ? 'active' : 'inactive') do
            link_to("[ + ]", "#", :class => "toggle") + " " +
              link_to(year, "#") +
              draw_months(model_sym, year)
          end
        end

        ul_body
      end
    end

    def draw_months(model_sym, year) # :nodoc:
      model = model_sym.to_s.capitalize.constantize

      content_tag :ul do
        ul_body = ""

        model.archived_months(:year => year, :month_names => :long).each_pair do |month, count|
          ul_body << content_tag(:li, link_to("#{month} (#{count})", "#"))
        end

        ul_body
      end
    end

end # PostsHelper
