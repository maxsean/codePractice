# Given a string s, find the longest palindromic substring in s. You may assume that the maximum length of s is 1000

def longest_palindrome(s)
    winner = ""
    (0..s.length-1).each do |n|
        temp = helper(s, n, n)
        if temp.length > winner.length
            winner = temp
        end
        temp = helper(s, n, n+1)
        if temp.length > winner.length
            winner = temp
        end
    end
    return winner
end

def helper(s, l, r)
    while l >= 0 && r < s.length && s[l] == s[r] do
        l -= 1
        r += 1
    end
    return s[l+1..r-1]
end
