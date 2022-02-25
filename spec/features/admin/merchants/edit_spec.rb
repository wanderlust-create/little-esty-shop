require 'rails_helper'

RSpec.describe 'Admin Merchant Edit Page' do
  before :each do
    @merchant_1 = Merchant.create!(name: "Ana Maria")
    @merchant_2 = Merchant.create!(name: "Juan Lopez")
  end

  it "has a form with the merchants existing information filled in" do
    visit edit_admin_merchant_path(@merchant_1)
    expect(page).to have_content(@merchant_1.name)
  end

  it "redirects back to the show page with the updated info" do
    visit edit_admin_merchant_path(@merchant_1)
    fill_in "Name", with: "New Name"
    click_on "Submit"
    expect(current_path).to eq(admin_merchant_path(@merchant_1))
    expect(page).to have_content("New Name")
  end

  it "has a flash message stating the update was successful" do
    visit edit_admin_merchant_path(@merchant_1)
    fill_in "Name", with: "New Name"
    click_on "Submit"
    expect(current_path).to eq(admin_merchant_path(@merchant_1))
    expect(page).to have_content("Update Successful")
  end
end