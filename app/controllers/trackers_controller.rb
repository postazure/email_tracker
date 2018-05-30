class TrackersController < ApplicationController
  def index

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
    # request is coming from this site (ie the show page then dont count a view but do show the sunset)
    send_file Rails.root.join("public", "sunset+wave.jpg"), type: "image/gif", disposition: "inline"

    # If the image request is coming from another page then do this
    tracker = Tracker.find_by(uuid: params[:uuid])
    tracker.view_count += 1
    tracker.last_viewed = DateTime.now
    tracker.save
    head :ok

  end

  private

  def tracker_params
    params.require(:tracker).permit(
        :recipient,
        :notes
    )
  end
end