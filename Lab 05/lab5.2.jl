#Алгоритм вычисления символа Якоби

function jacobi_symbol(a::Int, n::Int)
    g = 1

    if a == 0
        return 0
    end

    if a == 1
        return g
    end

    k = 0
    while iseven(a)
        a = div(a, 2)
        k += 1
    end

    a1 = a

    if iseven(k)
        s = 1
    else
        if n % 8 == 1 || n % 8 == 7
            s = 1
        else
            s = -1
        end
    end

    if a1 == 1
        return g * s
    end

    if n % 4 == 3 && a1 % 4 == 3
        s = -s
    end

    a = n % a1
    n = a1
    g *= s

    return jacobi_symbol(a, n) * g
end

a = input("a = ")
num1 = parse(Int, a)

n = input("n = ")
num2 = parse(Int, n)

result = jacobi_symbol(num1, num2)
println("Jacobi symbol (a/b): ", result)