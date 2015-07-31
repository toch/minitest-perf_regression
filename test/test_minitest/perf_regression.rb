require 'minitest_helper'

class TestMinitestPerformanceRegression < MiniTest::Test
  extend MiniTest::PerformanceRegression

  def test_that_it_has_a_version_number
    refute_nil ::Minitest::PerformanceRegression::VERSION
  end

  def test_that_it_provides_check_performance_regression_on
    obj = Object.new
    obj.extend(MiniTest::PerformanceRegression)
    assert_respond_to(obj, :check_performance_regression_on)
  end

  def test_that_it_checks_performance_regression
    assert true
  end

  check_performance_regression_on :test_that_it_checks_performance_regression
end
