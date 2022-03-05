class Merchant::BulkDiscountsController < ApplicationController
  def index
    @merchant = Merchant.find(params[:merchant_id])
  end

  def show
   @bulk_discount = BulkDiscount.find(params[:id])
  end

  def new
    @discount = BulkDiscount.new
    @merchant = Merchant.find(params[:merchant_id])
  end

  def create
    bulk_discount = params[:bulk_discount]
    @merchant = Merchant.find(params[:merchant_id])
    BulkDiscount.create(percentage_discount: bulk_discount[:percentage_discount], quantity_threshold: bulk_discount[:quantity_threshold], merchant: @merchant)
    redirect_to merchant_bulk_discounts_path(@merchant)
  end

  def destroy
    @merchant = Merchant.find_by(id: params[:merchant_id])
    BulkDiscount.find(params[:id]).destroy
    redirect_to merchant_bulk_discounts_path(@merchant.id)
  end
end
