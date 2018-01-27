convert 12-hour to 24-hour given HH:MM:SSAM

def timeConversion(s)
    a = s.split(":")
    if a[0] == "12" && a[-1].gsub(/[^A-Za-z]/,"") == "PM" || a[-1].gsub(/[^A-Za-z]/,"") == "pm"
        a[-1] = a[-1].gsub(/[^0-9]/,"")
    elsif a[-1].gsub(/[^A-Za-z]/,"") == "PM" || a[-1].gsub(/[^A-Za-z]/,"") == "pm"
        a[0] = (12 + a[0].to_i).to_s
        a[-1] = a[-1].gsub(/[^0-9]/,"")
    elsif a[0] == "12" && a[-1].gsub(/[^A-Za-z]/,"") == "AM" || a[-1].gsub(/[^A-Za-z]/,"") == "am"
        a[0] = "00"
        a[-1] = a[-1].gsub(/[^0-9]/,"")
    elsif a[-1].gsub(/[^A-Za-z]/,"") == "AM" || a[-1].gsub(/[^A-Za-z]/,"") == "am"
        a[-1] = a[-1].gsub(/[^0-9]/,"")    
    end    
    puts a.join(":")
end
