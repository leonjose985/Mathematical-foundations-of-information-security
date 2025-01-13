function caesar_cipher1(text::String, shift::Int, mode::Symbol)
    result = []
    for char in text
        if isletter(char)
            base = ifelse(isuppercase(char), 'A', 'a')
            if mode == :encrypt
                new_char = base + (char - base + shift) % 26
            elseif mode == :decrypt
                new_char = base + (char - base - shift) % 26
            end

            push!(result, Char(new_char))
        else
            push!(result, char)
        end
    end
    return join(result)
end

plaintext = "KHOOR"
k = 3
encrypted_text = caesar_cipher1(plaintext, k, :encrypt)
println("Encrypted Text: $encrypted_text")

decrypted_text = caesar_cipher1(encrypted_text, k, :decrypt)
println("Decrypted Text: $decrypted_text")