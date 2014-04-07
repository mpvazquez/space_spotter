class Vendors::ListingsController < ApplicationController
  def index
    @listings = Vendor.find(session[:user_id]).listings
  end

  def show
    @listing = Listing.find(params[:id])
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

  private

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