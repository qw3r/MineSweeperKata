class MineSweeper

  attr_reader :field



  def initialize(field)
    @field = field
  end



  def hints
    #fields.map { |position, value| value.eql?('*') ? '*' : 0 }

    field.lines.map { |line| line.strip.chars.map { |char| char.eql?('*') ? '*' : 0 }.join }.join($/)
  end



  private

  def fields
    return hash if hash

    hash = {}
    field.lines.map.with_index { |line, y| line.strip.chars.map.with_index { |char, x|  hash.merge! [y,x] => char } }

    hash
  end

end
