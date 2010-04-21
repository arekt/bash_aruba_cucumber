Feature:
    Display Hello on the screen

Background:
    Given I'm in "/tmp"
    And a file named "hello.bash" with:
"""
#!/bin/bash
NAME="World"
[ $1 != '' ] && NAME=$1
echo "Hello ${NAME}"
echo "Error: Access violation!!!" > /dev/stderr 
exit 1
"""

Scenario: Run without parameters give Hello World in the output
    When I run "bash hello.bash"
    Then I should see:
"""
Hello World
"""
    And the stdout should not contain "Arek"

Scenario: Run with "Arek" as a first parameter give Hello Arek in the output
    When I run "bash hello.bash Arek"
    Then I should see:
"""
Hello Arek
"""

    And it should fail with:
"""
Error: Access violation
"""
    And the exit status should be 1
