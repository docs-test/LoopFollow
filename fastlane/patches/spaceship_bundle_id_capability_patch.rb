ruby
   # fastlane/patches/spaceship_bundle_id_capability_patch.rb
   require 'spaceship/connect_api/provisioning'

   module Spaceship
     class ConnectAPI
       module Provisioning
         module API
           # override to drop the invalid 'capability' relationship
           def post_bundle_id_capability(bundle_id_id:, capability_type:, settings: [])
             body = {
               data: {
                 type: "bundleIdCapabilities",
                 attributes: {
                   capabilityType: capability_type,
                   settings: settings
                 },
                 relationships: {
                   bundleId: {
                     data: { type: "bundleIds", id: bundle_id_id }
                   }
                 }
               }
             }
             provisioning_request_client.post("bundleIdCapabilities", body)
           end
         end
       end
     end
   end
   
