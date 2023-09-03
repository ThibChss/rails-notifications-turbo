class PagesController < ApplicationController
  def home
    @events = current_user.events.order(created_at: :desc)
  end
end
