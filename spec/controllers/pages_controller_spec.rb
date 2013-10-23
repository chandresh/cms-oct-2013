require 'spec_helper'

describe PagesController do

  let(:valid_attributes) { {name: "home1"} }

  describe "GET 'new'" do
    it "should assign a new page as @page" do
      get 'new'
      expect(assigns(:page)).to be_a_new(Page)
    end
  end

  describe "POST 'create'" do

    it "should create a page" do
      expect {
        post 'create', {page: valid_attributes}
      }.to change(Page, :count).by(1)
      response.should redirect_to(pages_url)
    end

    it "should redirect to pages_url when successful" do
      post 'create', {page: valid_attributes}
      response.should redirect_to(pages_url)
    end
  end

end
