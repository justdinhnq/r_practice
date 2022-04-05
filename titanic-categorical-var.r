{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "e64053bc",
   "metadata": {
    "_execution_state": "idle",
    "_kg_hide-output": true,
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "execution": {
     "iopub.execute_input": "2022-04-05T10:56:39.594811Z",
     "iopub.status.busy": "2022-04-05T10:56:39.591674Z",
     "iopub.status.idle": "2022-04-05T10:56:41.215787Z",
     "shell.execute_reply": "2022-04-05T10:56:41.213278Z"
    },
    "papermill": {
     "duration": 1.719898,
     "end_time": "2022-04-05T10:56:41.216033",
     "exception": false,
     "start_time": "2022-04-05T10:56:39.496135",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "── \u001b[1mAttaching packages\u001b[22m ─────────────────────────────────────── tidyverse 1.3.1 ──\n",
      "\n",
      "\u001b[32m✔\u001b[39m \u001b[34mggplot2\u001b[39m 3.3.5     \u001b[32m✔\u001b[39m \u001b[34mpurrr  \u001b[39m 0.3.4\n",
      "\u001b[32m✔\u001b[39m \u001b[34mtibble \u001b[39m 3.1.5     \u001b[32m✔\u001b[39m \u001b[34mdplyr  \u001b[39m 1.0.7\n",
      "\u001b[32m✔\u001b[39m \u001b[34mtidyr  \u001b[39m 1.1.4     \u001b[32m✔\u001b[39m \u001b[34mstringr\u001b[39m 1.4.0\n",
      "\u001b[32m✔\u001b[39m \u001b[34mreadr  \u001b[39m 2.0.2     \u001b[32m✔\u001b[39m \u001b[34mforcats\u001b[39m 0.5.1\n",
      "\n",
      "── \u001b[1mConflicts\u001b[22m ────────────────────────────────────────── tidyverse_conflicts() ──\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfilter()\u001b[39m masks \u001b[34mstats\u001b[39m::filter()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlag()\u001b[39m    masks \u001b[34mstats\u001b[39m::lag()\n",
      "\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "'titanic'"
      ],
      "text/latex": [
       "'titanic'"
      ],
      "text/markdown": [
       "'titanic'"
      ],
      "text/plain": [
       "[1] \"titanic\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "library(tidyverse) # metapackage of all tidyverse packages\n",
    "\n",
    "list.files(path = \"../input\")\n",
    "\n",
    "# data source: https://www.kaggle.com/competitions/titanic/data?select=train.csv\n",
    "# ref: https://medium.com/@conankoh/interpreting-results-from-logistic-regression-in-r-using-titanic-dataset-bb9f9a1f644c"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "86a293ef",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-05T10:56:41.446665Z",
     "iopub.status.busy": "2022-04-05T10:56:41.408435Z",
     "iopub.status.idle": "2022-04-05T10:56:41.507873Z",
     "shell.execute_reply": "2022-04-05T10:56:41.505635Z"
    },
    "papermill": {
     "duration": 0.198431,
     "end_time": "2022-04-05T10:56:41.508077",
     "exception": false,
     "start_time": "2022-04-05T10:56:41.309646",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "'data.frame':\t891 obs. of  12 variables:\n",
      " $ PassengerId: int  1 2 3 4 5 6 7 8 9 10 ...\n",
      " $ Survived   : int  0 1 1 1 0 0 0 0 1 1 ...\n",
      " $ Pclass     : int  3 1 3 1 3 3 1 3 3 2 ...\n",
      " $ Name       : chr  \"Braund, Mr. Owen Harris\" \"Cumings, Mrs. John Bradley (Florence Briggs Thayer)\" \"Heikkinen, Miss. Laina\" \"Futrelle, Mrs. Jacques Heath (Lily May Peel)\" ...\n",
      " $ Sex        : chr  \"male\" \"female\" \"female\" \"female\" ...\n",
      " $ Age        : num  22 38 26 35 35 NA 54 2 27 14 ...\n",
      " $ SibSp      : int  1 1 0 1 0 0 0 3 0 1 ...\n",
      " $ Parch      : int  0 0 0 0 0 0 0 1 2 0 ...\n",
      " $ Ticket     : chr  \"A/5 21171\" \"PC 17599\" \"STON/O2. 3101282\" \"113803\" ...\n",
      " $ Fare       : num  7.25 71.28 7.92 53.1 8.05 ...\n",
      " $ Cabin      : chr  \"\" \"C85\" \"\" \"C123\" ...\n",
      " $ Embarked   : chr  \"S\" \"C\" \"S\" \"S\" ...\n"
     ]
    }
   ],
   "source": [
    "titanic <- read.csv(\"../input/titanic/train.csv\")\n",
    "\n",
    "str(titanic)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "86a17a37",
   "metadata": {
    "papermill": {
     "duration": 0.093958,
     "end_time": "2022-04-05T10:56:41.697795",
     "exception": false,
     "start_time": "2022-04-05T10:56:41.603837",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Notice Board: for simplicity, this report did not do data wrangling and only focus on interpretation !!!!"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "883ebc0b",
   "metadata": {
    "papermill": {
     "duration": 0.092466,
     "end_time": "2022-04-05T10:56:41.889997",
     "exception": false,
     "start_time": "2022-04-05T10:56:41.797531",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Problem: which predictors do affect the survival status of passengers?"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "b2198b06",
   "metadata": {
    "papermill": {
     "duration": 0.092127,
     "end_time": "2022-04-05T10:56:42.075526",
     "exception": false,
     "start_time": "2022-04-05T10:56:41.983399",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "1. Univariate analysis with a categorical predictor\n",
    "2. Univariate analysis with a continuous predictor\n",
    "3. Multivariable logistic regression"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "b870d93f",
   "metadata": {
    "papermill": {
     "duration": 0.09569,
     "end_time": "2022-04-05T10:56:42.263270",
     "exception": false,
     "start_time": "2022-04-05T10:56:42.167580",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "#### 1. Univariate analysis with a categorical predictor"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "a22ed8a6",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-05T10:56:42.451896Z",
     "iopub.status.busy": "2022-04-05T10:56:42.449482Z",
     "iopub.status.idle": "2022-04-05T10:56:42.510150Z",
     "shell.execute_reply": "2022-04-05T10:56:42.507733Z"
    },
    "papermill": {
     "duration": 0.157746,
     "end_time": "2022-04-05T10:56:42.510370",
     "exception": false,
     "start_time": "2022-04-05T10:56:42.352624",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A matrix: 2 × 4 of type dbl</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>Estimate</th><th scope=col>Std. Error</th><th scope=col>z value</th><th scope=col>Pr(&gt;|z|)</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>(Intercept)</th><td> 1.056589</td><td>0.1289864</td><td>  8.191477</td><td>2.580394e-16</td></tr>\n",
       "\t<tr><th scope=row>Sexmale</th><td>-2.513710</td><td>0.1671782</td><td>-15.036107</td><td>4.258662e-51</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A matrix: 2 × 4 of type dbl\n",
       "\\begin{tabular}{r|llll}\n",
       "  & Estimate & Std. Error & z value & Pr(>\\textbar{}z\\textbar{})\\\\\n",
       "\\hline\n",
       "\t(Intercept) &  1.056589 & 0.1289864 &   8.191477 & 2.580394e-16\\\\\n",
       "\tSexmale & -2.513710 & 0.1671782 & -15.036107 & 4.258662e-51\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A matrix: 2 × 4 of type dbl\n",
       "\n",
       "| <!--/--> | Estimate | Std. Error | z value | Pr(&gt;|z|) |\n",
       "|---|---|---|---|---|\n",
       "| (Intercept) |  1.056589 | 0.1289864 |   8.191477 | 2.580394e-16 |\n",
       "| Sexmale | -2.513710 | 0.1671782 | -15.036107 | 4.258662e-51 |\n",
       "\n"
      ],
      "text/plain": [
       "            Estimate  Std. Error z value    Pr(>|z|)    \n",
       "(Intercept)  1.056589 0.1289864    8.191477 2.580394e-16\n",
       "Sexmale     -2.513710 0.1671782  -15.036107 4.258662e-51"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "model  <- glm(Survived ~ Sex, data = titanic, family = binomial)\n",
    "summary(model)$coef"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "761e0bc2",
   "metadata": {
    "papermill": {
     "duration": 0.092575,
     "end_time": "2022-04-05T10:56:42.695812",
     "exception": false,
     "start_time": "2022-04-05T10:56:42.603237",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**Interpretation of the model:** Sex is a significant predictor to Survival Status (p < 0.05)\n",
    "\n",
    "However, instead of the log-transformed coefficient, we would have the odds ratio and 95% confidence interval. Hence, we implemented the following code to exponentiate the coefficent: "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "b5402496",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-05T10:56:42.889399Z",
     "iopub.status.busy": "2022-04-05T10:56:42.886777Z",
     "iopub.status.idle": "2022-04-05T10:56:43.018056Z",
     "shell.execute_reply": "2022-04-05T10:56:43.015848Z"
    },
    "papermill": {
     "duration": 0.229437,
     "end_time": "2022-04-05T10:56:43.018363",
     "exception": false,
     "start_time": "2022-04-05T10:56:42.788926",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".dl-inline {width: auto; margin:0; padding: 0}\n",
       ".dl-inline>dt, .dl-inline>dd {float: none; width: auto; display: inline-block}\n",
       ".dl-inline>dt::after {content: \":\\0020\"; padding-right: .5ex}\n",
       ".dl-inline>dt:not(:first-of-type) {padding-left: .5ex}\n",
       "</style><dl class=dl-inline><dt>(Intercept)</dt><dd>2.8765432098679</dd><dt>Sexmale</dt><dd>0.0809673159461025</dd></dl>\n"
      ],
      "text/latex": [
       "\\begin{description*}\n",
       "\\item[(Intercept)] 2.8765432098679\n",
       "\\item[Sexmale] 0.0809673159461025\n",
       "\\end{description*}\n"
      ],
      "text/markdown": [
       "(Intercept)\n",
       ":   2.8765432098679Sexmale\n",
       ":   0.0809673159461025\n",
       "\n"
      ],
      "text/plain": [
       "(Intercept)     Sexmale \n",
       " 2.87654321  0.08096732 "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Waiting for profiling to be done...\n",
      "\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A matrix: 2 × 2 of type dbl</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>2.5 %</th><th scope=col>97.5 %</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>(Intercept)</th><td>2.24473635</td><td>3.7245050</td></tr>\n",
       "\t<tr><th scope=row>Sexmale</th><td>0.05804709</td><td>0.1118353</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A matrix: 2 × 2 of type dbl\n",
       "\\begin{tabular}{r|ll}\n",
       "  & 2.5 \\% & 97.5 \\%\\\\\n",
       "\\hline\n",
       "\t(Intercept) & 2.24473635 & 3.7245050\\\\\n",
       "\tSexmale & 0.05804709 & 0.1118353\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A matrix: 2 × 2 of type dbl\n",
       "\n",
       "| <!--/--> | 2.5 % | 97.5 % |\n",
       "|---|---|---|\n",
       "| (Intercept) | 2.24473635 | 3.7245050 |\n",
       "| Sexmale | 0.05804709 | 0.1118353 |\n",
       "\n"
      ],
      "text/plain": [
       "            2.5 %      97.5 %   \n",
       "(Intercept) 2.24473635 3.7245050\n",
       "Sexmale     0.05804709 0.1118353"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# exponentiate the coefficient of the model\n",
    "exp(coefficients(model))\n",
    "\n",
    "# exponentiate the confidence interval of 95%\n",
    "exp(confint(model))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "ecc5a9b9",
   "metadata": {
    "papermill": {
     "duration": 0.098978,
     "end_time": "2022-04-05T10:56:43.218547",
     "exception": false,
     "start_time": "2022-04-05T10:56:43.119569",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**Interpretation**: from the result, the odd ratio is 0.081 or 8.1%, with 95% CI being 0.058 and 0.112. This means that the odds of surviving for males is 91.9% (100% - 8.1%) less likely as comopared to females."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "27e5fc76",
   "metadata": {
    "papermill": {
     "duration": 0.104774,
     "end_time": "2022-04-05T10:56:43.429679",
     "exception": false,
     "start_time": "2022-04-05T10:56:43.324905",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "#### 2. Univariate analysis with a continous predictor"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "b9d32728",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-05T10:56:43.638256Z",
     "iopub.status.busy": "2022-04-05T10:56:43.635766Z",
     "iopub.status.idle": "2022-04-05T10:56:43.683256Z",
     "shell.execute_reply": "2022-04-05T10:56:43.680993Z"
    },
    "papermill": {
     "duration": 0.152327,
     "end_time": "2022-04-05T10:56:43.683492",
     "exception": false,
     "start_time": "2022-04-05T10:56:43.531165",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A matrix: 2 × 4 of type dbl</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>Estimate</th><th scope=col>Std. Error</th><th scope=col>z value</th><th scope=col>Pr(&gt;|z|)</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>(Intercept)</th><td>-0.05672364</td><td>0.17358043</td><td>-0.3267859</td><td>0.74382982</td></tr>\n",
       "\t<tr><th scope=row>Age</th><td>-0.01096345</td><td>0.00532994</td><td>-2.0569560</td><td>0.03969046</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A matrix: 2 × 4 of type dbl\n",
       "\\begin{tabular}{r|llll}\n",
       "  & Estimate & Std. Error & z value & Pr(>\\textbar{}z\\textbar{})\\\\\n",
       "\\hline\n",
       "\t(Intercept) & -0.05672364 & 0.17358043 & -0.3267859 & 0.74382982\\\\\n",
       "\tAge & -0.01096345 & 0.00532994 & -2.0569560 & 0.03969046\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A matrix: 2 × 4 of type dbl\n",
       "\n",
       "| <!--/--> | Estimate | Std. Error | z value | Pr(&gt;|z|) |\n",
       "|---|---|---|---|---|\n",
       "| (Intercept) | -0.05672364 | 0.17358043 | -0.3267859 | 0.74382982 |\n",
       "| Age | -0.01096345 | 0.00532994 | -2.0569560 | 0.03969046 |\n",
       "\n"
      ],
      "text/plain": [
       "            Estimate    Std. Error z value    Pr(>|z|)  \n",
       "(Intercept) -0.05672364 0.17358043 -0.3267859 0.74382982\n",
       "Age         -0.01096345 0.00532994 -2.0569560 0.03969046"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "model <- glm(Survived ~ Age, data = titanic, family = binomial)\n",
    "\n",
    "summary(model)$coef"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "3a480485",
   "metadata": {
    "papermill": {
     "duration": 0.104011,
     "end_time": "2022-04-05T10:56:43.891579",
     "exception": false,
     "start_time": "2022-04-05T10:56:43.787568",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**Interpretation of the model**: Age is a significant predictor to Survival Status (p = 0.0397)\n",
    "\n",
    "We implemented the following code to exponentiate the coefficient:"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "8caa4609",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-05T10:56:44.110071Z",
     "iopub.status.busy": "2022-04-05T10:56:44.107556Z",
     "iopub.status.idle": "2022-04-05T10:56:44.174784Z",
     "shell.execute_reply": "2022-04-05T10:56:44.172434Z"
    },
    "papermill": {
     "duration": 0.180885,
     "end_time": "2022-04-05T10:56:44.174979",
     "exception": false,
     "start_time": "2022-04-05T10:56:43.994094",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".dl-inline {width: auto; margin:0; padding: 0}\n",
       ".dl-inline>dt, .dl-inline>dd {float: none; width: auto; display: inline-block}\n",
       ".dl-inline>dt::after {content: \":\\0020\"; padding-right: .5ex}\n",
       ".dl-inline>dt:not(:first-of-type) {padding-left: .5ex}\n",
       "</style><dl class=dl-inline><dt>(Intercept)</dt><dd>0.944855153188964</dd><dt>Age</dt><dd>0.989096426716741</dd></dl>\n"
      ],
      "text/latex": [
       "\\begin{description*}\n",
       "\\item[(Intercept)] 0.944855153188964\n",
       "\\item[Age] 0.989096426716741\n",
       "\\end{description*}\n"
      ],
      "text/markdown": [
       "(Intercept)\n",
       ":   0.944855153188964Age\n",
       ":   0.989096426716741\n",
       "\n"
      ],
      "text/plain": [
       "(Intercept)         Age \n",
       "  0.9448552   0.9890964 "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Waiting for profiling to be done...\n",
      "\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A matrix: 2 × 2 of type dbl</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>2.5 %</th><th scope=col>97.5 %</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>(Intercept)</th><td>0.6722345</td><td>1.328528</td></tr>\n",
       "\t<tr><th scope=row>Age</th><td>0.9787246</td><td>0.999417</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A matrix: 2 × 2 of type dbl\n",
       "\\begin{tabular}{r|ll}\n",
       "  & 2.5 \\% & 97.5 \\%\\\\\n",
       "\\hline\n",
       "\t(Intercept) & 0.6722345 & 1.328528\\\\\n",
       "\tAge & 0.9787246 & 0.999417\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A matrix: 2 × 2 of type dbl\n",
       "\n",
       "| <!--/--> | 2.5 % | 97.5 % |\n",
       "|---|---|---|\n",
       "| (Intercept) | 0.6722345 | 1.328528 |\n",
       "| Age | 0.9787246 | 0.999417 |\n",
       "\n"
      ],
      "text/plain": [
       "            2.5 %     97.5 %  \n",
       "(Intercept) 0.6722345 1.328528\n",
       "Age         0.9787246 0.999417"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# exponentiate the coefficients of the model\n",
    "exp(coefficients(model))\n",
    "# exponentiate the confidence interval of the model\n",
    "exp(confint(model))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "753dc9e4",
   "metadata": {
    "papermill": {
     "duration": 0.113103,
     "end_time": "2022-04-05T10:56:44.395067",
     "exception": false,
     "start_time": "2022-04-05T10:56:44.281964",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**Interpretation:** From the result, the odd ratio is 0.989, with 95% CI being 0.979 and 0.999. This means that for every increase in 1 year of age, the odds of surviving decreases by 1.1% (100% - 98.9%)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "241cff76",
   "metadata": {
    "papermill": {
     "duration": 0.10786,
     "end_time": "2022-04-05T10:56:44.614656",
     "exception": false,
     "start_time": "2022-04-05T10:56:44.506796",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "#### 3. Multivariable logistic regression"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "441791c0",
   "metadata": {
    "papermill": {
     "duration": 0.106817,
     "end_time": "2022-04-05T10:56:44.829058",
     "exception": false,
     "start_time": "2022-04-05T10:56:44.722241",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**Forward selection method**\n",
    "\n",
    "The table below shows the result of the univariate analysis for some of the variables in the dataset. Based on the dataset, the following 4 predictors are significant (p-value < 0.05): Sex, Age, number of parents/children aboard the Titanic and Passenger fare.\n",
    "\n",
    "We wil use these variables in multivariable logistic regression.\n",
    "\n",
    "| variables_names                            | variables | coefficient | lower_95 | upper_95 | p_value |\n",
    "|--------------------------------------------|-----------|-------------|----------|----------|---------|\n",
    "| Sex                                        | Sex       |             |          |          |         |\n",
    "| Age                                        | Age       |             |          |          |         |\n",
    "| # of siblings / spouses aboard the Titanic | SibSp     |             |          |          |         |\n",
    "| # of parents / children aboard the Titanic | Parch     |             |          |          |         |\n",
    "| Passenger fare                             | Fare      |             |          |          |         |"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "8b49a1ca",
   "metadata": {
    "papermill": {
     "duration": 0.116304,
     "end_time": "2022-04-05T10:56:45.056540",
     "exception": false,
     "start_time": "2022-04-05T10:56:44.940236",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**The multivariable logistic regression model**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "5fed764a",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-05T10:56:45.297863Z",
     "iopub.status.busy": "2022-04-05T10:56:45.295467Z",
     "iopub.status.idle": "2022-04-05T10:56:45.334183Z",
     "shell.execute_reply": "2022-04-05T10:56:45.331979Z"
    },
    "papermill": {
     "duration": 0.162306,
     "end_time": "2022-04-05T10:56:45.334384",
     "exception": false,
     "start_time": "2022-04-05T10:56:45.172078",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A matrix: 5 × 4 of type dbl</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>Estimate</th><th scope=col>Std. Error</th><th scope=col>z value</th><th scope=col>Pr(&gt;|z|)</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>(Intercept)</th><td> 1.21848282</td><td>0.261805707</td><td>  4.654149</td><td>3.253212e-06</td></tr>\n",
       "\t<tr><th scope=row>Sexmale</th><td>-2.48671709</td><td>0.199948059</td><td>-12.436815</td><td>1.649503e-35</td></tr>\n",
       "\t<tr><th scope=row>Age</th><td>-0.01446547</td><td>0.006750857</td><td> -2.142761</td><td>3.213230e-02</td></tr>\n",
       "\t<tr><th scope=row>Parch</th><td>-0.32753343</td><td>0.113587530</td><td> -2.883533</td><td>3.932411e-03</td></tr>\n",
       "\t<tr><th scope=row>Fare</th><td> 0.01508130</td><td>0.002907636</td><td>  5.186793</td><td>2.139468e-07</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A matrix: 5 × 4 of type dbl\n",
       "\\begin{tabular}{r|llll}\n",
       "  & Estimate & Std. Error & z value & Pr(>\\textbar{}z\\textbar{})\\\\\n",
       "\\hline\n",
       "\t(Intercept) &  1.21848282 & 0.261805707 &   4.654149 & 3.253212e-06\\\\\n",
       "\tSexmale & -2.48671709 & 0.199948059 & -12.436815 & 1.649503e-35\\\\\n",
       "\tAge & -0.01446547 & 0.006750857 &  -2.142761 & 3.213230e-02\\\\\n",
       "\tParch & -0.32753343 & 0.113587530 &  -2.883533 & 3.932411e-03\\\\\n",
       "\tFare &  0.01508130 & 0.002907636 &   5.186793 & 2.139468e-07\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A matrix: 5 × 4 of type dbl\n",
       "\n",
       "| <!--/--> | Estimate | Std. Error | z value | Pr(&gt;|z|) |\n",
       "|---|---|---|---|---|\n",
       "| (Intercept) |  1.21848282 | 0.261805707 |   4.654149 | 3.253212e-06 |\n",
       "| Sexmale | -2.48671709 | 0.199948059 | -12.436815 | 1.649503e-35 |\n",
       "| Age | -0.01446547 | 0.006750857 |  -2.142761 | 3.213230e-02 |\n",
       "| Parch | -0.32753343 | 0.113587530 |  -2.883533 | 3.932411e-03 |\n",
       "| Fare |  0.01508130 | 0.002907636 |   5.186793 | 2.139468e-07 |\n",
       "\n"
      ],
      "text/plain": [
       "            Estimate    Std. Error  z value    Pr(>|z|)    \n",
       "(Intercept)  1.21848282 0.261805707   4.654149 3.253212e-06\n",
       "Sexmale     -2.48671709 0.199948059 -12.436815 1.649503e-35\n",
       "Age         -0.01446547 0.006750857  -2.142761 3.213230e-02\n",
       "Parch       -0.32753343 0.113587530  -2.883533 3.932411e-03\n",
       "Fare         0.01508130 0.002907636   5.186793 2.139468e-07"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "model <- glm(Survived ~ Sex + Age + Parch + Fare, data = titanic, family = binomial)\n",
    "\n",
    "summary(model)$coef"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "2c05cb8f",
   "metadata": {
    "papermill": {
     "duration": 0.111262,
     "end_time": "2022-04-05T10:56:45.560860",
     "exception": false,
     "start_time": "2022-04-05T10:56:45.449598",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**Interpretation of the model**: all predictors remain significant after adjusting for other factors.\n",
    "\n",
    "We then implemented the following code to exponentiate the coefficients:"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "7971c8be",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-05T10:56:45.796818Z",
     "iopub.status.busy": "2022-04-05T10:56:45.794586Z",
     "iopub.status.idle": "2022-04-05T10:56:45.992629Z",
     "shell.execute_reply": "2022-04-05T10:56:45.990956Z"
    },
    "papermill": {
     "duration": 0.317048,
     "end_time": "2022-04-05T10:56:45.992796",
     "exception": false,
     "start_time": "2022-04-05T10:56:45.675748",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".dl-inline {width: auto; margin:0; padding: 0}\n",
       ".dl-inline>dt, .dl-inline>dd {float: none; width: auto; display: inline-block}\n",
       ".dl-inline>dt::after {content: \":\\0020\"; padding-right: .5ex}\n",
       ".dl-inline>dt:not(:first-of-type) {padding-left: .5ex}\n",
       "</style><dl class=dl-inline><dt>(Intercept)</dt><dd>3.38205265734032</dd><dt>Sexmale</dt><dd>0.0831825996901138</dd><dt>Age</dt><dd>0.985638648994722</dd><dt>Parch</dt><dd>0.720699201048072</dd><dt>Fare</dt><dd>1.01519560101741</dd></dl>\n"
      ],
      "text/latex": [
       "\\begin{description*}\n",
       "\\item[(Intercept)] 3.38205265734032\n",
       "\\item[Sexmale] 0.0831825996901138\n",
       "\\item[Age] 0.985638648994722\n",
       "\\item[Parch] 0.720699201048072\n",
       "\\item[Fare] 1.01519560101741\n",
       "\\end{description*}\n"
      ],
      "text/markdown": [
       "(Intercept)\n",
       ":   3.38205265734032Sexmale\n",
       ":   0.0831825996901138Age\n",
       ":   0.985638648994722Parch\n",
       ":   0.720699201048072Fare\n",
       ":   1.01519560101741\n",
       "\n"
      ],
      "text/plain": [
       "(Intercept)     Sexmale         Age       Parch        Fare \n",
       "  3.3820527   0.0831826   0.9856386   0.7206992   1.0151956 "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Waiting for profiling to be done...\n",
      "\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A matrix: 5 × 2 of type dbl</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>2.5 %</th><th scope=col>97.5 %</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>(Intercept)</th><td>2.04207094</td><td>5.7096914</td></tr>\n",
       "\t<tr><th scope=row>Sexmale</th><td>0.05576965</td><td>0.1222331</td></tr>\n",
       "\t<tr><th scope=row>Age</th><td>0.97251882</td><td>0.9986355</td></tr>\n",
       "\t<tr><th scope=row>Parch</th><td>0.57276422</td><td>0.8969299</td></tr>\n",
       "\t<tr><th scope=row>Fare</th><td>1.00972794</td><td>1.0212996</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A matrix: 5 × 2 of type dbl\n",
       "\\begin{tabular}{r|ll}\n",
       "  & 2.5 \\% & 97.5 \\%\\\\\n",
       "\\hline\n",
       "\t(Intercept) & 2.04207094 & 5.7096914\\\\\n",
       "\tSexmale & 0.05576965 & 0.1222331\\\\\n",
       "\tAge & 0.97251882 & 0.9986355\\\\\n",
       "\tParch & 0.57276422 & 0.8969299\\\\\n",
       "\tFare & 1.00972794 & 1.0212996\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A matrix: 5 × 2 of type dbl\n",
       "\n",
       "| <!--/--> | 2.5 % | 97.5 % |\n",
       "|---|---|---|\n",
       "| (Intercept) | 2.04207094 | 5.7096914 |\n",
       "| Sexmale | 0.05576965 | 0.1222331 |\n",
       "| Age | 0.97251882 | 0.9986355 |\n",
       "| Parch | 0.57276422 | 0.8969299 |\n",
       "| Fare | 1.00972794 | 1.0212996 |\n",
       "\n"
      ],
      "text/plain": [
       "            2.5 %      97.5 %   \n",
       "(Intercept) 2.04207094 5.7096914\n",
       "Sexmale     0.05576965 0.1222331\n",
       "Age         0.97251882 0.9986355\n",
       "Parch       0.57276422 0.8969299\n",
       "Fare        1.00972794 1.0212996"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# to exponentiate the coefficients of the model\n",
    "exp(coefficients(model))\n",
    "\n",
    "# to exponentiate teh confidence interval of the model\n",
    "exp(confint(model))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "32e80ae7",
   "metadata": {
    "papermill": {
     "duration": 0.117463,
     "end_time": "2022-04-05T10:56:46.230255",
     "exception": false,
     "start_time": "2022-04-05T10:56:46.112792",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**Interpretation:** Taking sex is an example, after adjusting for all the confounders (Age, number of parents/children aboard the Titanic and Passenger fare), the odd ratio is 0.0832 with 95% CI being 0.0558 and 0.122. This means that the odds of surviving for males is 91.7% less likely as compared to females. \n",
    "\n",
    "Looking at Passenger fare, after adjusting for all the confounders (Age, number of parents/children aboard the Titanic and Passenger fare), the odd ratio is 1.02 with 95% CI being 1.01 and 1.02. This means that the odds of surviving increases by about 2% for every 1 unit increase of Passenger fare."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "84d4a2e2",
   "metadata": {
    "papermill": {
     "duration": 0.119818,
     "end_time": "2022-04-05T10:56:46.489020",
     "exception": false,
     "start_time": "2022-04-05T10:56:46.369202",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Tada! That's all!"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "a78a1533",
   "metadata": {
    "papermill": {
     "duration": 0.128809,
     "end_time": "2022-04-05T10:56:46.736961",
     "exception": false,
     "start_time": "2022-04-05T10:56:46.608152",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Below is just my further research, please ignore it!"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "10d0671b",
   "metadata": {
    "papermill": {
     "duration": 0.125521,
     "end_time": "2022-04-05T10:56:46.996052",
     "exception": false,
     "start_time": "2022-04-05T10:56:46.870531",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "There are also 3 concepts related to logistic regression:\n",
    "\n",
    "1. AIC (Akaike Information Criterion)\n",
    "    - AIC metric explains the relative quality of the model\n",
    "    - depends on 2 factors: AIC = 2K - 2ln(L)\n",
    "        + K: # of predictors in the model\n",
    "        + ln(L): the log-likelihood that the model can reproduce the data\n",
    "            * the lower AIC value, the better is the model\n",
    "2. Power of the model\n",
    "    - comparing one predictor in the models through its 95% CIs\n",
    "    - more/less predictors to the model widens/minifies the 95% CI\n",
    "    - to detect significant difference \n",
    "3. Hosmer-Lemeshow Goodness of fit test\n",
    "    - examining how well the model fit the data\n",
    "    - the model is a good fit if the p-value is less then the significance level"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "ae877484",
   "metadata": {
    "papermill": {
     "duration": 0.123895,
     "end_time": "2022-04-05T10:56:47.242327",
     "exception": false,
     "start_time": "2022-04-05T10:56:47.118432",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**A. Do some tests using the AIC concept**\n",
    "\n",
    "**Test 1 - comparing 3 different multivariable models**\n",
    "\n",
    "For simplicity's sake, the test 1 would use the 'mtcars' data which have numerical predictors along with an numerical outcome."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "26ac38dc",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-05T10:56:47.498359Z",
     "iopub.status.busy": "2022-04-05T10:56:47.496076Z",
     "iopub.status.idle": "2022-04-05T10:56:51.836811Z",
     "shell.execute_reply": "2022-04-05T10:56:51.834207Z"
    },
    "papermill": {
     "duration": 4.472111,
     "end_time": "2022-04-05T10:56:51.837026",
     "exception": false,
     "start_time": "2022-04-05T10:56:47.364915",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 11</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>mpg</th><th scope=col>cyl</th><th scope=col>disp</th><th scope=col>hp</th><th scope=col>drat</th><th scope=col>wt</th><th scope=col>qsec</th><th scope=col>vs</th><th scope=col>am</th><th scope=col>gear</th><th scope=col>carb</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>Mazda RX4</th><td>21.0</td><td>6</td><td>160</td><td>110</td><td>3.90</td><td>2.620</td><td>16.46</td><td>0</td><td>1</td><td>4</td><td>4</td></tr>\n",
       "\t<tr><th scope=row>Mazda RX4 Wag</th><td>21.0</td><td>6</td><td>160</td><td>110</td><td>3.90</td><td>2.875</td><td>17.02</td><td>0</td><td>1</td><td>4</td><td>4</td></tr>\n",
       "\t<tr><th scope=row>Datsun 710</th><td>22.8</td><td>4</td><td>108</td><td> 93</td><td>3.85</td><td>2.320</td><td>18.61</td><td>1</td><td>1</td><td>4</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>Hornet 4 Drive</th><td>21.4</td><td>6</td><td>258</td><td>110</td><td>3.08</td><td>3.215</td><td>19.44</td><td>1</td><td>0</td><td>3</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>Hornet Sportabout</th><td>18.7</td><td>8</td><td>360</td><td>175</td><td>3.15</td><td>3.440</td><td>17.02</td><td>0</td><td>0</td><td>3</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>Valiant</th><td>18.1</td><td>6</td><td>225</td><td>105</td><td>2.76</td><td>3.460</td><td>20.22</td><td>1</td><td>0</td><td>3</td><td>1</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 11\n",
       "\\begin{tabular}{r|lllllllllll}\n",
       "  & mpg & cyl & disp & hp & drat & wt & qsec & vs & am & gear & carb\\\\\n",
       "  & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\tMazda RX4 & 21.0 & 6 & 160 & 110 & 3.90 & 2.620 & 16.46 & 0 & 1 & 4 & 4\\\\\n",
       "\tMazda RX4 Wag & 21.0 & 6 & 160 & 110 & 3.90 & 2.875 & 17.02 & 0 & 1 & 4 & 4\\\\\n",
       "\tDatsun 710 & 22.8 & 4 & 108 &  93 & 3.85 & 2.320 & 18.61 & 1 & 1 & 4 & 1\\\\\n",
       "\tHornet 4 Drive & 21.4 & 6 & 258 & 110 & 3.08 & 3.215 & 19.44 & 1 & 0 & 3 & 1\\\\\n",
       "\tHornet Sportabout & 18.7 & 8 & 360 & 175 & 3.15 & 3.440 & 17.02 & 0 & 0 & 3 & 2\\\\\n",
       "\tValiant & 18.1 & 6 & 225 & 105 & 2.76 & 3.460 & 20.22 & 1 & 0 & 3 & 1\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 11\n",
       "\n",
       "| <!--/--> | mpg &lt;dbl&gt; | cyl &lt;dbl&gt; | disp &lt;dbl&gt; | hp &lt;dbl&gt; | drat &lt;dbl&gt; | wt &lt;dbl&gt; | qsec &lt;dbl&gt; | vs &lt;dbl&gt; | am &lt;dbl&gt; | gear &lt;dbl&gt; | carb &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| Mazda RX4 | 21.0 | 6 | 160 | 110 | 3.90 | 2.620 | 16.46 | 0 | 1 | 4 | 4 |\n",
       "| Mazda RX4 Wag | 21.0 | 6 | 160 | 110 | 3.90 | 2.875 | 17.02 | 0 | 1 | 4 | 4 |\n",
       "| Datsun 710 | 22.8 | 4 | 108 |  93 | 3.85 | 2.320 | 18.61 | 1 | 1 | 4 | 1 |\n",
       "| Hornet 4 Drive | 21.4 | 6 | 258 | 110 | 3.08 | 3.215 | 19.44 | 1 | 0 | 3 | 1 |\n",
       "| Hornet Sportabout | 18.7 | 8 | 360 | 175 | 3.15 | 3.440 | 17.02 | 0 | 0 | 3 | 2 |\n",
       "| Valiant | 18.1 | 6 | 225 | 105 | 2.76 | 3.460 | 20.22 | 1 | 0 | 3 | 1 |\n",
       "\n"
      ],
      "text/plain": [
       "                  mpg  cyl disp hp  drat wt    qsec  vs am gear carb\n",
       "Mazda RX4         21.0 6   160  110 3.90 2.620 16.46 0  1  4    4   \n",
       "Mazda RX4 Wag     21.0 6   160  110 3.90 2.875 17.02 0  1  4    4   \n",
       "Datsun 710        22.8 4   108   93 3.85 2.320 18.61 1  1  4    1   \n",
       "Hornet 4 Drive    21.4 6   258  110 3.08 3.215 19.44 1  0  3    1   \n",
       "Hornet Sportabout 18.7 8   360  175 3.15 3.440 17.02 0  0  3    2   \n",
       "Valiant           18.1 6   225  105 2.76 3.460 20.22 1  0  3    1   "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "library(AICcmodavg)\n",
    "\n",
    "data(mtcars)\n",
    "head(mtcars)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "e644d2b4",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-05T10:56:52.086015Z",
     "iopub.status.busy": "2022-04-05T10:56:52.083569Z",
     "iopub.status.idle": "2022-04-05T10:56:52.139511Z",
     "shell.execute_reply": "2022-04-05T10:56:52.137471Z"
    },
    "papermill": {
     "duration": 0.183473,
     "end_time": "2022-04-05T10:56:52.139709",
     "exception": false,
     "start_time": "2022-04-05T10:56:51.956236",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A aictab: 3 × 8</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>Modnames</th><th scope=col>K</th><th scope=col>AICc</th><th scope=col>Delta_AICc</th><th scope=col>ModelLik</th><th scope=col>AICcWt</th><th scope=col>LL</th><th scope=col>Cum.Wt</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>disp, hp, wt, qsec</td><td>6</td><td>162.4296</td><td> 0.000000</td><td>1.000000000</td><td>0.830404924</td><td>-73.53480</td><td>0.8304049</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>disp, wt          </td><td>4</td><td>165.6493</td><td> 3.219656</td><td>0.199921966</td><td>0.166016185</td><td>-78.08389</td><td>0.9964211</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>disp, qsec        </td><td>4</td><td>173.3233</td><td>10.893721</td><td>0.004309815</td><td>0.003578891</td><td>-81.92092</td><td>1.0000000</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A aictab: 3 × 8\n",
       "\\begin{tabular}{r|llllllll}\n",
       "  & Modnames & K & AICc & Delta\\_AICc & ModelLik & AICcWt & LL & Cum.Wt\\\\\n",
       "  & <chr> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t1 & disp, hp, wt, qsec & 6 & 162.4296 &  0.000000 & 1.000000000 & 0.830404924 & -73.53480 & 0.8304049\\\\\n",
       "\t3 & disp, wt           & 4 & 165.6493 &  3.219656 & 0.199921966 & 0.166016185 & -78.08389 & 0.9964211\\\\\n",
       "\t2 & disp, qsec         & 4 & 173.3233 & 10.893721 & 0.004309815 & 0.003578891 & -81.92092 & 1.0000000\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A aictab: 3 × 8\n",
       "\n",
       "| <!--/--> | Modnames &lt;chr&gt; | K &lt;dbl&gt; | AICc &lt;dbl&gt; | Delta_AICc &lt;dbl&gt; | ModelLik &lt;dbl&gt; | AICcWt &lt;dbl&gt; | LL &lt;dbl&gt; | Cum.Wt &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | disp, hp, wt, qsec | 6 | 162.4296 |  0.000000 | 1.000000000 | 0.830404924 | -73.53480 | 0.8304049 |\n",
       "| 3 | disp, wt           | 4 | 165.6493 |  3.219656 | 0.199921966 | 0.166016185 | -78.08389 | 0.9964211 |\n",
       "| 2 | disp, qsec         | 4 | 173.3233 | 10.893721 | 0.004309815 | 0.003578891 | -81.92092 | 1.0000000 |\n",
       "\n"
      ],
      "text/plain": [
       "  Modnames           K AICc     Delta_AICc ModelLik    AICcWt      LL       \n",
       "1 disp, hp, wt, qsec 6 162.4296  0.000000  1.000000000 0.830404924 -73.53480\n",
       "3 disp, wt           4 165.6493  3.219656  0.199921966 0.166016185 -78.08389\n",
       "2 disp, qsec         4 173.3233 10.893721  0.004309815 0.003578891 -81.92092\n",
       "  Cum.Wt   \n",
       "1 0.8304049\n",
       "3 0.9964211\n",
       "2 1.0000000"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Step 1: Let's try to fit 3 different multiple linear regression models:\n",
    "# Predictor variables in Model 1: disp, hp, wt, qsec\n",
    "model1 <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)\n",
    "\n",
    "# Predictor variables in Model 2: disp, qsec\n",
    "model2 <- lm(mpg ~ disp + qsec, data = mtcars)\n",
    "\n",
    "# Predictor variables in Model 3: disp, wt\n",
    "model3 <- lm(mpg ~ disp + wt, data = mtcars)\n",
    "\n",
    "# Step 2: calculate the AIC of each model\n",
    "models <- list(model1, model2, model3)\n",
    "\n",
    "# set model names\n",
    "model.names <- c('disp, hp, wt, qsec', 'disp, qsec', 'disp, wt')\n",
    "\n",
    "# calculate AIC of each model\n",
    "aictab(cand.set = models, modnames = model.names)\n",
    "\n",
    "# note: the model with the lowest AIC value is always listed first!"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "4e615e6d",
   "metadata": {
    "papermill": {
     "duration": 0.124275,
     "end_time": "2022-04-05T10:56:52.390040",
     "exception": false,
     "start_time": "2022-04-05T10:56:52.265765",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "The model 1 would be chosen as it has the lowest AIC value of 162.43. \n",
    "\n",
    "Once we've identified this model as the best, we can proceed to fit the model and analyze the results including the R-squared value and the beta coefficients to determine the exact relationship between the set of predictor variables and the response variable."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "7df67019",
   "metadata": {
    "papermill": {
     "duration": 0.125788,
     "end_time": "2022-04-05T10:56:52.638853",
     "exception": false,
     "start_time": "2022-04-05T10:56:52.513065",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**Test 2 - comparing the model with only sex as the predictor and the multivariable model**\n",
    "\n",
    "Using the 'Titanic' data"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "id": "9a40d947",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-05T10:56:52.902984Z",
     "iopub.status.busy": "2022-04-05T10:56:52.901086Z",
     "iopub.status.idle": "2022-04-05T10:56:52.954784Z",
     "shell.execute_reply": "2022-04-05T10:56:52.952862Z"
    },
    "papermill": {
     "duration": 0.187741,
     "end_time": "2022-04-05T10:56:52.955015",
     "exception": false,
     "start_time": "2022-04-05T10:56:52.767274",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A aictab: 2 × 8</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>Modnames</th><th scope=col>K</th><th scope=col>AICc</th><th scope=col>Delta_AICc</th><th scope=col>ModelLik</th><th scope=col>AICcWt</th><th scope=col>LL</th><th scope=col>Cum.Wt</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>2</th><td>sex, age, parch, fare</td><td>5</td><td>717.4890</td><td>  0.0000</td><td>1.000000e+00</td><td>1.000000e+00</td><td>-353.7021</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>1</th><td>sex                  </td><td>2</td><td>921.8174</td><td>204.3285</td><td>4.272043e-45</td><td>4.272043e-45</td><td>-458.9020</td><td>1</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A aictab: 2 × 8\n",
       "\\begin{tabular}{r|llllllll}\n",
       "  & Modnames & K & AICc & Delta\\_AICc & ModelLik & AICcWt & LL & Cum.Wt\\\\\n",
       "  & <chr> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t2 & sex, age, parch, fare & 5 & 717.4890 &   0.0000 & 1.000000e+00 & 1.000000e+00 & -353.7021 & 1\\\\\n",
       "\t1 & sex                   & 2 & 921.8174 & 204.3285 & 4.272043e-45 & 4.272043e-45 & -458.9020 & 1\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A aictab: 2 × 8\n",
       "\n",
       "| <!--/--> | Modnames &lt;chr&gt; | K &lt;dbl&gt; | AICc &lt;dbl&gt; | Delta_AICc &lt;dbl&gt; | ModelLik &lt;dbl&gt; | AICcWt &lt;dbl&gt; | LL &lt;dbl&gt; | Cum.Wt &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|\n",
       "| 2 | sex, age, parch, fare | 5 | 717.4890 |   0.0000 | 1.000000e+00 | 1.000000e+00 | -353.7021 | 1 |\n",
       "| 1 | sex                   | 2 | 921.8174 | 204.3285 | 4.272043e-45 | 4.272043e-45 | -458.9020 | 1 |\n",
       "\n"
      ],
      "text/plain": [
       "  Modnames              K AICc     Delta_AICc ModelLik     AICcWt      \n",
       "2 sex, age, parch, fare 5 717.4890   0.0000   1.000000e+00 1.000000e+00\n",
       "1 sex                   2 921.8174 204.3285   4.272043e-45 4.272043e-45\n",
       "  LL        Cum.Wt\n",
       "2 -353.7021 1     \n",
       "1 -458.9020 1     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Predictor variable in Model 1: sex\n",
    "model1 <- glm(Survived ~ Sex, data = titanic, family = binomial)\n",
    "\n",
    "# Predictor variables in Model 2: Sex, Age, Parch, Fare\n",
    "model2 <- glm(Survived ~ Sex + Age + Parch + Fare, data = titanic, family = binomial)\n",
    "\n",
    "models <- list(model1, model2)\n",
    "\n",
    "model.names <- c('sex', 'sex, age, parch, fare')\n",
    "\n",
    "# calculate AIC of each model\n",
    "aictab(cand.set = models, modnames = model.names)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "9ce2434d",
   "metadata": {
    "papermill": {
     "duration": 0.124979,
     "end_time": "2022-04-05T10:56:53.211559",
     "exception": false,
     "start_time": "2022-04-05T10:56:53.086580",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Comparing the model with only sex as the predictor and the multivariable model, the AIC are 921.8 and 717.5. This means that the multivariable model is a better model as compared to the former."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "02dc0b95",
   "metadata": {
    "papermill": {
     "duration": 0.131032,
     "end_time": "2022-04-05T10:56:53.473853",
     "exception": false,
     "start_time": "2022-04-05T10:56:53.342821",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**B. Do an example of the power of the model**"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "969522aa",
   "metadata": {
    "papermill": {
     "duration": 0.135418,
     "end_time": "2022-04-05T10:56:53.755299",
     "exception": false,
     "start_time": "2022-04-05T10:56:53.619881",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Comparing the model with only sex as the predictor and the multivariable model, it can be seen that the 95% CI for sex in the multivariable model (95% CI: 0.0558 to 0.122) is wider than the univariate model (95% CI: 0.058 to 0.112). From here, it can be seen that adding more predictors to the model widens the 95% CI and if there is too many predictors, the power of the model may be reduced."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "bd3036c0",
   "metadata": {
    "papermill": {
     "duration": 0.135527,
     "end_time": "2022-04-05T10:56:54.046210",
     "exception": false,
     "start_time": "2022-04-05T10:56:53.910683",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**C. Do an example of the Goodness Of Fit Test** "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "id": "2b531057",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-05T10:56:54.331360Z",
     "iopub.status.busy": "2022-04-05T10:56:54.328202Z",
     "iopub.status.idle": "2022-04-05T10:56:54.395454Z",
     "shell.execute_reply": "2022-04-05T10:56:54.393392Z"
    },
    "papermill": {
     "duration": 0.210834,
     "end_time": "2022-04-05T10:56:54.395686",
     "exception": false,
     "start_time": "2022-04-05T10:56:54.184852",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "ResourceSelection 0.3-5 \t 2019-07-22\n",
      "\n"
     ]
    }
   ],
   "source": [
    "library(ResourceSelection)\n",
    "library(dplyr)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 13,
   "id": "399d294e",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-05T10:56:54.669877Z",
     "iopub.status.busy": "2022-04-05T10:56:54.667689Z",
     "iopub.status.idle": "2022-04-05T10:56:54.736509Z",
     "shell.execute_reply": "2022-04-05T10:56:54.733940Z"
    },
    "papermill": {
     "duration": 0.20806,
     "end_time": "2022-04-05T10:56:54.736750",
     "exception": false,
     "start_time": "2022-04-05T10:56:54.528690",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "\n",
       "\tHosmer and Lemeshow goodness of fit (GOF) test\n",
       "\n",
       "data:  no_na_df$Survived, fitted(model)\n",
       "X-squared = 12.813, df = 8, p-value = 0.1185\n"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# data wrangling - getting data without missing values\n",
    "no_na_df <- titanic %>%\n",
    "    filter(\n",
    "        !is.na(Sex) & !is.na(Age) & !is.na(Parch) & !is.na(Fare)\n",
    "    )\n",
    "\n",
    "model <- glm(Survived ~ Sex + Age + Parch + Fare, data = titanic, family = binomial)\n",
    "\n",
    "# Hosmer and Lemeshow goodness of fit (GOF) test\n",
    "hoslem.test(no_na_df$Survived, fitted(model))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "47b74481",
   "metadata": {
    "papermill": {
     "duration": 0.144486,
     "end_time": "2022-04-05T10:56:55.022135",
     "exception": false,
     "start_time": "2022-04-05T10:56:54.877649",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**Interpretation:** the p-value is 0.1185, suggesting that there is no significant evidence to show that the model is a poor fit to the data. "
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.0.5"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 19.788063,
   "end_time": "2022-04-05T10:56:55.275203",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2022-04-05T10:56:35.487140",
   "version": "2.3.3"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
