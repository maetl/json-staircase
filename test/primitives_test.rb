require 'test/unit'
require 'json/staircase'

class PrimitivesTest < Test::Unit::TestCase

  def test_properties
  	schema = JSON::Staircase::Schema.new('./test/resources/primitives.json')

  	assert_equal 7, schema.properties.length
  	assert_equal 'string', schema.properties['string']['type']
  	assert_equal 'number', schema.properties['number']['type']
  	assert_equal 'integer', schema.properties['integer']['type']
  	assert_equal 'boolean', schema.properties['boolean']['type']
  	assert_equal 'object', schema.properties['object']['type']
  end

  def test_flattened_properties
  	schema = JSON::Staircase::Schema.new('./test/resources/primitives.json')

  	assert_equal 8, schema.flattened_properties.length
  	assert_equal 'string', schema.flattened_properties['object.name']['type']
  end

end
