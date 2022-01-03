# == Schema Information
#
# Table name: mood_boards
#
#  id            :bigint           not null, primary key
#  editing       :boolean
#  featured      :boolean
#  global_rating :integer
#  published     :boolean
#  template      :string
#  title         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :bigint
#
# Indexes
#
#  index_mood_boards_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class MoodBoardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
