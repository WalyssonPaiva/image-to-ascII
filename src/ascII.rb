require 'colorize'

class AscII

    attr_accessor :ascII, :ascIIMatrix

    def initialize
        @ascII = "`^\",:;Il!i~+_-?][}{1)(|\\/tfjrxnuvczXYUJCLQ0OZmwqpdbkhao*#MW&8%B@$"
        
    end

    def mapToAsc(value, max_value)
        position = ((65*value)/max_value).floor 
        position = position != 0 ? position : 1
        return @ascII[position-1]
    end
    #iterate the given matrix and get the correspondent value of the string ascII
    def setAscIIMatrix(matrix, max_color = 255)
        @ascIIMatrix = matrix.map do |matrix_row|
                        matrix_row.map do |column|
                            mapToAsc(column, max_color)
                        end
                    end
    end

    def printAscII(color)
        @ascIIMatrix.each do |char_array|
            char_array.each do |char|
                print char.colorize(color) * 3
            end
            print "\n"
        end
    end

end