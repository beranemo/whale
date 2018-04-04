RSpec.describe CartItem, type: :model do
  describe 'Association' do
    it { should belong_to(:discount_method) }
    it { should belong_to(:cart) }
    it { should belong_to(:product) }
  end

end