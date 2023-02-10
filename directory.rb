require 'date'
require 'active_support/inflector'

@students = []

def input_students
    months = Date::MONTHNAMES
    puts "Please enter the names of the students"
    name = STDIN.gets.strip.capitalize()
    puts "Please enter the cohort"
    answer = STDIN.gets.strip.capitalize()
    answer == "" ? cohort = "February" : cohort = answer
    while true do
        if months.include?(answer) == false && !answer.empty?
            puts "There is a typo in the cohort name"
            answer = STDIN.gets.strip.capitalize()
            answer == "" ? cohort = "February" : cohort = answer
        else
            break
        end
    end
    puts "To finish, just hit return twice\n\n"
    cohorts = []
    
    while !name.empty? || !answer.empty? do
        add_students(name, cohort)
        cohorts << cohort
        @students.count > 1 ? no_of_st = "student".pluralize : no_of_st = "student"
        puts "Now we have #{@students.count} #{no_of_st}\n\n"
        
        puts "Please enter the names of the students"
        name = STDIN.gets.strip.capitalize()
        puts "Please enter the cohort"
        answer = STDIN.gets.strip.capitalize()
        answer == "" ? cohort = "February" : cohort = answer
        while true do
            if months.include?(answer) == false && !answer.empty?
                puts "There is a typo in the cohort name"
                answer = STDIN.gets.strip.capitalize()
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
    names[0].count > 1 ? no_of_st = "student".pluralize : no_of_st = "student"
    puts "\n\nOverall, we have #{names[0].count} great #{no_of_st}"
end

def show_students
    print_header
    students_list = @students
    @students[1].each do |cohort|
        @students[0].each do |student|
            if student[:cohort] == cohort.to_sym
                students_list << [student[:cohort], student[:name]]
                @students[0].delete(student)
            end
        end
    end
    print @students
    print_footer(@students)
end

def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save the list to students.csv"
    puts "4. Load the list from student.csv"
    puts "9. Exit"
end

def process(selection)
    case selection
    when "1"
        puts "You selected 1. Input the students"
        @students = input_students
    when "2"
        if @students[0] == nil || @students[0].count == 0
            puts "There is nothing to print"
        else
            puts "You selected 2. Show the students"
            show_students
        end
    when "3"
        puts "You selected 3. Save the list to students.csv"
        save_students
    when "4"
        puts "You selected 4. Load the list from student.csv"
        load_students
    when "9"
        puts "9. The program will now end"
        exit
    else
        puts "I don't know what you meant, try again"
    end
end

def interactive_menu
    loop do
        try_load_students
        print_menu
        process(STDIN.gets.chomp)
    end
end

def save_students
    file = File.open("students.csv", "w")
    if @students.empty?
        puts "There is nothing to add!"
    else
        file.puts @students[0].map {|student| student[:name] + "," + student[:cohort]}    
    end
    file.close
end

def load_students(filename = "students.csv")
    file = File.open(filename, "r")
    file.readlines.each do |line|
        name, cohort = line.chomp.split(",")
        add_students(name, cohort)
        puts line
    end
    file.close
end

def try_load_students(filename = "students.csv")
  filename = ARGV.first
  return if filename.nil?
  if File.exist?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def add_students(stud_name, cohort_name)
    @students << {name: stud_name, cohort: cohort_name}
    return @students
end

interactive_menu