=begin
#OpenFGA

#A high performance and flexible authorization/permission engine built for developers and inspired by Google Zanzibar.

The version of the OpenAPI document: 1.x
Contact: community@openfga.dev
Generated by: https://openapi-generator.tech
Generator version: 7.8.0

=end

# Common files
require 'openfga_client/api_client'
require 'openfga_client/api_error'
require 'openfga_client/version'
require 'openfga_client/configuration'

# Models
require 'openfga_client/models/aborted_message_response'
require 'openfga_client/models/any'
require 'openfga_client/models/assertion'
require 'openfga_client/models/assertion_tuple_key'
require 'openfga_client/models/authorization_model'
require 'openfga_client/models/check_request'
require 'openfga_client/models/check_request_tuple_key'
require 'openfga_client/models/check_response'
require 'openfga_client/models/computed'
require 'openfga_client/models/condition'
require 'openfga_client/models/condition_metadata'
require 'openfga_client/models/condition_param_type_ref'
require 'openfga_client/models/consistency_preference'
require 'openfga_client/models/contextual_tuple_keys'
require 'openfga_client/models/create_store_request'
require 'openfga_client/models/create_store_response'
require 'openfga_client/models/error_code'
require 'openfga_client/models/expand_request'
require 'openfga_client/models/expand_request_tuple_key'
require 'openfga_client/models/expand_response'
require 'openfga_client/models/get_store_response'
require 'openfga_client/models/internal_error_code'
require 'openfga_client/models/internal_error_message_response'
require 'openfga_client/models/leaf'
require 'openfga_client/models/list_objects_request'
require 'openfga_client/models/list_objects_response'
require 'openfga_client/models/list_stores_response'
require 'openfga_client/models/list_users_request'
require 'openfga_client/models/list_users_response'
require 'openfga_client/models/metadata'
require 'openfga_client/models/node'
require 'openfga_client/models/nodes'
require 'openfga_client/models/not_found_error_code'
require 'openfga_client/models/null_value'
require 'openfga_client/models/object'
require 'openfga_client/models/object_relation'
require 'openfga_client/models/path_unknown_error_message_response'
require 'openfga_client/models/read_assertions_response'
require 'openfga_client/models/read_authorization_model_response'
require 'openfga_client/models/read_authorization_models_response'
require 'openfga_client/models/read_changes_response'
require 'openfga_client/models/read_request'
require 'openfga_client/models/read_request_tuple_key'
require 'openfga_client/models/read_response'
require 'openfga_client/models/relation_metadata'
require 'openfga_client/models/relation_reference'
require 'openfga_client/models/relationship_condition'
require 'openfga_client/models/source_info'
require 'openfga_client/models/status'
require 'openfga_client/models/store'
require 'openfga_client/models/stream_result_of_streamed_list_objects_response'
require 'openfga_client/models/streamed_list_objects_response'
require 'openfga_client/models/tuple'
require 'openfga_client/models/tuple_change'
require 'openfga_client/models/tuple_key'
require 'openfga_client/models/tuple_key_without_condition'
require 'openfga_client/models/tuple_operation'
require 'openfga_client/models/type_definition'
require 'openfga_client/models/type_name'
require 'openfga_client/models/typed_wildcard'
require 'openfga_client/models/unauthenticated_response'
require 'openfga_client/models/unprocessable_content_error_code'
require 'openfga_client/models/unprocessable_content_message_response'
require 'openfga_client/models/user'
require 'openfga_client/models/user_type_filter'
require 'openfga_client/models/users'
require 'openfga_client/models/userset'
require 'openfga_client/models/userset_tree'
require 'openfga_client/models/userset_tree_difference'
require 'openfga_client/models/userset_tree_tuple_to_userset'
require 'openfga_client/models/userset_user'
require 'openfga_client/models/usersets'
require 'openfga_client/models/v1_difference'
require 'openfga_client/models/v1_tuple_to_userset'
require 'openfga_client/models/validation_error_message_response'
require 'openfga_client/models/write_assertions_request'
require 'openfga_client/models/write_authorization_model_request'
require 'openfga_client/models/write_authorization_model_response'
require 'openfga_client/models/write_request'
require 'openfga_client/models/write_request_deletes'
require 'openfga_client/models/write_request_writes'

# APIs
require 'openfga_client/api/assertions_api'
require 'openfga_client/api/authorization_models_api'
require 'openfga_client/api/relationship_queries_api'
require 'openfga_client/api/relationship_tuples_api'
require 'openfga_client/api/stores_api'

module OpenfgaClient
  class << self
    # Customize default settings for the SDK using block.
    #   OpenfgaClient.configure do |config|
    #     config.username = "xxx"
    #     config.password = "xxx"
    #   end
    # If no block given, return the default Configuration object.
    def configure
      if block_given?
        yield(Configuration.default)
      else
        Configuration.default
      end
    end
  end
end
