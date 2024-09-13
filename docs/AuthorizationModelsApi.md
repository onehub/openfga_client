# OpenfgaClient::AuthorizationModelsApi

All URIs are relative to *http://localhost*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**read_authorization_model**](AuthorizationModelsApi.md#read_authorization_model) | **GET** /stores/{store_id}/authorization-models/{id} | Return a particular version of an authorization model |
| [**read_authorization_models**](AuthorizationModelsApi.md#read_authorization_models) | **GET** /stores/{store_id}/authorization-models | Return all the authorization models for a particular store |
| [**write_authorization_model**](AuthorizationModelsApi.md#write_authorization_model) | **POST** /stores/{store_id}/authorization-models | Create a new authorization model |


## read_authorization_model

> <ReadAuthorizationModelResponse> read_authorization_model(store_id, id)

Return a particular version of an authorization model

The ReadAuthorizationModel API returns an authorization model by its identifier. The response will return the authorization model for the particular version.  ## Example To retrieve the authorization model with ID `01G5JAVJ41T49E9TT3SKVS7X1J` for the store, call the GET authorization-models by ID API with `01G5JAVJ41T49E9TT3SKVS7X1J` as the `id` path parameter.  The API will return: ```json {   \"authorization_model\":{     \"id\":\"01G5JAVJ41T49E9TT3SKVS7X1J\",     \"type_definitions\":[       {         \"type\":\"user\"       },       {         \"type\":\"document\",         \"relations\":{           \"reader\":{             \"union\":{               \"child\":[                 {                   \"this\":{}                 },                 {                   \"computedUserset\":{                     \"object\":\"\",                     \"relation\":\"writer\"                   }                 }               ]             }           },           \"writer\":{             \"this\":{}           }         }       }     ]   } } ``` In the above example, there are 2 types (`user` and `document`). The `document` type has 2 relations (`writer` and `reader`).

### Examples

```ruby
require 'time'
require 'openfga_client'

api_instance = OpenfgaClient::AuthorizationModelsApi.new
store_id = 'store_id_example' # String | 
id = 'id_example' # String | 

begin
  # Return a particular version of an authorization model
  result = api_instance.read_authorization_model(store_id, id)
  p result
rescue OpenfgaClient::ApiError => e
  puts "Error when calling AuthorizationModelsApi->read_authorization_model: #{e}"
end
```

#### Using the read_authorization_model_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ReadAuthorizationModelResponse>, Integer, Hash)> read_authorization_model_with_http_info(store_id, id)

```ruby
begin
  # Return a particular version of an authorization model
  data, status_code, headers = api_instance.read_authorization_model_with_http_info(store_id, id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ReadAuthorizationModelResponse>
rescue OpenfgaClient::ApiError => e
  puts "Error when calling AuthorizationModelsApi->read_authorization_model_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **store_id** | **String** |  |  |
| **id** | **String** |  |  |

### Return type

[**ReadAuthorizationModelResponse**](ReadAuthorizationModelResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## read_authorization_models

> <ReadAuthorizationModelsResponse> read_authorization_models(store_id, opts)

Return all the authorization models for a particular store

The ReadAuthorizationModels API will return all the authorization models for a certain store. OpenFGA's response will contain an array of all authorization models, sorted in descending order of creation.  ## Example Assume that a store's authorization model has been configured twice. To get all the authorization models that have been created in this store, call GET authorization-models. The API will return a response that looks like: ```json {   \"authorization_models\": [     {       \"id\": \"01G50QVV17PECNVAHX1GG4Y5NC\",       \"type_definitions\": [...]     },     {       \"id\": \"01G4ZW8F4A07AKQ8RHSVG9RW04\",       \"type_definitions\": [...]     },   ],   \"continuation_token\": \"eyJwayI6IkxBVEVTVF9OU0NPTkZJR19hdXRoMHN0b3JlIiwic2siOiIxem1qbXF3MWZLZExTcUoyN01MdTdqTjh0cWgifQ==\" } ``` If there are no more authorization models available, the `continuation_token` field will be empty ```json {   \"authorization_models\": [     {       \"id\": \"01G50QVV17PECNVAHX1GG4Y5NC\",       \"type_definitions\": [...]     },     {       \"id\": \"01G4ZW8F4A07AKQ8RHSVG9RW04\",       \"type_definitions\": [...]     },   ],   \"continuation_token\": \"\" } ``` 

### Examples

```ruby
require 'time'
require 'openfga_client'

api_instance = OpenfgaClient::AuthorizationModelsApi.new
store_id = 'store_id_example' # String | 
opts = {
  page_size: 56, # Integer | 
  continuation_token: 'continuation_token_example' # String | 
}

begin
  # Return all the authorization models for a particular store
  result = api_instance.read_authorization_models(store_id, opts)
  p result
rescue OpenfgaClient::ApiError => e
  puts "Error when calling AuthorizationModelsApi->read_authorization_models: #{e}"
end
```

#### Using the read_authorization_models_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ReadAuthorizationModelsResponse>, Integer, Hash)> read_authorization_models_with_http_info(store_id, opts)

```ruby
begin
  # Return all the authorization models for a particular store
  data, status_code, headers = api_instance.read_authorization_models_with_http_info(store_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ReadAuthorizationModelsResponse>
rescue OpenfgaClient::ApiError => e
  puts "Error when calling AuthorizationModelsApi->read_authorization_models_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **store_id** | **String** |  |  |
| **page_size** | **Integer** |  | [optional] |
| **continuation_token** | **String** |  | [optional] |

### Return type

[**ReadAuthorizationModelsResponse**](ReadAuthorizationModelsResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## write_authorization_model

> <WriteAuthorizationModelResponse> write_authorization_model(store_id, body)

Create a new authorization model

The WriteAuthorizationModel API will add a new authorization model to a store. Each item in the `type_definitions` array is a type definition as specified in the field `type_definition`. The response will return the authorization model's ID in the `id` field.  ## Example To add an authorization model with `user` and `document` type definitions, call POST authorization-models API with the body:  ```json {   \"type_definitions\":[     {       \"type\":\"user\"     },     {       \"type\":\"document\",       \"relations\":{         \"reader\":{           \"union\":{             \"child\":[               {                 \"this\":{}               },               {                 \"computedUserset\":{                   \"object\":\"\",                   \"relation\":\"writer\"                 }               }             ]           }         },         \"writer\":{           \"this\":{}         }       }     }   ] } ``` OpenFGA's response will include the version id for this authorization model, which will look like  ``` {\"authorization_model_id\": \"01G50QVV17PECNVAHX1GG4Y5NC\"} ``` 

### Examples

```ruby
require 'time'
require 'openfga_client'

api_instance = OpenfgaClient::AuthorizationModelsApi.new
store_id = 'store_id_example' # String | 
body = OpenfgaClient::WriteAuthorizationModelRequest.new({type_definitions: [OpenfgaClient::TypeDefinition.new({type: 'document'})], schema_version: 'schema_version_example'}) # WriteAuthorizationModelRequest | 

begin
  # Create a new authorization model
  result = api_instance.write_authorization_model(store_id, body)
  p result
rescue OpenfgaClient::ApiError => e
  puts "Error when calling AuthorizationModelsApi->write_authorization_model: #{e}"
end
```

#### Using the write_authorization_model_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<WriteAuthorizationModelResponse>, Integer, Hash)> write_authorization_model_with_http_info(store_id, body)

```ruby
begin
  # Create a new authorization model
  data, status_code, headers = api_instance.write_authorization_model_with_http_info(store_id, body)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <WriteAuthorizationModelResponse>
rescue OpenfgaClient::ApiError => e
  puts "Error when calling AuthorizationModelsApi->write_authorization_model_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **store_id** | **String** |  |  |
| **body** | [**WriteAuthorizationModelRequest**](WriteAuthorizationModelRequest.md) |  |  |

### Return type

[**WriteAuthorizationModelResponse**](WriteAuthorizationModelResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

