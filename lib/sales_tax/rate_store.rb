module SalesTax
  class RateStore
    def initialize
      # Map of 5-digit US zip code to `Rate` instances
      @data = {}
    end

    def empty?
      @data.empty?
    end

    def find_by_zip_code(zip_code)
      @data[zip_code.to_s]
    end

    def load_csv_file(path)
      rows = File.read(path)
        .split("\n")
        .map { |row| row.split ',' }

      rows.shift # Shift the header row off the front
      load_rows rows
    end

    def load_rows(rows)
      # Layout of the rows in the CSV:
      #   0 = State
      #   1 = ZipCode
      #   2 = TaxRegionName
      #   3 = StateRate
      #   4 = EstimatedCombinedRate
      #   5 = EstimatedCountyRate
      #   6 = EstimatedCityRate
      #   7 = EstimatedSpecialRate
      #   8 = RiskLevel

      rows.to_a.each do |row|
        zip_code = row[1]

        @data[zip_code] = Rate.new(
          row[2].gsub('"', ''), # region_name
          '',                   # region_code
          row[4].to_f,          # combined_rate
          row[3].to_f,          # state_rate
          row[5].to_f,          # county_rate
          row[6].to_f,          # city_rate
          row[7].to_f,          # special_rate
        )
      end
    end
  end
end
