let author = "castlelecs"
let commentSign = "//"
let indentation = "    "
let lineOne = "if (!isAligned) {"
let lineTwo = "[self.editor.shapeHandler setVerticalAlignment:alignment];"
let lineThree = "}"
let fullMessage = "\(indentation)\(lineOne)\n\(indentation)\(indentation)\(lineTwo)\n\(indentation)\(lineThree)"
let originalMessage = "// [self.editor.shapeHandler setVerticalAlignment:alignment];"

let result = addAuthorComment(to: originalMessage, with: commentSign, by: author)
print(result)
