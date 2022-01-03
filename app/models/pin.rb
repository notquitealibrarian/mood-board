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
class Pin < ApplicationRecord

    has_one_attached :image_file

    belongs_to(
        :mood_board,
        class_name: "MoodBoard",
        foreign_key: "mood_board_id",
        inverse_of: :pins
    )

end
