Feature: T Reduction

  For a GL String, find the T reduced version

  Scenario Outline: T Reduction

    Given the allele as <Allele>
    When reducing on the <Level> level with ping
    Then the reduced allele is found to be <Redux Allele>

    Examples:
      | Allele                                                | Level | Redux Allele        |
      | HLA-A*24:02:01:01/HLA-A*24:02:01:15/HLA-A*24:02:01:16 | T     | HLA-A*24:02:01:01T  |
      | HLA-A*24:02:01:01/HLA-A*24:02:01:15/HLA-A*24:02:01:17Q | T     | HLA-A*24:02:01:01T/HLA-A*24:02:01:17Q  |
      | HLA-B*39:01:03:01/HLA-B*39:01:03:02                   | T     | HLA-B*39:01:03:01T  |
      | HLA-B*39:01:03:01                                     | T     | HLA-B*39:01:03:01T  |
      | HLA-B*39:01:03:02                                     | T     | HLA-B*39:01:03:01T  |
