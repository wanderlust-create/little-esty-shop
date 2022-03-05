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
  end

  it "when visiting the merchant bulk discounts index" do
      visit merchant_dashboard_index_path(@merchant)
      expect(page).to have_link("##{@merchant.name}'s bulk discounts")

      click_on("#{@merchant.name}'s bulk discounts")

      expect(current_path).to eq(merchant_bulk_discounts_path(@merchant))
      # expect(page).to have_content("#{@merchant.name}'s bulk discounts")
      visit merchant_bulk_discounts_path(@merchant)

      within("#bulk_discount-#{@discount_1.id}") do
        expect(page).to have_content(@discount_1.percentage_discount)
        expect(page).to have_content(@discount_1.quantity_threshold)
        click_on "#{@discount_1.percentage_discount}"
        expect(current_path).to eq(merchant_bulk_discount_path(@merchant, @discount_1))
      end

    # within("#bulk_discount-#{@discount_2.id}") do
    #   expect(page).to have_content(@discount_2.percentage_discount)
    #   expect(page).to have_content(@discount_2.quantity_threshold)
    #   click_on "#{@discount_2.percentage_discount}"
    #   expect(current_path).to eq(merchant_bulk_discount_path(@merchant, @discount_2))
    # end

  end
end
