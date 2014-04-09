require 'spec_helper'

describe "bookings" do
  let!(:customer) { FactoryGirl.create(:customer) }
  let(:booking) {FactoryGirl.build(:booking, customer: customer)}

  let!(:vendor) { FactoryGirl.create(:vendor) }
  let!(:listing) { FactoryGirl.create(:listing, vendor: vendor)}
  let!(:timeslot) { FactoryGirl.create(:timeslot, listing: listing)}

  it "lets customers book timeslots" do
    login(customer)
    visit root_path

    click_link "Browse All Listings"
    expect(page).to have_content listing.title

    click_link listing.title
    expect(page).to have_content timeslot.date
    expect(page).to have_content listing.rate
    expect(page).to have_content listing.address    

    click_link "Book This Listing"

    expect(page).to have_content timeslot.date
    expect(page).to have_content "Please Select Your Desired Timeslot Below:"

    click_link timeslot.date

    expect(page).to have_content "Book this space on"
    expect(page).to have_content "Yes"

    click_button "Submit"
    
    expect(page).to have_content listing.title
    save_and_open_page
  end

  def login(user)
    visit "/login"
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button "Log In"
  end
end