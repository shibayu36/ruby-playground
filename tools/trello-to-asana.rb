#!/usr/bin/env ruby

# Usage
# fillin TRELLO_DEVELOPER_PUBLIC_KEY={{trello:developer_public_key}} TRELLO_MEMBER_TOKEN={{trello:member_token}} TRELLO_BOARD_ID=... ASANA_TOKEN={{asana:token}} ASANA_WORKSPACE_ID=... ASANA_PROJECT_ID=... ruby tools/trello-to-asana.rb

require 'trello'
require 'asana'

Trello.configure do |config|
  config.developer_public_key = ENV['TRELLO_DEVELOPER_PUBLIC_KEY']
  config.member_token = ENV['TRELLO_MEMBER_TOKEN']
end

asana = Asana::Client.new do |c|
  c.authentication :access_token, ENV['ASANA_TOKEN']
end

lists = Trello::Board.find(ENV['TRELLO_BOARD_ID']).lists
lists.each do |list|
  puts "======== #{list.name} ========"
  section = asana.sections.create_section_for_project(project_gid: ENV['ASANA_PROJECT_ID'], name: list.name)
  # Reverse cards to make cards in Asana same order
  list.cards.reverse.each do |card|
    puts "Migrate #{card.name} in #{list.name}"
    task = asana.tasks.create_task(
      workspace: ENV['ASANA_WORKSPACE_ID'],
      projects: [ENV['ASANA_PROJECT_ID']],
      name: card.name,
      notes: card.desc
    )
    asana.sections.add_task_for_section(section_gid: section.gid, task: task.gid)
  end
end
