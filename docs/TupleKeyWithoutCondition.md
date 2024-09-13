# OpenfgaClient::TupleKeyWithoutCondition

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **user** | **String** |  |  |
| **relation** | **String** |  |  |
| **object** | **String** |  |  |

## Example

```ruby
require 'openfga_client'

instance = OpenfgaClient::TupleKeyWithoutCondition.new(
  user: user:anne,
  relation: reader,
  object: document:2021-budget
)
```

