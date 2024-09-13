=begin
#OpenFGA

#A high performance and flexible authorization/permission engine built for developers and inspired by Google Zanzibar.

The version of the OpenAPI document: 1.x
Contact: community@openfga.dev
Generated by: https://openapi-generator.tech
Generator version: 7.8.0

=end

require 'date'
require 'time'

module OpenfgaClient
  class ErrorCode
    NO_ERROR = "no_error".freeze
    VALIDATION_ERROR = "validation_error".freeze
    AUTHORIZATION_MODEL_NOT_FOUND = "authorization_model_not_found".freeze
    AUTHORIZATION_MODEL_RESOLUTION_TOO_COMPLEX = "authorization_model_resolution_too_complex".freeze
    INVALID_WRITE_INPUT = "invalid_write_input".freeze
    CANNOT_ALLOW_DUPLICATE_TUPLES_IN_ONE_REQUEST = "cannot_allow_duplicate_tuples_in_one_request".freeze
    CANNOT_ALLOW_DUPLICATE_TYPES_IN_ONE_REQUEST = "cannot_allow_duplicate_types_in_one_request".freeze
    CANNOT_ALLOW_MULTIPLE_REFERENCES_TO_ONE_RELATION = "cannot_allow_multiple_references_to_one_relation".freeze
    INVALID_CONTINUATION_TOKEN = "invalid_continuation_token".freeze
    INVALID_TUPLE_SET = "invalid_tuple_set".freeze
    INVALID_CHECK_INPUT = "invalid_check_input".freeze
    INVALID_EXPAND_INPUT = "invalid_expand_input".freeze
    UNSUPPORTED_USER_SET = "unsupported_user_set".freeze
    INVALID_OBJECT_FORMAT = "invalid_object_format".freeze
    WRITE_FAILED_DUE_TO_INVALID_INPUT = "write_failed_due_to_invalid_input".freeze
    AUTHORIZATION_MODEL_ASSERTIONS_NOT_FOUND = "authorization_model_assertions_not_found".freeze
    LATEST_AUTHORIZATION_MODEL_NOT_FOUND = "latest_authorization_model_not_found".freeze
    TYPE_NOT_FOUND = "type_not_found".freeze
    RELATION_NOT_FOUND = "relation_not_found".freeze
    EMPTY_RELATION_DEFINITION = "empty_relation_definition".freeze
    INVALID_USER = "invalid_user".freeze
    INVALID_TUPLE = "invalid_tuple".freeze
    UNKNOWN_RELATION = "unknown_relation".freeze
    STORE_ID_INVALID_LENGTH = "store_id_invalid_length".freeze
    ASSERTIONS_TOO_MANY_ITEMS = "assertions_too_many_items".freeze
    ID_TOO_LONG = "id_too_long".freeze
    AUTHORIZATION_MODEL_ID_TOO_LONG = "authorization_model_id_too_long".freeze
    TUPLE_KEY_VALUE_NOT_SPECIFIED = "tuple_key_value_not_specified".freeze
    TUPLE_KEYS_TOO_MANY_OR_TOO_FEW_ITEMS = "tuple_keys_too_many_or_too_few_items".freeze
    PAGE_SIZE_INVALID = "page_size_invalid".freeze
    PARAM_MISSING_VALUE = "param_missing_value".freeze
    DIFFERENCE_BASE_MISSING_VALUE = "difference_base_missing_value".freeze
    SUBTRACT_BASE_MISSING_VALUE = "subtract_base_missing_value".freeze
    OBJECT_TOO_LONG = "object_too_long".freeze
    RELATION_TOO_LONG = "relation_too_long".freeze
    TYPE_DEFINITIONS_TOO_FEW_ITEMS = "type_definitions_too_few_items".freeze
    TYPE_INVALID_LENGTH = "type_invalid_length".freeze
    TYPE_INVALID_PATTERN = "type_invalid_pattern".freeze
    RELATIONS_TOO_FEW_ITEMS = "relations_too_few_items".freeze
    RELATIONS_TOO_LONG = "relations_too_long".freeze
    RELATIONS_INVALID_PATTERN = "relations_invalid_pattern".freeze
    OBJECT_INVALID_PATTERN = "object_invalid_pattern".freeze
    QUERY_STRING_TYPE_CONTINUATION_TOKEN_MISMATCH = "query_string_type_continuation_token_mismatch".freeze
    EXCEEDED_ENTITY_LIMIT = "exceeded_entity_limit".freeze
    INVALID_CONTEXTUAL_TUPLE = "invalid_contextual_tuple".freeze
    DUPLICATE_CONTEXTUAL_TUPLE = "duplicate_contextual_tuple".freeze
    INVALID_AUTHORIZATION_MODEL = "invalid_authorization_model".freeze
    UNSUPPORTED_SCHEMA_VERSION = "unsupported_schema_version".freeze
    CANCELLED = "cancelled".freeze

    def self.all_vars
      @all_vars ||= [NO_ERROR, VALIDATION_ERROR, AUTHORIZATION_MODEL_NOT_FOUND, AUTHORIZATION_MODEL_RESOLUTION_TOO_COMPLEX, INVALID_WRITE_INPUT, CANNOT_ALLOW_DUPLICATE_TUPLES_IN_ONE_REQUEST, CANNOT_ALLOW_DUPLICATE_TYPES_IN_ONE_REQUEST, CANNOT_ALLOW_MULTIPLE_REFERENCES_TO_ONE_RELATION, INVALID_CONTINUATION_TOKEN, INVALID_TUPLE_SET, INVALID_CHECK_INPUT, INVALID_EXPAND_INPUT, UNSUPPORTED_USER_SET, INVALID_OBJECT_FORMAT, WRITE_FAILED_DUE_TO_INVALID_INPUT, AUTHORIZATION_MODEL_ASSERTIONS_NOT_FOUND, LATEST_AUTHORIZATION_MODEL_NOT_FOUND, TYPE_NOT_FOUND, RELATION_NOT_FOUND, EMPTY_RELATION_DEFINITION, INVALID_USER, INVALID_TUPLE, UNKNOWN_RELATION, STORE_ID_INVALID_LENGTH, ASSERTIONS_TOO_MANY_ITEMS, ID_TOO_LONG, AUTHORIZATION_MODEL_ID_TOO_LONG, TUPLE_KEY_VALUE_NOT_SPECIFIED, TUPLE_KEYS_TOO_MANY_OR_TOO_FEW_ITEMS, PAGE_SIZE_INVALID, PARAM_MISSING_VALUE, DIFFERENCE_BASE_MISSING_VALUE, SUBTRACT_BASE_MISSING_VALUE, OBJECT_TOO_LONG, RELATION_TOO_LONG, TYPE_DEFINITIONS_TOO_FEW_ITEMS, TYPE_INVALID_LENGTH, TYPE_INVALID_PATTERN, RELATIONS_TOO_FEW_ITEMS, RELATIONS_TOO_LONG, RELATIONS_INVALID_PATTERN, OBJECT_INVALID_PATTERN, QUERY_STRING_TYPE_CONTINUATION_TOKEN_MISMATCH, EXCEEDED_ENTITY_LIMIT, INVALID_CONTEXTUAL_TUPLE, DUPLICATE_CONTEXTUAL_TUPLE, INVALID_AUTHORIZATION_MODEL, UNSUPPORTED_SCHEMA_VERSION, CANCELLED].freeze
    end

    # Builds the enum from string
    # @param [String] The enum value in the form of the string
    # @return [String] The enum value
    def self.build_from_hash(value)
      new.build_from_hash(value)
    end

    # Builds the enum from string
    # @param [String] The enum value in the form of the string
    # @return [String] The enum value
    def build_from_hash(value)
      return value if ErrorCode.all_vars.include?(value)
      raise "Invalid ENUM value #{value} for class #ErrorCode"
    end
  end
end
