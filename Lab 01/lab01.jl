# Define the shift count
shift = 3
# Input text
text = "HELLO"
# Initialize an empty string for the encrypted text
encryption = ""
# Loop through each character in the text
for c in text
    # Check if the character is uppercase
    if isuppercase(c)
        # Find the position of the character in the alphabet (0-25)
        c_unicode = Int(c)  # Get Unicode value
        c_index = c_unicode - Int('A')  # Get position in the alphabet (0-25)
        
        # Perform the shift
        new_index = (c_index + shift) % 26  # Shift within 0-25 range
        
        # Convert to the new character
        new_unicode = new_index + Int('A')  # New Unicode for the shifted character
        new_character = Char(new_unicode)  # Convert Unicode to character
        
        # Append to the encrypted string
        encryption *= new_character
    else
        # If the character is not uppercase, leave it unchanged
        encryption *= c
    end
end
# Print the original and encrypted texts
println("Plain text: $text")
println("Encrypted text: $encryption")
