module ApplicationHelper
  def zone_name_for(zone)
    case zone
      when :north then "Zona Norte"
      when :west then "Zona Oeste"
      when :south then "Zona Sul"
      when :east then "Zona Leste"
      when :downtown then "Centro"
    end
  end
end
