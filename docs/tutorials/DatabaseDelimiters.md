---
tags:
  - Database
  - MariaDB
  - Delimiters
---

# Delimiter Overview (and a word of caution!)

The field delimiter is the character which splits data or text into separate fields. A field is a column within your database. As an example, we may have the dataset below:

| **Column_1** | **Column_2** | **Column_3**|
| --- | --- |
| 25 | Harvard Way | Boston, MA |

When we export this data to a text file, it would appear as:

`Line 1: Column_1 DELIMITER Column_2 DELIMITER Column_3`
`Line 2: 25 DELIMITER Harvard Way DELIMITER Boston, MA`

Often, the comma is used as the field delimiter. In this example, using a comma would cause Line 2 to appear to have 4 fields instead of 3!

`Line 1: Column_1,Column_2,Column_3`
`Line 2: 25,Harvard Way,Boston, MA`

| **Column_1** | **Column_2** | **Column_3**|
| --- | --- |
| 25 | Harvard Way | Boston | MA|

When exporting data, you should not use a field delimiter that may also occur within your data. Commas and tabs are common field delimiters but are likely to occur when storing text strings. Your options are to either change your field delimiter or have MariaDB enclose the data. We recommend you use the pipe character, |, as your field delimiter. Otherwise you may have MariaDB enclose the data by adding **OPTIONALLY ENCLOSED BY …** as described here (https://mariadb.com/kb/en/mariadb/select-into-outfile/">https://mariadb.com/kb/en/mariadb/select-into-outfile/).

When importing data, you must specify the field delimiter that had been used. You should verify with the dataset author as to the field delimiter, and whether any fields were enclosed by another character. Aside from the field delimiter, you will also have to specify the line delimiter. In most cases, the line delimiter is **\n**. You may also try using **\r**.

# Using Excel with NonStandard Delimiters such as the Pipe Character

Many users will use Excel to view their data. If you decide to set the pipe character, |, as your field delimiter, then Excel will not automatically parse your data into separate columns. As an example, we can enter the above data into a text editor. 

`Line 1: Column_1|Column_2|Column_3`
`Line 2: 25|Harvard Way|Boston, MA`

![image](https://github.com/user-attachments/assets/c550f636-f2f2-4384-82cf-ece3871217c7)

Now we will open the file with Excel. As seen below, each row is within one column. To have Excel parse the data into appropriate columns, select the entire column by click on the column header **A**.

![image](https://github.com/user-attachments/assets/c36c45c2-e33d-41fa-b1e7-6bde552aa559)

Within the **DATA** tab at the top, click on **Text to Columns**

![image](https://github.com/user-attachments/assets/035d8663-161e-43fc-b42f-646a3c307f07)

In the new window, **Convert Text to Columns Wizard**, on **Step 1** you should select **Delimited**. Next, on **Step 2**, you would select only **Other** and enter the pipe character, |, into the accompanying box.

![image](https://github.com/user-attachments/assets/fb9eeaf0-f9e4-4e3d-ac44-4a4fbcce72fe)

Once you are complete the remaining step of the **Convert Text to Columns Wizard**, you should find your data separated into appropriate columns.

![image](https://github.com/user-attachments/assets/698161f1-e196-4a5c-a7b9-7c4b21960999)
