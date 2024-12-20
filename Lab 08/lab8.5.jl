function divide_large_integers(u::Vector{Int}, v::Vector{Int}, b::Int)
    n = length(u) - 1  # Degree of dividend u
    t = length(v) - 1  # Degree of divisor v
    q = zeros(Int, n - t + 1)  # Quotient array
    r = copy(u)  # Copy of u, will hold the remainder

    # Step 2: Adjust for high powers of b
    while compare_large_integers(r, v, n - t, b) >= 0
        q[end] += 1
        r = subtract_scaled(r, v, n - t, b)
    end

    # Step 3: Perform the main division algorithm
    for i in n:-1:(t + 1)
        if r[i + 1] >= v[t + 1]
            q[i - t - 1] = b - 1
        else
            q[i - t - 1] = (r[i + 1] * b + r[i]) ÷ v[t + 1]
        end

        while q[i - t - 1] * (v[t + 1] * b + v[t]) > 
              (r[i + 1] * b^2 + r[i] * b + r[i - 1])
            q[i - t - 1] -= 1
        end

        # Subtract q[i-t-1] * v * b^(i-t-1) from r
        r = subtract_scaled(r, v, i - t - 1, b, q[i - t - 1])
        if r[1] < 0
            r = add_scaled(r, v, i - t - 1, b)
            q[i - t - 1] -= 1
        end
    end

    return q, r
end
