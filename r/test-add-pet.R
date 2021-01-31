library(openapi)

# create a pet object with random ID
petId <- sample(1:10000, 1)
var.body <- Pet$new("openapi-generator-ebook-test", list("photoUrls_example"), petId, Category$new(petId, "category_example"), list(Tag$new(petId, "tag_example")), "available") # Pet | Pet object that needs to be added to the store

#Add a new pet to the store
api.instance <- PetApi$new()
# Configure OAuth2 access token for authorization: petstore_auth
api.instance$apiClient$accessToken <- 'TODO_YOUR_ACCESS_TOKEN';
api.instance$AddPet(var.body)
cat("Successfully added a Pet with ID ", petId)

# Get the Pet that was just added
cat("\nGet the Pet that was just added:\n")
api.instance$GetPetById(petId)
