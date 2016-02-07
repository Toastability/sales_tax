module SalesTax
  def self.auto_load
    data_path  = File.join Dir.getwd, 'data'
    data_files = Dir.glob(File.join data_path, '*.csv')

    if data_files.empty?
      raise "No data files found in #{data_path}"
    end

    data_files.each do |path|
      SalesTax::Data.load_csv_file path
    end
  end
end

SalesTax.auto_load
