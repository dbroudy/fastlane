module Spaceship
  module Tunes
    # Represents a read only version of an iTunes Connect Versions State History
    class AppAddon < TunesBase
      # @return (Spaceship::Tunes::Application) A reference to the application
      #   this addon is for
      attr_accessor :application

      class << self
        # Create a new object based on a hash.
        # This is used to create a new object based on the server response.
        def factory(attrs)
          obj = self.new(attrs)
          return obj
        end
      end
    end
  end
end
