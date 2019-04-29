# load the gem
require 'openapi_client'
# setup authorization
OpenapiClient.configure do |config|
  # Configure OAuth2 access token for authorization: petstore_auth
  config.access_token = 'ANYTHING_HERE_WILL_DO'
end

api_instance = OpenapiClient::PetApi.new

body = OpenapiClient::Pet.new # Pet | Pet object that needs to be added to the store

body.id = rand(10000..90000)
body.name = "openapi-generator-ebook-test"

begin
  #Add a new pet to the store
  api_instance.add_pet(body)
  puts "Added a Pet with id " + body.id.to_s
rescue OpenapiClient::ApiError => e
  puts "Exception when calling PetApi->add_pet: #{e}"
end
