class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  has_many :created_events, class_name: :Event
  has_many :participations, class_name: :Participant
  has_many :events, through: :participations

  def notifications
    participations.unviewed.count
  end
end
