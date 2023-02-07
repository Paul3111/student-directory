#first, we print the list of students
students = ["The students of Villains Academy", "------------------",
"Dr. Hannibal Lecter", "Darth Vader", "Nurse Ratched", "Michael Corelone",
"Alex DeLarge", "The Wicked Witch of the West", "Terminator",
"Freddy Krueger", "The Joker", "Joffrey Baratheon", "Norman Bates"]

students.each do |student|
    puts student
end

puts "Overall, we have #{students.length} great students"