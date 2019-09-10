Module 4 Tutorial: ggplot2 Themes, Figure Labelling, and Saving
================
Natalie Nelson, PhD

### 1\. Overview

In this brief tutorial, learn how to apply themes to your ggplot
graphics, add axis labels, and use the `ggsave()` function to save your
visualizations. To start, go ahead and install the `ggthemes` package by
running the following code: `install.packages("ggthemes")`. Then, load
the `tidyverse` and `ggthemes` to your work space. `ggplot2` is included
in the
    `tidyverse`.

``` r
library(tidyverse)
```

    ## ── Attaching packages ──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────── tidyverse 1.2.1 ──

    ## ✔ ggplot2 3.2.1     ✔ purrr   0.3.2
    ## ✔ tibble  2.1.3     ✔ dplyr   0.8.3
    ## ✔ tidyr   0.8.3     ✔ stringr 1.4.0
    ## ✔ readr   1.3.1     ✔ forcats 0.4.0

    ## ── Conflicts ─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()

``` r
library(ggthemes)
```

### 2\. Themes

Themes are used to customize your plots by changing the visual
appearance of various elements of the plot - from the font size/type, to
the graph boundary and color schema. `ggplot2` comes with some
“pre-packaged” themes that are handy to use. There are additional
themes in the `ggthemes` package. We will review both.

#### 2.1. Complete themes in `ggplot2`: `theme_bw()`, `theme_minimal()`

