def test_visit(url)
  back_url = current_path
  visit url
  visit back_url
end

def test_click(link)
  test_visit(link[:href])
end