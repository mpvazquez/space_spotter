require 'spec_helper'

describe "users can edit and update their profiles" do
  let!(:user) {FactoryGirl.create :user}

  it "lets users edit and update their profiles" do
    visit root_path
    expect(page).not_to have_content "#{user.first_name}"

    login(user)
    visit root_path
    expect(page).to have_content "#{user.first_name}"

    click_link "#{user.first_name}'s Profile"
    expect(page).to have_content "#{user.first_name}"

    click_link "Edit Account Information"
    fill_in :user_zip_code, with: 10019
    
    click_button "Save Changes"
    
    click_link "Edit Account Information"
    expect(find('#user_zip_code').value).to have_content 10019
    save_and_open_page
  end

  def login(user)
    visit "/login"
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button "Log In"
  end
end