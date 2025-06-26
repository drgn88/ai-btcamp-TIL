# 중첩 리스트 생성 및 조작
set fruits [list apple banana]
set vegetables [list carrot potato]
set numbers [list 1 2 3]

set food_list [list $fruits $vegetables]
puts $food_list  

lappend food_list $numbers
puts $food_list  

set flat_list [concat {prefix} $food_list {suffix}]
puts $flat_list  