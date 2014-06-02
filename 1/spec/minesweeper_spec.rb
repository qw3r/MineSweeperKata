require 'rspec'

class MineSweeper

  attr_reader :field



  def initialize(mine_field)
    @field = {}

    mine_field.split("\n").each_with_index do |row, x|
      row.split('').each_with_index do |value, y|
        @field[[x, y]] = value
      end
    end
  end



  def hint_field
    result = []

    field.each do |key, value|
      result[key[0]] ||= []
      result[key[0]][key[1]] = is_mine?(value) ? '*' : mines_around(*key)
    end

    result.map { |row| row.join }.join("\n")
  end



  private

  def mines_around(x, y)
    neighbors(x, y).select { |pos| is_mine? field[pos] }.count
  end



  def neighbors(x, y)
    [
      [x-1, y+1], [x, y+1], [x+1, y+1],
      [x-1, y], [x+1, y],
      [x-1, y-1], [x, y-1], [x+1, y-1],
    ]
  end



  def is_mine?(value)
    value == '*'
  end

end


describe MineSweeper do

  [
    ["*", "*"],
    ["*.", "*1"],
    ["..", "00"],
    ["*\n.", "*\n1"],
    ["*...\n..*.\n....", "*211\n12*1\n0111"],
  ].each do |input_field, hint_field|

    it "should return the proper hint field (\n#{hint_field}\n) for the given input field (\n#{input_field}\n)" do
      expect(MineSweeper.new(input_field).hint_field).to eq hint_field
    end

  end
end