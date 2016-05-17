module Spaceship
  module Tunes
    # Represents a read only version of an iTunes Connect Versions State History
    class AppAddon < TunesBase
      # @return (Spaceship::Tunes::Application) A reference to the application
      #   this addon is for
      attr_accessor :application

      # @return (String) The identifier of this Addon, provided by iTunes Connect
      # @example
      #   "1013943394"
      attr_accessor :addon_id

      # @return (String) The type of the Addon.
      # @example
      #   "ITC.addons.type.subscription"
      attr_accessor :addon_type

      # @return (Bool) Can the Addon be deleted?
      attr_accessor :can_delete
      alias :can_delete? :can_delete

      # @return (String) Status of Addon in ITunes Connect
      # @example
      #   "readyToSubmit"
      attr_accessor :itc_status

      # @return (String) Name of Addon (Reference Name)
      # @example
      #   "My Product Name"
      attr_accessor :name

      # @return (String) Product Id in iTunes Connect
      # @example
      #   "com.company.app.MyProduct1"
      attr_accessor :vendor_id

      attr_mapping(
        'adamId' => :addon_id,
        'addOnType' => :addon_type,
        'canDeleteAddOn' => :can_delete,
        'iTunesConnectStatus' => :itc_status,
        'referenceName' => :name,
        'vendorId' => :vendor_id
      )

      class << self
        # Create a new object based on a hash.
        # This is used to create a new object based on the server response.
        def factory(attrs)
          obj = self.new(attrs)
          return obj
        end
      end

      # Delete current addon
      def delete!
        client.delete_addon!(self)
      end
    end
  end
end
