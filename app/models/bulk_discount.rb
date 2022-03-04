class BulkDiscount < ApplicationRecord
  belongs_to :merchant
  belongs_to :item
end
