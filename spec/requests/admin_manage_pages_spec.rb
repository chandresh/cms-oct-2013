require 'spec_helper'

describe "Manage Pages", :type => :feature do
  describe "As admin, when I click the manage pages link" do
    it "should take me to manage pages link" do
      http_login('cp', 'secret')
      visit admin_path
      Page.create(name: "home")
      Page.create(name: "about")

      find_link('Manage Pages').click
      expect(page).to have_content("home")
      expect(page).to have_content("about")
    end
  end
end
