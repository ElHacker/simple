class Cuadruples
  attr_accessor :operation, :operand_one, :operand_two, :destiny
  def initialize(operation, operand_one, operand_two, destiny)
    @operation = operation
    @operand_one = operand_one
    @operand_two = operand_two
    @destiny = destiny
  end
end
