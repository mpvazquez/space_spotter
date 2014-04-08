require 'spec_helper'

describe "vendor users can manage (edit/update, delete) their listings" do
  let!(:vendor) { FactoryGirl.create(:vendor) }
  let!(:listing) { FactoryGirl.build(:listing)}

  before do
    visit root_path
    login(vendor)

    visit new_vendor_listing_path(vendor)

    fill_in :listing_title, with: listing.title
    fill_in :listing_listing_photo_url, with: listing.listing_photo_url
    fill_in :listing_description, with: listing.description
    fill_in :listing_address, with: listing.address
    fill_in :listing_city, with: listing.city
    fill_in :listing_state, with: listing.state
    fill_in :listing_zip_code, with: listing.zip_code
    fill_in :listing_rate, with: listing.rate
    
    click_button "Create"
  end

  it "lets vendor manage listings" do
    visit vendor_listings_path(vendor)
    expect(page).to have_content listing.title
    
    click_link listing.title

    expect(page).to have_content listing.title
    expect(page).to have_content listing.address

    click_button "Update Listing"
    fill_in :listing_rate, with: 459.33

    click_button "Save Changes"
    
    click_button "Update Listing"
    expect(find('#listing_rate').value).to have_content 459.33
    
    visit vendor_listings_path(vendor)

    click_link listing.title

    click_button "Delete Listing"

    expect(page).not_to have_content listing.title

    save_and_open_page
  end

  def login(vendor)
    visit "/login"
    fill_in :email, with: vendor.email
    fill_in :password, with: vendor.password
    click_button "Log In"
  end
end