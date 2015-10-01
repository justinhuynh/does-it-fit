class BrandsController < ApplicationController
  def index
    @brands = Brand.all
  end

  def show
    @brand = Brand.find(params[:id])
    @products = @brand.products.page(params[:page]).per(10)
  end
end
