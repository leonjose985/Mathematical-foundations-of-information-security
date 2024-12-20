function add_large_integers(u::Vector{Int}, v::Vector{Int}, b::Int)
    n = length(u)  # Number of digits in the numbers
    w = zeros(Int, n + 1)  # Result array (extra space for carry)
    k = 0  # Initial carry
    
    for j in n:-1:1
        # Compute the sum of digits, including the carry
        digit_sum = u[j] + v[j] + k
        w[j + 1] = digit_sum % b  # Least significant digit of the result
        k = digit_sum ÷ b        # Carry for the next position
    end
    
    # Set the carry to the first digit (w₀)
    w[1] = k
    return w
end

# Example usage
u = [3, 4, 5]  # Represents 345 in base 10
v = [6, 7, 8]  # Represents 678 in base 10
b = 10  # Base
w = add_large_integers(u, v, b)
println("Result: ", w)  # Output the result
