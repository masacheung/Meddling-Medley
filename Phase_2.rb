# conjunct_select
# Write a method conjunct_select that accepts an array and one or more procs as arguments.
# The method should return a new array containing the elements that return true when passed into all of the given
# procs.

p "-----------"
p "conjunct_select"
p "-----------"

def conjunct_select(array, *p)
    hash = Hash.new(0)
    array.each do |ele|
        p.each do |proc|
            if proc.call(ele)
                hash[ele] += 1
            end
        end
    end
    ans = []

    hash.each do |k, v|
        if v == p.length
            ans << k
        end
    end
    
    ans
end

# Examples
is_positive = Proc.new { |n| n > 0 }
is_odd = Proc.new { |n| n.odd? }
less_than_ten = Proc.new { |n| n < 10 }

p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]

# convert_pig_latin
# Write a method convert_pig_latin that accepts a sentence as an argument.
# The method should translate the sentence according to the following rules:
# words that are shorter than 3 characters are unchanged
# words that are 3 characters or longer are translated according to the following rules:
# if the word begins with a vowel, simply add 'yay' to the end of the word (example: 'eat'->'eatyay')
# if the word begins with a non-vowel, move all letters that come before the word's first vowel to the end of
# the word and add 'ay' (example: 'trash'->'ashtray')
# Note that if words are capitalized in the original sentence, they should remain capitalized in the translated
# sentence. Vowels are the letters a, e, i, o, u.

p "-----------"
p "convert_pig_latin"
p "-----------"

def convert_pig_latin(string)
    words = string.split(" ")
    ans = []
    words.each do |word|
        if word.length > 2
            ans << start_with_vowel(word)
        else
            ans << word
        end
    end
    ans.join(" ")
end

def start_with_vowel(word)
    vowel ="aeiouAEIOU"
    new_word = ""
    num = 0
    if vowel.include?(word[0])
        return new_word = word + "yay"
    else
        num = find_vowel(word)
        return new_word = word[num..-1] + word[0...num] + "ay"
    end
end

def find_vowel(word)
    vowel = "aeiouAEIOU"
    word.each_char.with_index do |char, i|
        if vowel.include?(char)
           return i
        end
    end 
end

# Examples
p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"

# reverberate
# Write a method reverberate that accepts a sentence as an argument.
# The method should translate the sentence according to the following rules:
# words that are shorter than 3 characters are unchanged
# words that are 3 characters or longer are translated according to the following rules:
# if the word ends with a vowel, simply repeat the word twice (example: 'like'->'likelike')
# if the word ends with a non-vowel, repeat all letters that come after the word's last vowel,
#     including the last vowel itself (example: 'trash'->'trashash')
# Note that if words are capitalized in the original sentence, they should remain capitalized in the translated
# sentence. Vowels are the letters a, e, i, o, u.

p "-----------"
p "reverberate"
p "-----------"

def reverberate(sentence)
    words = sentence.split(" ")
    ans = []
    words.each do |word|
        if word.length > 2
            ans << change(word)
        else
            ans << word
        end
    end
    ans.join(" ")
end

def change(word)
    vowels = "aeiouAEIOU"
    new_word = ""
    if vowels.include?(word[-1])
        return new_word = word*2
    else
        num = find_last_vowel(word)
        return new_word = word + word[num..-1]
    end
end

def find_last_vowel(word)
    vowels = "aeiouAEIOU"
    (2..word.length).each do |i|
        if vowels.include?(word[-i])
            return -(i)
        end
    end
end

# Examples
p reverberate('We like to go running fast') # "We likelike to go runninging fastast"
p reverberate('He cannot find the trash') # "He cannotot findind thethe trashash"
p reverberate('Pasta is my favorite dish') # "Pastapasta is my favoritefavorite dishish"
p reverberate('Her family flew to France') # "Herer familyily flewew to Francefrance"

# disjunct_select
# Write a method disjunct_select that accepts an array and one or more procs as arguments.
# The method should return a new array containing the elements that return true when passed into at least one
# of the given procs.

p "-----------"
p "disjunct_select"
p "-----------"

def disjunct_select(array, *proc)
    ans = []
    array.each do |ele|
        proc.each do |p|
            if p.call(ele) && !ans.include?(ele)
                ans << ele
            end
        end
    end
    ans
end

# Examples
longer_four = Proc.new { |s| s.length > 4 }
contains_o = Proc.new { |s| s.include?('o') }
starts_a = Proc.new { |s| s[0] == 'a' }

