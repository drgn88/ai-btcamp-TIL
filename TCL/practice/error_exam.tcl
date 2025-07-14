proc divide {a b} {
	if {$b == 0} {
		error "Division by zero" "in divide function" DIVIDE_By_ZERO
	}
	return [expr {$a / $b}]
}

if {[catch {divide 10 0} result options]} {
	puts "Error: $result"
	puts "Info: [dict get $options -errorinfo]"
	puts "Code: [dict get $options -errorcode]"
}