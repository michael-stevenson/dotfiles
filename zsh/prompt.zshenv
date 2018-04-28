
reset_color='\e[00m'
time_color="$(truecolor 123 123 123)"
name_color="$(truecolor 123 23 23)"


PROMPT=$'%{\e[38;2;123;23;23m%}%n%{\e[00m%}@%m[%3~]> '
#RPROMPT="%{$time_color%}%t %{$reset_color%}"
