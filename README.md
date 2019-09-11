# Module 4: Data Viz in R

**Part 1: Complete the "ggplot2 Themes, Figure Labelling, and Saving" tutorial** 

The tutorial file (`module-4-tutorial`) is in this repository both as a `.md` and `.html` file. The tutorial also includes optional exercises that you can complete if you want extra practice working with ggplot2 functions. 

**Part 2: Participate in `#TidyTuesday`**

This week, you'll experience `#TidyTuesday`. `#TidyTuesday` is a "weekly social data project in R" in which members of the R community come together to create data visualizations based on the dataset of the week. Each dataset is accompanied by a recently-published popular press article that provides some context as to why the data are being analyzed. A new dataset is released each Tuesday. It's fun! 

For this homework assignment, you will create **one** data visualization that adheres to the principles and guidelines presented in the video lectures and reading by Kelleher and Wagener (2011). The only exception is with regards to color - since you haven't yet learned how to manipulate the color schemes of your ggplots, you are not expected to do so in this assignment. The visualization should be from one of the **2019** `#TidyTuesday` datasets. This week's `#TidyTuesday` dataset might not be of interest to you, so feel free to dig through the archive a bit. 

Instructions for `#TidyTuesday` homework assignment:
1. Fork the [tidytuesday](https://github.com/rfordatascience/tidytuesday) repository to your account. Look through the `README.md` file to find a dataset that sounds interesting to you. Read over the accompanying article to understand which trends might be interesting to visualize.
2. Create a R Project from the forked directory. Note that you do not have to let R know that there is an upstream version of this repository since you will not be submitting a pull request. You also don't have to create a branch (unless you want to!).
3. Once you've create a R Project, go ahead and create a new subdirectory called `R` or `code` in your project directory. Remember that you can do this in the `File` pane on RStudio. 
4. Create a new script and save it to the subdirectory you just created (named `R` or `code`). In the code header, include a brief description of the dataset you are analyzing (be sure to include the name of the dataset as specified on the `tidytuesday` repository `README.md` file).
5. In your script, write the code you need to visualize your data using ggplot. Be sure to keep your code organized and interpretable by using code sections and comments. Only include code for **one** data visualization. Your visualization should include axis labels with units (if applicable), as well as a theme (from either `ggplot2` or `ggthemes`).
6. Save your ggplot using `ggsave()`. 
7. Commit and push your repository changes to GitHub. Note that, this time, after you commit your changes, you can push the changes to your remote repository using buttons in RStudio: in the `Git` pane, click the `Push` button. 
8. Submit the PDF of your visualization to the Module 4 Discussion Forum. In your Discussion Forum post, include the following:
    - A link to your forked `Module-4` GitHub repository, which should include your code if you've completed step 7 correctly.
    - A brief (3-5 sentence) description of any trends you uncovered in your visualization.
9. **Extra credit**: Post your data visualization to Twitter. In the accompanying tweet, describe what you've plotted and include the hashtags `#TidyTuesday` and `#rstats`. Please tag me in the photo so I see your post. My username is [@NatalieGNelson](https://twitter.com/NatalieGNelson).

Assignment rubric:
- 1 point: `tidytuesday` repository forked to GitHub account
- 2 points: R script is organized and includes description of the selected dataset
- 5 points: visualization was created using ggplot, includes axis labels with units (if applicable), and follows the guidelines proposed in the module 4 material
- 2 points: R script for creating your data visualization was pushed to your remote GitHub repo, and is located in a subdirectory called `R` or `code`
- 1 point extra credit: post your #TidyTuesday plot to Twitter
