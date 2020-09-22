class Pros::BookingsController < ApplicationController

  def new
    @pros = Pro.joins(:prestations).select('count(*) as count, pros.*')
                                   .where(prestations: { id: session[:prestations] })
                                   .group('pros.id')
                                   .having('count(*) = ?', session[:prestations].length)
    @prestation_references = Prestation.find(session[:prestations]).pluck(:reference)
  end

  def create
  end
end
