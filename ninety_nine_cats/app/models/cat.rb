# == Schema Information
#
# Table name: cats
#
#  id          :bigint(8)        not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

CAT_COLORS = %w(orange purple green grey black white brown)

class Cat < ApplicationRecord
  validates :birth_date, :color, :name, :sex, :description, presence: true
  validates :color, inclusion: { in: CAT_COLORS, message: "%{value} is not a valid color" }
  validates :sex, length: { maximum: 1, too_long: "%{count} characters is the maximum allowed" }
end
