#!/usr/bin/env ruby

require 'trello'

Trello.configure do |config|
  config.developer_public_key = ENV['TRELLO_DEVELOPER_PUBLIC_KEY']
  config.member_token = ENV['TRELLO_MEMBER_TOKEN']
end

shibayu36 = Trello::Member.find('shibayu36')
puts shibayu36.full_name
pp Trello::Board.find('BsK3ck9C').lists.first
