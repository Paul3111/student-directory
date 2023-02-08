#def input_students
#    puts "Please enter the names of the students"
#    puts "To finish, just hit return twice"
#    students = []
#    name = gets.chomp
    
#    while !name.empty? do
#        students << {name: name, cohort: :november}
#        puts "Now we have #{students.count} students"
        
#        name = gets.chomp
#    end
#    students
#end

#def print_header
#    puts "The students of Villains Academy"
#    puts "-------------"
#end

#def print_footer(names)
#    puts "Overall, we have #{names.count} great students"
#end

#students = input_students
#print_header
#print(students)
#print_footer(students)

students = [
  {name: "Dr. Hannibal Lecter", cohort: :november, cob: "UK"},
  {name: "Darth Vader", cohort: :november, cob: "Galactia"},
  {name: "Nurse Ratched", cohort: :november, cob: "Switzerland"},
  {name: "Michael Corleone", cohort: :november, cob: "Italy"},
  {name: "Alex DeLarge", cohort: :november, cob: "UK"},
  {name: "The Wicked Witch of the West", cohort: :november, cob: "N/A"},
  {name: "Terminator", cohort: :november, cob: "Future Land"},
  {name: "Freddy Krueger", cohort: :november, cob: "USA"},
  {name: "The Joker", cohort: :november, cob: "USA"},
  {name: "Joffrey Baratheon", cohort: :november, cob: "UK"},
  {name: "Norman Bates", cohort: :november, cob: "Norway"}
]

def print_header
    puts "The students of Villains Academy"
    puts "-------------"
end

def print_footer(names)
    puts "\nOverall, we have #{names.count} great students"
end

def print(students)
    counter = 0
    while counter < students.length
        puts "#{students[counter][:name]} 
        (#{students[counter][:cohort]} cohort) - #{students[counter][:cob]}"
        counter += 1
    end
end

print_header
print(students)
print_footer(students)