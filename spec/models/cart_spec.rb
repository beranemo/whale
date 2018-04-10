# == Schema Information
#
# Table name: carts
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

RSpec.describe Cart, type: :model do
  describe 'Association' do
    it { should have_many(:cart_items) }
  
  end

end
