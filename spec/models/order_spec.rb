require 'rails_helper'

RSpec.describe Order, type: :model do
  it { is_expected.to respond_to(:shipped?) }

  context 'when a shipped date exists' do
    before { subject.update(shipped_at: Time.now) }
    it { is_expected.to be_shipped }
  end

  context 'when no shipped date is present' do
    it { is_expected.to_not be_shipped }
  end
end
