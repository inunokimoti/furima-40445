class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [ :index, :create ]
  before_action :set_item
  before_action :transition_bun1, only: :index
  before_action :transition_bun2, only: :index

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    #@item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    #@item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:post_code, :from_id, :adderss_city, :adderss_number, :adderss_bilding_name, :tel_number).merge(item_id: @item.id, user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.sale_price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def transition_bun1
    unless @item.order == nil
      redirect_to root_path
    end
  end

  def transition_bun2
    unless @item.user_id != current_user.id
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
