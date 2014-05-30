require 'test/unit'
require 'json/staircase'

class DefinitionsTest < Test::Unit::TestCase

  def test_inline_definitions
  	schema = JSON::Staircase::Schema.new('./test/resources/definitions.json')

  	puts schema.flattened_properties
  end

end
