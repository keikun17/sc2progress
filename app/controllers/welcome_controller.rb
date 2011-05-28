class WelcomeController < ApplicationController
  def index
    @sc2ranks = Sc2ranks.new('malayancolleges.com')
    @character = sc2ranks.character('http://us.battle.net/sc2/en/profile/280904/1/Kelsin/')
  end
end
