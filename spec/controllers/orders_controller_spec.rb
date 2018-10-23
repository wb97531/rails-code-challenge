require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  describe '#index' do
    subject { get :index }
    it { is_expected.to have_http_status(:ok) }
  end

  describe '#show' do
    let(:order) { Order.create! }
    before { get :show, params: { id: order.id } }
    subject { response }
    it { is_expected.to have_http_status(:ok) }
  end
end
