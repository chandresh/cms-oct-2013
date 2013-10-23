require 'spec_helper'

def visit_admin_path
  http_login('cp', 'secret')
  visit admin_path
end

describe "Manage Products", :type => :feature do
  describe "As admin, when I click the manage products link" do
    it "should take me to manage products link" do
      visit_admin_path
      Product.create(name: "Book1")
      Product.create(name: "Book2")

      find_link('Manage Products').click
      expect(page).to have_content("Book1")
      expect(page).to have_content("Book2")
    end
  end

  describe "create product" do
    it "should create new product" do
      visit_admin_path
      find_link('Manage Products').click
      find_link('New Product').click
      expect(page).to have_content("Create new product")
      fill_in 'Name', with: "A test product"
      fill_in 'Description', with: "A test product"
      fill_in 'Price', with: 10
      click_on('Save')
      expect(page).to have_content("A test product")
    end
  end

end
