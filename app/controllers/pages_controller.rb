class PagesController < ApplicationController
  before_action :set_page, only: [:edit, :update]
  def index
    @pages = Page.all
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)
    @page.save
    redirect_to pages_url
  end

  def edit

  end

  def update
    @page.update(page_params)
    redirect_to pages_url
  end

  private

  def set_page
    @page = Page.find(params[:id])
  end


  def page_params
    params.require(:page).permit(:name, :title, :content)
  end

end
