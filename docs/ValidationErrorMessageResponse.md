# OpenfgaClient::ValidationErrorMessageResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **code** | [**ErrorCode**](ErrorCode.md) |  | [optional][default to &#39;no_error&#39;] |
| **message** | **String** |  | [optional] |

## Example

```ruby
require 'openfga_client'

instance = OpenfgaClient::ValidationErrorMessageResponse.new(
  code: null,
  message: null
)
```

