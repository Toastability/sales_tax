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

      # Layout of the rows in CSV:
      #   0 = State
      #   1 = ZipCode
      #   2 = TaxRegionName
      #   3 = TaxRegionCode
      #   4 = CombinedRate
      #   5 = StateRate
      #   6 = CountyRate
      #   7 = CityRate
      #   8 = SpecialRate

      rows.to_a.each do |row|
        zip_code = row[1]

        @data[zip_code] = Rate.new(
          row[2],
          row[3],
          row[4].to_f,
          row[5].to_f,
          row[6].to_f,
          row[7].to_f,
          row[8].to_f,
        )
      end
    end
  end
end
