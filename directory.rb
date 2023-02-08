def input_students
    puts "Please enter the names of the students"
    name = gets.chomp
    puts "Please enter the cohort"
    answer = gets.chomp
    answer == "" ? cohort = "february" : cohort = answer
    puts "To finish, just hit return twice"
    students = []
    
    while !name.empty? || !answer.empty? do
        students << {name: name, cohort: cohort}
        puts "Now we have #{students.count} students\n"
        
        puts "Please enter the names of the students"
        name = gets.chomp
        puts "Please enter the cohort"
        answer = gets.chomp
        answer == "" ? cohort = "february" : cohort = answer
        puts "To finish, just hit return twice"
    end
    students
end

def print_header
    puts "The students of Villains Academy"
    puts "-------------"
end

def print_footer(names)
    puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
puts(students)
print_footer(students)
