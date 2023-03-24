Feature: API Testing

Scenario: Roomba can clean a large room
  Given I have a room that has a dimension of [1000, 1000]
  And I have a roomba in the following coordinates: [1, 1]
  And There are patches of dirt in the following coordinates: [[500, 500], [800, 800], [900, 900]]
  Then I send the command to the roomba to perform the following actions: NENENENENENENENENENENENENENENENENENENENENENENENENENENENENENENENENENENENENENENENEN
  And I got the response from the roomba
  And The response code is 200
  And The position now is [41, 42]
  And The total cleaned patches of dirt are 0

Scenario: Roomba can clean a very small room
  Given I have a room that has a dimension of [2, 2]
  And I have a roomba in the following coordinates: [0, 0]
  And There are patches of dirt in the following coordinates: [[0, 0]]
  Then I send the command to the roomba to perform the following actions: N
  Then I got the response from the roomba
  And The response code is 200
  And The position now is [0, 1]
  And The total cleaned patches of dirt are 1

  Scenario: Roomba cannot start outside the room
    Given I have a room that has a dimension of [4, 5]
    And I have a roomba in the following coordinates: [6, 6]
    And There are patches of dirt in the following coordinates: [[4, 4]]
    Then I send the command to the roomba to perform the following actions: N
    Then I got the response from the roomba
    And The response code is 400
    And The position now is [6, 6]
    And The total cleaned patches of dirt are 0

  Scenario: Roomba can clean a room with patches of dirt covering the entire room
    Given I have a room that has a dimension of [3, 3]
    And I have a roomba in the following coordinates: [0, 0]
    And There are patches of dirt in the following coordinates: [[0, 0], [0, 1], [0, 2], [1, 0], [1, 1], [1, 2], [2, 0], [2, 1], [2, 2]]
    Then I send the command to the roomba to perform the following actions: NNESSENNESSWWW
    Then I got the response from the roomba
    And The response code is 200
    And The position now is [0, 0]
    And The total cleaned patches of dirt are 9

  Scenario: Roomba cannot execute an invalid command
    Given I have a room that has a dimension of [3, 3]
    And I have a roomba in the following coordinates: [0, 0]
    And There are patches of dirt in the following coordinates: [[0, 1], [1, 1]]
    Then I send the command to the roomba to perform the following actions: NESXSWW
    Then I got the response from the roomba
    And The response code is 400
    And The position now is [1, 1]
    And The total cleaned patches of dirt are 0

  Scenario: Roomba can clean patches of dirt at the same location
    Given I have a room that has a dimension of [30, 30]
    And I have a roomba in the following coordinates: [0, 0]
    And There are patches of dirt in the following coordinates: [[1, 1], [1, 1], [2, 2]]
    Then I send the command to the roomba to perform the following actions: ENNESWWS
    Then I got the response from the roomba
    And The response code is 200
    And The position now is [0, 0]
    And The total cleaned patches of dirt are 2

  Scenario: Roomba can clean a room with a large number of patches of dirt
    Given I have a room that has a dimension of [100, 102]
    And I have a roomba in the following coordinates: [0, 0]
    And There are 1999 patches of dirt in the room, distributed randomly
    Then I send the command to the roomba to perform the following actions: N
    Then I got the response from the roomba
    And The response code is 200
    And The position now is [0, 1]
    And The total cleaned patches of dirt are 1
