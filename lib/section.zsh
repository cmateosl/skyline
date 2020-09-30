SKYLINE_FIRST_LINE_PREFIX_COLOR="${SKYLINE_FIRST_LINE_PREFIX_COLOR=blue}"
SKYLINE_FIRST_LINE_PREFIX="${SKYLINE_FIRST_LINE_PREFIX=\u256D\U2500}"
SKYLINE_LAST_LINE_PREFIX_COLOR="${SKYLINE_LAST_LINE_PREFIX_COLOR=blue}"
SKYLINE_LAST_LINE_PREFIX="${SKYLINE_LAST_LINE_PREFIX=\u2570\U2500\u27a4 }"

NEWLINE='
'

skyline::section() {
  local color prefix content suffix
  [[ -n $1 ]] && content="$1"   || content=""
  [[ -n $2 ]] && prefix="$2"    || prefix=""
  [[ -n $3 ]] && suffix="$3"    || suffix=""

  echo -n "$prefix"
  echo -n "$content"
  echo -n "$suffix"
}

skyline::first_line_prefix() {
  echo -n "%F{$SKYLINE_FIRST_LINE_PREFIX_COLOR}"
  echo -n "$SKYLINE_FIRST_LINE_PREFIX"
  echo -n "%f"
}

skyline::last_line_prefix() {
  echo -n "%F{$SKYLINE_LAST_LINE_PREFIX_COLOR}"
  echo -n "$SKYLINE_LAST_LINE_PREFIX"
  echo -n "%f"
}

skyline::compose_prompt() {
  skyline::first_line_prefix

  skyline::user
  skyline::dir

  echo -n $NEWLINE

  skyline::last_line_prefix
}