begin
	require 'lazyman'
rescue LoadError
	puts 'you need using "gem install lazyman" to install lazyman first'
end

Lazyman::Initializer.new(File.expand_path File.join('.'))
$:.unshift(File.expand_path File.join('.'))

require File.join($pages, '<%= app_name %>_page')
require File.join($pages, '<%= app_name %>_navigator')

RSpec.configure do |c|
	c.before(:all) do
		@navi = <%= app_name.camelize %>Navigator.new
	end

	c.after(:all) do
		@navi.close
	end
end