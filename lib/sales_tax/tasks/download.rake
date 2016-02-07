require 'open-uri'

namespace 'sales_tax' do

  desc 'Download CSVs'
  task 'download' do
    list_file_path = File.expand_path '../../../../data/taxrates_download_list.txt', __FILE__

    list_file = File.read list_file_path

    list = list_file
      .split("\n")
      .map(&:strip)
      .reject {|line| line.start_with?('#') || line.empty? }

    output_base_path = File.join Dir.getwd, 'data'

    list.each do |url|
      print "Downloading #{url} ..."

      output_path = File.join output_base_path, File.basename(url)
      File.write output_path, open(url).read

      print " Done\n"
    end
  end

end # namespace sales_tax
