class DocumentsController < ApplicationController
  before_filter :find_category, :only => [:new, :create]

  def show
    @document = Document.find(params[:id])
  end

  def new
    @document = Document.new
    @document.category = @category
  end

  def edit
    @document = Document.find(params[:id])
  end

  def create
    @document = Document.new(params[:document])
    @document.category = @category
    if @document.save
      redirect_to @document, notice: 'Document was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @document = Document.find(params[:id])
    if @document.update_attributes(params[:document])
      redirect_to @document, notice: 'Document was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @document = Document.find(params[:id])
    @document.destroy
    redirect_to category_path(@document.category), notice: 'Document deleted.'
  end

  private
  def find_category
    @category = Category.find(params[:category_id])
  end
end