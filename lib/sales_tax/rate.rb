module SalesTax
  RATE_FIELDS = [
    :region_name,
    :region_code,
    :combined_rate,
    :state_rate,
    :county_rate,
    :city_rate,
    :special_rate,
  ]

  Rate = Struct.new(*RATE_FIELDS)
end
