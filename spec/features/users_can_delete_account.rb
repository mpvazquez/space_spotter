require 'spec_helper'

describe "users can delete their accounts" do
  let!(:user) {FactoryGirl.create :user}

  it "lets users delete their profiles" do
    visit root_path
    expect(page).not_to have_content "#{user.first_name}"

    login(user)
    visit root_path
    expect(page).to have_content "#{user.first_name}"

    click_link "#{user.first_name}'s Profile"
    expect(page).to have_content "#{user.first_name}"

    click_button "Delete Account"
    
    expect(page).to have_content "Register Here"
    expect(page).not_to have_content "#{user.first_name}"

    login(user)

    expect(page).not_to have_content "#{user.first_name}"
    expect(page).to have_content "This email and password combination does not exist."
  end

  def login(user)
    visit "/login"
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button "Log In"
  end
end