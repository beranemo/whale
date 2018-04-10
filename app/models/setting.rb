# == Schema Information
#
# Table name: settings
#
#  id         :integer          not null, primary key
#  code       :string
#  content    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  note       :string
#  label      :string
#  is_active  :boolean          default(FALSE)
#

class Setting < ApplicationRecord
end
