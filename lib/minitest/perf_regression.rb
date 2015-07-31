require "minitest"
require "minitest/perf_regression/version"
require 'benchmark/lab'
require 'json'

module Minitest
  module PerformanceRegression
    def check_performance_regression_on(name)
      define_method("test_performance_regression_on_#{name}") do
        nbr_of_samples = 20
        timestamp = Time.now
        prefix_filename = "perfregr_#{name}_"

        perfregr_files = Dir.entries('.').grep(/^#{prefix_filename}/).sort
        result_jsons = []
        result = Benchmark.observe_and_summarize(nbr_of_samples) do |x|
          x.report("name #{timestamp}") { send name }
        end
        result_jsons << JSON.parse(result)

        File.open("#{prefix_filename}#{timestamp.to_i}.json", 'w') do |file|
          file.write(result)
        end

        if perfregr_files.empty?
          assert true
        else
          previous_result_json = nil
          File.open(perfregr_files.last, 'r') do |file|
            result_jsons << JSON.load(file)
          end
          best, is_h0_rejected = Benchmark.aggregate_and_rank(result_jsons)
          refute is_h0_rejected, "Performance Regression for #{name} run at #{timestamp}"
        end
      end
    end

  end
end