p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
    longer_four,
) # ["apple", "teeming"]

p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
    longer_four,
    contains_o
) # ["dog", "apple", "teeming", "boot"]

p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
    longer_four,
    contains_o,
    starts_a
) # ["ace", "dog", "apple", "teeming", "boot"]

# alternating_vowel
# Write a method alternating_vowel that accepts a sentence as an argument.
# The method should return a new sentence where the words alternate between having their first or last vowel
# removed. For example:
# the 1st word should be missing its first vowel
# the 2nd word should be missing its last vowel
# the 3rd word should be missing its first vowel
# the 4th word should be missing its last vowel
# ... and so on
# Note that words that contain no vowels should remain unchanged. Vowels are the letters a, e, i, o, u.

p "-----------"
p "alternating_vowel"
p "-----------"

def alternating_vowel(sentence)
    words = sentence.split(" ")
    ans = []

    words.each.with_index do |word, i|
        if !include_vowels?(word) && i % 2 == 0
            ans << word
        elsif include_vowels?(word) && i % 2 == 0
            ans << first_vowel(word)
        else 
            ans << last_vowel(word)
        end
    end
    ans.join(" ")
end

def include_vowels?(word)
    vowels = "aeiouAEIOU"
    word.each_char do |char|
        if vowels.include?(char)
            return true
        end
    end
    false
end

def first_vowel(word)
    vowels = "aeiouAEIOU"
    num = 0
    word.each_char.with_index do |char, i|
        if vowels.include?(char)
            num = i
            return new_word = word[0...num] + word[num+1..-1]
        end
    end
end

def last_vowel(word)
    vowels = "aeiouAEIOU"
    num = 0
    (1..word.length).each do |i|
        if vowels.include?(word[-i])
            num = -(i)
            if num == -1
                return new_word = word[0...-1]
            else
                return new_word = word[0...num] + word[num+1..-1]
            end
        end
    end
end


# Examples
p alternating_vowel('panthers are great animals') # "pnthers ar grat animls"
p alternating_vowel('running panthers are epic') # "rnning panthrs re epc"
p alternating_vowel('code properly please') # "cde proprly plase"
p alternating_vowel('my forecast predicts rain today') # "my forecst prdicts ran tday"

# silly_talk
# Write a method silly_talk that accepts a sentence as an argument.
# The method should translate each word of the sentence according to the following rules:

# if the word ends with a vowel, simply repeat that vowel at the end of the word (example: 'code'->'codee')
# if the word ends with a non-vowel, every vowel of the word should be followed by 'b' and that same vowel
#     (example: 'siren'->'sibireben')
# Note that if words are capitalized in the original sentence, they should remain capitalized in the translated
# sentence. Vowels are the letters a, e, i, o, u.

p "-----------"
p "silly_talk"
p "-----------"

def silly_talk(sentence)
    words = sentence.split(" ")
    new_word = ""
    ans = []
    vowels = "aeiouAEIOU"
    words.each do |word|
        if vowels.include?(word[-1])
            new_word = word + word[-1]
        else
            new_word = change(word)
        end
        ans << new_word
    end
    ans.join(" ")
end

def change(word)
    vowels = "aeiouAEIOU"
    new_word = ""
    word.each_char do |char|
        if vowels.include?(char)
            new_word += char + "b" + char
        else
            new_word += char
        end
    end
    new_word
end

# Examples
p silly_talk('Kids like cats and dogs') # "Kibids likee cabats aband dobogs"
p silly_talk('Stop that scooter') # "Stobop thabat scobooboteber"
p silly_talk('They can code') # "Thebey caban codee"
p silly_talk('He flew to Italy') # "Hee flebew too Ibitabaly"

# compress
# Write a method compress that accepts a string as an argument.
# The method should return a "compressed" version of the string where streaks of consecutive letters are
# translated to a single appearance of the letter followed by the number of times it appears in the streak.
# If a letter does not form a streak (meaning that it appears alone), then do not add a number after it.

p "-----------"
p "compress"
p "-----------"

def compress(string)
    hash = Hash.new(0)
    com = ""
    string.each_char do |char|
        hash[char] += 1
    end

    hash.each do |k, v|
        if v != 1
            com += k + v.to_s
        else
            com += k
        end
    end

    com
end

# Examples
p compress('aabbbbc')   # "a2b4c"
p compress('boot')      # "bo2t"
p compress('xxxyxxzzzz')# "x3yx2z4"