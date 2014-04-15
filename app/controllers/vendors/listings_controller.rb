class Vendors::ListingsController < ApplicationController
  before_action :load_vendor, only: [:index, :show, :edit, :update, :destroy]
  before_action :load_listing, only: [:show, :edit, :update, :destroy]

  def index
    @listings = Vendor.find(session[:user_id]).listings
  end

  def show
    @timeslots = Timeslot.where(listing_id: @listing.id)
  end

  def new
    @vendor = Vendor.find(session[:user_id])
    @listing = Listing.new
  end

  def create
    @vendor = Vendor.find(session[:user_id])
    @listing = Listing.new(listing_params)
    if @listing.update(vendor_id: @vendor.id)
      redirect_to vendor_listing_path(@vendor, @listing)
    else
      render(:new)
    end
  end

  def edit 
    @timeslots = Timeslot.where(listing_id: @listing)
  end

  def update
    @listing_update = @listing.update(listing_params)
    if @listing_update
      redirect_to vendor_listing_path(@vendor, @listing)
    else
      render(:edit)
    end
  end

  def destroy
    @listing.destroy
    redirect_to vendor_listings_path
  end

  private

  def load_listing
    @listing = Listing.find(params[:id])
  end

  def load_vendor
    @vendor = Vendor.find(session[:user_id])
  end 

  def listing_params
    params.require(:listing).permit(
      :title,
      :listing_photo_url,
      :description,
      :address,
      :city,
      :state,
      :zip_code,
      :rate
    )
  end
end