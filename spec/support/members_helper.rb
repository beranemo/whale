module MembersHelper
  def create_members
    member1 = FactoryBot.create(:member, email: FFaker::Internet.email, name: 'member1',birthday: Date.current)
    member2 = FactoryBot.create(:member, email: FFaker::Internet.email, name: 'member2',birthday: Date.current)
    member3 = FactoryBot.create(:member, email: FFaker::Internet.email, name: 'member3',birthday: Date.current + 1.month)
    member4 = FactoryBot.create(:member, email: FFaker::Internet.email, name: 'member4',birthday: Date.current + 1.month)
    member5 = FactoryBot.create(:member, email: FFaker::Internet.email, name: 'member5',birthday: Date.current + 1.month)
  end

end