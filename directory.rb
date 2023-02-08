require 'date'

def input_students
    months = Date::MONTHNAMES
    puts "Please enter the names of the students"
    name = gets.strip.capitalize()
    puts "Please enter the cohort"
    answer = gets.strip.capitalize()
    answer == "" ? cohort = "February" : cohort = answer
    while true do
        if months.include?(answer) == false && !answer.empty?
            puts "There is a typo in the cohort name"
            answer = gets.strip.capitalize()
            answer == "" ? cohort = "February" : cohort = answer
        else
            break
        end
    end
    puts "To finish, just hit return twice"
    students = []
    
    while !name.empty? || !answer.empty? do
        students << {name: name, cohort: cohort}
        puts "Now we have #{students.count} students\n"
        
        puts "Please enter the names of the students"
        name = gets.strip.capitalize()
        puts "Please enter the cohort"
        answer = gets.strip.capitalize()
        answer == "" ? cohort = "February" : cohort = answer
        while true do
            if months.include?(answer) == false && !answer.empty?
                puts "There is a typo in the cohort name"
                answer = gets.strip.capitalize()
                answer == "" ? cohort = "February" : cohort = answer
            else
                break
            end
        end
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