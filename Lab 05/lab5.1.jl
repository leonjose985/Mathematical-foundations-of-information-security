#Алгоритм, реализующий тест Ферма
using Random 

function fermat_primality_test(n::Int)
    if n < 5 || iseven(n)
        return "Input must be a odd integer greater than or equal 5"
    end

    a = rand(2:(n - 2))
    r = powermod(a, n - 1, n)
    if r == 1
        return "The number n is a probably prime"
    else 
        return "The number n is composite"
    end
end

function input(prompt:: AbstractString)
    print(prompt)
    return chomp(readline())
end

n = input("n = ")
num1 = parse(Int, n)

result = fermat_primality_test(num1)
println(result)