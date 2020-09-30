SKYLINE_DIR_DEFAULT_FOREGROUND="${SKYLINE_DIR_DEFAULT_FOREGROUND=8}"
SKYLINE_DIR_ETC_FOREGROUND="${SKYLINE_DIR_ETC_FOREGROUND=8}"
SKYLINE_DIR_NOT_WRITABLE_FOREGROUND="${SKYLINE_DIR_NOT_WRITABLE_FOREGROUND=8}"
SKYLINE_DIR_HOME_FOREGROUND="${SKYLINE_DIR_HOME_FOREGROUND=8}"
SKYLINE_DIR_HOME_SUBFOLDER_FOREGROUND="${SKYLINE_DIR_HOME_SUBFOLDER_FOREGROUND=8}"
SKYLINE_DIR_DEFAULT_ICON="${SKYLINE_DIR_DEFAULT_ICON=\uF115}"
SKYLINE_DIR_ETC_ICON="${SKYLINE_DIR_ETC_ICON=\uF013}"
SKYLINE_DIR_NOT_WRITABLE_ICON="${SKYLINE_DIR_NOT_WRITABLE_ICON=\UF023}"
SKYLINE_DIR_HOME_ICON="${SKYLINE_DIR_HOME_ICON=\uF015}"
SKYLINE_DIR_HOME_SUBFOLDER_ICON="${SKYLINE_DIR_HOME_SUBFOLDER_ICON=\uF07C}"

skyline::dir() {
  local current_path="$(print -P '%~')"
  local dir_name=${current_path%/*}
  local base_name=${current_path##*/}

  local current_state="DEFAULT"
  if [[ $current_path == '/etc'* ]]; then
    current_state="ETC"
  elif [[ ! -w $PWD ]]; then
    current_state="NOT_WRITABLE"
  elif [[ $current_path == '~' ]]; then
    current_state="HOME"
  elif [[ $current_path == '~'* ]]; then
    current_state="HOME_SUBFOLDER"
  fi

  local path_opt=$current_path
  if [[ $current_path == "/" || $current_path == "~" ]]; then
    base_name="$(skyline::bold $current_path)"
    current_path="$(skyline::color $current_path white)"
  else
    base_name="$(skyline::bold $base_name)"
    current_path="$dir_name/$(skyline::color $base_name white)"
  fi

  local icon=SKYLINE_DIR_${current_state}_ICON
  local color=SKYLINE_DIR_${current_state}_FOREGROUND
  
  local content=" ${(P)icon} :$current_path"
  
  skyline::section ${(P)color} "${content}" " " " "
}
