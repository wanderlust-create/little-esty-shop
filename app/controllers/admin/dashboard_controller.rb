class Admin::DashboardController < ApplicationController
  def index
    @customers = Customer.top_five_customers
    @invoices = Invoice.not_shipped
  end
end
