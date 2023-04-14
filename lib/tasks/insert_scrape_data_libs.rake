task insert_scrape_data_libs: :environment do
  require 'open-uri'

  # Fetch and parse HTML document
  doc = Nokogiri::HTML(URI.open('https://en.wikipedia.org/wiki/List_of_libraries'))

  x = doc.css('div.mw-parser-output')
  y = []
  x.css("ul li").each do |item|
    y << item.children.first
  end

  v = []
  y.each do |i|
    v << i.children[0]&.content if i.attributes.count == 2
  end
  p = v.compact
  k = p.delete_if { |line| line.split.size < 2 }
  result = []

  k.each_with_index do |value, index|
    if value == 'Zillur Rahman Library'
      result = k.delete_if.with_index { |num, idx| idx > index }
    end
  end

  result.each do |value|
    Library.new(name: value).save
  end

end