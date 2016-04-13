require "rails_helper"

describe "The board creation process", :type => :feature do
  before do
    @user = FactoryGirl.create(:user)
    sign_in @user
  end

  it "signs in the user" do
    visit "/boards/new"
    fill_in "board[name]", with: "My new board"
    click_button "Save"
    expect(current_path).to eql "/boards"
  end
end
