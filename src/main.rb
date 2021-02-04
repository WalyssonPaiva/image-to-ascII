require_relative 'image'
require_relative 'ascII'

RESIZE_TO = 100

puts "Digite o caminho da imagem"
path = gets.chomp
puts "Qual cor? (Digite em inglês ou deixe vazio para padrão)"

color = gets.chomp.to_s.downcase.to_sym

image = Image.new(path, RESIZE_TO)
ascII = AscII.new
ascII.setAscIIMatrix(image.pixels_brightness_matrix)
ascII.printAscII(color)



# image = Image.new('teste.png', 100)

# puts "Tamanho da matriz"
# puts image.getSize
# image.setPixels
# image.setAverageBrightnessPixels

# ascII = AscII.new
# ascII.setAscIIMatriz(image.pixels_brightness)
# ascII.printAscII