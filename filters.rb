# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program
require './candidates'

def find(id)
  cnt = 0
  @candidates.each do |candidate|
    if (candidate[:id] == id)
      return @candidates[cnt]
    end
    cnt += 1
  end
  {}
end

def experienced?(candidate)
  candidate[:years_of_experience] >= 2 ? true : false
end

# More methods will go below
def git_points?(candidate)
  candidate[:github_points] >= 100 ? true : false
end

def languages?(candidate)
  result = false
  candidate[:languages].each do |x|
    if x == "Ruby"
      result = true 
    elsif x == "Python" 
      result = true
    end
  end
  result
end

def date_applied?(candidate)
  #candidate[:date_applied] is same as X.days.ago.to_date
  # If X is bigger than 15, it means the day is eariler than 15
  candidate[:date_applied] >= 15.days.ago.to_date ? true : false
end

def age?(candidate)
 candidate[:age] > 17 ? true : false
end

def qualified_candidates(collection)
  hash = []
  collection.each do |h|
    if experienced?(h) && git_points?(h) && languages?(h) && date_applied?(h) && age?(h)
      hash.push(h)
    else
      nil
    end
  end
  hash
end

def ordered_by_qualifications(collection)
  arr = []
  collection.sort! {|x, y| [x[:years_of_experience],x[:github_points]] <=> [y[:years_of_experience],y[:github_points]]}
  collection.reverse
end

