class EnquiryMailer < ActionMailer::Base
  default :to => 'gnomeslab@gmail.com'

  def contact(enquiry)
    @enquiry = enquiry
    mail :from => @enquiry.email, :subject => "Contact from #{@enquiry.name}"
  end
end
