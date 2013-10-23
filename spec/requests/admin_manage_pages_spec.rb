require 'spec_helper'

def visit_admin_path
  http_login('cp', 'secret')
  visit admin_path
end

describe "Manage Pages", :type => :feature do
  describe "As admin, when I click the manage pages link" do
    it "should take me to manage pages link" do
      visit_admin_path
      Page.create(name: "home")
      Page.create(name: "about")

      find_link('Manage Pages').click
      expect(page).to have_content("home")
      expect(page).to have_content("about")
    end
  end

  describe "create page" do
    it "should create new page" do
      visit_admin_path
      find_link('Manage Pages').click
      find_link('New Page').click
      expect(page).to have_content("Create new page")
      fill_in 'Name', with: "A test page"
      fill_in 'Title', with: "A test page"
      click_on('Save')
      expect(page).to have_content("A test page")
    end
  end

  describe "edit page" do
    it "should update the page" do

      # setup
      visit_admin_path

      Page.create(name: "home")
      Page.create(name: "about")

      find_link('Manage Pages').click

      # click on the first edit link

      click_link('Edit', match: :first)

      # test that we are on correct page

      expect(page).to have_content("Edit page")

      # Fill the form

      fill_in 'Name', with: "Something else"
      fill_in 'Title', with: "Something else"
      click_on('Save')

      # test - output

      expect(page).to have_content("Something else")
    end
  end

end
