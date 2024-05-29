class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
    @items = Item.all.order(created_at: :desc)
 end
 def new
  @item = Item.new

end
def show
  @item = Item.find(params[:id])
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
  @item = Item.find(params[:id])
end

def update
  @item = Item.find(params[:id])
  @item.update(items_params)
  redirect_to item_path
end

private

  def items_params
    params.require(:item).permit(:product, :description, :category_id, :condition_id, :delivery_fee_id, :source_id, :shipping_id, :price_id, :image).merge(user_id: current_user.id)
  end

end