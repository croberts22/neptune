require "neptune/version"
require 'rugged'
require 'linguist'

module Neptune
  class Error < StandardError; end

  # FIXME: Testing out a sample directory here
  # current_directory = Dir.pwd
  current_directory = "../Projects/Test/"

  output_file = File.open("#{current_directory}commit_history.csv","w") do |s|
    # current_directory = Dir.pwd
    repo = Rugged::Repository.new(current_directory)
    walker = Rugged::Walker.new(repo)
    walker.sorting(Rugged::SORT_TOPO | Rugged::SORT_REVERSE) # optional
    walker.push(repo.branches["master"].target_id)
    walker.each do |commit|
      project = Linguist::Repository.new(repo, commit.oid)

      csv_string = "#{commit.oid},#{commit.epoch_time}"

      project.languages.sort_by { |_, size| size }.reverse.each do |language, size|
        csv_string += ","
        percentage = size / project.size.to_f
        percentage = sprintf '%.2f' % percentage
        csv_string += "#{percentage},#{language}"
      end

      puts csv_string
      s.puts csv_string

    end
  end


end
