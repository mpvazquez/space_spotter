class Vendors::TimeslotsController < ApplicationController
  before_action :load_vendor
  before_action :load_listing

  def index
    @timeslots = Timeslot.where(listing_id: params[:listing_id])
  end

  def new
    @timeslot = Timeslot.new
  end

  def create
    @timeslot = Timeslot.new(timeslot_params)
    @timeslot.update(listing_id: @listing.id)
    if @timeslot.save
      redirect_to edit_vendor_listing_path(@vendor, @listing)
    else
      render(:new)
    end
  end

  def show
    @user = Customer.find(session[:user_id])
    @timeslot = Timeslot.find(params[:id])
  end

  def edit
    @timeslot = Timeslot.find(params[:id])
  end

  def update
    @timeslot = Timeslot.find(params[:id])
    @timeslot_update = @timeslot.update(timeslot_params)
    if @timeslot_update
      redirect_to vendor_listing_path(@vendor, @listing)
    else
      render(:edit)
    end
  end

  def destroy
    @timeslot = Timeslot.find(params[:id])
    @timeslot.destroy
    redirect_to vendor_listing_path(@vendor, @listing)
  end

  private 

  def load_vendor
    return @vendor = Vendor.find(session[:user_id])
  end

  def load_listing
    return @listing = Listing.find(params[:listing_id])
  end

  def timeslot_params
    params.require(:timeslot).permit(
      :date,
      :start_time,
      :stop_time
      )
  end
end