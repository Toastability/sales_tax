# sales_tax

Interface to the public [Avalara TaxRates](http://www.taxrates.com/) database for sales taxes in the United States of America. Easily look up combined, state, and county rates by zip code.

**Notice**: This is a development tool only; it is not intended for use as tax compliance software and should not be relied upon for financial decisions. As detailed in the [LICENSE](LICENSE), **use of this software is at your own risk**. The author(s) disclaim all warranties and by your use of this software you agree to waive the author(s) of any and all liabilities. You should consult with a tax professional before collecting or paying taxes.

## Installation

After installation you will need to download the publicly available CSV data from Avalara's [taxrates.com](http://www.taxrates.com/download-tax-tables/) and place the csv files in the `tax_rates` directory located at the root of the application.

## Basic usage

You can look up the tax rates via zip code:

```ruby
SalesTax['94107']
# => <struct SalesTax::Rate region_name="SAN FRANCISCO COUNTY",
#                           region_code="AIUQ",
#                           combined_rate=0.0875,
#                           state_rate=0.065,
#                           county_rate=0.01,
#                           city_rate=0.0,
#                           special_rate=0.0125>
```

## License

Licensed under the MIT license. See [LICENSE](LICENSE) for details.
