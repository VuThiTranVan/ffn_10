class HomeController < ApplicationController
  def index
    @matches =
      Match.includes(round: :league).date_match.newest.group_by(&:round)
  end
end
