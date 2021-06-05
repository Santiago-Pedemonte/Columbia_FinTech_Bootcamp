# Import the `random` library.
import random

# Answer each question with the correct coding solution.

# QUESTION 1: Create a function called `number_guess` that takes in an integer as an argument.
# If the number is 42, print(true). If it isn't 42, print(false)
def number_guess(number):
    if number == 42:
        print(True)
    else:
        print(False)

# This code is to help you test your function
test_num = random.randint(40, 45)
print(f"Number {test_num}")
number_guess(test_num)

# QUESTION 2: Write a function that takes in a list of numbers. the function should print the smallest number in the given list
def find_smallest(list_param):
    minimum = 0

    for number in list_param:
        if minimum == 0:
            minimum = number
        elif number < minimum:
            minimum = number

    print(f"The smallest number in the list is {minimum}")

# This code is to help you test your function
nums = [10, 11, 3, 123, 54, 6, 67]
find_smallest(nums)

# QUESTION 3: Write a function which takes in a list of strings. The function should print the shortest string in the list.
def find_shortest(list_param):
    shortest_string = ""
    shortest_character_count = 0

    for string in list_param:
        count = 0

        for character in string:
            count += 1

        print(string, count)

        if shortest_character_count == 0:
            shortest_character_count = count
            shortest_string = string
        elif count < shortest_character_count:
            shortest_character_count = count
            shortest_string = string

    print(f"The shortest string is {shortest_string}")


# This code is to help you test your function
strings = ["hey there", "yo", "a", "hello", "what up", "hello, my name is farley", "howdy"]
find_shortest(strings)

#QUESTION 4: Write a function that takes in three arguments: a high value, a low value and a list of numbers.
# The function should print a new list of numbers where the elements are greater than the low value and less than the high value
def filter_list(high, low, list_param):
    filtered_list = []

    for number in list_param:
        if number > 10 and number < 20:
            filtered_list.append(number)

# This code is to help you test your function
high = 20
low = 10
arr = [2,5,99,15,23,18,11,21]

filter_list(high, low, arr)
