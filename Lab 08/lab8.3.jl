function multiply_large_integers(u::Vector{Int}, v::Vector{Int}, b::Int)
    n = length(u)  # Number of digits in u
    m = length(v)  # Number of digits in v
    w = zeros(Int, n + m)  # Result array (enough space for the product)
    
    for j in m:-1:1
        if v[j] == 0
            continue  # Skip if the digit in v is 0
        end
        
        k = 0  # Initial carry
        for i in n:-1:1
            t = u[i] * v[j] + w[i + j] + k  # Multiply, add to the result and carry
            w[i + j] = t % b  # Store least significant digit
            k = t ÷ b         # Carry for the next iteration
        end
        
        w[j] = k  # Store remaining carry
    end
    
    return w
end

# Example usage
u = [1, 2, 3]  # Represents 123 in base 10
v = [4, 5]     # Represents 45 in base 10
b = 10         # Base
w = multiply_large_integers(u, v, b)
println("Result: ", w)  # Output the result
