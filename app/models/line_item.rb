class LineItem < ApplicationRecord
  belongs_to :order
  belongs_to :widget

  validates :order, :quantity, :unit_price, :widget, presence: true
end
