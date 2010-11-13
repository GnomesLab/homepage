xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title       { xml.cdata!('Blog | Gnomeslab') }
    xml.description { xml.cdata!('Latest blog posts on gnomeslab.com') }

    xml.link  posts_url
    xml.ttl   30

    for post in @posts
      xml.item do
        xml.title       { xml.cdata!(post.title) }
        xml.description { xml.cdata!(post.html_safe_body) }
        xml.author      { xml.cdata!(post.user.name) }

        xml.link      post_url(post)
        xml.comments  post_url(post, :anchor => 'comments')
        xml.pubDate   post.published_at.to_s(:rfc822)
        xml.guid      post.uuid, :isPermaLink => false
      end
    end
  end
end
