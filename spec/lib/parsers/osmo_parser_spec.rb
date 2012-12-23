# encoding = utf-8
require 'spec_helper'
require 'parsers/osmo_parser'

describe OsmoParser do
  describe '#parse_indoor_colors' do
    before :all do
      @colors = OsmoParser.parse_indoor_colors
    end
    it 'includes white color code' do
      colors_values = @colors.map {|c| c[:value]}
      colors_values.should include('3040')
    end
    it 'includes white color presentation' do
      colors_presentations = @colors.map {|c| c[:presentation]}
      colors_presentations.should include('3040 Белое')
    end
    it 'includes white color image' do
      colors_images = @colors.map {|c| c[:image]}
      colors_images.should include('http://osmo.ru/pictures/catalog/colors/catalog_foto_10_530x.jpg')
    end
  end
  describe '#parse_outdoor_colors' do
    before :all do
      @colors = OsmoParser.parse_outdoor_colors
    end
    it 'includes white color code' do
      colors_values = @colors.map {|c| c[:value]}
      colors_values.should include('2104')
    end
    it 'includes white color presentation' do
      colors_presentations = @colors.map {|c| c[:presentation]}
      colors_presentations.should include('2104 Белая')
    end
    it 'includes white color image' do
      colors_images = @colors.map {|c| c[:image]}
      colors_images.should include('http://osmo.ru/pictures/catalog/colors/catalog_foto_21_530x.jpeg')
    end
  end
end