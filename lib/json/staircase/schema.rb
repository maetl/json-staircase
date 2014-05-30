module JSON

  class Validator
  	def schema_object
  	  @base_schema.schema
  	end
  end

  module Staircase
    class Schema
      def initialize(schema)
      	@validator = JSON::Validator.new(schema, {}, {})
      end

      def title
      	@validator.schema_object['title']
      end

      def description
      	@validator.schema_object['description']
      end

      def properties
      	@validator.schema_object['properties']
      end

      def flattened_properties
      	flatten_properties(properties, {})
      end

      def flatten_properties(nested, flattened, object_path='')
      	nested.each do |name,object|
      	  if object['type'] == 'object'
      	  	key_name = object_path + name
      	  	flattened[key_name] = object
      	  	flatten_properties(object['properties'], flattened, "#{name}.")
      	  else
      	  	key_name = object_path + name
      	  	flattened[key_name] = object
      	  end
      	end
      	flattened
      end

      def definition
      	if @validator.schema_object['allOf']
      	  all_of_definition(@validator.schema_object)
      	elsif @validator.schema_object['anyOf']
      	  any_of_definition(@validator.schema_object)
      	elsif @validator.schema_object['oneOf']
      	  one_of_definition(@validator.schema_object)
      	else
      	  type_definition(@validator.schema_object)
      	end
      end

      def all_of_definition

      end

      def any_of_definition

      end

	  def one_of_definition
	  	
	  end

      def type_definition(schema)
		{ schema['type'] => flattened_properties }
      end

    end
  end
end
