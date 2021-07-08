# duos
# Write a method duos that accepts a string as an argument and returns the count of the number of times
# the same character appears consecutively in the given string.

p "-----------"
p "duos"
p "-----------"

def duos(string)
    count = 0
    (0...string.length-1).each do |num|
        if string[num] == string[num+1]
            count += 1
        end
    end
    count
end

# Examples
p duos('bootcamp')      # 1
p duos('wxxyzz')        # 2
p duos('hoooraay')      # 3
p duos('dinosaurs')     # 0
p duos('e')             # 0

# sentence_swap
# Write a method sentence_swap that accepts a sentence and a hash as arguments.
# The method should return a new sentence where every word is replaced with
# it's corresponding value in the hash. If a word does not exist as a key of the hash,
# then it should remain unchanged.

p "-----------"
p "sentence_swap"
p "-----------"

def sentence_swap(sentence, hash)
    words = sentence.split(" ")
    ans = []
    words.each do |word|
        if hash.has_key?(word)
            ans << hash[word]
        else
            ans << word
        end
    end
    ans.join(" ")
end

# Examples
p sentence_swap('anything you can do I can do',
    'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
) # 'nothing you shall drink I shall drink'

p sentence_swap('what a sad ad',
    'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
) # 'make a happy ad'

p sentence_swap('keep coding okay',
    'coding'=>'running', 'kay'=>'pen'
) # 'keep running okay'

# hash_mapped
# Write a method hash_mapped that accepts a hash, a proc, and a block.
# The method should return a new hash where each key is the result of the original key when given to the block.
# Each value of the new hash should be the result of the original values when passed into the proc.

p "-----------"
p "hash_mapped"
p "-----------"

def hash_mapped(hash, p, &proc)
    ans = Hash.new

    hash.each do |k, v|
        tempv = p.call(v)
        tempk = proc.call(k)
        ans[tempk] = tempv
    end
    ans
end

# Examples
double = Proc.new { |n| n * 2 }
p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }
# {"A!!"=>8, "X!!"=>14, "C!!"=>-6}

first = Proc.new { |a| a[0] }
p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }
# {25=>"q", 36=>"w"}

# counted_characters
# Write a method counted_characters that accepts a string as an argument.
# The method should return an array containing the characters of the string that appeared more than twice.
# The characters in the output array should appear in the same order they occur in the input string.

p "-----------"
p "counted_characters"
p "-----------"

def counted_characters(string)
    count = Hash.new(0)
    
    string.each_char do |char|
        count[char] += 1
    end
    ans = []

    count.each do |k, v|
        if v > 2
            ans << k
        end
    end
    ans
end

# Examples
p counted_characters("that's alright folks") # ["t"]
p counted_characters("mississippi") # ["i", "s"]
p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
p counted_characters("runtime") # []

# triplet_true?
# Write a method triplet_true? that accepts a string as an argument and returns a boolean indicating whether
# or not the string contains three of the same character consecutively.

p "-----------"
p "triplet_true"
p "-----------"

def triplet_true(string)
    ans = Hash.new(0)
    string.each_char do |char|
        ans[char] += 1
    end

    ans.each do |k,v|
        if v >= 3
            return true
        end
    end
    false
end

# Examples
p triplet_true('caaabb')        # true
p triplet_true('terrrrrible')   # true
p triplet_true('runninggg')     # true
p triplet_true('bootcamp')      # false
p triplet_true('e')             # false

# energetic_encoding
# Write a method energetic_encoding that accepts a string and a hash as arguments.
# The method should return a new string where characters of the original string are replaced
# with the corresponding values in the hash. If a character is not a key of the hash,
# then it should be replaced with a question mark ('?'). Space characters (' ') should remain unchanged.

p "-----------"
p "energetic_encoding"
p "-----------"

def energetic_encoding(string, hash)
    ans = ""
    string.each_char do |char|
        if hash.has_key?(char)
            ans += hash[char]
        elsif char == " "
            ans += char
        else 
            ans += "?"
        end
    end
    ans
end

# Examples
p energetic_encoding('sent sea',
    'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
) # 'zimp ziu'

p energetic_encoding('cat',
    'a'=>'o', 'c'=>'k'
) # 'ko?'

p energetic_encoding('hello world',
    'o'=>'i', 'l'=>'r', 'e'=>'a'
) # '?arri ?i?r?'

p energetic_encoding('bike', {}) # '????'

# uncompress
# Write a method uncompress that accepts a string as an argument.
# The string will be formatted so every letter is followed by a number.
# The method should return an "uncompressed" version of the string where every letter is repeated multiple
# times given based on the number that appears directly after the letter.

p "-----------"
p "uncompress"
p "-----------"

def uncompress(string)
    num = "0123456789"
    ans = ""
    (0...string.length).each do |i|
        if i % 2 == 0
            ans += string[i]
        else
            temp = num.index(string[i]) - 1
            tc = ans[-1]
            ans += tc * temp
        end
    end
    ans
end

# Examples
p uncompress('a2b4c1') # 'aabbbbc'
p uncompress('b1o2t1') # 'boot'
p uncompress('x3y1x2z4') # 'xxxyxxzzzz'