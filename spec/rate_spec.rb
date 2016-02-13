require 'spec_helper'

describe SalesTax::RateStore do
  ATTRIBUTES = [
    [:region_name,   'A SUNNY SOCIALIST WORLD' ],
    [:region_code,   'ABCD'                    ],
    [:combined_rate, 0.03                      ],
    [:state_rate,    0.02                      ],
    [:county_rate,   0.01                      ],
    [:city_rate,     0.0                       ],
    [:special_rate,  0.0                       ],
  ]

  let(:rate) { SalesTax::Rate.new *ATTRIBUTES.map(&:last) }

  ATTRIBUTES.each do |(key, value)|
    it "has a .#{key}" do
      expect(rate.send(key)).to eq value
    end
  end
end
