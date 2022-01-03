# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  about_me               :string
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :inet
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :inet
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  username               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_username              (username) UNIQUE
#
class User < ApplicationRecord

  has_many(
        :mood_boards,
        class_name: "MoodBoard",
        foreign_key: "user_id",
        inverse_of: :user,
        dependent: :destroy
    )

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,#, :validatable 
         :validatable , :authentication_keys => {email: false, login: false}
         attr_writer :login
        # validate :validate_username
         #validates_uniqueness_of :username

  has_one_attached :image_file


         
 # only allow letter, number, underscore and punctuation.
 validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true

  def login=(login)
    @login || self.username || self.email
  end
  
 has_many(
   :ratings,
   class_name: 'Rating',
   foreign_key: 'rating_id',
   inverse_of: :user,
   dependent: :destroy
 )

        # def login=(login)
         # @login = login
      #  end

         #def login
         #  @login || self.username || self.email
        # end

         def login
          @login || username || email
        end
         
        def self.find_for_database_authentication(warden_conditions)
          conditions = warden_conditions.dup
          if login = conditions.delete(:login)
            where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
          elsif conditions.has_key?(:username) || conditions.has_key?(:email)
            where(conditions.to_h).first
          end
        end
        
        # def self.find_first_by_auth_conditions(warden_conditions)
        #  conditions = warden_conditions.dup
        #  if login = conditions.delete(:login)
        #    where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
        #  else
        #    if conditions[:username].nil?
        #      where(conditions).first
        #    else
        #      where(username: conditions[:username]).first
        #    end
        #   end
        # end
       
  
has_many(
  :comments,
  class_name: "Comment",
  foreign_key: "user_id",
  inverse_of: :user,
  dependent: :destroy
)
 end
