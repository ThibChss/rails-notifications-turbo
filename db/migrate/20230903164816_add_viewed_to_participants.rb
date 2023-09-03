class AddViewedToParticipants < ActiveRecord::Migration[7.0]
  def change
    add_column :participants, :viewed, :boolean, null: false, default: false
  end
end
