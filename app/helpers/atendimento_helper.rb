# -*- encoding : utf-8 -*-
module AtendimentoHelper

  def check_place
  	place_name = place_client("none")
    place_selected =  Place.where(active: true, name: place_name)
   

    place_selected
  end

  def check_atendimento_place(place)
  	place_name = Place.find_by_id(place).name
  	place_selected = Place.where(active: true, name: place_name)

  	place_selected
  end
end
