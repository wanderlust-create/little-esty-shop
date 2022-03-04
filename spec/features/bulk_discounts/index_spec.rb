require 'rails_helper'

RSpec.describe 'Bulk discounts index page' do
  #     Merchant Bulk Discounts Index
  #
  # As a merchant
  # When I visit my merchant dashboard
  # Then I see a link to view all my discounts
  # When I click this link
  # Then I am taken to my bulk discounts index page
  # Where I see all of my bulk discounts including their
  # percentage discount and quantity thresholds
  # And each bulk discount listed includes a link to its show page
  before :each do
    @merchant = Merchant.create!(name: "Ana Maria")
    @discount_1 = BulkDiscount.create!(percentage_discount: 0.5, quantity_threshold: 15, merchant_id: @merchant.id)
    @discount_2 = BulkDiscount.create!(percentage_discount: 0.10, quantity_threshold: 30, merchant_id: @merchant.id)
    @discount_3 = BulkDiscount.create!(percentage_discount: 0.20, quantity_threshold: 40, merchant_id: @merchant.id)
  end

  it "when visiting the merchant bulk discounts index" do
      visit merchant_dashboard_index_path(@merchant)
      expect(page).to have_link("##{@merchant.name}'s bulk discounts")
      click_on("##{@merchant.name}'s bulk discounts")
      # expect(current_path).to eq("/merchants/#{@katz.id}/bulk_discounts")

      expect(current_path).to eq(merchant_bulk_discounts_path(@merchant))
      # expect(page).to have_content("#{@merchant.name}'s bulk discounts")

    # within("#bulk_discount-0#{@discount_1.id}") do
    within("#bulk_discount-0") do
      visit merchant_bulk_discounts_path(@merchant)
      expect(page).to have_content(@discount_1.percentage_discount)
      expect(page).to have_content(@discount_1.quantity_threshold)
    end

    within("#bulk_discount-1") do
      expect(page).to have_content(@discount_2.percentage_discount)
      expect(page).to have_content(@discount_2.quantity_threshold)
    end

    within("#bulk_discount-2") do
      expect(page).to have_content(@discount_3.percentage_discount)
      expect(page).to have_content(@discount_3.quantity_threshold)
    end

    # click_on "#{@merchant.name}'s items"
    # expect(current_path).to eq("/merchants/#{@merchant.id}/items")
    # expect(page).to have_link('Discount')
    # click_on('Discount')
    # expect(current_path).to eq(merchant_bulk_discount_path)
  end
end
