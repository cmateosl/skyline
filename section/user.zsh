SKYLINE_USER_LOGO_PREFIX="${SKYLINE_USER_LOGO_PREFIX=\ue0b2}"
SKYLINE_USER_LOGO_SUFFIX="${SKYLINE_USER_LOGO_SUFFIX=\ue0b0}"
SKYLINE_USER_LOGO="${SKYLINE_USER_LOGO=\uf120}"
SKYLINE_USER_SUFFIX="${SKYLINE_USER_SUFFIX=\ue0c6}"

skyline::user_logo() {
  skyline::color $SKYLINE_USER_LOGO_PREFIX $SKYLINE_MAIN_COLOR
  skyline::color " $SKYLINE_USER_LOGO " black $SKYLINE_MAIN_COLOR
  skyline::color $SKYLINE_USER_LOGO_SUFFIX $SKYLINE_MAIN_COLOR white
}

skyline::user() {
  local prefix="$(skyline::user_logo)"
  local content="$(skyline::color " %n " black white)"
  
  skyline::section \
    "" \
    $content \
    $prefix \
    $SKYLINE_USER_SUFFIX
}
