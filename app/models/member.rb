# == Schema Information
#
# Table name: members
#
#  id         :bigint           not null, primary key
#  about_me   :string
#  email      :string
#  username   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Member < ApplicationRecord
end
