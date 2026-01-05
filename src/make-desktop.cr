# `MakeDesktop` is a library for creating .desktop
# files for your applications that don't have them.
# it does no checks to see if a .desktop file
# for the program already exists, so if there is
# one, you will lose that file.
module MakeDesktop
  VERSION = "0.1.0"

  # `make_desktop` takes an executable file, *exe : String*,
  # the directory it's in, *exe_dir : Path | String*, its name
  # *exe_name : String*, and an optional *mime_type : String | Nil*,
  # which defaults to `nil`, and then writes a .desktop file containing:
  # [Desktop Entry]
  # Type=Application
  # Name=*exe_name*
  # Path=*exe_dir*
  # Exec=./*exe*
  # MimeType=*mime_type* (only if not `nil` when called)
  def self.make_desktop(
    exe : String,
    exe_name : String,
    exe_dir : Path | String,
    mime_type : String | Nil = nil,
  )
    if mime_type.nil?
      File.write "#{Path["~/.local/share/applications"].expand(home: true)}/#{exe_name}.desktop",
        "[Desktop Entry]\n" \
        "Type=Application\n" \
        "Name=#{exe_name}\n" \
        "Path=#{exe_dir}\n" \
        "Exec=./#{exe}\n"
    else
      File.write "#{Path["~/.local/share/applications"].expand(home: true)}/#{exe_name}.desktop",
        "[Desktop Entry]\n" \
        "Type=Application\n" \
        "Name=#{exe_name}\n" \
        "Path=#{exe_dir}\n" \
        "Exec=./#{exe}\n" \
        "MimeType=#{mime_type}\n"
    end
  end
end
