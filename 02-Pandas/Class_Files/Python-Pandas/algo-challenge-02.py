# Import the `string` library.
import string

# Use the `string` library to initialize string variables representing all valid letters and digits, respectively.
valid_characters = string.ascii_letters
valid_numbers = string.digits

# Define a function called `check_strength` that takes in a string parameter called `password`.
def check_strength(password):
    # Create two boolean variables called `contains_number` and `contains_letter`. Set them to False.
    contains_number = False
    contains_letter = False

    # Initialize a `count` variable and set it to 0.
    count = 0

    # Loop through each character in the `password` and increment the `count` variable by 1 for each character.
    for character in password:
        count += 1

        # Create an if-else statement that loops through each character in `password` and updates `contains_number` or `contains_letter` to True.
        if character in valid_characters:
            contains_letter = True
        elif character in valid_numbers:
            contains_number = True

    # If `password` contains equal to or fewer than 6 characters and consists only of numbers, print "Your password is too weak."
    # Else if `password` contains more than 6 characters and consists of at least one number and at least one letter, print "Your password is a strong password".
    # Else, print "Your password is of average strength."
    if count <= 6 and contains_number == True and contains_letter == False:
        print("Your password is too weak.")
    elif count > 6 and contains_number == True and contains_letter == True:
        print("Your password is a strong password.")
    else:
        print("Your password is of average strength.")

# Declare a variable as `user_input_password` with an input stating "Input your password: ".
user_password = input("Input your password: ")

# Call the check_strength function with the `user_input_password`.
check_strength(user_password)
