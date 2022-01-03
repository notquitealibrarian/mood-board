# == Schema Information
#
# Table name: pins
#
#  id            :bigint           not null, primary key
#  hovertext     :string
#  pin_name      :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  mood_board_id :bigint
#
# Indexes
#
#  index_pins_on_mood_board_id  (mood_board_id)
#
# Foreign Keys
#
#  fk_rails_...  (mood_board_id => mood_boards.id)
#
require "test_helper"

class PinTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
