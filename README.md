# 75 Days DSA challenge

## Introduction

75 days challenge is an in-club initiative by CodeChef ABESEC Chapter to
increase the consistency and build a community within the club.

To get started with the 75 Days DSA Challenge using this template,
follow these steps:

1. Create your Repository: Click the "Use Template" button at the top right of
   this repository to create your own copy.

2. Clone the Repository: Clone your forked repository to your local machine
   using the following command:

   `git clone https://github.com/<your-username>/Daily75.git`

3. Create a New Branch: Create a new branch for your challenge journey.

   `git checkout -b day1`

4. Form directory structure of the Repository: Use the `make.sh` script to form directory structure

   | Action                              | Command                      | Example               |
   | ----------------------------------- | ---------------------------- | --------------------- |
   | To create a day folder              | `./make.sh form <day/all>`   | `./make.sh form 10`   |
   | To clean a day folder               | `./make.sh clean <day/>all>` | `./make.sh clean 5`   |
   | To create all directories (1 to 75) | `./make.sh form <day/all>`   | `./make.sh form all`  |
   | To clean all directories (1 to 75)  | `./make.sh clean <day/all>`  | `./make.sh clean all` |

    <table border="1">
        <tr>
            <td><b>Note:</b> This Bash script, make.sh, is intended for Unix-based systems like Linux and macOS. To use it on Windows, you'll need to install a Bash environment, such as Windows Subsystem for Linux (WSL) or Git Bash. Once installed, follow the README for instructions.</td>
        </tr>
    </table>

5. Solving Problems: Use this template to write your code for solving DSA
   problems. You can use any programming language of your choice. Organize your code in a
   structured manner within the appropriate folders.

6. Problem Descriptions: Add problem descriptions, links, or any additional
   information about the problem you are solving in `SUMMARY.md` or as comments
   in your code.

7. Commit and Push: After solving a problem, commit your changes and push them to your forked repository.

   ```bash
   git add .
   git commit -m "Solved problem for Day 1"
   git push origin day1
   ```

8. Once you are done with you task, merge the branch onto you main branch of you repository

9. Repeat: Repeat the process for each day of the challenge, creating a new branch for each day and solving DSA problems.

## Structure of the Repository

This template repository is structured to help you organize your DSA challenge
journey efficiently. The main directories and files you'll find in this
repository include:

1. day_01/, day_02/, ..., day_75/: Each day has its own folder where you can
   place the code for the problems you solve on that specific day.

2. `SUMMARY.md`: You can update this main readme file with your progress,
   notes, and any additional information you'd like to share with others about your solution.

3. `.gitignore`: A standard .gitignore file to exclude unnecessary files
   and folders from version control.

## Rules and Guidelines

To make the most of this challenge and your journey:

1. Solve at least one DSA problem every day.
2. Document your solutions and problem descriptions.
3. Commit and push your code regularly to track your progress.
4. Feel free to collaborate and learn from others who are taking the challenge.
5. Stay consistent, and remember that the key to success is daily practice.

## Conclusion

The 75 Days DSA Challenge Template provides you with a structured and
organized way to enhance your DSA skills. By following this template,
you can track your progress, document your solutions, and collaborate
with others who are on the same journey. Happy coding and best of luck with
your DSA challenge!
