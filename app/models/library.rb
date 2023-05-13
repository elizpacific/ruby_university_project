class Library < ApplicationRecord
  paginates_per 5
  has_many :books
  has_one_attached :image
  has_many_attached :images

  def self.to_csv
    @csv = CSV.generate do |csv|
      @library.map do |lib|
        csv << [lib.library_id,lib.name ,lib.city, lib.street_address, lib.zip_code]
      end
    end
  end

end
