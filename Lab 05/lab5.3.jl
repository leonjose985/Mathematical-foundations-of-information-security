#Алгоритм, реализующий тест Соловэя-Штрассена
using Random

function jacobi_symbol(a::Int, n ::Int)
    g = 1 

    while a != 0
        #Step 4: Factor out powers of 2 in a to find a1(odd part)
        k = 0 
        while iseven(a)
            a = div(a, 2)
            k += 1
        end
        a1 = a

        #Determine s based on k and n mod 8
        s = 1
        if isodd(k)
            if n % 8 == 3 || n % 8 == 5
                s = -1
            end
        end

        if n % 4 == 3 && a1 % 4 == 3
            s = -s
        end

        #Update g, a and n
        g *= s
        a, n = n % a1, a1
    end

    return g == 1 ? 1 : (n == 1 ? g : 0)    
end

function solovay_strassen_test(n::Int)
    if n < 5 || iseven(n)
        return "Input must be an odd integer greater than or equal to 5"
    end

    a = rand(2: n - 2)
    r = powermod(a, div(n - 1, 2), n)

    if r != 1 && r != n - 1
        return "The number n is composite"
    end

    s = jacobi_symbol(a, n)

    if r % n != s
        return "The number n is compisite"
    else 
        return "The number n is probably prime"
    end
end

n = input("n = ")
num1 = parse(Int, n)

r = solovay_strassen_test(num1)
println(r)