
class WalkableGrid
  attr_accessor :len, :init_val, :grid, :currentX, :currentY

  def initialize(len=11, init_val=0)
    @len, @init_val = len, init_val
    @grid = make_grid(@len, @init_val)
    mark(@len/2,@len/2)
  end

  def to_s
    printthis
  end

  def makeRandomStep
    r = rand(4)
    case r
    when 0
      mark(currentX+1,currentY)
    when 1
      mark(currentX,currentY+1)
    when 2
      mark(currentX-1,currentY)
    when 3
      mark(currentX,currentY-1)
    end
  end

  def distance
    startX = @len/2
    startY = @len/2
    dx = (@currentX - startX).abs
    dy = (@currentY - startY).abs
    return Math.sqrt((dx**2)+(dy**2))
  end

  private
  def printthis
    return "No Grid" if @grid.empty?
    ret = ""
    @grid.each_with_index do |row, index|
      ret += "\t#{index}|"
      row.each do |col|
        ret += "\t#{col}"
      end
      ret += "\n"*3
    end
    ret += "\t\t"
    ret += (0..grid.size-1).to_a.join("\t")
    return ret
  end

  def mark(x,y)
    @grid[x][y] = "()"
    @currentX = x
    @currentY = y
  end

  def make_grid(len , init_val)
    grid =[]
    len.times do |row|
      grid[row] = []
      len.times do |col|
        grid[row][col] = init_val
      end
    end
    return grid
  end
end


d = []
1000.times do |step|
  g = WalkableGrid.new(ARGV[0].to_i || 10, ARGV[1] || '-')
  20.times do |i|
    g.makeRandomStep
  end
  d << g.distance
end

puts "max - #{d.min}"
puts "min - #{d.max}"
puts "avg - #{d.inject{ |sum, el| sum + el }.to_f / d.size}"
