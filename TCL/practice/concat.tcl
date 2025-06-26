set list1 {1 2 3}
set list2 {4 5 6}
set combined [concat $list1 $list2]
puts $combined 

set result [concat "Hello" {World} [list How are you?]]
puts $result