# OpenfgaClient::UnprocessableContentMessageResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **code** | [**UnprocessableContentErrorCode**](UnprocessableContentErrorCode.md) |  | [optional][default to &#39;no_throttled_error_code&#39;] |
| **message** | **String** |  | [optional] |

## Example

```ruby
require 'openfga_client'

instance = OpenfgaClient::UnprocessableContentMessageResponse.new(
  code: null,
  message: null
)
```

