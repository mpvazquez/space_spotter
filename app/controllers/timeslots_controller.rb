class TimeslotsController < ApplicationController
  before_action :load_vendor
  before_action :load_listing

  def new
    @timeslot = Timeslot.new
  end

  def create
    @timeslot = Timeslot.new(timeslot_params)
    @timeslot.update(listing_id: @listing.id)

    if @timeslot.save
      redirect_to vendor_listing_path(@vendor, @listing)
    else
      render(:new)
    end
  end

  def show
    @timeslot = Timeslot.find(params[:id])
  end

  private 

  def load_vendor
    return @vendor = Vendor.find(params[:vendor_id])
  end

  def load_listing
    return @listing = Listing.find(params[:listing_id])
  end

  def timeslot_params
    return params.require(:timeslot).permit(
      :date,
      :start_time,
      :stop_time
      )
  end
end