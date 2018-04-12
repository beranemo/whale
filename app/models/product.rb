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

class Product < ApplicationRecord
  has_many :order_items
  has_many :cart_items
  has_many :stock_records
  has_one :discount
  has_many :product_orders, through: :order_items, source: :order
  
  def self.update_by_file(file)
    attribute = Hash["類型" => "category" ,
                    "中文品名" => "zh_name",
                    "英文品名" => "en_name",
                    "規格" => "capacity",
                    "定價" => "price",
                    "國際條碼" => "upc",
                    "適用對象" => "use_for",
                    "使用方法" => "directions",
                    "中文主成分" => "zh_m_ingredients",
                    "中文全成分" => "zh_ingredients",
                    "英文全成分" => "en_ingredients",
                    "數量" => "quantity"                    
                    ]
    sheet = Roo::Spreadsheet.open(file.path)
    header = sheet.row(1)
    header.each_with_index do |val, index|
      header[index] = attribute[val]
    end

    for i in 2..sheet.last_row()
      row = Hash[[header,sheet.row(i)].transpose]
      product = find_by(upc: row["upc"]) || new
      o_quantity = product.quantity
      product.attributes = row.to_hash
      product.stock_records.build(quantity: product.quantity)
      product.quantity += o_quantity
      product.status = "listing" 
      product.save!
    end
  end

  def minus_by_order(order,num)
    self.quantity -= num

    stock_record = self.stock_records.find_by(order_id: order.id)
    if stock_record == nil
      stock_record = self.stock_records.build(quantity: -num, order_id: order.id)
    else
      stock_record.quantity -= num
    end
    stock_record.save!
  end
  
  def self.to_csv
    zh_attr = %w{類型 中文名稱 英文名稱 規格 價錢 國際條碼 適用對象 中文主成分 中文全成分 英文全成分 使用方法 數量}
    attributes = %w{category zh_name en_name capacity price upc use_for zh_m_ingredients zh_ingredients en_ingredients directions quantity}
    CSV.generate(headers: true) do |csv|
      csv << zh_attr

      all.each do |product|
        data = product.attributes.values_at(*attributes)
        csv << data
      end
    end
  end

end
