require 'spec_helper'

describe "users can log in" do
  let(:user) { FactoryGirl.create(:user) }

  it "lets users log into and out of their accounts" do
    visit root_path
    click_link "Please Log In"

    fill_in(:email, with: user.email)
    fill_in(:password, with: user.password)

    expect(page).to have_content "Please log into your account"
    expect(page).to have_content "Email"
    expect(page).to have_content "Password"

    click_button "Log In"

    expect(page).to have_content "#{user.first_name}"
  
    visit root_path

    expect(page).to have_content "#{user.first_name}'s Profile"
     
    click_link "Log Out"

    expect(page).to have_content "Please Log In"
  end
end