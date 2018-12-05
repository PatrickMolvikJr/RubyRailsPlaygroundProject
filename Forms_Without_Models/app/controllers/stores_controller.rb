class StoresController < ApplicationController

  def index
    @products = Product.page( params[:page] )
  end

  def show
    @product = Product.find(params[:id])
    @page = params[:page].to_i
    @per_page = params[:per].to_i
    #@articles = Article.page(@page)
  end

end
