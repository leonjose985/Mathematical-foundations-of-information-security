using Random
using Printf

# Function to compute the GCD (Greatest Common Divisor)
function gcd(a, b)
    while b != 0
        (a, b) = (b, a % b)
    end
    return abs(a)
end

# Function to implement Pollard's p-method
function pollards_p_method(n::Int, c::Int, f::Function)
    # Step 1: Initialize a and b
    a = c
    b = c

    while true
        # Step 2: Update a and b using the function f
        a = f(a) % n
        b = f(f(b) % n) % n

        # Step 3: Compute d = GCD(a - b, n)
        d = gcd(abs(a - b), n)

        # Step 4: Check conditions for termination
        if d > 1 && d < n
            return d # Non-trivial divisor found
        elseif d == n
            return "No divisor found"
        end
        # If d == 1, continue the loop
    end
end

# Example parameters
n = 1359331
c = 1
f(x) = (x^2 + 5)

# Run the algorithm
result = pollards_p_method(n, c, f)

# Print the result
if typeof(result) == Int
    println("A non-trivial divisor of $n is $result.")
else
    println(result)
end
