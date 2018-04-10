# == Schema Information
#
# Table name: members
#
#  id             :integer          not null, primary key
#  name           :string           default(""), not null
#  birthday       :date             not null
#  gender         :string           default(""), not null
#  phone          :string           default(""), not null
#  avatar         :string
#  remark         :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  email          :string           default(""), not null
#  fax            :string
#  password       :string
#  zip            :string
#  county         :string
#  address        :string
#  bonus          :integer          default(0)
#  skin_type_id   :integer
#  hair_type_id   :integer
#  member_type_id :integer
#  info_way_id    :integer
#

RSpec.describe Member, type: :model do
  describe 'Association' do
    it { should have_many(:orders) }
    it { should belong_to(:member_type) }
    it { should belong_to(:skin_type) }
    it { should belong_to(:hair_type) }
  end

end
