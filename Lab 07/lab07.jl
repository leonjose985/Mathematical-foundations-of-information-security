# Function to compute modular exponentiation
function mod_exp(base, exp, mod)
    result = 1
    while exp > 0
        if exp % 2 == 1
            result = (result * base) % mod
        end
        base = (base * base) % mod
        exp ÷= 2
    end
    return result
end

# Функция, реализующая метод p Полларда
function pollard_rho_dlog(p, a, b, r, f)
    # Step 1: Choose random u, v and initialize c and d
    u, v = 2, 2  # Example initialization, these can be random
    c = (mod_exp(a, u, p) * mod_exp(b, v, p)) % p
    d = c
    u_c, v_c = u, v
    u_d, v_d = u, v

    # Step 2: Update c and d using the function f and track logs
    while true
        # Update c
        if c < r
            u_c = (u_c + 1) % r
        else
            v_c = (v_c + 1) % r
        end
        c = f(c, p, r)

        # Update d twice
        for _ in 1:2
            if d < r
                u_d = (u_d + 1) % r
            else
                v_d = (v_d + 1) % r
            end
            d = f(d, p, r)
        end

        # Check for collision
        if c == d
            break
        end
    end

    # Step 3: Solve for x
    numerator = (u_c - u_d) % r
    denominator = (v_d - v_c) % r

    # Solve numerator / denominator mod r using modular inverse
    inv_denominator = mod_exp(denominator, r - 2, r)  # Fermat's little theorem
    x = (numerator * inv_denominator) % r

    # Verify result
    if mod_exp(a, x, p) == b
        return x
    else
        return "No solution"
    end
end

# Example input and function
p = 107
a = 10
b = 64
r = 53

# Define the function f
function f(c, p, r)
    return c < r ? (10 * c) % p : (64 * c) % p
end

# Solve using Pollard's rho
x = pollard_rho_dlog(p, a, b, r, f)
println("Discrete logarithm x = $x")
