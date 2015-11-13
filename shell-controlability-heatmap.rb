require 'rubygems'
require 'csv'
require 'mini_magick'


def create_graphic file_name, matrix, width, height
  puts "*********"

  zoom = 100
  cmd = "convert -size #{width*zoom}x#{height*zoom} xc:'#ffffff' #{file_name}"
  system(cmd)

  MiniMagick::Tool::Mogrify.new do |mogrify|
    matrix.each do |column, rows|
      max_ocurrences = rows.values.max
      puts "--------"
      rows.each do |row, ocurrences|
        unless row == height || column == width
          score = ocurrences.to_f/max_ocurrences
          puts "Row: #{height-row}, Column: #{column}, Score: #{score}"
          mogrify.fill "rgba( 0, 0, 0 , #{score.round(2)} )"
          mogrify.draw "rectangle #{(column)*zoom},#{(height-1-row)*zoom} #{(column+1)*zoom},#{(height-row)*zoom}"
        end
      end
    end
    mogrify << file_name
  end
end

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
