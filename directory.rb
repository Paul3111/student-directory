require 'date'
require 'active_support/inflector'

@students = []

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
    cohorts = []
    
    while !name.empty? || !answer.empty? do
        @students << {name: name, cohort: cohort}
        cohorts << cohort
        @students.count > 1 ? no_of_st = "student".pluralize : no_of_st = "student"
        puts "Now we have #{@students.count} #{no_of_st}\n\n"
        
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
    return @students, cohorts.uniq
end

def print_header
    puts "The students of Villains Academy"
    puts "-------------"
end

def print_footer(names)
    names.count > 1 ? no_of_st = "student".pluralize : no_of_st = "student"
    puts "\n\nOverall, we have #{names.count} great #{no_of_st}"
end

def show_students
    print_header
    students_list = []
    @students[1].each do |cohort|
        @students[0].each do |student|
            if student[:cohort] == cohort
                students_list << [student[:cohort], student[:name]]
                @students[0].delete(student)
            end
        end
    end
    print students_list
    print_footer(students_list)
end

def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save the list to students.csv"
    puts "9. Exit"
end

def process(selection)
    case selection
    when "1"
        @students = input_students
    when "2"
        if @students[0] == nil || @students[0].count == 0
            puts "There is nothing to print"
        else
            show_students
        end
    when "3"
        save_students
    when "9"
        exit
    else
        puts "I don't know what you meant, try again"
    end
end

def interactive_menu
    loop do
        print_menu
        process(gets.chomp)
    end
end

def save_students
    file = File.open("students.csv", "w")
    @students[0].each do |student|
        student_data = [student[:name], student[:cohort]]
        csv_line = student_data.join(",")
        file.puts csv_line
    end
    file.close
end

interactive_menu