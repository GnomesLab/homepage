# encoding: UTF-8

Then(/^I should see a xml document$/) do
  page.body.should include("<?xml version=\"1.0\" encoding=\"UTF-8\"?>")
end

Then(/^I should see the rss version$/) do
  page.body.should include("<rss version=\"2.0\">")
end

Then(/^I should see the channel headers$/) do
  body_xml.xpath('//channel/title').should_not be_empty
  body_xml.xpath('//channel/description').should_not be_empty
  body_xml.xpath('//channel/link').should_not be_empty
  body_xml.xpath('//channel/ttl').should_not be_empty
end

Then(/^I should see the published posts through rss items$/) do
  Post.published.latest.each_with_index do |p, i|
    node = body_xml.xpath("//channel/item[#{i+1}]")
    node.xpath('title').text.should include(p.title)
    node.xpath('link').text.should include(post_url(p))
    node.xpath('description').text.should include(p.html_safe_body)
    node.xpath('comments').text.should include(post_url(p, :anchor => 'comments'))
    node.xpath('author').text.should include(p.user.name)
    node.xpath('pubDate').text.should include(p.published_at.to_s(:rfc822))
    node.xpath('guid[@isPermaLink="false"]').text.should include(p.uuid)
  end
end

Then(/^I should not see the unpublished posts through rss items$/) do
  Post.where('published_at IS NULL').each { |p| page.should_not have_content(p.title) }
end

#
# Helpers
#
def body_xml
  @xml || @xml = Nokogiri::XML(page.body)
end
