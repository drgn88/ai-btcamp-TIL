for {set i 0} {$i < 5} {incr i} {
	if {$i == 2} {
		continue
	}
	puts $i
}