module OrdersHelper

  def create_user_list
    user1 = FactoryBot.create(:user, email: FFaker::Internet.email, name: 'user1',role: 'cashier')
    user2 = FactoryBot.create(:user, email: FFaker::Internet.email, name: 'user2',role: 'cashier')
    user3 = FactoryBot.create(:user, email: FFaker::Internet.email, name: 'user3',role: 'cashier')
    user4 = FactoryBot.create(:user, email: FFaker::Internet.email, name: 'user4',role: 'cashier')
    user5 = FactoryBot.create(:user, email: FFaker::Internet.email, name: 'user5',role: 'cashier')

  end

  def create_member_list
    member1 = FactoryBot.create(:member)
  end

  def create_orders
    User.first.orders.create!(
      [{member_id: -1,address: ["宅配","自取"].sample, payment_method: ["付現","刷卡"].sample, status: true, created_at: 5.days.ago },
      {member_id: -1,address: ["宅配","自取"].sample, payment_method: ["付現","刷卡"].sample, status: true,  created_at: 4.days.ago },
      {member_id: -1,address: ["宅配","自取"].sample, payment_method: ["付現","刷卡"].sample, status: true, created_at: 3.days.ago },
      {member_id: -1,address: ["宅配","自取"].sample, payment_method: ["付現","刷卡"].sample, status: true,  created_at: 2.days.ago },
      {member_id: -1,address: ["宅配","自取"].sample, payment_method: ["付現","刷卡"].sample, status: true,  created_at: 1.days.ago },
      {member_id: -1,address: ["宅配","自取"].sample, payment_method: ["付現","刷卡"].sample, status: true,  created_at: 0.days.ago  }]
    )
  end

  def create_skin_type
    skin_type_list = [
      { note: "系統設置，無法刪除", code: "A", system_flag: "Y", value: "中性膚質（一般膚質）" },
      { note: "系統設置，無法刪除", code: "B", system_flag: "Y", value: "油性膚質" },
      { note: "系統設置，無法刪除", code: "C", system_flag: "Y", value: "乾性膚質" },
      { note: "系統設置，無法刪除", code: "D", system_flag: "Y", value: "混合性膚質" },
      { note: "系統設置，無法刪除", code: "E", system_flag: "Y", value: "敏感膚質" }
    ]
    skin_type_list.each do |skin_type|
      FactoryBot.create(
        :skin_type, 
        note: skin_type[:note],
        value: skin_type[:value],
        system_flag: skin_type[:system_flag]
        )
    end
  end

  def create_hair_type
    hair_type_list = [
      { note: "系統設置，無法刪除", code: "A", system_flag: "Y", value: "中性髮質" },
      { note: "系統設置，無法刪除", code: "B", system_flag: "Y", value: "油性髮質" },
      { note: "系統設置，無法刪除", code: "C", system_flag: "Y", value: "染燙受損髮質" },
      { note: "系統設置，無法刪除", code: "D", system_flag: "Y", value: "乾性髮質" },
      { note: "系統設置，無法刪除", code: "E", system_flag: "Y", value: "毛躁髮質" },
      { note: "系統設置，無法刪除", code: "F", system_flag: "Y", value: "有頭皮屑困擾" }
    ]

    hair_type_list.each do |hair_type|
      FactoryBot.create( 
        :hair_type,
        note: hair_type[:note],
        code: hair_type[:code],
        value: hair_type[:value], 
        system_flag: hair_type[:system_flag] 
        )
    end
  end


end
