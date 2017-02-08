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
    mock_csv = mock_row.keys.join(',') + "\n" +
               mock_row.values.join(',') + "\n"

    allow(File).to receive(:read).and_return(mock_csv)
    allow(Dir).to receive(:glob).and_return(['data/taxrates_AA2016.csv'])

    require 'sales_tax/auto_load'

    expect(SalesTax::Data).not_to be_empty

    row = SalesTax::Data.find_by_zip_code '12345'

    expect(row).not_to be_nil
    expect(row.region_code).to eq 'ABCD'
    expect(row.combined_rate).to eq 0.03
  end
end
