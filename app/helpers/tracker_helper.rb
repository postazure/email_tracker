module TrackerHelper
  def tracker_link_text(tracker_uuid)
    "<img height='100' width='100' alt='' src='#{ENV['HOSTED_URL']}/trackers/#{tracker_uuid}/mark'/>"
  end

  def tracker_link_img(tracker_uuid)
    tracker_link_text(tracker_uuid).html_safe
  end
end