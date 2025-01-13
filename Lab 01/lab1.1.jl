k = 3
text = "HOLA MUNDO"
encryption = ""

for c in text
    if isuppercase(c)
        c_unicode = Int(c)
        c_index = c_unicode - Int('A')

        new_index = (c_index + k) % 26

        new_unicode = new_index + Int('A')
        new_character = Char(new_unicode)

        encryption *= new_character
    else
        encryption *= c
    end
end
println("Plain text: $text")
println("Encrypted text: $encryption")