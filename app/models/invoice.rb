class Invoice < ApplicationRecord
  enum status: { pending: 0, completed: 1 }
  belongs_to :customer
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items
end