class Merchant::BulkDiscountsController < ApplicationController
  def index
    @merchant = Merchant.find(params[:merchant_id])
  end

  def show
   @bulk_discount = BulkDiscount.find(params[:id])
  end

  def destroy
    @merchant = Merchant.find_by(id: params[:merchant_id])
    BulkDiscount.find(params[:id]).destroy
    redirect_to merchant_bulk_discounts_path(@merchant.id)
  end
end
