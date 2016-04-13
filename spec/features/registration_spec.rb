require "rails_helper"

describe "the registration process", type: :feature do
  before do
    @user = FactoryGirl.build :user
  end

  context "when the user is correct" do
    it "register the user" do
      visit "/users/sign_up"
      fill_in "user[name]", with: @user.name
      fill_in "user[username]", with: @user.username
      fill_in "user[email]", with: @user.email
      fill_in "user[password]", with: "12345678"
      fill_in "user[password_confirmation]", with: "12345678"
      click_on "Sign up"
      expect(page).to have_content 'Log out'
    end
  end

  context "when the user is not correct" do
    it "does not register the user, due to missing username" do
      visit "/users/sign_up"
      fill_in "user[name]", with: @user.name
      fill_in "user[email]", with: @user.email
      fill_in "user[password]", with: "12345678"
      fill_in "user[password_confirmation]", with: "12345678"
      click_on "Sign up"
      expect(page).to have_content "Username can't be blank"
    end
  end

end
