require 'csv'
require_relative 'graph'

by_shell_heatmap = {}
by_controlability_heatmap = {}

max_kshell = 9
alpha = 0.01

CSV.foreach('data/k-shell-controlabilidad.csv', headers: true).each do |row|
  kshell = row['kshell'].to_f
  controlability = row['controlability'].to_f
  controllability_index = (controlability*10).to_i
  by_shell_heatmap[kshell-2] ||= {}
  by_shell_heatmap[kshell-2][controllability_index] ||= 0
  by_shell_heatmap[kshell-2][controllability_index] += 1

  by_controlability_heatmap[controllability_index] ||= {}
  by_controlability_heatmap[controllability_index][kshell-2] ||= 0
  by_controlability_heatmap[controllability_index][kshell-2] += 1
end

create_graphic "heatmaps/shell-controllability-by-shell.jpg", by_shell_heatmap, 8, 10
create_graphic "heatmaps/shell-controllability-by-controllability.jpg", by_controlability_heatmap, 10, 8
