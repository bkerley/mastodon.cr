require "json"

module Mastodon
  module Entities
    class Mention

      JSON.mapping({
        url: String,
        username: String,
        acct: String,
        id: String,
      })

    end
  end
end
