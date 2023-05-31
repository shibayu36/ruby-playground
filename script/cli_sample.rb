require 'optparse'

# コマンドライン引数を解析するためのOptionParserオブジェクトを作成
options = {}
OptionParser.new do |opts|
  opts.banner = 'Usage: command.rb [options] url(s)'

  # --metadataオプションを定義
  opts.on('--metadata', 'Fetch metadata') do
    options[:metadata] = true
  end
end.parse!

# 引数を取得する
urls = ARGV

# metadataオプションが指定されている場合の処理
if options[:metadata]
  # metadataを取得する処理
  # （ここでは、単にメッセージを表示するだけにしています）
  puts "Fetching metadata for #{urls}"

# metadataオプションが指定されていない場合の処理
else
  # URLを処理する処理
  # （ここでは、単にURLを表示するだけにしています）
  puts "Processing URLs: #{urls}"
end
