class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :require_permission, only: [:edit, :update, :destroy]

  def index
    if params[:search]
      @products = Product.search(params[:search]).page(params[:page]).per(10)
      flash[:notice] = 'Your search query went through!'
    else
      @products = Product.page(params[:page]).per(10)
    end
  end

  def show
    @product = Product.find(params[:id])
    @reviews = @product.reviews
    @review = Review.new
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
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

  def require_permission
    @product = Product.find(params[:id])
    if (current_user != @product.user) && !current_user.admin?
      flash[:error] = "You cannot modify another user\'s product"
      redirect_to @product
    end
  end
end
