require "nkf"

class Num
  def initialize(arg)
    @one_num, @two_num = zen_to_han(arg).split(" "){:to_i}
  end

  def match
    type_filter(@one_num, @two_num)

    operator = "==" if @one_num == @two_num
    operator = "<" if @one_num < @two_num
    operator = ">" if @one_num > @two_num
    "#{@one_num} #{operator} #{@two_num}"
  end

  private def zen_to_han(char)
    NKF.nkf('-m0Z1 -w', char)
  end

  private def type_filter(*num)
    num.map{ |i| raise unless i =~ /\d+/ }
  end
end
