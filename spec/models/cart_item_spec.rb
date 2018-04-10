# == Schema Information
#
# Table name: cart_items
#
#  id                   :integer          not null, primary key
#  cart_id              :integer
#  product_id           :integer          not null
#  quantity             :integer          default(1)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  discount_off         :integer
#  discount_method_code :string
#

RSpec.describe CartItem, type: :model do
  describe 'Association' do
    it { should belong_to(:discount_method) }
    it { should belong_to(:cart) }
    it { should belong_to(:product) }
  end

end
