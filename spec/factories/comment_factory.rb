# encoding: UTF-8

Factory.define :comment do |p|
  p.sequence(:name)   { |n| "comment user#{n}"                }
  p.sequence(:email)  { |n| "comment_email#{n}@gnomeslab.com" }
  p.sequence(:url)    { |n| "http://www.site#{n}.com"         }
  p.sequence(:body)   { |n| "body of comment #{n}"            }
  p.association       :post
end