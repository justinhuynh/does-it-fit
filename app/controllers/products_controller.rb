class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    #
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
    #
  end

  def update
    #
  end

  def destroy
    #
  end

  protected
  def product_params
    params.require(:product).permit(:title, :brand_id, :category_id, :description)
  end


end
