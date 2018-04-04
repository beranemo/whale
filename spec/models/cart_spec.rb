RSpec.describe Cart, type: :model do
  describe 'Association' do
    it { should have_many(:cart_items) }
  
  end

end