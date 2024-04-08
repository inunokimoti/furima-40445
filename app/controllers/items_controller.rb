class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :describe, :category_id, :state_id, :shipping_charge_id, :from_id, :transport_day_id, :sale_price, :image).merge(user_id: current_user.id)
  end

end
