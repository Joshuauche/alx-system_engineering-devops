#!/usr/bin/env ruby
#  script that accepts one argument and pass it to a regular expression matching method
# the regular expression searches for repitions
puts ARGV[0].scan(/^\b\d{10}\b/).join
