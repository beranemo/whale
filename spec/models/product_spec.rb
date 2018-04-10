# == Schema Information
#
# Table name: products
#
#  id               :integer          not null, primary key
#  category         :string
#  zh_name          :string
#  en_name          :string
#  capacity         :string
#  price            :integer
#  upc              :string
#  use_for          :string
#  directions       :text
#  zh_m_ingredients :text
#  zh_ingredients   :text
#  en_ingredients   :text
#  quantity         :integer          default(0)
#  status           :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  category_id      :integer
#

RSpec.describe Product, type: :model do
  describe 'Association' do
    it { should have_many(:cart_items) }
    it { should have_many(:stock_records) }
    it { should have_many(:order_items) }
  end

end