To apply a theme and change the appearance of a plot, you simply add a
[theme function](https://ggplot2.tidyverse.org/reference/ggtheme.html).
You should add the theme near the bottom of your ggplot code. Remember,
ggplot codes work as a system of layers: each line of code adds an
additional layer to the **top** of the plot. By adding the theme near,
or at, the bottom of your ggplot code, you are ensuring that the theme
is applied to your entire plot. If you add the theme near the start of
your ggplot code block, you may inadvertently override certain aspects
of the theme when you add additional functions.

To play with themes, we will once again work with the `iris` data. Let’s
first create a scatterplot with `Sepal.Length` on the x-axis and
`Petal.Length` on the y-axis, with the points varying in color as a
function of `Species`.

``` r
# Load the iris data
data(iris)

# Quickly inspect the contents
head(iris)
```

    ##   Sepal.Length Sepal.Width Petal.Length Petal.Width Species
    ## 1          5.1         3.5          1.4         0.2  setosa
    ## 2          4.9         3.0          1.4         0.2  setosa
    ## 3          4.7         3.2          1.3         0.2  setosa
    ## 4          4.6         3.1          1.5         0.2  setosa
    ## 5          5.0         3.6          1.4         0.2  setosa
    ## 6          5.4         3.9          1.7         0.4  setosa

``` r
str(iris)
```

    ## 'data.frame':    150 obs. of  5 variables:
    ##  $ Sepal.Length: num  5.1 4.9 4.7 4.6 5 5.4 4.6 5 4.4 4.9 ...
    ##  $ Sepal.Width : num  3.5 3 3.2 3.1 3.6 3.9 3.4 3.4 2.9 3.1 ...
    ##  $ Petal.Length: num  1.4 1.4 1.3 1.5 1.4 1.7 1.4 1.5 1.4 1.5 ...
    ##  $ Petal.Width : num  0.2 0.2 0.2 0.2 0.2 0.4 0.3 0.2 0.2 0.1 ...
    ##  $ Species     : Factor w/ 3 levels "setosa","versicolor",..: 1 1 1 1 1 1 1 1 1 1 ...

``` r
# Create the scatterplot
ggplot() +
  geom_point(data = iris, mapping = aes(x = Sepal.Length, y = Petal.Length, color = Species))
```

![](ggplot2-extras_files/figure-gfm/unnamed-chunk-2-1.png)<!-- -->

Now, to add a theme, we would simply add a theme function to the end of
our ggplot code block. The theme functions include: `theme_grey()`,
`theme_gray()`, `theme_bw()`, `theme_linedraw()`, `theme_light()`,
`theme_dark()`, `theme_minimal()`, `theme_classic()`, `theme_void()`,
`theme_test()`. They all have a slightly different look - go ahead and
play around with different options. I personally often use `theme_bw()`
and `theme_minimal()`.

``` r
# Add a theme
ggplot() +
  geom_point(data = iris, mapping = aes(x = Sepal.Length, y = Petal.Length, color = Species)) +
  theme_bw()
```

![](ggplot2-extras_files/figure-gfm/unnamed-chunk-3-1.png)<!-- -->

#### 2.2. Complete themes in `ggthemes`: `theme_few()`, `theme_base()`, `theme_tufte()`

The `ggthemes` package includes several theme functions that behave in
the exact same way as the built-in `ggplot2` themes. To see the theme
options, [browse this
webpage](https://mran.microsoft.com/snapshot/2016-12-03/web/packages/ggthemes/vignettes/ggthemes.html).
Some are a bit silly, but there are two in particular that are very
useful: `theme_few()` and `theme_base()`. `theme_base()` increases the
font size of all text in the plot. When I’m creating a figure that I
need to use in a presentation, I often use `theme_base()` since the plot
will be easier to read on a screen thanks to the larger font size.
`theme_few()` incorporates elements of effective data visualization
proposed by Stephen Few, who is a resepcted leader in the data
visualization community. `theme_few()` is a nice go-to for creating
easy-to-read plots destined for reports and publications. There’s also
`theme_tufte()`, which applies a minimalist style à la Edward Tufte.

``` r
# Add a ggtheme
ggplot() +
  geom_point(data = iris, mapping = aes(x = Sepal.Length, y = Petal.Length, color = Species)) +
  theme_few()
```

![](ggplot2-extras_files/figure-gfm/unnamed-chunk-4-1.png)<!-- -->

### 3\. Figure labelling

#### 3.1. Changing axis labels: `labs()`, `xlab()`, `ylab()`

When you create a ggplot, the axis labels will automatically be assigned
to the column names you used in your `mapping` argument, or a default
used by a particular `geom` (e.g., `freq` is the default y-axis label
for a histogram). To change the labels, you have two options: use
`labs()`, or `xlab()`/`ylab()`. `labs()` is an abbreviation for
**labels**, and it can be used to modify several labels in your plot. To
use `labs()` to modify x- and y-axis labels, you supply arguments for
`x` and `y`. In contrast, `xlab()` and `ylab()` will specifically change
the names of the x- and y-axes, respectively, and you change the name by
including your desired axis label in quotations within the parentheses
(e.g., `xlab("x-axis label")`). Examples provided below.

``` r
# Modify x and y axis labels using labs()
ggplot() +
  geom_point(data = iris, mapping = aes(x = Sepal.Length, y = Petal.Length, color = Species)) +
  theme_few() +
  labs(x = "Sepal length (cm)", y = "Petal length (cm)")
```

![](ggplot2-extras_files/figure-gfm/unnamed-chunk-5-1.png)<!-- -->

``` r
# Modify x and y axis labels using xlab() and ylab()
ggplot() +
  geom_point(data = iris, mapping = aes(x = Sepal.Length, y = Petal.Length, color = Species)) +
  theme_few() +
  xlab("Sepal length (cm)") + 
  ylab("Petal length (cm)")
```

![](ggplot2-extras_files/figure-gfm/unnamed-chunk-5-2.png)<!-- -->

#### 3.2. Changing the legend title: `labs()`

You can also use `labs()` to change the title of your legend. In this
case, the argument you provide to `labs()` will depend on the *type* of
legend you have. If the legend is corresponding to a change in `color`,
you would use `color` as the argument to `labs()`. If the legend is
corresponding to a `fill`, you would use `fill` as the argument to
`labs()`.

``` r
# Change color legend title
ggplot() +
  geom_point(data = iris, mapping = aes(x = Sepal.Length, y = Petal.Length, color = Species)) +
  theme_few() +
  labs(x = "Sepal length (cm)", y = "Petal length (cm)", color = "Iris species")
```

![](ggplot2-extras_files/figure-gfm/unnamed-chunk-6-1.png)<!-- -->

#### 3.3. Adding a plot title: `labs()`, `ggtitle()`

To add a title to a plot, you can once again `labs()`. To use `labs()`,
specify an argument for `title`. Alternatively, you can use the
`ggtitle()` function. `ggtitle()` is used to add a title to a plot by
simply placing the desired title in quotation marks between the
parentheses, e.g. `ggtitle("My title")`.

``` r
# Add a plot title using labs()
ggplot() +
  geom_point(data = iris, mapping = aes(x = Sepal.Length, y = Petal.Length, color = Species)) +
  theme_few() +
  labs(x = "Sepal length (cm)", y = "Petal length (cm)", color = "Iris species", title = "Petal length vs. sepal length by species")
```

![](ggplot2-extras_files/figure-gfm/unnamed-chunk-7-1.png)<!-- -->

``` r
# Add a plot title using ggtitle()
ggplot() +
  geom_point(data = iris, mapping = aes(x = Sepal.Length, y = Petal.Length, color = Species)) +
  theme_few() +
  labs(x = "Sepal length (cm)", y = "Petal length (cm)", color = "Iris species") +
  ggtitle("Petal length vs. sepal length by species")
```

![](ggplot2-extras_files/figure-gfm/unnamed-chunk-7-2.png)<!-- -->

#### 3.4. Adding a subtitle and caption: `labs()`

The versatile `labs()` function can also be used to specify a `subtitle`
(written in a smaller font size than the title, located directly under
the title), as well as a `caption` (written in small font, located at
the bottom-right of the plot).

``` r
# Add a plot subtitle and caption using labs()
ggplot() +
  geom_point(data = iris, mapping = aes(x = Sepal.Length, y = Petal.Length, color = Species)) +
  theme_few() +
  labs(x = "Sepal length (cm)", y = "Petal length (cm)", color = "Iris species", # Note that I hit enter/return here to help with readability
       title = "Petal length vs. sepal length by species", subtitle = "Iris setosa displays a weak petal-sepal length relationship", 
       caption = "Data source: R.A. Fisher")
```

![](ggplot2-extras_files/figure-gfm/unnamed-chunk-8-1.png)<!-- -->

#### 3.5. Removing a label

If you ever want to remove a label or title from a ggplot, you can set
the corresponding argument to empty quotation marks `""` or `NULL`.

``` r
# Remove a label with empty quotes
ggplot() +
  geom_point(data = iris, mapping = aes(x = Sepal.Length, y = Petal.Length, color = Species)) +
  theme_few() +
  labs(x = "Sepal length (cm)", y = "")
```

![](ggplot2-extras_files/figure-gfm/unnamed-chunk-9-1.png)<!-- -->

``` r
# Remove a label with NULL
ggplot() +
  geom_point(data = iris, mapping = aes(x = Sepal.Length, y = Petal.Length, color = Species)) +
  theme_few() +
  xlab(NULL) +
  ylab("")
```

![](ggplot2-extras_files/figure-gfm/unnamed-chunk-9-2.png)<!-- -->

### 4\. Save a ggplot: `ggsave()`

To save a ggplot, you can use the
[`ggsave()`](https://ggplot2.tidyverse.org/reference/ggsave.html)
function. `ggsave()` will save the last plot you created, which usually
corresponds to the plot displayed in your `Plots` tab. To use
`ggsave()`, you should specify the **relative path** of the file to be
written, including the file name with file extension. You can also
specify the dimensions of the plot you save by providing the `width`,
`height`, and `units` arguments. `units` can be set equal to `"in"`,
`"cm"`, or `"mm"`, and indicates the type of measurement unit you have
specified for `width` and `height`. For example, if we were to run
`ggsave("output/my_plot.pdf", width = 4, height = 4, units = "in")`, R
would save a 4 inch by 4 inch plot to the outputs folder, and the file
would be named `my_plot.pdf`. Let’s give it a
try.

``` r
ggsave("petal_length_vs_sepal_length.pdf", width = 5, height = 4, units = "in")
# Play with the size
ggsave("petal_length_vs_sepal_length.pdf", width = 10, height = 8, units = "in")
```

You can also save a plot without code. In the `Plots` tab, you will see
a button that says `Export`. You can click this button and choose to
export the plot as a PDF or image (e.g. PNG, JPG). I recommend saving
plots as PDFs to ensure the quality matches that of the plot displayed
in the `Plots` tab.

### 5\. Optional exercises

Happy coding\!

  - Exercise 1:
    [Complete 1-4](https://datacarpentry.org/semester-biology/exercises/Graphing-mass-vs-metabolism-R/).

  - Exercise 2 (challenging):
    [Complete 1-4](https://datacarpentry.org/semester-biology/exercises/Graphing-sexual-dimorphism-exploration-R/).

### Attribution and license

Exercises in this tutorial are directly from [Data Carpentry for
Biologists](https://datacarpentry.org/semester-biology/) by Ethan White
and Zachary Brym. Used under [CC
BY 4.0](https://creativecommons.org/licenses/by/4.0/). Material
presented in this tutorial is not endorsed by the licensor.
