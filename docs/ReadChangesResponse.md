# OpenfgaClient::ReadChangesResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **changes** | [**Array&lt;TupleChange&gt;**](TupleChange.md) |  |  |
| **continuation_token** | **String** | The continuation token will be identical if there are no new changes. | [optional] |

## Example

```ruby
require 'openfga_client'

instance = OpenfgaClient::ReadChangesResponse.new(
  changes: null,
  continuation_token: eyJwayI6IkxBVEVTVF9OU0NPTkZJR19hdXRoMHN0b3JlIiwic2siOiIxem1qbXF3MWZLZExTcUoyN01MdTdqTjh0cWgifQ&#x3D;&#x3D;
)
```

