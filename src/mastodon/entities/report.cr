require "json"

module Mastodon
  module Entities
    class Report

      JSON.mapping({
        id: String,
        action_taken: Bool
      })

      def_equals id
    end
  end
end
