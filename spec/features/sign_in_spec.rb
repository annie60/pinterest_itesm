require "rails_helper"

describe "the signin process", :type => :feature do
  before do
    @user = FactoryGirl.create(:user)
  end

  it "signs in the user" do
    visit "/users/sign_in"
    fill_in "user[email]", with: @user.email
    fill_in "user[password]", with: "12345678"
    click_button "Log in"
    expect(page).to have_content 'Log out'
  end
end
