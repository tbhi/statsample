require(File.expand_path(File.dirname(__FILE__) + '/helpers_tests.rb'))
class StatsampleAmazingPrintBug < Minitest::Test
  context('Amazing Print integration') do
    setup do
      require 'amazing_print'
    end
    should 'should be flawless' do
      a = Daru::Vector.new([1, 2, 3])

      assert(a != [1, 2, 3])
      assert_nothing_raised do
        ap a
      end
    end
  end
end
