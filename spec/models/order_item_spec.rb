# == Schema Information
#
# Table name: order_items
#
#  id         :integer          not null, primary key
#  product_id :integer
#  order_id   :integer
#  quantity   :integer
#  price      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

RSpec.describe OrderItem, type: :model do
  describe 'Association' do
    it { should belong_to(:order) }
    it { should belong_to(:product) }
  end

end
