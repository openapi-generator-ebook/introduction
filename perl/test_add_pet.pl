#!/usr/bin/perl
use lib 'lib';
use strict;
use warnings;
# load the API package
use WWW::OpenAPIClient::PetApi;
use WWW::OpenAPIClient::StoreApi;
use WWW::OpenAPIClient::UserApi;

# load the models
use WWW::OpenAPIClient::Object::ApiResponse;
use WWW::OpenAPIClient::Object::Category;
use WWW::OpenAPIClient::Object::Order;
use WWW::OpenAPIClient::Object::Pet;
use WWW::OpenAPIClient::Object::Tag;
use WWW::OpenAPIClient::Object::User;

# for displaying the API response data
use Data::Dumper;

my $api_instance = WWW::OpenAPIClient::PetApi->new(
    # Configure OAuth2 access token for authorization: petstore_auth
    access_token => 'YOUR_ACCESS_TOKEN',
);

my $random_id = int(rand(10000));
my $name = "openapi-generator-ebook-test";
my $category =  WWW::OpenAPIClient::Object::Category->new('id' => "$random_id", 'name' => $name);
my $tag =  WWW::OpenAPIClient::Object::Tag->new('id' => "$random_id", 'name' => $name);
my $pet =  WWW::OpenAPIClient::Object::Pet->new('id' => $random_id, 'name' => $name,
      "photoUrls" => ['123', 'oop'], 'tags' => [$tag], 'status' => 'pending', 'category' => $category);

eval {
    $api_instance->add_pet(pet => $pet);
    print "Add a Pet with id $random_id\n";
};
if ($@) {
    warn "Exception when calling PetApi->add_pet: $@\n";
}

# get pet by the random ID
eval {
    my $result = $api_instance->get_pet_by_id(pet_id => $random_id);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling PetApi->get_pet_by_id: $@\n";
}

