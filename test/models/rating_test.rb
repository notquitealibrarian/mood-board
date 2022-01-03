# == Schema Information
#
# Table name: ratings
#
#  id            :bigint           not null, primary key
#  like          :boolean
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  mood_board_id :bigint
#  user_id       :bigint
#
# Indexes
#
#  index_ratings_on_mood_board_id  (mood_board_id)
#  index_ratings_on_user_id        (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (mood_board_id => mood_boards.id)
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class RatingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
