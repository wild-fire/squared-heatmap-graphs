require 'csv'
require_relative 'graph'

by_shell_heatmap = {}
by_pagerank_heatmap = {}

max_kshell = 9
alpha = 0.01

CSV.foreach('data/k-shell-pagerank.csv', headers: true).each do |row|
  kshell = row['kshell'].to_f
  pagerank = row['pagerank'].to_f
  puts row.inspect
  pagerank_index = (pagerank*10).to_i
  by_shell_heatmap[kshell-2] ||= {}
  by_shell_heatmap[kshell-2][pagerank_index] ||= 0
  by_shell_heatmap[kshell-2][pagerank_index] += 1

  by_pagerank_heatmap[pagerank_index] ||= {}
  by_pagerank_heatmap[pagerank_index][kshell-2] ||= 0
  by_pagerank_heatmap[pagerank_index][kshell-2] += 1
end

create_graphic "heatmaps/shell-pagerank-by-shell.jpg", by_shell_heatmap, 8, 10
create_graphic "heatmaps/shell-pagerank-by-pagerank.jpg", by_pagerank_heatmap, 10, 8
