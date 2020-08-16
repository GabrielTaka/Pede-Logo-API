class Api::V1::ProductsController < ApplicationController

  def index
    products = Product.with_distance( params[:lng], params[:lat] )
    render json: products, status: :ok
  end

  def by_establishment
    products = Product.where(establishment_id: params[:establishment_id])
    render json: products, status: :ok
  end

  def random
    #products = Product.order("RANDOM()")
    products = Product.with_distance( params[:lng], params[:lat] ).limit(5)
    render json: products, status: :ok
  end

  def show
    product = Product.find(params[:id])
    render json: product, status: :ok
  end

end
