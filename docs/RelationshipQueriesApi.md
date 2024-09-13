# OpenfgaClient::RelationshipQueriesApi

All URIs are relative to *http://localhost*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**check**](RelationshipQueriesApi.md#check) | **POST** /stores/{store_id}/check | Check whether a user is authorized to access an object |
| [**expand**](RelationshipQueriesApi.md#expand) | **POST** /stores/{store_id}/expand | Expand all relationships in userset tree format, and following userset rewrite rules.  Useful to reason about and debug a certain relationship |
| [**list_objects**](RelationshipQueriesApi.md#list_objects) | **POST** /stores/{store_id}/list-objects | List all objects of the given type that the user has a relation with |
| [**list_users**](RelationshipQueriesApi.md#list_users) | **POST** /stores/{store_id}/list-users | List the users matching the provided filter who have a certain relation to a particular type. |
| [**streamed_list_objects**](RelationshipQueriesApi.md#streamed_list_objects) | **POST** /stores/{store_id}/streamed-list-objects | Stream all objects of the given type that the user has a relation with |


## check

> <CheckResponse> check(store_id, body)

Check whether a user is authorized to access an object

The Check API returns whether a given user has a relationship with a given object in a given store. The `user` field of the request can be a specific target, such as `user:anne`, or a userset (set of users) such as `group:marketing#member` or a type-bound public access `user:*`. To arrive at a result, the API uses: an authorization model, explicit tuples written through the Write API, contextual tuples present in the request, and implicit tuples that exist by virtue of applying set theory (such as `document:2021-budget#viewer@document:2021-budget#viewer`; the set of users who are viewers of `document:2021-budget` are the set of users who are the viewers of `document:2021-budget`). A `contextual_tuples` object may also be included in the body of the request. This object contains one field `tuple_keys`, which is an array of tuple keys. Each of these tuples may have an associated `condition`. You may also provide an `authorization_model_id` in the body. This will be used to assert that the input `tuple_key` is valid for the model specified. If not specified, the assertion will be made against the latest authorization model ID. It is strongly recommended to specify authorization model id for better performance. You may also provide a `context` object that will be used to evaluate the conditioned tuples in the system. It is strongly recommended to provide a value for all the input parameters of all the conditions, to ensure that all tuples be evaluated correctly. By default, the Check API caches results for a short time to optimize performance. You may specify a value of `HIGHER_CONSISTENCY` for the optional `consistency` parameter in the body to inform the server that higher conisistency is preferred at the expense of increased latency. Consideration should be given to the increased latency if requesting higher consistency. The response will return whether the relationship exists in the field `allowed`.  Some exceptions apply, but in general, if a Check API responds with `{allowed: true}`, then you can expect the equivalent ListObjects query to return the object, and viceversa.  For example, if `Check(user:anne, reader, document:2021-budget)` responds with `{allowed: true}`, then `ListObjects(user:anne, reader, document)` may include `document:2021-budget` in the response. ## Examples ### Querying with contextual tuples In order to check if user `user:anne` of type `user` has a `reader` relationship with object `document:2021-budget` given the following contextual tuple ```json {   \"user\": \"user:anne\",   \"relation\": \"member\",   \"object\": \"time_slot:office_hours\" } ``` the Check API can be used with the following request body: ```json {   \"tuple_key\": {     \"user\": \"user:anne\",     \"relation\": \"reader\",     \"object\": \"document:2021-budget\"   },   \"contextual_tuples\": {     \"tuple_keys\": [       {         \"user\": \"user:anne\",         \"relation\": \"member\",         \"object\": \"time_slot:office_hours\"       }     ]   },   \"authorization_model_id\": \"01G50QVV17PECNVAHX1GG4Y5NC\" } ``` ### Querying usersets Some Checks will always return `true`, even without any tuples. For example, for the following authorization model ```python model   schema 1.1 type user type document   relations     define reader: [user] ``` the following query ```json {   \"tuple_key\": {      \"user\": \"document:2021-budget#reader\",      \"relation\": \"reader\",      \"object\": \"document:2021-budget\"   } } ``` will always return `{ \"allowed\": true }`. This is because usersets are self-defining: the userset `document:2021-budget#reader` will always have the `reader` relation with `document:2021-budget`. ### Querying usersets with difference in the model A Check for a userset can yield results that must be treated carefully if the model involves difference. For example, for the following authorization model ```python model   schema 1.1 type user type group   relations     define member: [user] type document   relations     define blocked: [user]     define reader: [group#member] but not blocked ``` the following query ```json {   \"tuple_key\": {      \"user\": \"group:finance#member\",      \"relation\": \"reader\",      \"object\": \"document:2021-budget\"   },   \"contextual_tuples\": {     \"tuple_keys\": [       {         \"user\": \"user:anne\",         \"relation\": \"member\",         \"object\": \"group:finance\"       },       {         \"user\": \"group:finance#member\",         \"relation\": \"reader\",         \"object\": \"document:2021-budget\"       },       {         \"user\": \"user:anne\",         \"relation\": \"blocked\",         \"object\": \"document:2021-budget\"       }     ]   }, } ``` will return `{ \"allowed\": true }`, even though a specific user of the userset `group:finance#member` does not have the `reader` relationship with the given object. ### Requesting higher consistency By default, the Check API caches results for a short time to optimize performance. You may request higher consistency to inform the server that higher consistency should be preferred at the expense of increased latency. Care should be taken when requesting higher consistency due to the increased latency. ```json {   \"tuple_key\": {      \"user\": \"group:finance#member\",      \"relation\": \"reader\",      \"object\": \"document:2021-budget\"   },   \"consistency\": \"HIGHER_CONSISTENCY\" } ``` 

### Examples

```ruby
require 'time'
require 'openfga_client'

api_instance = OpenfgaClient::RelationshipQueriesApi.new
store_id = 'store_id_example' # String | 
body = OpenfgaClient::CheckRequest.new({tuple_key: OpenfgaClient::CheckRequestTupleKey.new({user: 'user:anne', relation: 'reader', object: 'document:2021-budget'})}) # CheckRequest | 

begin
  # Check whether a user is authorized to access an object
  result = api_instance.check(store_id, body)
  p result
rescue OpenfgaClient::ApiError => e
  puts "Error when calling RelationshipQueriesApi->check: #{e}"
end
```

#### Using the check_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CheckResponse>, Integer, Hash)> check_with_http_info(store_id, body)

```ruby
begin
  # Check whether a user is authorized to access an object
  data, status_code, headers = api_instance.check_with_http_info(store_id, body)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CheckResponse>
rescue OpenfgaClient::ApiError => e
  puts "Error when calling RelationshipQueriesApi->check_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **store_id** | **String** |  |  |
| **body** | [**CheckRequest**](CheckRequest.md) |  |  |

### Return type

[**CheckResponse**](CheckResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## expand

> <ExpandResponse> expand(store_id, body)

Expand all relationships in userset tree format, and following userset rewrite rules.  Useful to reason about and debug a certain relationship

The Expand API will return all users and usersets that have certain relationship with an object in a certain store. This is different from the `/stores/{store_id}/read` API in that both users and computed usersets are returned. Body parameters `tuple_key.object` and `tuple_key.relation` are all required. The response will return a tree whose leaves are the specific users and usersets. Union, intersection and difference operator are located in the intermediate nodes.  ## Example To expand all users that have the `reader` relationship with object `document:2021-budget`, use the Expand API with the following request body ```json {   \"tuple_key\": {     \"object\": \"document:2021-budget\",     \"relation\": \"reader\"   },   \"authorization_model_id\": \"01G50QVV17PECNVAHX1GG4Y5NC\" } ``` OpenFGA's response will be a userset tree of the users and usersets that have read access to the document. ```json {   \"tree\":{     \"root\":{       \"type\":\"document:2021-budget#reader\",       \"union\":{         \"nodes\":[           {             \"type\":\"document:2021-budget#reader\",             \"leaf\":{               \"users\":{                 \"users\":[                   \"user:bob\"                 ]               }             }           },           {             \"type\":\"document:2021-budget#reader\",             \"leaf\":{               \"computed\":{                 \"userset\":\"document:2021-budget#writer\"               }             }           }         ]       }     }   } } ``` The caller can then call expand API for the `writer` relationship for the `document:2021-budget`.

### Examples

```ruby
require 'time'
require 'openfga_client'

api_instance = OpenfgaClient::RelationshipQueriesApi.new
store_id = 'store_id_example' # String | 
body = OpenfgaClient::ExpandRequest.new({tuple_key: OpenfgaClient::ExpandRequestTupleKey.new({relation: 'reader', object: 'document:2021-budget'})}) # ExpandRequest | 

begin
  # Expand all relationships in userset tree format, and following userset rewrite rules.  Useful to reason about and debug a certain relationship
  result = api_instance.expand(store_id, body)
  p result
rescue OpenfgaClient::ApiError => e
  puts "Error when calling RelationshipQueriesApi->expand: #{e}"
end
```

#### Using the expand_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ExpandResponse>, Integer, Hash)> expand_with_http_info(store_id, body)

```ruby
begin
  # Expand all relationships in userset tree format, and following userset rewrite rules.  Useful to reason about and debug a certain relationship
  data, status_code, headers = api_instance.expand_with_http_info(store_id, body)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ExpandResponse>
rescue OpenfgaClient::ApiError => e
  puts "Error when calling RelationshipQueriesApi->expand_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **store_id** | **String** |  |  |
| **body** | [**ExpandRequest**](ExpandRequest.md) |  |  |

### Return type

[**ExpandResponse**](ExpandResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## list_objects

> <ListObjectsResponse> list_objects(store_id, body)

List all objects of the given type that the user has a relation with

The ListObjects API returns a list of all the objects of the given type that the user has a relation with.  To arrive at a result, the API uses: an authorization model, explicit tuples written through the Write API, contextual tuples present in the request, and implicit tuples that exist by virtue of applying set theory (such as `document:2021-budget#viewer@document:2021-budget#viewer`; the set of users who are viewers of `document:2021-budget` are the set of users who are the viewers of `document:2021-budget`). An `authorization_model_id` may be specified in the body. If it is not specified, the latest authorization model ID will be used. It is strongly recommended to specify authorization model id for better performance. You may also specify `contextual_tuples` that will be treated as regular tuples. Each of these tuples may have an associated `condition`. You may also provide a `context` object that will be used to evaluate the conditioned tuples in the system. It is strongly recommended to provide a value for all the input parameters of all the conditions, to ensure that all tuples be evaluated correctly. By default, the Check API caches results for a short time to optimize performance. You may specify a value of `HIGHER_CONSISTENCY` for the optional `consistency` parameter in the body to inform the server that higher conisistency is preferred at the expense of increased latency. Consideration should be given to the increased latency if requesting higher consistency. The response will contain the related objects in an array in the \"objects\" field of the response and they will be strings in the object format `<type>:<id>` (e.g. \"document:roadmap\"). The number of objects in the response array will be limited by the execution timeout specified in the flag OPENFGA_LIST_OBJECTS_DEADLINE and by the upper bound specified in the flag OPENFGA_LIST_OBJECTS_MAX_RESULTS, whichever is hit first. The objects given will not be sorted, and therefore two identical calls can give a given different set of objects.

### Examples

```ruby
require 'time'
require 'openfga_client'

api_instance = OpenfgaClient::RelationshipQueriesApi.new
store_id = 'store_id_example' # String | 
body = OpenfgaClient::ListObjectsRequest.new({type: 'document', relation: 'reader', user: 'user:anne'}) # ListObjectsRequest | 

begin
  # List all objects of the given type that the user has a relation with
  result = api_instance.list_objects(store_id, body)
  p result
rescue OpenfgaClient::ApiError => e
  puts "Error when calling RelationshipQueriesApi->list_objects: #{e}"
end
```

#### Using the list_objects_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListObjectsResponse>, Integer, Hash)> list_objects_with_http_info(store_id, body)

```ruby
begin
  # List all objects of the given type that the user has a relation with
  data, status_code, headers = api_instance.list_objects_with_http_info(store_id, body)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListObjectsResponse>
rescue OpenfgaClient::ApiError => e
  puts "Error when calling RelationshipQueriesApi->list_objects_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **store_id** | **String** |  |  |
| **body** | [**ListObjectsRequest**](ListObjectsRequest.md) |  |  |

### Return type

[**ListObjectsResponse**](ListObjectsResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## list_users

> <ListUsersResponse> list_users(store_id, body)

List the users matching the provided filter who have a certain relation to a particular type.

The ListUsers API returns a list of all the users of a specific type that have a relation to a given object.  To arrive at a result, the API uses: an authorization model, explicit tuples written through the Write API, contextual tuples present in the request, and implicit tuples that exist by virtue of applying set theory (such as `document:2021-budget#viewer@document:2021-budget#viewer`; the set of users who are viewers of `document:2021-budget` are the set of users who are the viewers of `document:2021-budget`). An `authorization_model_id` may be specified in the body. If it is not specified, the latest authorization model ID will be used. It is strongly recommended to specify authorization model id for better performance. You may also specify `contextual_tuples` that will be treated as regular tuples. Each of these tuples may have an associated `condition`. You may also provide a `context` object that will be used to evaluate the conditioned tuples in the system. It is strongly recommended to provide a value for all the input parameters of all the conditions, to ensure that all tuples be evaluated correctly. The response will contain the related users in an array in the \"users\" field of the response. These results may include specific objects, usersets  or type-bound public access. Each of these types of results is encoded in its own type and not represented as a string.In cases where a type-bound public access result is returned (e.g. `user:*`), it cannot be inferred that all subjects of that type have a relation to the object; it is possible that negations exist and checks should still be queried on individual subjects to ensure access to that document.The number of users in the response array will be limited by the execution timeout specified in the flag OPENFGA_LIST_USERS_DEADLINE and by the upper bound specified in the flag OPENFGA_LIST_USERS_MAX_RESULTS, whichever is hit first. The returned users will not be sorted, and therefore two identical calls may yield different sets of users.

### Examples

```ruby
require 'time'
require 'openfga_client'

api_instance = OpenfgaClient::RelationshipQueriesApi.new
store_id = 'store_id_example' # String | 
body = OpenfgaClient::ListUsersRequest.new({object: 3.56, relation: 'reader', user_filters: [{type=user},  {type=group,  relation=member}]}) # ListUsersRequest | 

begin
  # List the users matching the provided filter who have a certain relation to a particular type.
  result = api_instance.list_users(store_id, body)
  p result
rescue OpenfgaClient::ApiError => e
  puts "Error when calling RelationshipQueriesApi->list_users: #{e}"
end
```

#### Using the list_users_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListUsersResponse>, Integer, Hash)> list_users_with_http_info(store_id, body)

```ruby
begin
  # List the users matching the provided filter who have a certain relation to a particular type.
  data, status_code, headers = api_instance.list_users_with_http_info(store_id, body)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListUsersResponse>
rescue OpenfgaClient::ApiError => e
  puts "Error when calling RelationshipQueriesApi->list_users_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **store_id** | **String** |  |  |
| **body** | [**ListUsersRequest**](ListUsersRequest.md) |  |  |

### Return type

[**ListUsersResponse**](ListUsersResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## streamed_list_objects

> <StreamResultOfStreamedListObjectsResponse> streamed_list_objects(store_id, body)

Stream all objects of the given type that the user has a relation with

The Streamed ListObjects API is very similar to the the ListObjects API, with two differences:  1. Instead of collecting all objects before returning a response, it streams them to the client as they are collected.  2. The number of results returned is only limited by the execution timeout specified in the flag OPENFGA_LIST_OBJECTS_DEADLINE.  

### Examples

```ruby
require 'time'
require 'openfga_client'

api_instance = OpenfgaClient::RelationshipQueriesApi.new
store_id = 'store_id_example' # String | 
body = OpenfgaClient::ListObjectsRequest.new({type: 'document', relation: 'reader', user: 'user:anne'}) # ListObjectsRequest | 

begin
  # Stream all objects of the given type that the user has a relation with
  result = api_instance.streamed_list_objects(store_id, body)
  p result
rescue OpenfgaClient::ApiError => e
  puts "Error when calling RelationshipQueriesApi->streamed_list_objects: #{e}"
end
```

#### Using the streamed_list_objects_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<StreamResultOfStreamedListObjectsResponse>, Integer, Hash)> streamed_list_objects_with_http_info(store_id, body)

```ruby
begin
  # Stream all objects of the given type that the user has a relation with
  data, status_code, headers = api_instance.streamed_list_objects_with_http_info(store_id, body)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <StreamResultOfStreamedListObjectsResponse>
rescue OpenfgaClient::ApiError => e
  puts "Error when calling RelationshipQueriesApi->streamed_list_objects_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **store_id** | **String** |  |  |
| **body** | [**ListObjectsRequest**](ListObjectsRequest.md) |  |  |

### Return type

[**StreamResultOfStreamedListObjectsResponse**](StreamResultOfStreamedListObjectsResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

