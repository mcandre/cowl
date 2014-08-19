require 'rubygems'
require 'ptools'

require 'version'

DEFAULT_IGNORES = %w(
  .hg/
  .svn/
  .git/
  .git
  .gitignore
  node_modules/
  .vagrant/
  Gemfile.lock
  .exe
  .bin
  .png
  .jpg
  .jpeg
  .svg
  .min.js
  -min.js
)

DEFAULT_MAX_WIDTH = 80

UNLIMITED = 'unlimited'

DEFAULT_CONFIGURATION = {
  "max_width" => DEFAULT_MAX_WIDTH
}

#
# Parse, model, and print a line too wide for its own good
#
class Widening
  attr_accessor :filename, :line_number, :line

  def self.parse(filename, grep_line)
    match = grep_line.match(/^(.+)\:(.+)$/)

    line_number = match[1]
    line = match[2]

    Widening.new(filename, line_number, line)
  end

  def initialize(filename, line_number, line)
    @filename = filename
    @line_number = line_number
    @line = line
  end

  def to_s
    "#{filename}:#{line_number}:#{line}"
  end
end

def self.recursive_list(directory, ignores = DEFAULT_IGNORES)
  Find.find(directory).reject do |f|
    File.directory?(f) ||
    ignores.any? { |ignore| f =~ /#{ignore}/ } ||
    File.binary?(f)
  end
end

def self.check(filename, configuration = DEFAULT_CONFIGURATION)
  max_width = configuration["max_width"]

  if max_width != UNLIMITED
    output = `grep -n \'^.\\{#{max_width.to_i + 1},\\}$\' \"#{filename}\"`

    lines = output.split("\n")

    widenings = lines.map { |line| Widening.parse(filename, line) }

    widenings.each { |m| puts m }
  end
end
