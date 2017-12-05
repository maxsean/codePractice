module CoverageFinder

  def self.coverage(read_list, loci_list, coverage_list)
    read_list.each do |startlength,count|
      array = startlength.split(",") #parse read_list key to get start position (array[0]) and read length (array[1])
      loci_list.sort! #sorting for search alogrithm (binary_search)
      bookend = binary_search(loci_list, array[0].to_i, array[1].to_i) #establish a reasonable loci index to start search for coverage and avoid iterating through entire list
      if bookend
        start = bookend - 100 #hardcoded based on distribution of read lengths and differences of basepair between loci of interest
        finish = bookend + 100 #hardcoded based on distribution of read lengths and differences of basepair between loci of interest
        if start < 0
          start = 0 #no reason to wrap around array
        end
        if finish > loci_list.length
          finish = loci_list.length #no reason to wrap around array
        end
        loci_list[start..finish].each do |position|
          if (position >= array[0].to_i) && (position < (array[0].to_i + array[1].to_i))
            coverage_list[position] += count
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
