Feature: API Testing

  Scenario Outline: Happy Path
    Given I have a room that has a dimension of <room>
    And I have a roomba in the following coordinates: <pos>
    And There are patches of dirt in the following coordinates: <patches>
    Then I send the command to the roomba to perform the following actions: <command>
    Then I got the response from the roomba
    And The response code is <rcode>
    And The position now is <fpos>
    And The total cleaned patches of dirt are <cpatches>

    Examples:
      | pos   | room    | patches                           | command       | rcode | fpos    | cpatches  |
      | [1,5] | [7,7]   | [[1, 0],[1, 1],[2, 3],[1, 4]]     | N             | 200   | [1,6]   | 0         |
      | [3,4] | [7,7]   | [[3, 0],[1, 1],[3, 5],[5, 4]]     | NSNS          | 200   | [3,4]   | 1         |
      | [5,3] | [7,7]   | [[5, 0],[5, 1],[2, 3],[5, 4]]     | NNNS          | 200   | [5,5]   | 1         |
      | [6,6] | [7,7]   | [[6, 0],[1, 1],[6, 3],[6, 4]]     | SSSN          | 200   | [6,4]   | 2         |
      | [6,0] | [7,7]   | [[6, 2],[6, 1],[6, 3],[1, 4]]     | NNSN          | 200   | [6,2]   | 2         |
      | [3,3] | [7,7]   | [[3, 0],[3, 1],[3, 2],[3, 4]]     | SSNS          | 200   | [3,1]   | 2         |
      | [2,0] | [7,7]   | [[2, 0],[2, 1],[2, 3],[2, 4]]     | NNNSSS        | 200   | [2,0]   | 3         |
      | [2,2] | [7,7]   | [[2, 0],[2, 1],[2, 3],[2, 4]]     | NSSS          | 200   | [2,0]   | 3         |
