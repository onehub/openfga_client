# OpenfgaClient::WriteRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **writes** | [**WriteRequestWrites**](WriteRequestWrites.md) |  | [optional] |
| **deletes** | [**WriteRequestDeletes**](WriteRequestDeletes.md) |  | [optional] |
| **authorization_model_id** | **String** |  | [optional] |

## Example

```ruby
require 'openfga_client'

instance = OpenfgaClient::WriteRequest.new(
  writes: null,
  deletes: null,
  authorization_model_id: 01G5JAVJ41T49E9TT3SKVS7X1J
)
```

