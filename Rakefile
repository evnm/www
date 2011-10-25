# Stolen from @holman.

require 'rubygems'
require 'rake'
require 'fileutils'

desc "Draft a new post"
task :new do
  puts "What should we call this post for now?"
  title = STDIN.gets.chomp
  filename = title.gsub(' ', '-').downcase
  FileUtils.touch("drafts/#{filename}.md")

  open("drafts/#{filename}.md", 'a') do |f|
    f.puts "---"
    f.puts "layout: post"
    f.puts "title: \"#{title}\""
    f.puts "---"
  end
end

desc "Startup Jekyll"
task :start do
  sh "jekyll --server"
end

task :default => :start
