class BaseSerializer < ActiveModel::Serializer
  def distance
    return if object.try(:dist).nil?
    distance = object.dist
    format_distance distance
  end

  def format_distance(value)
    return 0 if value.nil?
    if value < 1000
      return "#{value.round(0)} m"
    else
      return "#{(value / 1000).round(2)} Km".sub('.',',')
    end
  end
end
