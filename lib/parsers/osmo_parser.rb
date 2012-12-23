require 'nokogiri'

module OsmoParser
  def self.parse
    parse_indoor_colors.zip(parse_outdoor_colors).flatten
  end
  def self.parse_indoor_colors
    parse_whatever('http://osmo.ru/colors_indoor.html')
  end
  def self.parse_outdoor_colors
    parse_whatever('http://osmo.ru/colors_outdoor.html')
  end

  def self.parse_whatever(url)
    doc = Nokogiri::HTML(open(url))
    links = doc.css('div.colors_item a').map { |a| {title: a['title'], image: a['href']} }
    links.inject([]) do |sum, link|
      match = /^(?<code>\d+).*$/.match(link[:title])
      if match
        sum << {
            :value => match['code'],
            :presentation => link[:title],
            :image => link[:image]
        }
      end
      sum
    end
  end
end