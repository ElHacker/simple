class Cuadruples
  attr_accessor :operation, :operand_one, :operand_two, :destiny
  def initialize(operation, operand_one, operand_two, destiny)
    @operation = operation
    @operand_one = operand_one
    @operand_two = operand_two
    @destiny = destiny
  end

  def to_s
    return "op: #{@operation}, op1: #{@operand_one}, op2: #{@operand_two}, dest: #{@destiny}"
  end
end
