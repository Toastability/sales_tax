require 'sales_tax/version'
require 'sales_tax/base'
require 'sales_tax/auto_load'

if defined? Rake
  load File.join(File.dirname(__FILE__), 'sales_tax', 'tasks', 'download.rake')
end
