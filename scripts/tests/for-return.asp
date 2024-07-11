# Test return statement inside a for statement
# Thanks for Max "The Natrix" Tymchii for providing this test case.

def parse_value(key):
    dictionary = {"10": 100, "20": 200, "30": 300}
    for k, v in dictionary:
        if k == key:
            return v
    else:
        return None

print(parse_value("10"))
print(parse_value("50"))
