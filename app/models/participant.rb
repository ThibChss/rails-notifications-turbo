class Participant < ApplicationRecord
  belongs_to :user
  belongs_to :event
  scope :unviewed, -> { where(viewed: false) }
  default_scope { latest }

  # after_create_commit do
  #   broadcast_prepend_to  "broadcast_to_user_#{user_id}",
  #                         target: :notifications
  # end

  # after_update_commit do
  #   broadcast_replace_to  "broadcast_to_user_#{user_id}",
  #                         target: self
  # end

  # after_destroy_commit do
  #   broadcast_remove_to "broadcast_to_user_#{user_id}",
  #                       target: :notifications
  # end

  after_commit do
    broadcast_replace_to  "broadcast_to_user_#{user_id}",
                          target: "notifications_count",
                          partial: "participants/count",
                          locals: { count: user.notifications }
  end
end
