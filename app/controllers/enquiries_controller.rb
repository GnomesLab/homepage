class EnquiriesController < ApplicationController
  respond_to :html

  # GET /enquiries
  def index
    redirect_to contact_path
  end

  # GET /contact
  # GET /equiries/new
  def new
    @enquiry = Enquiry.new
    respond_with @enquiry
  end

  # POST /enquiries
  def create
    @enquiry = Enquiry.new(params[:enquiry])

    if @enquiry.save
      flash[:notice] = "Thank you for contacting us! We will get back to you shortly."
      redirect_to root_path
    else
      flash[:error] = "Oops! Your message could not be sent. Please check your input and try again."
      render :new
    end
  end
end
