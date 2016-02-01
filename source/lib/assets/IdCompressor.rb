class IdCompressor
  
  # base 65 encoding
  CHAR_SET = %w(- 0 1 2 3 4 5 6 7 8 9 A B C D E F G H I
               J K L M N O P Q R S T U V W X Y Z a b c
               d e f g h i j k l m n o p q r s t u v w
               x y z)

  # base will always be the number of characters
  # we want to use to represent a base 65 num 
  def self.base
    CHAR_SET.length
  end

  def self.decompress(compressed_num)
    power = 0
    base_10_int = 0
    compressed_num.to_s.reverse.each_char do |digit|
      base_10_int += ((IdCompressor.base**power)*CHAR_SET.index(digit))
      power += 1
    end
    base_10_int
  end

  def self.compress(num)
    digits_needed = Math.log(num, IdCompressor.base).floor + 1
    compressed_num_string = ''
    prev_remainder = num
    (digits_needed-1).downto(0) do |power|
      r = prev_remainder.divmod(IdCompressor.base**power)
      compressed_num_string << CHAR_SET[r[0]]
      prev_remainder = r[1]
    end
    compressed_num_string
  end
  
end
