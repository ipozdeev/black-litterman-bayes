# introduction

The Black-Litterman (BL) asset allocation model is pretty amazing. It consists of three brilliant ideas, whose interplay is a brilliant idea on its own. It is (1) a Bayesian econometrics model (2) with a very smart choice of the prior and the data, and (3) an asset allocation model. Neither of the ideas feels out of place, and neither was introduced just for the sake of it.

In this project, I would like to visualize the Bayesian dimension of Black-Litterman that was pointed out (among others) by [Kolm and Ritter (2017)](https://cims.nyu.edu/~ritter/kolm2017bayesian.pdf). I will use a library for Bayesian inference &ndash; `Turing.jl` &ndash; to numerically solve the example in [He and Litterman (1999)](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=334304), and, of course, will arrive at the same values as in the closed-form solution derived by the original inventors.

# usage
## VS Code
Install julia 1.10, the easiest with `juliaup`:

```
juliaup add 1.10
```

Change the Julia executable in the Workspace settings of VS Code to `julia +1.10`. Run the notebook in the editor, making sure the kernel is shown as 'Julia 1.10 channel'.

## jupyter
TBD

## docker
TBD