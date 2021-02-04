require 'mini_magick'

class Image

        attr_accessor :image, :pixels_matrix, :pixels_brightness_matrix

    def initialize(path, new_size = 100, auto_start = true)
        @image = MiniMagick::Image.open(path)
        @pixels_matrix = []
        @pixels_brightness_matrix = []
        if @image.dimensions[0] > 100 && @image.dimensions[1] > 100
            @image.resize "#{new_size}x#{new_size}>"
        end
        if auto_start
            self.setPixels
            self.setAverageBrightnessPixels
        end
    end

    def getSize
        return "#{@image.dimensions[0]} x #{@image.dimensions[1]}"
    end
    #set a 3d matrix with rgb like [[[255,255,255], [0,94,94], ...]]
    def setPixels
        position = 0
        pixels = @image.get_pixels
        pixels.each do |row|
            colors = []
            colors_position = 0
            row.each do |column|
                colors[colors_position] = [column[0], column[1], column[2]]
                colors_position +=1 
            end
            @pixels_matrix[position] = colors
            position+=1
        end
    end
    #set a value of brightness using the averarage between rgb: (R+G+B)/3
    def setAverageBrightnessPixels
        position = 0
        @pixels_matrix.each do |row|
            auxiliar = []
            row.each do |column|       
                auxiliar << (column[0] + column[1] + column[2])/3      
            end
            @pixels_brightness_matrix[position] = auxiliar
            position+=1
        end
    end

end