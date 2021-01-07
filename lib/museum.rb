class Museum
  attr_reader :name, :exhibits, :patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit)
    exhibits << exhibit
  end

  def recommend_exhibits(patron)
    exhibits.find_all do |exhibit|
      patron.interests
    end
  end

  def admit(patron)
    patrons << patron
  end

  def recommend_patrons(exhibit)
    patrons.find_all do |patron|
      if patron.interests.include?(exhibit.name)
        patron
      end
    end
  end

  def patrons_by_exhibit_interest
    pbei = Hash.new
    exhibits.map do |exhibit|
      patrons.each do |patron|
        pbei[exhibit] = recommend_patrons(exhibit)
      end
    end
    pbei
  end

  def ticket_lottery_contestants(exhibit)
    patrons.find_all do |patron|
      if patron.spending_money <= exhibit.cost
        patron
      end
    end
  end
end