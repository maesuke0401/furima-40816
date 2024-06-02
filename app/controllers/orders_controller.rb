class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :non_purchased_item, only: [:index, :create]
  before_action :yes, only: [:index, :create]
  
  def index
    if user_signed_in? && current_user.id != @item.user_id
      @item_order = ItemOrder.new
      gon.public_key = ENV['PAYJP_PUBLIC_KEY'] # gon.public_key を設定
    else
      redirect_to root_path
    end
  end

  def create
    @item_order = ItemOrder.new(order_params)
    if @item_order.valid?
      
      pay_item
      @item_order.save
      return redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY'] # gon.public_key を設定
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:item_order).permit(:post_code, :source_id, :city, :house_number, :building_name, :phone).merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY'] # PAY.JPのAPIキーを設定
    Payjp::Charge.create(
      amount: @item.price_id,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
  def non_purchased_item
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id || @item.order.present?
  end
  def yes
    @item = Item.find(params[:item_id])
  end

end
