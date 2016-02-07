require 'csv'

module SalesTax
  Rate = Struct.new(:region_name, :region_code, :combined_rate, :state_rate, :county_rate, :city_rate, :special_rate)

  class RateStore
    def initialize
      # Map of 5-digit US zip code to `Rate` instances
      @data = {}
    end

    def empty?
      @data.empty?
    end

    FIELDS_MAP = [
      ['TaxRegionName' , :to_s],
      ['TaxRegionCode' , :to_s],
      ['CombinedRate'  , :to_f],
      ['StateRate'     , :to_f],
      ['CountyRate'    , :to_f],
      ['CityRate'      , :to_f],
      ['SpecialRate'   , :to_f],
    ]

    def load_csv_file(path)
      CSV.foreach(path, headers: :first_row) do |row|
        zip_code = row['ZipCode']
        fields   = {}

        FIELDS_MAP.each do |(row_key, fields_key)|
          fields[fields_key] = row[row_key]
        end

        @data[zip_code] = Rate.new fields
      end
    end
  end
end
