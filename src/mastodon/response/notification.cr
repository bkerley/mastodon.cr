require "json"
require "./account"
require "./status"

module Mastodon
  module Response
    class Notification

      JSON.mapping({
        id: Int32,
        type: String,
        created_at: { type: Time, converter: Time::Format.new("%Y-%m-%dT%T") },
        account: Response::Account,
        status: { type: Response::Status, nilable: true }
      })

    end
  end
end
