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
class Rating < ApplicationRecord

    belongs_to(
        :mood_board,
        class_name: 'MoodBoard',
        foreign_key: 'mood_board_id',
        inverse_of: :ratings
    )

    belongs_to(
        :user,
        class_name: 'User',
        foreign_key: 'user_id',
        inverse_of: :ratings
    )

    validates :user, uniqueness: {scope: :mood_board}
    
end
