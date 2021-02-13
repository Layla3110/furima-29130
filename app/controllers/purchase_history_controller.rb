class PurchaseHistoryController < ApplicationController
  before_action :set_item, only: [:show, :purchase, :pay]

  def index
    @purchase = Purchase.new
    @item = Item.find(params[:item_id])
  end

  def new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase = Purchase.new(purchase_params)
    if @purchase.valid?
       pay_item
       @purchase.save
       redirect_to root_path
    else
      render action: :index
    end
  end

  private
  def purchase_params
    params.require(:purchase).permit(:postal_code, :prefecture_id, :municipalities, :house_number, :building, :phone_number).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.amount,
        card: purchase_params[:token],    
        currency: 'jpy'                 
      )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end