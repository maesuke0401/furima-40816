class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :kosuke, only: [:show, :edit, :update, :destroy]
  def index
    @items = Item.all.order(created_at: :desc)
 end
 def new
  @item = Item.new

end
def show
 
end

def create
  @item = Item.new(items_params)
  if @item.save
    redirect_to root_path
  else
    render :new, status: :unprocessable_entity
  end
end

def edit

  if user_signed_in? && current_user.id != @item.user_id
    redirect_to root_path
  end
end

def update

  if @item.update(items_params)
  redirect_to item_path
  else
    render :edit, status: :unprocessable_entity
  end
end

def destroy
  if user_signed_in? && current_user.id == @item.user_id
    @item.destroy
    redirect_to root_path
  end
end

private

  def items_params
    params.require(:item).permit(:product, :description, :category_id, :condition_id, :delivery_fee_id, :source_id, :shipping_id, :price_id, :image).merge(user_id: current_user.id)
  end

  def kosuke
    @item = Item.find(params[:id])
  end

end