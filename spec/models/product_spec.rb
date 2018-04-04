RSpec.describe Product, type: :model do
  describe 'Association' do
    it { should have_many(:cart_items) }
    it { should have_many(:stock_records) }
    it { should have_many(:order_items) }
  end

end