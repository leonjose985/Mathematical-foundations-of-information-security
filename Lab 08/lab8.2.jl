function subtract_large_integers(u::Vector{Int}, v::Vector{Int}, b::Int)
    n = length(u)  # Number of digits in the numbers
    w = zeros(Int, n)  # Result array
    k = 0  # Initial borrow
    
    for j in n:-1:1
        # Compute the difference, including the borrow
        digit_diff = u[j] - v[j] + k
        if digit_diff < 0
            digit_diff += b  # Adjust with base if negative
            k = -1           # Borrow for the next position
        else
            k = 0            # No borrow needed
        end
        w[j] = digit_diff  # Store the result
    end
    
    return w
end

# Example usage
u = [4, 5, 6]  # Represents 456 in base 10
v = [1, 2, 3]  # Represents 123 in base 10
b = 10  # Base
w = subtract_large_integers(u, v, b)
println("Result: ", w)  # Output the result
