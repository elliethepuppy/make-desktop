require "./make-desktop"
require "option_parser"

exe = String.new
exe_name = String.new
exe_dir : Path | String = String.new
mime_type : String | Nil = nil

OptionParser.parse do |parser|
  parser.banner = "make-desktop is a program to create .desktop files" \
                  "usage: make-desktop [flags]"
  parser.on("exe=PROG", "set the executable to PROG") { |prog| exe = prog }
  parser.on("name=NAME", "set the program name") { |name| exe_name = name }
  parser.on("dir=DIR", "set the executable's directory (NOT including the exe)") { |dir| exe_dir = dir }
  parser.on("mime=MIME", "set the mime type to MIME") { |mime| mime_type = mime }
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
    if exe_name == ""
      MakeDesktop.make_desktop exe, exe, exe_dir, mime_type
    else
      MakeDesktop.make_desktop exe, exe_name, exe_dir, mime_type
    end
  else
    STDERR.puts "no exe_dir specified!\n" \
                "try 'make-desktop -h' for more information"
    exit -1
  end
else
  STDERR.puts "no exe specified!\n" \
              "try 'make-desktop -h' for more information"
end
