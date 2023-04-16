task insert_scrape_csv: :environment do
  require 'csv'

  table = CSV.parse(File.read("lib/tasks/data/libraries_4.csv"), headers: true)

  (0..table.count - 1).each { |x|
      # Library.new(street_address: 'qwe').save
      Library.new(
        name: table[x]['Library Name'],
        street_address: table[x]['Street Address'],
        number: table[x]['Library ID'],
        city: table[x]['City'],
        zip_code: table[x]['Zip Code'],
      ).save
  }

end