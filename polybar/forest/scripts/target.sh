target=$(cat /tmp/name)

if [ "$target" = "Null" ]; then
  echo "Waiting..."
else  
  echo "%{F#9658A4}   %{F#93A1A1}%{F#2495e7}  %{F#e2ee6a}$(cat /tmp/target) %{F#9658A4}  %{F#93A1A1}%{F#2495e7}  $(cat /tmp/name)%{F#e2ee6a}"
fi

