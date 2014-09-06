require 'rubygems'
require 'ptools'
require 'tempfile'

$stdout.sync = true

require 'version'

DEFAULT_IGNORES = %w(
  tmp/
  \.hg/
  \.svn/
  \.git/
  \.gitignore
  node_modules/
  bower_components/
  target/
  dist/
  \.vagrant/
  Gemfile.lock
  \.exe
  \.bin
  \.apk
  \.ap_
  res/
  \.dmg
  \.pkg
  \.app
  \.xcodeproj/
  \.lproj/
  \.xcassets/
  \.pmdoc/
  \.dSYM/
  \.class
  \.zip
  \.jar
  \.war
  \.xpi
  \.jad
  \.cmo
  \.cmi
  \.png
  \.gif
  \.jpg
  \.jpeg
  \.tiff
  \.ico
  \.svg
  \.dot
  \.wav
  \.mp3
  \.min\.
  -min\.
)

DEFAULT_MAX_WIDTH = 80

UNLIMITED = 'unlimited'

DEFAULT_CONFIGURATION = {
  'max_width' => DEFAULT_MAX_WIDTH
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

    begin
      File.binary?(f)
    rescue Errno::ENOENT
      true
    end
  end
end

def self.check_stdin(configuration = DEFAULT_CONFIGURATION)
  max_width = configuration['max_width']

  contents = $stdin.read

  t = Tempfile.new('aspelllint')
  t.write(contents)
  t.close

  filename = t.path

  if max_width != UNLIMITED
    output = `grep -n \'^.\\{#{max_width.to_i + 1},\\}$\' \"#{filename}\"`

    lines = output.split("\n").reject { |line| line =~ /^Binary file/ }

    widenings = lines.map { |line| Widening.parse('stdin', line) }

    widenings.each { |m| puts m }
  end
end

def self.check(filename, configuration = DEFAULT_CONFIGURATION)
  max_width = configuration['max_width']

  if max_width != UNLIMITED
    output = `grep -n \'^.\\{#{max_width.to_i + 1},\\}$\' \"#{filename}\"`

    lines = output.split("\n").reject { |line| line =~ /^Binary file/ }

    widenings = lines.map { |line| Widening.parse(filename, line) }

    widenings.each { |m| puts m }
  end
end
