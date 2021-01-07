require 'minitest/autorun'
require 'minitest/pride'
require './lib/exhibit'
require './lib/patron'

class ExhibitTest < Minitest::Test

  def test_it_exists_with_attributes
    ex = Exhibit.new({name: "Gems and Minerals", cost: 0})
    assert_instance_of Exhibit, ex
    assert_equal "Gems and Minerals", ex.name
    assert_equal 0, ex.cost
  end
end