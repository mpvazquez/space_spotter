require 'spec_helper'

describe "an anonymous user can see the splah page" do
  it "lets users see a splash page" do
    visit root_path
    expect(page).to have_content "Welcome!"
    expect(page).to have_content "Browse"
    expect(page).to have_content "Log In"
  end
end