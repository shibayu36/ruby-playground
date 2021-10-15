#!/usr/bin/env ruby

require 'trello'

Trello.configure do |config|
  config.developer_public_key = ENV['TRELLO_DEVELOPER_PUBLIC_KEY']
  config.member_token = ENV['TRELLO_MEMBER_TOKEN']
end

lists = Trello::Board.find(ENV['TRELLO_BOARD_ID']).lists
lists.each do |list|
  puts "======== #{list.name} ========"
  list.cards.each do |card|
    puts card.name
    puts card.desc
    puts card.labels.map(&:name).join(',')
    puts ''
  end
end
