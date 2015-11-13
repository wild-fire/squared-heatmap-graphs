require 'csv'
require_relative 'graph'

by_controllability = {}
by_pagerank_heatmap = {}

granularity = 100

CSV.foreach('data/controlabilidad-pagerank.csv', headers: true).each do |row|
  pagerank = row['pagerank'].to_f
  controllability = row['controlabilidad'].to_f
  pagerank_index = (pagerank*granularity).to_i
  controllability_index = (controllability*granularity).to_i

puts row.inspect
puts pagerank_index
  by_controllability[controllability_index] ||= {}
  by_controllability[controllability_index][pagerank_index] ||= 0
  by_controllability[controllability_index][pagerank_index] += 1

  by_pagerank_heatmap[pagerank_index] ||= {}
  by_pagerank_heatmap[pagerank_index][controllability_index] ||= 0
  by_pagerank_heatmap[pagerank_index][controllability_index] += 1
end

create_graphic "heatmaps/controllability-pagerank-by-controllability.jpg", by_controllability, granularity, granularity, 1000/granularity
create_graphic "heatmaps/controllability-pagerank-by-pagerank.jpg", by_pagerank_heatmap, granularity, granularity, 1000/granularity
