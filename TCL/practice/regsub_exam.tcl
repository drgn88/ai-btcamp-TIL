set str "The quick brown fox jumps over the lazy dog"

regsub {(\w+) (\w+)} $str {\2 \1} result
puts $result  # quick The brown fox jumps over the lazy dog

regsub -all {\w+} $str {[\0]} result
puts $result  # [The] [quick] [brown] [fox] [jumps] [over] [the] [lazy] [dog]

regsub -nocase -all {o} $str "0" result
puts $result  # The quick br0wn f0x jumps 0ver the lazy d0g