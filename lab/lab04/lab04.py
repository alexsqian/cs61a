# Q4
def get_seven_a(x):
    """
    >>> x = [1, 3, [5, 7], 9]
    >>> get_seven_a(x)
    7
    """
    "*** YOUR CODE HERE ***"
    return x[2][1]

def get_seven_b(x):
    """
    >>> x = [[7]]
    >>> get_seven_b(x)
    7
    """
    "*** YOUR CODE HERE ***"
    return x[0][0]

def get_seven_c(x):
    """
    >>> x = [1, [2, [3, [4, [5, [6, [7]]]]]]]
    >>> get_seven_c(x)
    7
    """
    "*** YOUR CODE HERE ***"
    return x[1][1][1][1][1][1][0]

# Q5
def reverse_recursive(lst):
    """Returns the reverse of the given list.

    >>> reverse_recursive([1, 2, 3, 4])
    [4, 3, 2, 1]
    """
    "*** YOUR CODE HERE ***"
    x=lst
    y = [x[-1]]
    if x[-1] == x[0]:
        return x
    else:
        lst = lst[:-1]
        return y + reverse_recursive(lst)


# Q6
def merge(lst1, lst2):
    """Merges two sorted lists recursively.

    >>> merge([1, 3, 5], [2, 4, 6])
    [1, 2, 3, 4, 5, 6]
    >>> merge([], [2, 4, 6])
    [2, 4, 6]
    >>> merge([1, 2, 3], [])
    [1, 2, 3]
    >>> merge([5, 7], [2, 4, 6])
    [2, 4, 5, 6, 7]
    """
    "*** YOUR CODE HERE ***"
    x, y = 0, 0
    lst3 = lst1 + lst2
    if len(lst1) == 0 or len(lst2) == 0:
        return lst3
    else:
        if lst1[0] < lst2[0]:
            return lst1[:1] + merge(lst1[1:], lst2)
        elif lst1[0] > lst2[0]:
            return lst2[:1] + merge(lst1, lst2[1:])






# Q8
from math import sqrt

def is_square(n):
    return float(sqrt(n)) == int(sqrt(n))

def squares(seq):
    """Returns a new list containing elements of the original list that are
    perfect squares.

    >>> seq = [49, 8, 2, 1, 102]
    >>> squares(seq)
    [49, 1]
    >>> seq = [500, 30]
    >>> squares(seq)
    []
    """
    "*** YOUR CODE HERE ***"
    return [x for x in seq if is_square(x)]