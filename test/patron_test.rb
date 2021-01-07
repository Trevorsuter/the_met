require 'minitest/autorun'
require 'minitest/pride'
require './lib/patron'

class PatronTest < MiniTest::Test

  def test_it_exists_with_attributes
    patron = Patron.new("Bob", 20)
    assert_instance_of Patron, patron
    assert_equal "Bob", patron.name
    assert_equal 20, patron.spending_money
  end

  def test_patron_has_interests_attribute
    patron = Patron.new("Bob", 20)
    assert_equal [], patron.interests
  end

  def test_patron_can_add_interests
    patron = Patron.new("Bob", 20)
    patron.add_interest("Dead Sea Scrolls")
    patron.add_interest("Gems and Minerals")
    assert_equal ["Dead Sea Scrolls", "Gems and Minerals"], patron.interests
  end
end