Feature: Hint field

  Scenario:
    Given the following minefield:
    """
    *...
    ..*.
    ....
    """
    When I reveal the hint field
    Then the output should be:
    """
    *211
    12*1
    0111
    """
