require 'spec_helper'

describe 'vendors can set listing timeslots' do
  let!(:vendor) { FactoryGirl.create(:vendor) }
  let(:listing) { FactoryGirl.build(:listing)}
  let(:booking) { FactoryGirl.build(:booking)}

  it "assigns timeslots to listings" do
    create_listing

    visit vendor_listings_path(vendor)
    
    click_link "Update Listing"

    expect(page).to have_content "Listing Availability"

    click_link "Add New Timeslot"

    expect(page).to have_content "Start Time"
    expect(page).to have_content "Date"

    fill_in :timeslot_date, with: '2015-03-15'
    fill_in :timeslot_start_time, with: '11:00'
    fill_in :timeslot_stop_time, with: '13:00'

    click_button "Add Timeslot"

    expect(page).to have_content '2015-03-15'
  end

  def login(vendor)
    visit "/login"
    fill_in :email, with: vendor.email
    fill_in :password, with: vendor.password
    click_button "Log In"
  end

  def create_listing
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
end