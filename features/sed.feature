Feature:
    Write number before each line

Background:
Given a file named "numbered_lines.sed" with:
"""
#!/bin/sed
=       # print line number
p       # print pattern space 
""" 
And a file named "lines.txt" with:
"""
First
Second
Third
"""
Scenario: Text file should have some content
When I run "cat lines.txt"
Then I should see:
"""
First
Second
Third
"""

Scenario: Produce numbered output 
When I run "cat lines.txt | sed -n -f numbered_lines.sed"
Then I should see:
"""
1
First
2
Second
3
Third
"""
