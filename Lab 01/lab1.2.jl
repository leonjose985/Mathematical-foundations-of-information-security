# Function to perform Atbash cipher encryption/decryption
function atbash_cipher(text::String)
    result = String[]  # Initialize an empty array of Strings

    for char in text
        if isletter(char)
            ascii_offset = isuppercase(char) ? 'A' : 'a'
            # Calculate the new character based on Atbash cipher
            new_char = Char(ascii_offset + (25 - (Int(char) - Int(ascii_offset))))
            push!(result, string(new_char))  # Convert Char to String before appending
        else
            push!(result, string(char))  # Convert Char to String before appending
        end
    end

    return join(result)  # Join the array into a single string
end

# Example usage
println(atbash_cipher("HELLO WORLD"))
