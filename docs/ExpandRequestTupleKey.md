# OpenfgaClient::ExpandRequestTupleKey

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **relation** | **String** |  |  |
| **object** | **String** |  |  |

## Example

```ruby
require 'openfga_client'

instance = OpenfgaClient::ExpandRequestTupleKey.new(
  relation: reader,
  object: document:2021-budget
)
```

