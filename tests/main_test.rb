require 'minitest/autorun'
require_relative '../src/image'
require_relative '../src/ascII'

class MainTest < Minitest::Test

    def setup
        @image = Image.new('../assets/teste.png')
        @ascII = AscII.new
    end

    def test_getSize
        assert_equal "100 x 100", @image.getSize
    end

    def test_reSizeIfImageBiggerThan100
        @image = Image.new('../assets/teste_resize.jpg')
        assert_equal "100 x 63", @image.getSize
    end

    def test_setAverageBrightnessPixels
        test_object = [[[1,2,3], [255,255,255]], [[0,0,0,], [12, 89, 200]]]
        image_test = Image.new('../assets/teste.png', 100, false)
        image_test.pixels_matrix= test_object
        image_test.setAverageBrightnessPixels

        assert_equal [[2, 255], [0, 100]], image_test.pixels_brightness_matrix

    end

    def test_MapToAsc
        assert_equal "`", @ascII.mapToAsc(0, 255)
        assert_equal "$", @ascII.mapToAsc(255, 255)
        assert_equal "x", @ascII.mapToAsc(120, 255)
        assert_equal "\"", @ascII.mapToAsc(12, 255)
    end
end