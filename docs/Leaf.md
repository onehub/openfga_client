# OpenfgaClient::Leaf

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **users** | [**Users**](Users.md) |  | [optional] |
| **computed** | [**Computed**](Computed.md) |  | [optional] |
| **tuple_to_userset** | [**UsersetTreeTupleToUserset**](UsersetTreeTupleToUserset.md) |  | [optional] |

## Example

```ruby
require 'openfga_client'

instance = OpenfgaClient::Leaf.new(
  users: null,
  computed: null,
  tuple_to_userset: null
)
```

