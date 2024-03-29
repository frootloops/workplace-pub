require 'spec_helper'

feature "User" do

  before do
    OmniAuth.config.test_mode = true
  end

  scenario "sign up with facebook" do
    OmniAuth.config.mock_auth[:facebook] = build(:facebook_omniauth)
    visit root_path
    click_link I18n.t("devise.sign_in")
    click_link I18n.t("devise.sign_in_with_provider", provider: "Facebook")
    expect(page).to have_content "user@facebook.com"
  end

  scenario "sign up with twitter" do
    OmniAuth.config.mock_auth[:twitter] = build(:twitter_omniauth)
    visit root_path
    click_link I18n.t("devise.sign_in")
    click_link I18n.t("devise.sign_in_with_provider", provider: "Twitter")
    fill_in "user_email", with: "new_user@example.com"
    click_button I18n.t("devise.sign_up")
    expect(page).to have_content "new_user@example.com"
  end

end
