require 'date'
require 'active_support/inflector'

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
        students.count > 1 ? no_of_st = "student".pluralize : no_of_st = "student"
        puts "Now we have #{students.count} #{no_of_st}\n\n"
        
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
    names.count > 1 ? no_of_st = "student".pluralize : no_of_st = "student"
    puts "Overall, we have #{names.count} great #{no_of_st}"
end

def run
    students = input_students
    if students.length == 0
        puts "There is nothing to print"
    else
        print_header
        puts(students)
        print_footer(students)
    end
end

run