# `MakeDesktop` is a library for creating .desktop
# files for your applications that don't have them.
# it does no checks to see if a .desktop file
# for the program already exists, so if there is
# one, you will lose that file.
module MakeDesktop
  VERSION = "0.1.0"

  # `make_desktop` takes an executable file, *exe : String*,
  # the directory it's in, *exe_dir : Path | String*, and an
  # optional *mime_type : String | Nil*, which defaults to `nil`,
  # and then writes a .desktop file containing:
  # [Desktop Entry]
  # Type=Application
  # Name=*exe*
  # Path=*exe_dir*
  # Exec=./*exe*
  # MimeType=*mime_type* (only if not `nil` when called)
  def self.make_desktop(
    exe : String,
    exe_dir : Path | String,
    mime_type : String | Nil = nil,
  )
    if mime_type.nil?
      File.write "#{Path.home}/.local/share/applications/#{exe}.desktop",
        "[Desktop Entry]\n" \
        "Type=Application\n" \
        "Name=#{exe}\n" \
        "Path=#{exe_dir}\n" \
        "Exec=./#{exe}"
    else
      File.write "#{Path.home}/.local/share/applications/#{exe}.desktop",
        "[Desktop Entry]\n" \
        "Type=Application\n" \
        "Name=#{exe}\n" \
        "Path=#{exe_dir}\n" \
        "Exec=./#{exe}\n" \
        "MimeType=#{mime_type}"
    end
  end
end
