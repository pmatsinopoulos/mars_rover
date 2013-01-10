Feature:
  As a Mars Rover User,
  I want to be able to land Rovers
  And move them around on plateau

  Scenario: Normal landing and movement, without collisions
    Given test input
      | 5 5         |
      | 1 2 N       |
      | LMLMLMLMM   |
      | 3 3 E       |
      | MMRMMRMRRM  |
    Then output should be
      | 1 3 N |
      | 5 1 E |

  Scenario: One rover will not move onto another
    Given test input
      | 5 5         |
      | 1 2 N       |
      | LMLMLMLMM   |
      | 3 2 N       |
      | MLMM        |
    Then output should be
      | 1 3 N |
      | 2 3 W |

  Scenario: One rover cannot land onto another
    Given test input
      | 5 5         |
      | 1 2 N       |
      | LMLMLMLMM   |
      | 1 3 N       |
      | MLMM        |
    Then it should raise error with message "cannot land on this position. Already occupied"

  Scenario: Should not move passed the left wall of the plateau
    Given test input
      | 5 5         |
      | 1 2 N       |
      | LMMMMMMMM   |
      | 3 2 S       |
      | MLMM        |
    Then output should be
      | 0 2 W |
      | 5 1 E |

  Scenario: Should not move passed the top wall of the plateau
    Given test input
      | 5 5          |
      | 1 2 N        |
      | MMMMMMMMMMMM |
      | 3 2 S        |
      | MLMM         |
    Then output should be
      | 1 5 N |
      | 5 1 E |

  Scenario: Should not move passed the right wall of the plateau
    Given test input
      | 5 5          |
      | 1 2 N        |
      | MMMMMMMMMMMM |
      | 2 3 S        |
      | MLMMMMMMMMMM |
    Then output should be
      | 1 5 N |
      | 5 2 E |
