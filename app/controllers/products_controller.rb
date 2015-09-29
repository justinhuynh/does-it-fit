class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def index
    if params[:search]
      @products = Product.search(params[:search])
      flash[:notice] = 'Your search query went through!'
    else
      @products = Product.all
    end
  end

  def show
    @product = Product.find(params[:id])
    @reviews = @product.reviews
    @review = Review.new
    @vote = Vote.new(params[:vote])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = 'Product Successfully Added'
      redirect_to '/products'
    else
      flash[:warning] = @product.errors.full_messages.join(', ')
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:success] = 'Product Successfully Added'
      redirect_to @product
    else
      flash[:warning] = @product.errors.full_messages.join(', ')
      render :edit
    end
  end

  def destroy
    Product.find(params[:id]).destroy
    flash[:success] = 'Product Deleted'
    redirect_to products_path
  end

  protected

  def product_params
    params.require(:product).permit(
      :title, :brand_id, :category_id, :description
    )
  end
end
