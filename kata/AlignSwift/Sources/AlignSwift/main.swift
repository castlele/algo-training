let text = """
SOME_STR: char
SOME_ARRAY: *char
SOME_INT: int
"""
let sep: Character = ":"

let alignedString = align(text, by: sep)
print(alignedString)
