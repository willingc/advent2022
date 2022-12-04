using Test

real_input = readchomp("data/day02.txt")
test_input = """
A Y
B X
C Z"""

function part1(input)
    choices = Dict(['A'=>1, 'B'=>2, 'C'=>3,
              'X'=>1, 'Y'=>2, 'Z'=>3])
    result = 0
    for line in eachsplit(input, '\n')
        opponent_elf = choices[line[1]]
        my_elf = choices[line[end]]
        if opponent_elf == 3 && my_elf == 1
            opponent_elf = 0
        end
        if opponent_elf == 1 && my_elf == 3
            opponent_elf = 4
        end
        won = sign(my_elf - opponent_elf)
        result += my_elf + 3 + 3won
    end
    result
end

print("Part 1... ")
@test part1(test_input) == 15
println("ok")
println("Result: ", part1(real_input))

function part2(input)
    choices = Dict(['A'=>1, 'B'=>2, 'C'=>3,
              'X'=>0, 'Y'=>3, 'Z'=>6])
    result = 0
    for line in eachsplit(input, '\n')
        opponent_elf = choices[line[1]]
        score = choices[line[end]]
        my_elf = -1
        if score == 0
            my_elf = opponent_elf - 1
            if my_elf == 0
                my_elf = 3
            end
        elseif score == 6
            my_elf = opponent_elf + 1
            if my_elf == 4
                my_elf = 1
            end
        else
            my_elf = opponent_elf
        end
        result += my_elf + score
    end
    result
end

print("Part 2... ")
@test part2(test_input) == 12
println("ok")
println("Result: ", part2(real_input))
