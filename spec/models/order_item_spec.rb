RSpec.describe OrderItem, type: :model do
  describe 'Association' do
    it { should belong_to(:order) }
    it { should belong_to(:product) }
  end

end