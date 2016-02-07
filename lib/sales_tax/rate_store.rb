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

    FIELDS_MAP = {
      'TaxRegionName' => :region_name,
      'TaxRegionCode' => :region_code,
      'CombinedRate'  => :combined_rate,
      'StateRate'     => :state_rate,
      'CountyRate'    => :county_rate,
      'CityRate'      => :city_rate,
      'SpecialRate'   => :special_rate,
    }

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
