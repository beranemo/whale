# == Schema Information
#
# Table name: orders
#
#  id             :integer          not null, primary key
#  member_id      :integer
#  user_id        :integer
#  amount         :integer
#  address        :string
#  payment_method :string
#  name           :string
#  phone          :string
#  remark         :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  discount_off   :integer
#  status         :boolean
#  sn             :integer
#  guest_id       :integer
#

RSpec.describe Order, type: :model do
  describe 'Association' do
    it { should have_many(:order_items) }
    it { should belong_to(:user) }
    it { should belong_to(:member) }
    it { should belong_to(:guest) }
  end

end
