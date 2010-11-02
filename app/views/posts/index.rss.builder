xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title { xml.cdata!('Blog | Gnomeslab') }
    xml.description { xml.cdata!('Latest blog posts on gnomeslab.com') }
    xml.link { xml.cdata!(posts_url) }

    for post in @posts
      xml.item do
        xml.title { xml.cdata!(post.title) }
        xml.link { xml.cdata!(post_url(post)) }
        xml.description { xml.cdata!(post.html_safe_body) }
        xml.comments { xml.cdata!(post_url(post, :anchor => 'comments')) }
        xml.author { xml.cdata!(post.user.name) }
        xml.pubDate post.published_at.to_s(:rfc822)
      end
    end
  end
end
