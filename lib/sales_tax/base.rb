require 'sales_tax/rate_store'

module SalesTax
  Data = RateStore.new

  def self.[](zip_code)
    Data.find_by_zip_code zip_code
  end
end
