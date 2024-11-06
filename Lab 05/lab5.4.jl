#Алгоритм, реализующий тест Миллера-Рабина
using Random 

function miller_rabin_test(n::Int)
    r = n - 1
    s = 0
    while iseven(r)
        r = div(r, 2)
        s += 1
    end

    a = rand(2: n - 2)
    y = powermod(a, r, n)

    if y != 1 && y != n - 1
        j = 1
        while j <= s - 1 && y != n - 1
            y = powermod(y, 2, n)
            if y == 1
                return "The number n is composite"
            end
            j += 1
        end

        if y != n - 1
            return "The number n is composite"
        end
    end
    return "The number n is probably prime"
end

n = input("n = ")
num1 = parse(Int, n)

r = miller_rabin_test(num1)
println(r)
