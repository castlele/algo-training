# Katas

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
