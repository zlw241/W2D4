

class String
  # O(n!)
  def first_anagram?(other_string)
    perms = []
    self.split("").permutation.each { |p| perms << p.join }
    perms.include? other_string
  end

  # O(n**2)
  def second_anagram?(other_string)
    other_string_dup = other_string.dup.split("")
    self_dup = self.dup.split("")
    self.chars do |s|
      if other_string_dup.include? s
        self_dup.delete(s)
        other_string_dup.delete(s)
      end
    end
    other_string_dup.empty? && self_dup.empty?
  end

  # O(n*log(n))
  def third_anagram?(other_string)
    self.split("").sort == other_string.split("").sort
  end

  # O(n)
  def fourth_anagram?(other_string)
    self_hash = Hash.new(0)
    other_hash = Hash.new(0)
    self.chars { |s| self_hash[s] += 1 }
    other_string.chars { |s| other_hash[s] += 1 }
    self_hash == other_hash
  end
end




p "gizmo".first_anagram?("sally")    #=> false
p "elvis".first_anagram?("lives")    #=> true

p "gizmo".second_anagram?("sally")
p "elvis".second_anagram?("lives")

p "gizmo".third_anagram?("sally")
p "elvis".third_anagram?("lives")

p "gizmo".fourth_anagram?("sally")
p "elvis".fourth_anagram?("lives")
