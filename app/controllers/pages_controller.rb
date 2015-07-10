class PagesController < ApplicationController
  def index
    @pages = Page.all
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      redirect_to page_path(id: @page.id), notice: "Post is successfully created"
    else
      render :new
    end
  end

  def show
    @page = Page.find(params[:id])
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])

    if @page.update_attributes(page_params)
      redirect_to page_path(id: @page.id), notice: "Successfully Updated"
    else
      render :edit
    end
  end

  def destroy
    @page = Page.find(params[:id])
    
    if @page.destroy
      redirect_to pages_path, notice: "Successfully Deleted"
    else
      render :index
    end
  end

  def page_params
    params.require(:page).permit(:title, :content)
  end
end
