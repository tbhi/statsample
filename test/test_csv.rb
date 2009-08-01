require File.dirname(__FILE__)+'/../lib/rubyss'
	require 'tmpdir'
require 'test/unit'

class RubySSCSVTestCase < Test::Unit::TestCase
	def initialize(*args)
        @ds=RubySS::CSV.read(File.dirname(__FILE__)+"/test_csv.csv")
		super
	end
    def test_read
        assert_equal(6,@ds.cases)
        assert_equal(%w{id name age city a1},@ds.fields)
    end
    def test_nil
        assert_equal(nil,@ds['age'][5])
    end
    def test_write
        filename=Dir::tmpdir+"/test_write.csv"
        RubySS::CSV.write(@ds,filename)
        ds2=RubySS::CSV.read(filename)
        i=0
        ds2.each_array{|row|
            assert_equal(@ds.case_as_array(i),row)
               i+=1
        }
    end
end