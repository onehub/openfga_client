# OpenfgaClient::AssertionsApi

All URIs are relative to *http://localhost*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**read_assertions**](AssertionsApi.md#read_assertions) | **GET** /stores/{store_id}/assertions/{authorization_model_id} | Read assertions for an authorization model ID |
| [**write_assertions**](AssertionsApi.md#write_assertions) | **PUT** /stores/{store_id}/assertions/{authorization_model_id} | Upsert assertions for an authorization model ID |


## read_assertions

> <ReadAssertionsResponse> read_assertions(store_id, authorization_model_id)

Read assertions for an authorization model ID

The ReadAssertions API will return, for a given authorization model id, all the assertions stored for it. 

### Examples

```ruby
require 'time'
require 'openfga_client'

api_instance = OpenfgaClient::AssertionsApi.new
store_id = 'store_id_example' # String | 
authorization_model_id = 'authorization_model_id_example' # String | 

begin
  # Read assertions for an authorization model ID
  result = api_instance.read_assertions(store_id, authorization_model_id)
  p result
rescue OpenfgaClient::ApiError => e
  puts "Error when calling AssertionsApi->read_assertions: #{e}"
end
```

#### Using the read_assertions_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ReadAssertionsResponse>, Integer, Hash)> read_assertions_with_http_info(store_id, authorization_model_id)

```ruby
begin
  # Read assertions for an authorization model ID
  data, status_code, headers = api_instance.read_assertions_with_http_info(store_id, authorization_model_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ReadAssertionsResponse>
rescue OpenfgaClient::ApiError => e
  puts "Error when calling AssertionsApi->read_assertions_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **store_id** | **String** |  |  |
| **authorization_model_id** | **String** |  |  |

### Return type

[**ReadAssertionsResponse**](ReadAssertionsResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## write_assertions

> write_assertions(store_id, authorization_model_id, body)

Upsert assertions for an authorization model ID

The WriteAssertions API will upsert new assertions for an authorization model id, or overwrite the existing ones. An assertion is an object that contains a tuple key, the expectation of whether a call to the Check API of that tuple key will return true or false, and optionally a list of contextual tuples.

### Examples

```ruby
require 'time'
require 'openfga_client'

api_instance = OpenfgaClient::AssertionsApi.new
store_id = 'store_id_example' # String | 
authorization_model_id = 'authorization_model_id_example' # String | 
body = OpenfgaClient::WriteAssertionsRequest.new({assertions: [OpenfgaClient::Assertion.new({tuple_key: OpenfgaClient::AssertionTupleKey.new({object: 'document:2021-budget', relation: 'reader', user: 'user:anne'}), expectation: false})]}) # WriteAssertionsRequest | 

begin
  # Upsert assertions for an authorization model ID
  api_instance.write_assertions(store_id, authorization_model_id, body)
rescue OpenfgaClient::ApiError => e
  puts "Error when calling AssertionsApi->write_assertions: #{e}"
end
```

#### Using the write_assertions_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> write_assertions_with_http_info(store_id, authorization_model_id, body)

```ruby
begin
  # Upsert assertions for an authorization model ID
  data, status_code, headers = api_instance.write_assertions_with_http_info(store_id, authorization_model_id, body)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue OpenfgaClient::ApiError => e
  puts "Error when calling AssertionsApi->write_assertions_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **store_id** | **String** |  |  |
| **authorization_model_id** | **String** |  |  |
| **body** | [**WriteAssertionsRequest**](WriteAssertionsRequest.md) |  |  |

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

