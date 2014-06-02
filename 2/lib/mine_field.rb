class MineField

  def initialize(field)
    @field = field
  end



  def hint_field
    result = to_cells zero_field

    result.each_with_index do |row, row_index|
      row.each_with_index do |cell, column_index|
        next unless mine? cell
        increase_mine_count_of_neighbors result, row_index, column_index
      end
    end

    to_string result
  end



  private

  NEIGHBOR_OFFSETS = [[-1, -1], [-1, 0], [-1, 1], [0, -1], [0, 1], [1, -1], [1, 0], [1, 1]]



  def increase_mine_count_of_neighbors(field, row_index, column_index)
    NEIGHBOR_OFFSETS.each do |(row_offset, column_offset)|
      next if row_index+row_offset > field.count-1
      neighbor_cell = field[row_index+row_offset][column_index+column_offset]
      unless row_index+row_offset < 0 or column_index+column_offset < 0 or neighbor_cell.nil? or mine? neighbor_cell
        field[row_index+row_offset][column_index+column_offset] = neighbor_cell.succ
      end
    end
  end



  def mine?(cell)
    cell == "*"
  end



  def zero_field
    @field.gsub ".", "0"
  end



  def to_cells(result)
    result.lines.map(&:strip).map &:chars
  end



  def to_string(cells)
    cells.map { |chars| chars.join }.join "\n"
  end

end
