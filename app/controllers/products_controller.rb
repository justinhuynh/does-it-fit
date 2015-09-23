class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    if current_user
      @product = Product.new(product_params)
      if @product.save
        flash[:success] = 'Product Successfully Added'
        redirect_to '/products'
      else
        flash[:warning] = @product.errors.full_messages.join(', ')
        render :new
      end
    else
      flash[:warning] = @product.errors.full_messages.join(', ')
      redirect_to products_path
    end
  end

  def edit
    if current_user
      @product = Product.find(params[:id])
    else
      flash[:error] = "You need to sign in to do that!"
      redirect_to products_path
    end
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
    if current_user
      Product.find(params[:id]).destroy
      flash[:success] = 'Product Deleted'
      redirect_to products_path
      return
    else
      flash[:warning] = 'You must be signed in.'
      redirect_to products_path
    end
  end

  protected

  def product_params
    params.require(:product).permit(
      :title, :brand_id, :category_id, :description
    )
  end
end
