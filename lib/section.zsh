SKYLINE_FIRST_LINE_PREFIX="${SKYLINE_FIRST_LINE_PREFIX=\u256D\U2500}"
SKYLINE_LAST_LINE_PREFIX="${SKYLINE_LAST_LINE_PREFIX=\u2570\U2500\u27a4 }"

NEWLINE='
'

skyline::section() {
  local color prefix content suffix
  [[ -n $1 ]] && color="$1"     || color=""
  [[ -n $2 ]] && content="$2"   || content=""
  [[ -n $3 ]] && prefix="$3"    || prefix=""
  [[ -n $4 ]] && suffix="$4"    || suffix=""

  echo -n "$prefix"
  
  if [[ -n $color ]]; then
    skyline::color $content $color
  else
    echo -n "$content"
  fi

  echo -n "$suffix"
}

skyline::first_line_prefix() {
  skyline::color $SKYLINE_FIRST_LINE_PREFIX $SKYLINE_MAIN_COLOR
}

skyline::last_line_prefix() {
  skyline::color $SKYLINE_LAST_LINE_PREFIX $SKYLINE_MAIN_COLOR
}

skyline::compose_prompt() {
  skyline::first_line_prefix

  for section in $@; do
    skyline::$section
  done

  echo -n $NEWLINE

  skyline::last_line_prefix
}