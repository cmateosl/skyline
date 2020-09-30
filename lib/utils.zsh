skyline::color() {
  local content="$1" fg_color="$2" bg_color="$3"
  local reset
  
  if [[ -n $fg_color ]]; then
    echo -n "%F{$fg_color}"
    reset="${reset}%f"
  fi
  
  if [[ -n $bg_color ]]; then
    echo -n "%K{$bg_color}"
    reset="${reset}%k"
  fi

  echo -n $content
  echo -n $reset
}

skyline::bold() {
  local content="$1"
  echo -n "%B$content%b"
}
