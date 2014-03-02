require 'csv'
require 'benchmark'


desc "Imports a CSV file into an ActiveRecord table"
task :import, [:filename] => :environment do
  puts Benchmark.measure {
    CSV.foreach('lib/tasks/file3.csv', :headers => true) do |row|
      Tbl.create!(Hash[row])
    end
  }
end
