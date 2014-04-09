class TimeslotsController < ApplicationController
  # before_action :load_vendor
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
      redirect_to vendor_listing_path(@vendor, @listing)
    else
      render(:new)
    end
  end

  def show
    @user = Customer.find(session[:user_id])
    @timeslot = Timeslot.find(params[:id])
  end

  def update
    @timeslot = Timeslot.find(params[:id])
    @timeslot_update = @timeslot.update(booked: params[:booked])
    if @timeslot_update
      redirect_to listing_path(@listing)
    else
      render(:edit)
    end
  end

  private 

  # def load_vendor
  #   return @vendor = Vendor.find(session[:user_id])
  # end

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