
def input_students
  puts "Please enter the name and cohort of each student, with each detail separated by a comma."
  puts "Example: Dylan, November"
  puts "To finish, just hit return twice."
  # create an empty array
  months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
  students = []
  # get the student's info
  student_details = gets.chomp
  # while the student info is not empty, repeat this code
  while !student_details.empty? do
    # create student info array to then individually add to students array
    student_info_array = student_details.split(", ")
    # add the student hash to the student array
    puts student_info_array[1]

    # after inputting both values, script checks if the entered
    # month corresponds to any of the month values in the months
    # array. If yes, carries on program
      if months.include?(student_info_array[1].capitalize)
        students << {name: student_info_array[0], cohort: student_info_array[1].to_s}
        puts "Now we have #{students.count} students"
      else
      # if value entered does not correspond, gives the user
      # 1 last chance to enter the right month. If right, goes on
        puts "A valid month was not entered, please try entering only the month one more time."
        student_info_array[1] = gets.chomp.capitalize

        if months.include?(student_info_array[1].capitalize)
          students << {name: student_info_array[0], cohort: student_info_array[1].to_s}
          puts "Now we have #{students.count} students"
        else
      # if not right for a second time, enters the current
      # month as default value

          puts "A valid month was not entered, recording default month value."
          students << {name: student_info_array[0], cohort: months[(Time.now.strftime("%m").to_i-1)].to_s}
          puts "Now we have #{students.count} students"
        end

        # ideally, this if statement and also the input process
        # would be two separate functions.
      end




    # get another student from the user
    student_details = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each_with_index do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
# nothing happens until we call the methods
print_header
print(students)
print_footer(students)
