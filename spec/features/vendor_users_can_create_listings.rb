require "spec_helper"

describe "vendor users can create listings" do
  let!(:vendor) { FactoryGirl.create(:vendor) }
  let!(:listing) { FactoryGirl.build(:listing)}

  it "lets a user with the vendor role create a listing" do
    visit root_path
    login(vendor)

    click_link "#{vendor.first_name}'s Profile"
    expect(page).to have_content "Welcome, #{vendor.first_name}"
    expect(page).to have_content "Edit Account Information"

    click_button "Create New Listing"

    expect(page).to have_content "Title"
    expect(page).to have_content "Zip Code"

    fill_in :listing_title, with: listing.title
    fill_in :listing_listing_photo_url, with: listing.listing_photo_url
    fill_in :listing_description, with: listing.description
    fill_in :listing_address, with: listing.address
    fill_in :listing_city, with: listing.city
    fill_in :listing_state, with: listing.state
    fill_in :listing_zip_code, with: listing.zip_code
    fill_in :listing_rate, with: listing.rate
    
    click_button "Create"

    expect(page).to have_content "#{listing.title}"
  end

  def login(vendor)
    visit "/login"
    fill_in :email, with: vendor.email
    fill_in :password, with: vendor.password
    click_button "Log In"
  end
end