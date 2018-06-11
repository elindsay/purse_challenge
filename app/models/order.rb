class Order < ActiveRecord::Base
  attr_accessor :input_string

  validates :number, format: {with: /\d{3}-\d{7}-\d{7}/ }, uniqueness: true
  validates :deliver_by, presence: { message: "is not formatted correctly" }
  before_validation :format_input


  def format_input
    begin
      input_array = input_string.split("\n")
      order_string = input_array[0].split("Order Number: ")[1].strip
      date_string = input_array[1].split("delivery by ")[1]
      self.number = order_string
      date_string_to_dates date_string
    rescue => ex
      errors.add(:base, "Inputted string is non-parsable")
    end
  end

  def date_string_to_dates date_string
    deliver_array = date_string.split("-")
    self.deliver_by = Chronic.parse(deliver_array[-1])
    if deliver_array.length > 1
      self.earliest_deliver = Chronic.parse(deliver_array[0])
    end
  end
end
