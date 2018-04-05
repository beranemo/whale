RSpec.describe Member, type: :model do
  describe 'Association' do
    it { should have_many(:orders) }
    it { should belong_to(:member_type) }
    it { should belong_to(:skin_type) }
    it { should belong_to(:hair_type) }
  end

end