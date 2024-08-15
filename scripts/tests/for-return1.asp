# Test return statement inside a for statement.
# Thanks to Max "The Natrix" Tymchii for providing this test case.

def parse_value(key):
    dictionary = {"10": 100, "20": 200, "30": 300}
    for k, v in dictionary:
        if k == key:
            return v

print(parse_value("10"))
print(parse_value("50"))
