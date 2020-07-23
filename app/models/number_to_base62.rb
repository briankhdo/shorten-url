class NumberToBase62
  START = 1_000_000
  BASE = %w[3 G h I 6 s c o a S j b O J Y Z 7 r k d K f g R n 0 x 1 e N 8 p 2 U q z P 9 T i B v m E L V M 4 W H 5 w F
            X t y Q A D u C l].freeze

  def initialize(number)
    @number = START + number
  end

  def to_base62
    result = ''
    until @number.zero?
      char_index = @number % 62
      @number = (@number / 62).floor
      result = BASE[char_index] + result
    end
    result.rjust(7, BASE[0])
  end

  def self.from(number)
    n = new(number)
    n.to_base62
  end

  def self.to(string)
    result = -START
    string.split('').map { |v| BASE.index(v) } .each_with_index { |value, index| result += value * (62**(6 - index)) }
    result
  end
end
