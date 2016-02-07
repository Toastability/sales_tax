# sales_tax

Interface to the public [Avalara TaxRates](http://www.taxrates.com/) database for sales taxes in the United States of America. Easily look up combined, state, and county rates by zip code.

**Notice**: This is a development tool only; it is not intended for use as tax compliance software and should not be relied upon for financial decisions. As detailed in the [LICENSE](LICENSE), **use of this software is at your own risk**. The author(s) disclaim all warranties and by your use of this software you agree to waive the author(s) of any and all liabilities. You should consult with a tax professional before collecting or paying taxes.

[![Build Status](https://travis-ci.org/dirk/sales_tax.svg)](https://travis-ci.org/dirk/sales_tax)

## Installation

Install via Rubygems or add the dependency via Bundler:

```sh
# Rubygems directly
gem install sales_tax

# In your Gemfile
gem 'sales_tax'
```

After installation you will need to download the publicly available CSV data from Avalara's [taxrates.com](http://www.taxrates.com/download-tax-tables/):

```sh
# Ensure the gem is loaded when `rake` is called (this is done automatically
# if you're using Rails and the gem is in your Gemfile)
bundle exec rake sales_tax:download
```

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
