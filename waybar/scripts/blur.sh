TARGET="$HOME/.config/hypr/configs/transparent-configs/active.conf"

ON_STR="#TRANSPARENT_ON"      # transparent
MED_STR="#TRANSPARENT_MEDIUM" # slightly transparent and blurry
OFF_STR="#TRANSPARENT_OFF"    # fully opaque

STATE=$(grep '^#TRANSPARENT_' "$TARGET")

case "$STATE" in
"$ON_STR")
    text="Ҍ:tsp"
    class="on"
    ;;
"$MED_STR")
    text="Ҍ:med"
    class="medium"
    ;;
"$OFF_STR")
    text="Ҍ:opq"
    class="off"
    ;;
*)
    text="???"
    class="unknown"
    ;;
esac

echo "{\"text\": \"$text\", \"class\": \"$class\"}"
