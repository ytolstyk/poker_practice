def stock_pick(array)
  max = 0
  answer = []
  array.each_with_index do |el, start|
    (start...array.count).each do |finish|
      if array[finish] - array[start] > max
        max = array[finish] - array[start]
        answer = [start, finish]
      end
    end
  end
  answer
end
