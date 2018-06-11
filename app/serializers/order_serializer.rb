class OrderSerializer < ActiveModel::Serializer
  attribute :number
  attribute :deliver_by, key: :deliver
end
