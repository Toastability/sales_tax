require 'spec_helper'

describe SalesTax do
  let(:mock_row) {
      {
        'State'         => 'AA',
        'ZipCode'       => '12345',
        'TaxRegionName' => 'A SUNNY SOCIALIST WORLD',
        'TaxRegionCode' => 'ABCD',
        'CombinedRate'  => '0.03',
        'StateRate'     => '0.02',
        'CountyRate'    => '0.01',
        'CityRate'      => '0',
        'SpecialRate'   => '0',
    }
  }

  it 'auto-loads CSV data' do
    allow(CSV).to receive(:foreach).and_yield(mock_row)
    allow(Dir).to receive(:glob).and_return(['a/b.csv'])

    require 'sales_tax/auto_load'

    expect(SalesTax::Data).not_to be_empty
  end
end
