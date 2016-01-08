# This is the main entrypoint into the program
# It requires the other files/gems that it needs

require 'pry'
require './candidates'
require './filters'

## Your test code can go here
@candidates.each { |hash| puts experienced?(hash) }
id_arr = [5, 7, 9, 10, 1000, 11, 13, 15]
id_arr.each { |id| pp find(id) }

#binding.pry
pp qualified_candidates(@candidates)
pp ordered_by_qualifications(@candidates)

continue = true
while continue
  puts "Select one: find, all, qualified, quit"
  user_in = gets.chomp
  if user_in == 'find'
    puts "Type the number of ID: "
    id = gets.chomp.to_i
    pp find(id)
  elsif user_in == 'all'
    @candidates.each { |hash| print hash }
  elsif user_in == 'qualified'
    print ordered_by_qualifications(qualified_candidates(@candidates))
  elsif user_in == 'quit'
    continue = false
  end
end
