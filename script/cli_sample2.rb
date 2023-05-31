#!/usr/bin/env ruby

require 'optparse'
require 'uri'

options = {
  metadata: false,
  urls: []
}

opt = OptionParser.new
opt.banner = 'Usage: command.rb [options] <url> <url> <url> ...'

opt.on('-m', '--metadata', 'Fetch metadata only') do |m|
  options[:metadata] = m
end

opt.on_tail('-h', '--help', 'Display help information') do
  puts opt
  exit
end

begin
  opt.parse!(ARGV)
rescue OptionParser::InvalidOption => e
  puts "#{e.message}\n#{opt}"
  exit 1
end

if ARGV.empty?
  puts 'Error: At least one URL must be provided.'
  puts opt
  exit 1
end

ARGV.each do |arg|
  if arg =~ URI::DEFAULT_PARSER.make_regexp
    options[:urls] << arg
  else
    puts "Error: Invalid URL '#{arg}'."
    exit 1
  end
end

if options[:metadata]
  puts "Fetching metadata for: #{options[:urls].join(', ')}"
else
  puts "Processing URLs: #{options[:urls].join(', ')}"
end
