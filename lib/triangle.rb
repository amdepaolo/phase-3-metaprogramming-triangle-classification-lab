class Triangle

  def initialize (side_1, side_2, side_3)
    @sides = [side_1, side_2, side_3]
    if less_than_zero || triangle_inequality
      raise TriangleError
    end
  end

  def kind
    no_unique_sides = @sides.uniq.length
    if no_unique_sides == 3
      return :scalene
    elsif no_unique_sides == 2
      return :isosceles
    else
      return :equilateral
    end
  end

  def less_than_zero
    @sides.any?{|side| side <= 0}
  end

  def triangle_inequality
    perimeter = @sides.sum
    @sides.any?{|side| side >= perimeter - side}
  end

  class TriangleError < StandardError
  end
    
end
