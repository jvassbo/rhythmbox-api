require "sinatra"
require "dbus"
require "yaml"

sysbus = DBus.session_bus

rb_service   = sysbus["org.mpris.MediaPlayer2.rhythmbox"]
rb_player    = rb_service.object "/org/mpris/MediaPlayer2"
rb_player.introspect
rb_interface = rb_player["org.mpris.MediaPlayer2.Player"]

get "/playpause" do
  rb_interface.PlayPause
end

get "/next" do
  rb_interface.Next
end
