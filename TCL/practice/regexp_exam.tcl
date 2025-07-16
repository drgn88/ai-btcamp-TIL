set str "The quick brown fox"

if {[regexp {(\w+)\s+(\w+)} $str -> first second]} {
    puts "First word: $first, Second word: $second"
}

regexp -nocase {fox} $str match
puts $match  # fox

regexp {(\d+)} "Age: 30" -> age
puts $age  # 30