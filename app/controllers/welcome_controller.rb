class WelcomeController < ApplicationController
  def index
    bnet_url = params[:bnet_url] || 'http://us.battle.net/sc2/en/profile/789884/1/dSeleCT/'
    @sc2ranks = Sc2ranks.new('malayancolleges.com')
    @character = @sc2ranks.character(bnet_url)
    if @character.team(1)
      @t1strategies = Strategy.find(:all, :conditions => ["? between range_low and range_high and LOWER(race) = ? and LOWER(league) = ?", @character.team(1).points, @character.team(1).fav_race.downcase, @character.team(1).league.downcase])
    end
  end
end
