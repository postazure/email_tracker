class TrackersController < ApplicationController
  def index
    @trackers = Tracker.all
  end

  def show
    @tracker = Tracker.find_by(uuid: params[:uuid])
  end

  def new
    @tracker = Tracker.new
  end

  def create
    @tracker = Tracker.create(tracker_params.merge(uuid: SecureRandom.uuid))
    redirect_to action: :show, uuid: @tracker.uuid
  end

  def mark
    if request.referrer.include?(ENV['HOSTED_URL'])
      # Request is comming from show page
      send_file Rails.root.join("public", "sunset+wave.jpg"), type: "image/gif", disposition: "inline"
    else
      # Request is comming from an external page
      tracker = Tracker.find_by(uuid: params[:uuid])
      tracker.view_count += 1
      tracker.last_viewed = DateTime.now
      tracker.save
      head :ok
    end
  end

  private

  def tracker_params
    params.require(:tracker).permit(
        :recipient,
        :notes
    )
  end
end