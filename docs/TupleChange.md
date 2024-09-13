# OpenfgaClient::TupleChange

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **tuple_key** | [**TupleKey**](TupleKey.md) |  |  |
| **operation** | [**TupleOperation**](TupleOperation.md) |  | [default to &#39;TUPLE_OPERATION_WRITE&#39;] |
| **timestamp** | **Time** |  |  |

## Example

```ruby
require 'openfga_client'

instance = OpenfgaClient::TupleChange.new(
  tuple_key: null,
  operation: null,
  timestamp: null
)
```

