class Participant < ApplicationRecord
  belongs_to :user
  belongs_to :event
  scope :unviewed, -> { where(viewed: false) }
  default_scope { latest }

  after_create_commit do
    broadcast_prepend_to  "broadcast_to_user_#{user_id}",
                          target: "cards_event",
                          partial: "pages/event",
                          locals: { user:, event: }
  end

  after_update_commit do
    broadcast_replace_to  "broadcast_to_user_#{user_id}",
                          target: "card_event_#{event_id}",
                          partial: "pages/event",
                          locals: { user:, event: }
  end

  after_destroy_commit do
    broadcast_remove_to "broadcast_to_user_#{user_id}",
                        target: "card_event_#{event_id}"
  end

  after_commit do
    broadcast_replace_to  "broadcast_to_user_#{user_id}",
                          target: "notifications_count",
                          partial: "shared/count",
                          locals: { count: user.notifications }
  end
end
