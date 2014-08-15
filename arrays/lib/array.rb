class Array
  def my_uniq
    answer = []
    self.each do |el|
      answer << el unless answer.include?(el)
    end
    answer
  end
  
  def two_sum
    answer = []
    self.each_with_index do |el1, id1|
      self.each_with_index do |el2, id2|
        next if id1 <= id2
        answer << [id1, id2].sort if el1 == -el2
      end
    end
    answer
  end
  
  def my_transpose
    answer = Array.new(self[0].length) { Array.new }
    self.each_with_index do |row, i|
      row.each_with_index do |el, j|
        answer[j] << el
      end
    end
    
    answer
  end
end