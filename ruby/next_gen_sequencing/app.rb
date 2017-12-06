require 'csv'
require_relative './CoverageFinder.rb'

t1 = Time.now #for simple benchmark
read_list = {}
coverage_list = {}
loci_list = []

puts "parsing reads.csv..."
read_count = 0 #for simple benchmark
#reduce reads.csv to smaller hash that keeps track of duplicates
CSV.foreach("./ruby/next_gen_sequencing/puzzle_data/reads.csv", headers: true) do |row|
  read_count += 1
  if read_list["#{row[0]},#{row[1]}"]
    read_list["#{row[0]},#{row[1]}"] += 1
  else
    read_list["#{row[0]},#{row[1]}"] = 1
  end
end

puts "parsing loci.csv..."
#convert loci.csv to hash to prep for coverage calculation {key = position, value = coverage}
CSV.foreach("./ruby/next_gen_sequencing/puzzle_data/loci.csv", headers: true) do |row|
  coverage_list[row[0].to_i] = 0
end

#make an array of loci as input for search algorithm - see CoverageFinder.rb
coverage_list.each do |k,v|
  loci_list << k
end

#see CoverageFinder.rb
puts "calculating coverage..."
output = CoverageFinder.coverage(read_list, loci_list, coverage_list)

#overwrite loci.csv
puts "writing loci.csv..."
CSV.open("./ruby/next_gen_sequencing/puzzle_data/loci.csv", "w", write_headers: true, headers: ["position", "coverage"]) do |csv|
  output.each do |k,v|
    csv << [k,v]
  end
end

#for simple benchmark purposes
t2 = Time.now
puts "Total time (sec): #{t2 - t1}"
puts "reads.csv length: #{read_count} lines"
puts "loci.csv length: #{loci_list.length} unique lines"
