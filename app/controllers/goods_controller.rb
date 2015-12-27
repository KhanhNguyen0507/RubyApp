class GoodsController < ApplicationController
  def index
  	@goods = Good.all
  end

  def show
  	@good = Good.find(params[:id])
  end

  def new
  	@good = Good.new
  end

  def create
  	@good = Good.new(good_params)
  	@good.shop = Shop.find(2)

  	if @good.save
  		flash[:success] = "Your Good is created successfully!"
  		redirect_to goods_path
  	else
  		render :new
  	end
  end

  private
  def good_params
  	params.require(:good).permit(:name, :price, :summary, :description)
  end
end
