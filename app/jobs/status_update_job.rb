# app/jobs/status_update_job.rb
class StatusUpdateJob < ApplicationJob
  queue_as :default

  def perform(restaurant_id, status)
    restaurant = Restaurant.find_by(id: restaurant_id)
    return unless restaurant

    # Sleep for 5 minutes (300 seconds)
    sleep(300)

    # Update the restaurant status after 5 minutes
    restaurant.update(status: status)
  end
end
