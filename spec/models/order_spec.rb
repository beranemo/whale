RSpec.describe Order, type: :model do
  describe 'Association' do
    it { should have_many(:order_items) }
    it { should belong_to(:user) }
    it { should belong_to(:member) }
    it { should belong_to(:guest) }
  end

end