require 'bundler/gem_tasks'

require 'open-uri'

desc 'Download CSVs'
task 'download' do
  list_file_path = File.join File.dirname(__FILE__), 'data', 'taxrates_download_list.txt'

  list_file = File.read list_file_path

  list = list_file
    .split("\n")
    .map(&:strip)
    .reject {|line| line.start_with?('#') || line.empty? }

  output_base_path = File.join File.dirname(__FILE__), 'data'

  list.each do |url|
    print "Downloading #{url} ..."

    output_path = File.join output_base_path, File.basename(url)
    File.write output_path, open(url).read

    print " Done\n"
  end
end
