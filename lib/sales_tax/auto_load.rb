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

# Uncomment for profiling:
# require 'ruby-prof'
# RubyProf.start

SalesTax.auto_load

# result = RubyProf.stop
# printer = RubyProf::FlatPrinter.new(result)
# printer.print(STDOUT)
