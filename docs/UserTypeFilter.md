# OpenfgaClient::UserTypeFilter

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | **String** |  |  |
| **relation** | **String** |  | [optional] |

## Example

```ruby
require 'openfga_client'

instance = OpenfgaClient::UserTypeFilter.new(
  type: group,
  relation: member
)
```

