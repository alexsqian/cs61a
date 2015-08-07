#############
# Iterators #
#############

class IteratorRestart:
    """
    >>> i = IteratorRestart(2, 7)
    >>> for item in i:
    ...     print(item)
    2
    3
    4
    5
    6
    7
    >>> for item in i:
    ...     print(item)
    2
    3
    4
    5
    6
    7
    """
    def __init__(self, start, end):
        "*** YOUR CODE HERE ***"
        self.current = 1

    def __next__(self):
        "*** YOUR CODE HERE ***"
        if self.current > 6:
            self.current = 1
            raise StopIteration
        self.current += 1
        return self.current

    def __iter__(self):
        "*** YOUR CODE HERE ***"
        return self

##############
# Generators #
##############

def countdown(n):
    """
    >>> for number in countdown(5):
    ...     print(number)
    ...
    5
    4
    3
    2
    1
    0
    """
    "*** YOUR CODE HERE ***"
    def generator():
        i = n
        while i >=0:
            yield i
            i -=1
    return generator()


class Countdown:
    """
    >>> for number in Countdown(5):
    ...     print(number)
    ...
    5
    4
    3
    2
    1
    0
    """
    "*** YOUR CODE HERE ***"
    def __init__(self, start):
        self.start = 5

    def __iter__(self):
        while self.start >=0:
            yield self.start
            self.start -=1

def hailstone(n):
    """
    >>> for num in hailstone(10):
    ...     print(num)
    ...
    10
    5
    16
    8
    4
    2
    1
    """
    "*** YOUR CODE HERE ***"
    def generator():
        i = n
        while i >=1:
            yield i
            if i == 1:
                return i
            if i%2 == 0:
                i = i//2
            else:
                i = (i*3 + 1)
    return generator()
