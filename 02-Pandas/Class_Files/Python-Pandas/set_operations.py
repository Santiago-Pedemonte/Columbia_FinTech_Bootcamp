# -*- coding: UTF-8 -*-
"""Set Operations."""

hero1 = {"smart", "rich", "armored", "martial_artist", "strong"}
hero2 = {"smart", "fast", "strong", "invulnerable", "antigravity"}

print(f"hero1: {hero1}")
print(f"Type of hero1: {type(hero1)}")
print(f"hero2: {hero2}")
print(f"Type of hero2: {type(hero2)}")

# Attributes for both heros (union)
print("*"*30)
print("Union Set Operation")
print(hero1 | hero2)
print(hero1.union(hero2))

# Attributes common to both heros (intersection)
print("*"*30)
print("Intersection Set Operation")
print(hero1 & hero2)
print(hero1.intersection(hero2))

# Attributes in hero1 that are not in hero2 (difference)
print("*"*30)
print("Difference Set Operation (elements in hero1 that are not in hero2)")
print(hero1 - hero2)
print(hero1.difference(hero2))

# Attributes in hero2 that are not in hero1 (difference)
print("*"*30)
print("Difference Set Operation (elements in hero2 that are not in hero1)")
print(hero2 - hero1)
print(hero2.difference(hero1))

# Attributes for hero1 or hero2 but not both (symmetric difference)
print("*"*30)
print("Symmetric Difference Set Operation")
print(hero1 ^ hero2)
print(hero1.symmetric_difference(hero2))
