require 'spec_helper'

describe "user can register for website" do
  let(:user) { FactoryGirl.build(:user) }

  it "allows a user to register" do
    visit root_path
    click_link "Register Here"

    fill_in "user_first_name", with: user.first_name
    fill_in "user_last_name", with: user.last_name
    fill_in "user_email", with: user.email
    fill_in "user_username", with: user.username
    fill_in "user_password", with: user.password
    fill_in "user_password_confirmation", with: user.password_confirmation
    fill_in "user_phone_number", with: user.phone_number
    fill_in "user_photo_url", with: user.photo_url
    fill_in "user_bio_text", with: user.bio_text
    fill_in "user_address", with: user.address
    fill_in "user_city", with: user.city
    fill_in "user_state", with: user.state
    fill_in "user_zip_code", with: user.zip_code

    click_button "Register"

    expect(page).to have_content("#{user.first_name}")

    save_and_open_page
  end
end