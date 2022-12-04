using Test

real_input = readchomp("data/day03.txt")

test_input = """
vJrwpWtwJgWrhcsFMMfFFhFp
jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
PmmdzqPrVvPwwTWBwg
wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
ttgJtRGJQctTZtZT
CrZsJsPPZsGzwwsLwLmpwMDw"""

# Split the input line into 2 parts
# Check what is the same  
function priority(char)
    if 'a' <= char <= 'z'
        1 + char - 'a'
    elseif 'A' <= char <= 'Z'
        27 + char - 'A'
    end
end

function part1(input)
    result = 0
    for line in input
        println(line)

    end
    result
end

println("Part 1... ")
@test part1(test_input) == 157
println("ok")
println("Result: ", part1(real_input))

function part2(input)
    result = 0
    for group in Iterators.partition(eachsplit(input, '\n'), 3)
        result += priority(only(Set(group[1]) ∩ Set(group[2]) ∩ Set(group[3])))
    end
    result
end

println("Part 2... ")
@test part2(test_input) == 70
println("ok")
println("Result: ", part2(real_input))