function fast_column_multiply(u::Vector{Int}, v::Vector{Int}, b::Int)
    n = length(u)  # Number of digits in u
    m = length(v)  # Number of digits in v
    w = zeros(Int, n + m)  # Result array
    t = 0  # Intermediate sum
    
    for s in 0:(m + n - 2)
        t = 0  # Reset intermediate sum for each position
        for i in 0:s
            # Include valid products where indices align
            if n - i > 0 && m - (s - i) > 0
                t += u[n - i] * v[m - (s - i)]
            end
        end
        # Compute result digit and carry
        w[m + n - 1 - s] = t % b
        t = t ÷ b
    end
    
    # Handle the final carry
    w[1] = t
    return w
end

# Example usage
u = [1, 2, 3]  # Represents 123 in base 10
v = [4, 5]     # Represents 45 in base 10
b = 10         # Base
w = fast_column_multiply(u, v, b)
println("Result: ", w)  # Output the result
