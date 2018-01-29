# Given a string, find the length of the longest substring without repeating characters

def length_of_longest_substring(s)
  max = 0
    start_index = -1
    char_to_index_map = {}

    s.chars.each_with_index do |c, i|
        if current_index = char_to_index_map[c] and current_index > start_index # if current_index != nil
            start_index = current_index
        end

        char_to_index_map[c] = i
        new_length = i - start_index
        max = new_length if max < new_length

    end
    max
end
