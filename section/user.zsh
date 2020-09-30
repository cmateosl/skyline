SKYLINE_ECHO_PREFIX="${SKYLINE_ECHO_PREFIX=\ue0b2}"
SKYLINE_ECHO_SUFFIX="${SKYLINE_ECHO_SUFFIX=\ue0b0}"
SKYLINE_ECHO_FOREGROUND_COLOR="${SKYLINE_ECHO_FOREGROUND_COLOR=blue}"
SKYLINE_ECHO_BACKGROUND_COLOR="${SKYLINE_ECHO_BACKGROUND_COLOR=black}"
SKYLINE_ECHO_VALUE="${SKYLINE_ECHO_VALUE=\uf120}"
OTRO="${OTRO=\ue0c6}"

skyline::setup_color() {
  local bg=$1 fg=$2
  echo -n "%K{$bg}%F{$fg}"
}

skyline::reset_color() {
  echo -n "%f%k"
}

skyline::user_logo() {
  local bg_color=black fg_color=blue

  skyline::setup_color $bg_color $fg_color
  echo -n "$SKYLINE_ECHO_PREFIX"
  skyline::setup_color $fg_color $bg_color
  echo -n " $SKYLINE_ECHO_VALUE "
  skyline::setup_color white $fg_color
  echo -n "$SKYLINE_ECHO_SUFFIX"
}

skyline::user() {
  skyline::user_logo

  skyline::setup_color white black
  skyline::section \
    "%n" \
    " " \
    " "
  skyline::setup_color black white
  echo -n "$OTRO"
  skyline::reset_color
}
