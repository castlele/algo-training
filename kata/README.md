# Katas

## Align lines

Implement aligning of the multiline string by some character. The user can pick the separator by which aligning will be implemented.

INPUT:
```swift
let multilineString = """
SOME_STR: char
SOME_OTHER_STR: char
INT_VALUE: int
"""
let alignedString = align(multilineString, ":")

print(alignedString)
```

OUTPUT:
```swift
SOME_STR      : char
SOME_OTHER_STR: char
INT_VALUE     : int
```

## Add Author Comment

Flow:
1. Create method, that adds comment with text "Author: <#name#>" to the given text. If text not empt the method comments it too

INPUT:
```swift
comment("print(\"Hello, World\")", with: "#", by: "My name")
```

OUTPUT:
```
# Author: My name
# print("Hello, World")
```

2. Update method to be aware of indentations. If there is an indent add comment sign after it. And Author comment should be aligned appropriately

INPUT:
```swift
comment("    print(\"Hello, World\")", with: "#", by: "My name")
```

OUTPUT:
```
    # Author: My name
    # print("Hello, World")
```

3. Update method to support multiline strings

INPUT:
```swift
comment("print(\"Hello, World\")\nreturn 0", with: "#", by: "My name")
```

OUTPUT:
```
# Author: My name
# print("Hello, World")
# return 0
```

4. Support different indentation levels in multiline strings. Comment sign should be placed by min indentation

INPUT:
```swift
comment("    if isGoodMood {\n        print(\"Hello, World\")\n    }", with: "#", by: "My name")
```

OUTPUT:
```
    # Author: My name
    # if isGoodMood {
    #     print("Hello, World")
    # }
```

5. Don't comment lines, that already commented (no matter write or wrong). Don't modify this line

INPUT:
```swift
comment("    if isGoodMood {\n        # print(\"Hello, World\")\n    }", with: "#", by: "My name")
```

OUTPUT:
```
    # Author: My name
    # if isGoodMood {
         # print("Hello, World")
    # }
```

6. Support ability to add custom user flags

INPUT:
```swift
comment("print(\"Hello, World\")", with: "#", by: "My name", parameters: [
    Parameter(name: "TODO", comment: "Remove later"),
    Parameter(name: "FIXME", comment: "Refactor later")
])
```

OUTPUT:
```
# Author: My name
# TODO: Remove later
# FIXME: Refactor later
# print("Hello, World")
```

## String calculator

[Original source](https://github.com/wix-incubator/tdd-katas#string-calculator)

STEPS:
1. An empty string returns zero '' => 0
2. A single number returns the value '1' => 1 '2' => 2
3. Two numbers, comma delimited, returns the sum '1,2' => 3 '10,20' => 30
4. Two numbers, newline delimited, returns the sum '1\n2' => 3
5. Three numbers, delimited either way, returns the sum '1\n2,3\n4' => 10
6. Negative numbers throw an exception with the message '-1,2,-3' => 'negatives not allowed: -1,-3'
7. Numbers greater than 1000 are ignored
8. A single char delimiter can be defined on the first line starting with // (e.g //#\n1#2 for a ‘#’ as the delimiter)
9. A multi char delimiter can be defined on the first line starting with // (e.g. //###\n1###2 for ‘###’ as the delimiter)
