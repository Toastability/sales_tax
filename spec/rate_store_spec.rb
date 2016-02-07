require 'spec_helper'

describe SalesTax::RateStore do
  before(:each) do
    @rate_store = SalesTax::RateStore.new

    @rate_store.instance_eval do
      fake_rate = SalesTax::Rate.new(
        region_name:   'A SUNNY SOCIALIST WORLD',
        region_code:   'ABCD',
        combined_rate: 0.03,
        state_rate:    0.02,
        county_rate:   0.01,
        city_rate:     0.0,
        special_rate:  0.0,
      )

      @data = {
        '12345' => fake_rate
      }
    end
  end

  describe '#find_by_zip_code' do
    it 'finds a rate by zip code' do
      expect(@rate_store.find_by_zip_code '12345').not_to be_nil
    end

    it 'returns nil if rate not found' do
      expect(@rate_store.find_by_zip_code 'bad-zip').to be_nil
    end
  end
end
