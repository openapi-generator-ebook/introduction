# load the gem
require 'swagger_client'
# setup authorization
SwaggerClient.configure do |config|
  # Configure OAuth2 access token for authorization: petstore_auth
  config.access_token = 'ANYTHING_HERE_WILL_DO'
end

api_instance = SwaggerClient::PetApi.new

body = SwaggerClient::Pet.new # Pet | Pet object that needs to be added to the store

body.id = rand(10000..90000)
body.name = "swagger-codegen-ebook-test"

begin
  #Add a new pet to the store
  api_instance.add_pet(body)
  puts "Added a Pet with id " + body.id.to_s
rescue SwaggerClient::ApiError => e
  puts "Exception when calling PetApi->add_pet: #{e}"
end
