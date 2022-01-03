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
class MoodBoard < ApplicationRecord

    has_many(
        :pins,
        class_name: "Pin",
        foreign_key: "mood_board_id",
        inverse_of: :mood_board,
        dependent: :destroy
    )

    has_many(
        :ratings,
        class_name: "Rating",
        foreign_key: "mood_board_id",
        inverse_of: :mood_board,
        dependent: :destroy
    )
    
    has_many(
        :comments,
        class_name: "Comment",
        foreign_key: "mood_board_id",
        inverse_of: :mood_board,
        dependent: :destroy
    )

    belongs_to(
        :user,
        class_name: "User",
        foreign_key: "user_id",
        inverse_of: :mood_boards
    )
    after_initialize do
        if self.new_record?
          # values will be available for new record forms.
          # ||= added  - this means if value is nil, false or undefiend, set it to default value otherwise use the existing value.
          self.featured ||= false
          self.global_rating ||= 0
          self.published ||= false
          self.template ||= "Bubbles"
        end
    end

    #validate :acceptable_image
end
