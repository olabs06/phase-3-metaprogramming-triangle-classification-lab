class Triangle
  attr_accessor :length1, :length2, :length3
  def initialize length1, length2, length3
    @length1 = length1
    @length2 = length2
    @length3 = length3
  end 

  def kind
    if is_triangle? self.length1, self.length2, self.length3
      if is_equilateral? self.length1, self.length2, self.length3
        :equilateral
      elsif is_isosceles? self.length1, self.length2, self.length3
        :isosceles
      else 
        :scalene
      end
    else
      raise TriangleError
    end


  end

  class TriangleError < StandardError
    def message
      "Invalid Triangle"
    end 
  end

  private
  def is_triangle? a, b, c
    (a && b && c > 0 ) && (a + b > c) && (a + c > b) && (b + c > a)
  end

  def is_equilateral? a, b, c
    a == b && a == c
  end

  def is_isosceles? a, b, c
    a == b || a == c || b == c
  end
end