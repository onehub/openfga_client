# OpenfgaClient::WriteAuthorizationModelRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type_definitions** | [**Array&lt;TypeDefinition&gt;**](TypeDefinition.md) |  |  |
| **schema_version** | **String** |  |  |
| **conditions** | [**Hash&lt;String, Condition&gt;**](Condition.md) |  | [optional] |

## Example

```ruby
require 'openfga_client'

instance = OpenfgaClient::WriteAuthorizationModelRequest.new(
  type_definitions: null,
  schema_version: null,
  conditions: null
)
```

