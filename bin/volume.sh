#!/usr/bin/env fish
echo (amixer get Master | sed -nre 's/.*\\[off\\].*/  \n\nmuted/p; s/.*\\[(.*%)\\].*/   \\1/p')
