$:.unshift(File.dirname(__FILE__) + '/../lib') 

require 'lib/ofc'
require 'lib/ofchart'
# Place for the test data

module TestData
  def numeric_series
    [1,2,3,4,5,6,7,8,9,10]
  end

  def numeric_series_labels
    %w(1 2 3 4 5 6 7 8 9 10)
  end
  
  def login_data
    [
      {:action => 'logins', :total => 1, :weekday => 1},
      {:action => 'logins', :total => 2, :weekday => 2},
      {:action => 'logins', :total => 3, :weekday => 3},
      {:action => 'logins', :total => 4, :weekday => 4},
      {:action => 'logins', :total => 5, :weekday => 5},
      {:action => 'logins', :total => 6, :weekday => 6},
      {:action => 'logins', :total => 7, :weekday => 7}
      ]
  end
  
  def more_test_data # thanks munger!
    [{:name => 'David', :age => 40, :day => 1, :score => 12},
     {:name => 'Michael',  :age => 32, :day => 2, :score => 20},
     {:name => 'David', :age => 40, :day => 2, :score => 13},
     {:name => 'Michael',  :age => 28, :day => 1, :score => 15}]
  end
end
