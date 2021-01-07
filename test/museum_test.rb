require 'minitest/autorun'
require 'minitest/pride'
require './lib/exhibit'
require './lib/patron'
require './lib/museum'
require 'pry'

class MuseumTest < Minitest::Test

  def test_it_exists_with_attributes
    dmns = Museum.new("Denver Museum of Nature and Science")
    assert_instance_of Museum, dmns
    assert_equal "Denver Museum of Nature and Science", dmns.name
  end

  def test_it_has_exhibits_attribute
    dmns = Museum.new("Denver Museum of Nature and Science")
    assert_equal [], dmns.exhibits
  end

  def test_it_can_add_exhibits
    dmns = Museum.new("Denver Museum of Nature and Science")
    gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    assert_equal [gems_and_minerals, dead_sea_scrolls], dmns.exhibits
  end

  def test_recommend_exhibits
    dmns = Museum.new("Denver Museum of Nature and Science")
    gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    patron_1 = Patron.new("Bob", 20)
    patron_1.add_interest("Dead Sea Scrolls")
    patron_1.add_interest("Gems and Minerals")
    patron_1.add_interest("IMAX")
    assert_equal [gems_and_minerals, dead_sea_scrolls], dmns.recommend_exhibits(patron_1)
  end

  def test_it_can_admit
    dmns = Museum.new("Denver Museum of Nature and Science")
    patron_1 = Patron.new("Bob", 20)
    patron_2 = Patron.new("Sally", 20)
    patron_3 = Patron.new("Johnny", 5)
    dmns.admit(patron_1)
    dmns.admit(patron_2)
    dmns.admit(patron_3)
    assert_equal [patron_1, patron_2, patron_3], dmns.patrons
  end

  def test_recommend_patrons
    dmns = Museum.new("Denver Museum of Nature and Science")
    gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    patron_1 = Patron.new("Bob", 20)
    patron_2 = Patron.new("Sally", 20)
    patron_1.add_interest("Dead Sea Scrolls")
    patron_2.add_interest("Gems and Minerals")
    dmns.admit(patron_1)
    dmns.admit(patron_2)
    assert_equal [patron_1], dmns.recommend_patrons(dead_sea_scrolls)
    end

  def test_patrons_by_exhibit_interest
    dmns = Museum.new("Denver Museum of Nature and Science")
    gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    patron_1 = Patron.new("Bob", 20)
    patron_2 = Patron.new("Sally", 20)
    patron_1.add_interest("Dead Sea Scrolls")
    patron_2.add_interest("Gems and Minerals")
    dmns.admit(patron_1)
    dmns.admit(patron_2)
    assert_equal [patron_1], dmns.patrons_by_exhibit_interest[dead_sea_scrolls]
    assert_equal [patron_2], dmns.patrons_by_exhibit_interest[gems_and_minerals]
  end

  def test_lottery_contestants
    dmns = Museum.new("Denver Museum of Nature and Science")
    gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    patron_1 = Patron.new("Bob", 20)
    patron_2 = Patron.new("Sally", 20)
    patron_3 = Patron.new("Johnny", 5)
    patron_1.add_interest("Dead Sea Scrolls")
    patron_2.add_interest("Gems and Minerals")
    dmns.admit(patron_1)
    dmns.admit(patron_2)
    assert_equal patron_3, dmns.ticket_lottery_contestants(dead_sea_scrolls)
  end
end