class SchedulingSerializer < ActiveModel::Serializer
  attributes :id, :start, :end, :establishment, :user, :product, :status

  def establishment
    return object.establishment
  end

  def user
    return object.user
  end

  def product
    return object.product
  end

  def status 
    if object.status == 0 
      return 'Pedido em aberto'
    elsif object.status == 1
      return 'Pedido sendo feito'
    elsif object.status == 2
      return 'Pedido enviado'
    elsif object.status == 3
      return 'Pedido pago'
    end

  end

  #def professional
  #  return object.professional
  #end

  #def subcategory
  #  subcategory = Subcategory.find(object.product.subcategory_id)
  #  return subcategory
  #end
end