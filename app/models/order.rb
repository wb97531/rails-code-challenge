class Order < ApplicationRecord
  def expedited?
    @expedite
  end

  def returnable?
    @returns
  end

  def settings(opts = {})
    @expedite = opts[:expedite].presence
    @returns = opts[:returns].presence
    @warehouse = opts[:warehouse].presence
  end

  def shipped?
    shipped_at.present?
  end

  def warehoused?
    @warehouse
  end
end
