if {[catch {open "nonexistent.txt" r} fid]} {
	puts "Couldn't poen the file: $fid"
} else {
	puts "File opened successfully"
	close $fid
}