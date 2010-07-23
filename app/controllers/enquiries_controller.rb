class EnquiriesController < ApplicationController
  # GET /contact
  # GET /equiries/new
  def new
    @enquiry = Enquiry.new
  end
end
