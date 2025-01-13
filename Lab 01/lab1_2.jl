#Шифр Атбаш
function atbash_cipher(text::String)
    result = []

    for char in text
        if isletter(char)
            ascii_offset = isuppercase(char) ? 'A' : 'a'
            new_char = Char(ascii_offset + (25 - (Int(char) - Int(ascii_offset))))
            push!(result, string(new_char))
        else
            push!(result, string(char))
        end
    end
    return join(result)
end

println("HELLO WORLD")
println(atbash_cipher("HELLO WORLD"))