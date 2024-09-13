# OpenfgaClient::StoresApi

All URIs are relative to *http://localhost*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_store**](StoresApi.md#create_store) | **POST** /stores | Create a store |
| [**delete_store**](StoresApi.md#delete_store) | **DELETE** /stores/{store_id} | Delete a store |
| [**get_store**](StoresApi.md#get_store) | **GET** /stores/{store_id} | Get a store |
| [**list_stores**](StoresApi.md#list_stores) | **GET** /stores | List all stores |


## create_store

> <CreateStoreResponse> create_store(body)

Create a store

Create a unique OpenFGA store which will be used to store authorization models and relationship tuples.

### Examples

```ruby
require 'time'
require 'openfga_client'

api_instance = OpenfgaClient::StoresApi.new
body = OpenfgaClient::CreateStoreRequest.new({name: 'my-store-name'}) # CreateStoreRequest | 

begin
  # Create a store
  result = api_instance.create_store(body)
  p result
rescue OpenfgaClient::ApiError => e
  puts "Error when calling StoresApi->create_store: #{e}"
end
```

#### Using the create_store_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CreateStoreResponse>, Integer, Hash)> create_store_with_http_info(body)

```ruby
begin
  # Create a store
  data, status_code, headers = api_instance.create_store_with_http_info(body)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CreateStoreResponse>
rescue OpenfgaClient::ApiError => e
  puts "Error when calling StoresApi->create_store_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **body** | [**CreateStoreRequest**](CreateStoreRequest.md) |  |  |

### Return type

[**CreateStoreResponse**](CreateStoreResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## delete_store

> delete_store(store_id)

Delete a store

Delete an OpenFGA store. This does not delete the data associated with the store, like tuples or authorization models.

### Examples

```ruby
require 'time'
require 'openfga_client'

api_instance = OpenfgaClient::StoresApi.new
store_id = 'store_id_example' # String | 

begin
  # Delete a store
  api_instance.delete_store(store_id)
rescue OpenfgaClient::ApiError => e
  puts "Error when calling StoresApi->delete_store: #{e}"
end
```

#### Using the delete_store_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_store_with_http_info(store_id)

```ruby
begin
  # Delete a store
  data, status_code, headers = api_instance.delete_store_with_http_info(store_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue OpenfgaClient::ApiError => e
  puts "Error when calling StoresApi->delete_store_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **store_id** | **String** |  |  |

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_store

> <GetStoreResponse> get_store(store_id)

Get a store

Returns an OpenFGA store by its identifier

### Examples

```ruby
require 'time'
require 'openfga_client'

api_instance = OpenfgaClient::StoresApi.new
store_id = 'store_id_example' # String | 

begin
  # Get a store
  result = api_instance.get_store(store_id)
  p result
rescue OpenfgaClient::ApiError => e
  puts "Error when calling StoresApi->get_store: #{e}"
end
```

#### Using the get_store_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetStoreResponse>, Integer, Hash)> get_store_with_http_info(store_id)

```ruby
begin
  # Get a store
  data, status_code, headers = api_instance.get_store_with_http_info(store_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetStoreResponse>
rescue OpenfgaClient::ApiError => e
  puts "Error when calling StoresApi->get_store_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **store_id** | **String** |  |  |

### Return type

[**GetStoreResponse**](GetStoreResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_stores

> <ListStoresResponse> list_stores(opts)

List all stores

Returns a paginated list of OpenFGA stores and a continuation token to get additional stores. The continuation token will be empty if there are no more stores. 

### Examples

```ruby
require 'time'
require 'openfga_client'

api_instance = OpenfgaClient::StoresApi.new
opts = {
  page_size: 56, # Integer | 
  continuation_token: 'continuation_token_example' # String | 
}

begin
  # List all stores
  result = api_instance.list_stores(opts)
  p result
rescue OpenfgaClient::ApiError => e
  puts "Error when calling StoresApi->list_stores: #{e}"
end
```

#### Using the list_stores_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListStoresResponse>, Integer, Hash)> list_stores_with_http_info(opts)

```ruby
begin
  # List all stores
  data, status_code, headers = api_instance.list_stores_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListStoresResponse>
rescue OpenfgaClient::ApiError => e
  puts "Error when calling StoresApi->list_stores_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **page_size** | **Integer** |  | [optional] |
| **continuation_token** | **String** |  | [optional] |

### Return type

[**ListStoresResponse**](ListStoresResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

