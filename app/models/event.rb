class Event < ApplicationRecord
  belongs_to :creator, class_name: :User, foreign_key: :user_id
  has_many :participants
  has_many :participating_users, through: :participants, source: :user
  after_create :add_creator_to_participants

  def add_creator_to_participants
    participating_users << creator
  end
end
