using Test

real_input = readchomp("data/day04.txt")

test_input = """
2-4,6-8
2-3,4-5
5-7,7-9
2-8,3-7
6-6,4-6
2-6,4-8"""

section_input = """
.234.....  2-4
.....678.  6-8

.23......  2-3
...45....  4-5

....567..  5-7
......789  7-9

.2345678.  2-8
..34567..  3-7

.....6...  6-6
...456...  4-6

.23456...  2-6
...45678.  4-8
"""

ints(str) = parse.(Int, eachmatch(r"(\d+)", str) .|> only)

within(a, b, c, d) = let x = a:b, y = c:d
    x ⊆ y || y ⊆ x
end

overlap(a, b, c, d) = let x = a:b, y = c:d
    !isempty(x ∩ y)
end

part1(input) = eachsplit(input, '\n') .|> ints .|> (x->within(x...)) |> sum

part2(input) = eachsplit(input, '\n') .|> ints .|> (x->overlap(x...)) |> sum

function part1a(input)
    result=0
    for line in eachsplit(input, '\n')
        a, b, c, d = ints(line)
        if within(a, b, c, d)
            result += 1
        end
    end
    result
end


println("Part 1... ")
@test part1(test_input) == 2
println("ok")
println("Result: ", part1(real_input))
println("Result: ", part1a(real_input))

println("Part 2... ")
@test part2(test_input) == 4
println("ok")
println("Result: ", part2(real_input))