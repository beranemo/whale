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
#  zh_m_ingredients :string
#  zh_ingredients   :string
#  en_ingredients   :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  category_id      :integer
#

class Product < ApplicationRecord
  has_many :order_items
  def self.update_by_file(file)
    attribute = Hash["類型" => "category" ,
                    "中文品名"=> "zh_name",
                    "英文品名"=> "en_name",
                    "規格"=>"capacity",
                    "定價"=>"price",
                    "國際條碼"=>"upc",
                    "適用對象"=>"use_for",
                    "使用方法"=>"directions",
                    "中文主成分"=>"zh_m_ingredients",
                    "中文全成分"=>"zh_ingredients",
                    "英文全成分"=>"en_ingredients"
                    ]
    sheet = Roo::Spreadsheet.open(file.path)
    header = sheet.row(1)
    header.each_with_index do |val, index|
      header[index] = attribute[val]
    end

    for i in 2..sheet.last_row()
      row = Hash[[header,sheet.row(i)].transpose]
      product = find_by(upc: row["upc"]) || new
      product.attributes = row.to_hash
      product.save!
    end
  end
end
