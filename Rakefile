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

desc "Publish a draft"
task :publish do
  drafts = Dir::glob("drafts/*")
  if drafts.empty?
    puts "There are no drafts to publish!"
  else
    puts "Drafts:"
    drafts.each_index do |i|
      puts "  #{i}  #{drafts[i]}"
    end

    # Prompt for and extract title from target draft.
    puts "\nWhich post would you like to publish?"
    draft_path = drafts[STDIN.gets.chomp.to_i]
    post_title = `grep 'title: ' "#{draft_path}"`.gsub('title: ', '').gsub('"', '').chomp

    # Move the file into the _posts dir and commit.
    published_filename = "_posts/#{Time.now.strftime("%Y-%m-%d")}-#{File.basename(draft_path)}"
    `cp "#{draft_path}" "#{published_filename}"`
    `git add "#{published_filename}" && git commit -m \'Publish post \"#{post_title}\".\'`
  end
end

desc "Startup Jekyll"
task :start do
  sh "jekyll --server"
end

task :default => :start
