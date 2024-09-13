# OpenfgaClient::UsersetUser

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | **String** |  |  |
| **id** | **String** |  |  |
| **relation** | **String** |  |  |

## Example

```ruby
require 'openfga_client'

instance = OpenfgaClient::UsersetUser.new(
  type: group,
  id: fga,
  relation: member
)
```

