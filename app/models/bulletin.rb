# == Schema Information
#
# Table name: bulletins
#
#  id         :integer          not null, primary key
#  title      :string
#  content    :text
#  user_id    :integer
#  start_date :date
#  end_date   :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Bulletin < ApplicationRecord
  belongs_to :user
end
