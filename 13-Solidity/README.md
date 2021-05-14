# Basic Solidity Contracts

## Contracts:

-**Level One** is an `AssociateProfitSplitter` contract. This will accept Ether into the contract and divide the Ether evenly among the associate level employees. This will allow the Human Resources department to pay employees quickly and efficiently.

-**Level Two** is a `TieredProfitSplitter` that will distribute different percentages of incoming Ether to employees at different tiers/levels. For example, the CEO gets paid 60%, CTO 25%, and Bob gets 15%.

-**Level Three** is a `DeferredEquityPlan` that models traditional company stock plans. This contract will automatically manage 1000 shares with an annual distribution of 250 over 4 years for a single employee.

### The `AssociateProfitSplitter` Contract

The contract works for 3 employees and will evenly split any ethereum sent to it between them. These variables are set to `public` and are determined at initialization in the `constructor` function.

Functions:

* `balance` -- This function is set to `public view returns(uint)`, and returns the contract's current balance. It should always return `0` because all of the ether sent to the contract will be distributed among the employees. 

* `deposit` -- This function is set to `public payable`, only the owner can call the function:

    * We may have 1 or 2 wei leftover, this'll be sent back to `msg.sender`. 

* Fallback function has been added.

### The `TieredProfitSplitter` Contract

In this contract, rather than splitting the profits between Associate-level employees, we calculate rudimentary percentages for different tiers of employees (CEO, CTO, and Bob).

* The `CEO` (a.k.a. employee_one) gets 60%, the `CFO` (a.k.a. employee_two) gets 25%, and `bob` (a.k.a. employee_three) gets 15%.
* Any remainder is sent to the `CEO` so balance should also return `0`.

### The `DeferredEquityPlan` Contract

In this contract, we manage an employee's "deferred equity incentive plan" in which 1000 shares will be distributed over 4 years to the employee. There is no Ether involved, but it stores and sets amounts that represent the number of distributed shares the employee owns- enforcing the vesting periods automatically.

* **A two-minute primer on deferred equity incentive plans:** In this set-up, employees receive shares for joining and staying with the firm. They may receive, for example, an award of 1,000 shares when joining, but with a 4 year vesting period for these shares. This means that these shares would stay with the company, with only 250 shares (1,000/4) actually distributed to and owned by the employee each year. If the employee leaves within the first 4 years, he or she would forfeit ownership of any remaining (“unvested”) shares.

* `distribute`:

  * This function requires that the vesting period has passed.

  * The final `if` statement checks that if the employee does not cash out until 5+ years after the contract start, the contract does not reward more than the `total_shares` agreed upon in the contract.

* `distributed_shares` keeps track of the employee's shares ytd.

## Resources

For some succinct and straightforward code snips, check out [Solidity By Example](https://github.com/raineorshine/solidity-by-example)

For a more extensive list of Solidity resources, checkout [Awesome Solidity](https://github.com/bkrem/awesome-solidity)

Another tutorial is available at [EthereumDev.io](https://ethereumdev.io/)

If you enjoy building games, here's an excellent tutorial called [CryptoZombies](https://cryptozombies.io/)
