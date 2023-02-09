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
    puts "To finish, just hit return twice\n\n"
    students = []
    cohorts = []
    
    while !name.empty? || !answer.empty? do
        students << {name: name, cohort: cohort}
        cohorts << cohort
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
        puts "To finish, just hit return twice\n\n"
    end
    return students, cohorts.uniq
end

def print_header
    puts "The students of Villains Academy"
    puts "-------------"
end

def print_footer(names)
    names.count > 1 ? no_of_st = "student".pluralize : no_of_st = "student"
    puts "\n\nOverall, we have #{names.count} great #{no_of_st}"
end

def interactive_menu
    students = []
    loop do
        puts "1. Input the students"
        puts "2. Show the students"
        puts "9. Exit"

        selection = gets.chomp
        
        case selection
        when "1"
            students = input_students
        when "2"
            students_list = []
            if students[0] == nil || students[0].count == 0
                puts "There is nothing to print"
            else
                print_header
                students[1].each do |cohort|
                    students[0].each do |student|
                        if student[:cohort] == cohort
                            students_list << [student[:cohort], student[:name]]
                            students[0].delete(student)
                        end
                    end
                end
                print students_list
                print_footer(students_list)
            end
        when "9"
            exit
        else
            puts "I don't know what you meant, try again"
        end
    end
end

interactive_menu