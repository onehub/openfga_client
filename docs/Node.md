# OpenfgaClient::Node

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **name** | **String** |  |  |
| **leaf** | [**Leaf**](Leaf.md) |  | [optional] |
| **difference** | [**UsersetTreeDifference**](UsersetTreeDifference.md) |  | [optional] |
| **union** | [**Nodes**](Nodes.md) |  | [optional] |
| **intersection** | [**Nodes**](Nodes.md) |  | [optional] |

## Example

```ruby
require 'openfga_client'

instance = OpenfgaClient::Node.new(
  name: null,
  leaf: null,
  difference: null,
  union: null,
  intersection: null
)
```

