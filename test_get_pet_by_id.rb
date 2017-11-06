# load the gem
require 'swagger_client'
# setup authorization
SwaggerClient.configure do |config|
  # Configure API key authorization: api_key
  config.api_key['api_key'] = 'ANYTHING_WILL_DO'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['api_key'] = 'Bearer'
end

api_instance = SwaggerClient::PetApi.new

pet_id = 789 # Integer | ID of pet to return

if ARGV[0] then
  pet_id = ARGV[0]
else
  puts "No Pet ID found in the command line argument. Using default: " + pet_id.to_s
end

begin
  #Find pet by ID
  result = api_instance.get_pet_by_id(pet_id)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling PetApi->get_pet_by_id: #{e}"
end
