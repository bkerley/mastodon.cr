require "http/client"
require "json"
require "./accounts"
require "./apps"
require "./media"
require "./miscellaneous"
require "./notifications"
require "./statuses"
require "./timelines"

module Mastodon
  module REST
    module Api
      include Mastodon::REST::Accounts
      include Mastodon::REST::Apps
      include Mastodon::REST::Media
      include Mastodon::REST::Miscellaneous
      include Mastodon::REST::Notifications
      include Mastodon::REST::Statuses
      include Mastodon::REST::Timelines
    end
  end
end
