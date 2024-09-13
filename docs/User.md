# OpenfgaClient::User

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **object** | **Object** |  | [optional] |
| **userset** | [**UsersetUser**](UsersetUser.md) |  | [optional] |
| **wildcard** | [**TypedWildcard**](TypedWildcard.md) |  | [optional] |

## Example

```ruby
require 'openfga_client'

instance = OpenfgaClient::User.new(
  object: null,
  userset: null,
  wildcard: null
)
```

