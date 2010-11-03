Given /^There (?:are|is) (\d+) (.+)$/ do |n, name|

  n.to_i.times do |i|
    model_sym = name.gsub(/\s/, '_').singularize.to_sym

    model_sym == :post ? Factory.create(:published_post) : Factory.create(model_sym)
  end

end

#
# Helpers
#

def handle_to_id(handle)
  case handle
  when 'dbalmeida' then 'diogo_almeida'
  when 'joaocorrelo' then 'joao_correlo'
  when 'miguelfteixeira' then 'miguel_teixeira'
  else
    nil
  end
end

def test_visit(url)
  back_url = current_path
  visit url
  visit back_url
end

def test_click(link)
  test_visit(link[:href])
end

# FIXME: Somebody could please remove this duplication? This logic is already in the ApplicationController
def friendly_post_path(post)
  friendly_post_show_path post.created_at.year,
                          "%02d" % post.published_at.month,
                          "#{post.friendly_id}"
end

# FIXME: make it generic
def inspect_post_html(id, element, regexp)
  position = find("#post_#{id} #{element}").text =~ regexp
  position.should be_a_kind_of Fixnum
  position.should_not be_nil
end

# FIXME: make it generic
def get_html_element(handle, css_class)
  find("##{handle_to_id(handle)} .description p a.#{css_class}")
end
