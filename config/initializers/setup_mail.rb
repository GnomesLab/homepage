ActionMailer::Base.smtp_settings = {
  :address => 'smtp.gmail.com',
  :port => 587,
  :user_name => 'gnomeslab@gmail.com',
  :password => 'gnomes1234',
  :authentication => 'plain',
  :enable_starttls_auto => true
}

ActionMailer::Base.default_charset = 'UTF-8'