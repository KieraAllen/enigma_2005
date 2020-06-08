# - This file removes the need to add the following code to the top of every test
# - Add "require_relative 'test_helper'" to the top of every test
# - Require 'csv' if needed and require './some_directory/some_file_name'
# (whichever file the test file uses)

require 'SimpleCov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
