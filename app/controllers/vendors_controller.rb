class VendorsController < ApplicationController
  before_action :load_vendor, only: [:show, :edit, :update, :destroy]
  before_action :authenticate, :authorize, only: [:edit, :update, :destroy]

  def new
    @vendor = Vendor.new
  end

  def create
    @vendor = Vendor.new(vendor_params)

    if @vendor.save
      redirect_to vendor_path(@vendor)
    else
      render(:new)
    end
  end

  def show
  end

  def update
    @account_update = @vendor.update(vendor_params)
    if @account_update
      redirect_to vendor_path(@vendor)
    else
      render(:edit)
    end
  end

  def destroy
    @vendor.destroy
    session.destroy
    redirect_to root_path
  end

  private

  def load_vendor
    return @vendor = Vendor.find(params[:id])
  end

  def vendor_params
    params.require(:vendor).permit(
      :first_name, 
      :last_name, 
      :email,
      :username,  
      :password, 
      :password_confirmation,
      :phone_number, 
      :photo_url,
      :address,
      :city,
      :state,
      :bio_text,
      :zip_code,
      :role
    )
  end

  def authenticate
    unless logged_in?
      redirect_to login_path
    end
  end

  def authorize
    unless current_user == @vendor
      redirect_to login_path
    end
  end
end
