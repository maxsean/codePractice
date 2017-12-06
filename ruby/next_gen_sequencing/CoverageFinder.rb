module CoverageFinder

  def self.coverage(read_list, loci_list, coverage_list)
    read_list.each do |startlength,count|
      array = startlength.split(",") #parse read_list key to get start position (array[0]) and read length (array[1])
      loci_list.sort! #sorting for search alogrithm (binary_search)
      bookend = binary_search(loci_list, array[0].to_i, array[1].to_i) #establish a reasonable loci index to start search for coverage and avoid iterating through entire list
      if bookend
        counter = 0
        while loci_list[bookend + counter] >= array[0].to_i && loci_list[bookend + counter] < (array[0].to_i + array[1].to_i)
          coverage_list[loci_list[bookend + counter]] += count
          counter += 1
          if bookend + counter >= loci_list.length
            break
          end
        end
        counter = -1
        while loci_list[bookend + counter] >= array[0].to_i && loci_list[bookend + counter] < (array[0].to_i + array[1].to_i)
          coverage_list[loci_list[bookend + counter]] += count
          counter -= 1
          if bookend + counter < 0
            break
          end
        end
      end
    end
    return coverage_list
  end

  def self.binary_search(list, position, read_length)
    #break apart list into halves until conditions are met
    low, high = 0, list.length
    middle = (low + high)/2
    while(low <= high)
      middle = (low + high)/2
      if !list[middle]
        return nil
      end
      return middle if list[middle] >= position && list[middle] < position+read_length

      if list[middle] < position
        low = middle + 1
      else
        high = middle - 1
      end
    end
  end

end
