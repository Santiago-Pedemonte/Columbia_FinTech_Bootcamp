# Unit 2 | Homework Assignment: Automate Your Day Job with Python

## Background
In this homework assignment, we completed two Python activities, PyBank and PyRamen. 

## PyBank

![Revenue](images/revenue-per-lead.jpg)

In this activity, you are tasked with creating a Python script for analyzing the financial records of your company. You will be provided with a financial dataset in this file: [budget_data.csv](PyBank/Resources/budget_data.csv). This dataset is composed of two columns, Date and Profit/Losses. (Thankfully, your company has rather lax standards for accounting, so the records are simple.)

Your task is to create a Python script that analyzes the records to calculate each of the following:

* The total number of months included in the dataset.

* The net total amount of Profit/Losses over the entire period.

* The average of the changes in Profit/Losses over the entire period.

* The greatest increase in profits (date and amount) over the entire period.

* The greatest decrease in losses (date and amount) over the entire period.

Your resulting analysis should look similar to the following:

  ```text
  Financial Analysis
  ----------------------------
  Total Months: 86
  Total: $38382578
  Average  Change: $-2315.12
  Greatest Increase in Profits: Feb-2012 ($1926159)
  Greatest Decrease in Profits: Sep-2013 ($-2196167)
  ```

Your final script should print the analysis to the terminal and export a text file with the results.


## PyRamen (Optional)

![ramen.jpg](images/ramen.jpg)

Welcome to Ichiban Ramen!

Opening a ramen shop has always been your dream, and now it's finally been realized––you're closing out on your second year of sales! Like last year, you need to analyze your business's financial performance by cross-referencing your sales data with your internal menu data to figure out revenues and costs for the year.

This year, you also want to analyze how well your business did on a per-product basis (as you have several choices of ramen) in order to better understand which products are doing well, which are doing poorly, and, ultimately, which products may need to be removed or changed.

You tried doing this type of per-product analysis last year in Excel, but you were not able to keep your reports up-to-date with your current sales data. Therefore, you need to innovate. With more customers and more data to process, you'll need a tool that will allow you to automate your calculations in a manner that scales with your business.

Enter Python! Python provides a wide range of capabilities for handling data, harnessing the power of low-level Python data structures and high-level development libraries, all the while supporting the automation and scalability needs for a growing enterprise.

## Packages used:
-Pandas

-requests

-IO
