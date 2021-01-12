# Bank Tech Test

[How to run](#How-to-run) | [Running Tests](#Running-Tests) | [Approach](#Approach) | [Code Structure](#Code-Structure) | [Visuals](#Visuals)  [Acceptance Criteria](#Acceptance-Criteria)

### How to run
First, clone this repository. Then:

```bash
> bundle install
> irb
> require './lib/account.rb'
```

### Running Tests
from root folder, run the following command
```bash
$ rspec 
```
### Approach
I approached this tech test by first creating user stories, which were taken from a breakdown of the acceptance criteria. 
I then started diagramming out how I expected the programme to work. 
I visualised the methods that I felt I would require in order to meet the acceptance criteria of the program.

### Code Structure
Once I had visualised the methods that would be required I spent time thinking about the structure of the code and how many classes would be required.
I thought about how the classes would interact, always trying to keep the SRP at the forefront of my mind. 

### Visuals
[Bank Tech Test Class Diagram](https://github.com/alexleesonmill/bank-tech-test/files/5802530/Bank.Tech.Test.Diagram.pdf)

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

