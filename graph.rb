require 'rubygems'
require 'mini_magick'

def create_graphic file_name, matrix, width, height, zoom = 100
  puts "*********"

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
