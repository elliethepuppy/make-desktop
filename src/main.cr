require "./make-desktop"
require "option_parser"

exe = String.new
exe_dir : Path | String = String.new
mime_type : String | Nil = nil

OptionParser.parse do |parser|
  parser.banner = "make-desktop is a program to create .desktop files" \
                  "usage: make-desktop [flags]"
  parser.on("exe PROG", "set the executable to PROG") { |prog| exe = prog }
  parser.on("dir DIR", "set the executable's directory (NOT including the exe)") { |dir| exe_dir = dir }
  parser.on("mime MIME", "set the mime type to MIME") { |mime| mime_type = mime }
  parser.on("-v", "--version", "display the version of the program") do
    puts MakeDesktop::VERSION
    exit 1
  end
  parser.on("-h", "--help", "display this help message") do
    puts parser
    exit 1
  end
end

unless exe == ""
  unless exe_dir == ""
    MakeDesktop.make_desktop exe, exe_dir, mime_type
  else
    STDERR.puts "no exe_dir specified!\n" \
                "try 'time-it -h' for more information"
    exit -1
  end
else
  STDERR.puts "no exe specified!\n" \
              "try 'time-it -h' for more information"
end
