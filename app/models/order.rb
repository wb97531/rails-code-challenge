class Order < ApplicationRecord
  def shipped?
    shipped_at.present?
  end
end
