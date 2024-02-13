class DirectorsController < ApplicationController
  def index 
    render({:template => "director_templates/list"})
  end 

  def show
    the_id = params.fetch("the_id")
    matching_records = Director.where({:id => the_id })
    @the_director = matching_records.at(0)
    render({:template => "director_templates/details"})
  end

  def youngest
    desc = Director.all.order({ :dob => :desc })
    dob_records = desc.where.not({:dob => nil })
   
    @youngest = dob_records.at(0)
    render({:template => "director_templates/youngest"})
  end

  def eldest
    asc = Director.all.order({ :dob => :asc })
    dob_records = asc.where.not({:dob => nil })

    @eldest = dob_records.at(0)
    render({:template => "director_templates/eldest"})
  end

end
