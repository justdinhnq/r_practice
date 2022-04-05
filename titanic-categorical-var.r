{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "47d9023c",
   "metadata": {
    "_execution_state": "idle",
    "_kg_hide-output": true,
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "execution": {
     "iopub.execute_input": "2022-04-05T11:52:34.686987Z",
     "iopub.status.busy": "2022-04-05T11:52:34.684637Z",
     "iopub.status.idle": "2022-04-05T11:52:35.978202Z",
     "shell.execute_reply": "2022-04-05T11:52:35.977493Z"
    },
    "papermill": {
     "duration": 1.389179,
     "end_time": "2022-04-05T11:52:35.978360",
     "exception": false,
     "start_time": "2022-04-05T11:52:34.589181",
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
   "id": "3de765f2",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-05T11:52:36.206252Z",
     "iopub.status.busy": "2022-04-05T11:52:36.173701Z",
     "iopub.status.idle": "2022-04-05T11:52:36.253908Z",
     "shell.execute_reply": "2022-04-05T11:52:36.252747Z"
    },
    "papermill": {
     "duration": 0.178974,
     "end_time": "2022-04-05T11:52:36.254056",
     "exception": false,
     "start_time": "2022-04-05T11:52:36.075082",
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
   "id": "8172f9aa",
   "metadata": {
    "papermill": {
     "duration": 0.097539,
     "end_time": "2022-04-05T11:52:36.449202",
     "exception": false,
     "start_time": "2022-04-05T11:52:36.351663",
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
   "id": "b45f4ce8",
   "metadata": {
    "papermill": {
     "duration": 0.094703,
     "end_time": "2022-04-05T11:52:36.638988",
     "exception": false,
     "start_time": "2022-04-05T11:52:36.544285",
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
   "id": "5d1791ab",
   "metadata": {
    "papermill": {
     "duration": 0.094969,
     "end_time": "2022-04-05T11:52:36.828823",
     "exception": false,
     "start_time": "2022-04-05T11:52:36.733854",
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
   "id": "ffcbe227",
   "metadata": {
    "papermill": {
     "duration": 0.096084,
     "end_time": "2022-04-05T11:52:37.019823",
     "exception": false,
     "start_time": "2022-04-05T11:52:36.923739",
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
   "id": "880b1662",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-05T11:52:37.217302Z",
     "iopub.status.busy": "2022-04-05T11:52:37.215195Z",
     "iopub.status.idle": "2022-04-05T11:52:37.262777Z",
     "shell.execute_reply": "2022-04-05T11:52:37.260919Z"
    },
    "papermill": {
     "duration": 0.147867,
     "end_time": "2022-04-05T11:52:37.262930",
     "exception": false,
     "start_time": "2022-04-05T11:52:37.115063",
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
   "id": "5043ea90",
   "metadata": {
    "papermill": {
     "duration": 0.097783,
     "end_time": "2022-04-05T11:52:37.458951",
     "exception": false,
     "start_time": "2022-04-05T11:52:37.361168",
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
   "id": "842fcff5",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-05T11:52:37.663031Z",
     "iopub.status.busy": "2022-04-05T11:52:37.660934Z",
     "iopub.status.idle": "2022-04-05T11:52:37.771878Z",
     "shell.execute_reply": "2022-04-05T11:52:37.770026Z"
    },
    "papermill": {
     "duration": 0.214504,
     "end_time": "2022-04-05T11:52:37.772032",
     "exception": false,
     "start_time": "2022-04-05T11:52:37.557528",
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
   "id": "31338a4e",
   "metadata": {
    "papermill": {
     "duration": 0.104235,
     "end_time": "2022-04-05T11:52:37.981791",
     "exception": false,
     "start_time": "2022-04-05T11:52:37.877556",
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
   "id": "98ecc839",
   "metadata": {
    "papermill": {
     "duration": 0.104913,
     "end_time": "2022-04-05T11:52:38.190261",
     "exception": false,
     "start_time": "2022-04-05T11:52:38.085348",
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
   "id": "66c08fcf",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-05T11:52:38.406147Z",
     "iopub.status.busy": "2022-04-05T11:52:38.404113Z",
     "iopub.status.idle": "2022-04-05T11:52:38.440297Z",
     "shell.execute_reply": "2022-04-05T11:52:38.438480Z"
    },
    "papermill": {
     "duration": 0.144659,
     "end_time": "2022-04-05T11:52:38.440467",
     "exception": false,
     "start_time": "2022-04-05T11:52:38.295808",
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
   "id": "c4bbc29d",
   "metadata": {
    "papermill": {
     "duration": 0.106943,
     "end_time": "2022-04-05T11:52:38.654263",
     "exception": false,
     "start_time": "2022-04-05T11:52:38.547320",
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
   "id": "69e64c05",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-05T11:52:38.875259Z",
     "iopub.status.busy": "2022-04-05T11:52:38.873170Z",
     "iopub.status.idle": "2022-04-05T11:52:38.927875Z",
     "shell.execute_reply": "2022-04-05T11:52:38.926257Z"
    },
    "papermill": {
     "duration": 0.16626,
     "end_time": "2022-04-05T11:52:38.928023",
     "exception": false,
     "start_time": "2022-04-05T11:52:38.761763",
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
   "id": "af39ad83",
   "metadata": {
    "papermill": {
     "duration": 0.113654,
     "end_time": "2022-04-05T11:52:39.155226",
     "exception": false,
     "start_time": "2022-04-05T11:52:39.041572",
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
   "id": "183972a1",
   "metadata": {
    "papermill": {
     "duration": 0.113493,
     "end_time": "2022-04-05T11:52:39.382335",
     "exception": false,
     "start_time": "2022-04-05T11:52:39.268842",
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
   "id": "385549b5",
   "metadata": {
    "papermill": {
     "duration": 0.112757,
     "end_time": "2022-04-05T11:52:39.608033",
     "exception": false,
     "start_time": "2022-04-05T11:52:39.495276",
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
    "| Sex                                        | Sex       | 0.081       |  0.058   | 0.112    | 0       |\n",
    "| Age                                        | Age       | 0.989       |  0.9787  | 0.9995   | 0.0397  |\n",
    "| # of siblings / spouses aboard the Titanic | SibSp     | 0.934       |  0.817   | 1.058    | 0.294   |\n",
    "| # of parents / children aboard the Titanic | Parch     | 1.225       |  1.039   | 1.449    | 0.0163  |\n",
    "| Passenger fare                             | Fare      | 1.0153      |  1.011   | 1.012    | 0       |"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "4cdde9f1",
   "metadata": {
    "papermill": {
     "duration": 0.114433,
     "end_time": "2022-04-05T11:52:39.836407",
     "exception": false,
     "start_time": "2022-04-05T11:52:39.721974",
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
   "id": "1b72b7c2",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-05T11:52:40.070328Z",
     "iopub.status.busy": "2022-04-05T11:52:40.069662Z",
     "iopub.status.idle": "2022-04-05T11:52:40.096849Z",
     "shell.execute_reply": "2022-04-05T11:52:40.095214Z"
    },
    "papermill": {
     "duration": 0.147283,
     "end_time": "2022-04-05T11:52:40.096991",
     "exception": false,
     "start_time": "2022-04-05T11:52:39.949708",
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
   "id": "4ea64816",
   "metadata": {
    "papermill": {
     "duration": 0.115912,
     "end_time": "2022-04-05T11:52:40.329698",
     "exception": false,
     "start_time": "2022-04-05T11:52:40.213786",
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
   "id": "c174ba3f",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-05T11:52:40.568744Z",
     "iopub.status.busy": "2022-04-05T11:52:40.567772Z",
     "iopub.status.idle": "2022-04-05T11:52:40.707657Z",
     "shell.execute_reply": "2022-04-05T11:52:40.706102Z"
    },
    "papermill": {
     "duration": 0.262306,
     "end_time": "2022-04-05T11:52:40.707811",
     "exception": false,
     "start_time": "2022-04-05T11:52:40.445505",
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
   "id": "a615bf48",
   "metadata": {
    "papermill": {
     "duration": 0.125949,
     "end_time": "2022-04-05T11:52:40.956251",
     "exception": false,
     "start_time": "2022-04-05T11:52:40.830302",
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
   "id": "d5ad36de",
   "metadata": {
    "papermill": {
     "duration": 0.124454,
     "end_time": "2022-04-05T11:52:41.203142",
     "exception": false,
     "start_time": "2022-04-05T11:52:41.078688",
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
   "id": "8aeafa5e",
   "metadata": {
    "papermill": {
     "duration": 0.1371,
     "end_time": "2022-04-05T11:52:41.463717",
     "exception": false,
     "start_time": "2022-04-05T11:52:41.326617",
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
   "id": "0cd65bdc",
   "metadata": {
    "papermill": {
     "duration": 0.123227,
     "end_time": "2022-04-05T11:52:41.719429",
     "exception": false,
     "start_time": "2022-04-05T11:52:41.596202",
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
   "id": "f2377f5d",
   "metadata": {
    "papermill": {
     "duration": 0.123051,
     "end_time": "2022-04-05T11:52:41.977277",
     "exception": false,
     "start_time": "2022-04-05T11:52:41.854226",
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
   "id": "df806efe",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-05T11:52:42.247229Z",
     "iopub.status.busy": "2022-04-05T11:52:42.246581Z",
     "iopub.status.idle": "2022-04-05T11:52:45.700855Z",
     "shell.execute_reply": "2022-04-05T11:52:45.699270Z"
    },
    "papermill": {
     "duration": 3.583399,
     "end_time": "2022-04-05T11:52:45.701006",
     "exception": false,
     "start_time": "2022-04-05T11:52:42.117607",
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
   "id": "1006f305",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-05T11:52:45.959710Z",
     "iopub.status.busy": "2022-04-05T11:52:45.958252Z",
     "iopub.status.idle": "2022-04-05T11:52:46.001086Z",
     "shell.execute_reply": "2022-04-05T11:52:45.999808Z"
    },
    "papermill": {
     "duration": 0.174283,
     "end_time": "2022-04-05T11:52:46.001249",
     "exception": false,
     "start_time": "2022-04-05T11:52:45.826966",
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
   "id": "f9a9d4e8",
   "metadata": {
    "papermill": {
     "duration": 0.133912,
     "end_time": "2022-04-05T11:52:46.265093",
     "exception": false,
     "start_time": "2022-04-05T11:52:46.131181",
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
   "id": "0c9132a9",
   "metadata": {
    "papermill": {
     "duration": 0.134269,
     "end_time": "2022-04-05T11:52:46.532077",
     "exception": false,
     "start_time": "2022-04-05T11:52:46.397808",
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
   "id": "99df88b8",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-05T11:52:46.804026Z",
     "iopub.status.busy": "2022-04-05T11:52:46.802327Z",
     "iopub.status.idle": "2022-04-05T11:52:46.844902Z",
     "shell.execute_reply": "2022-04-05T11:52:46.843382Z"
    },
    "papermill": {
     "duration": 0.182493,
     "end_time": "2022-04-05T11:52:46.845056",
     "exception": false,
     "start_time": "2022-04-05T11:52:46.662563",
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
   "id": "6d5e5e2f",
   "metadata": {
    "papermill": {
     "duration": 0.131793,
     "end_time": "2022-04-05T11:52:47.109318",
     "exception": false,
     "start_time": "2022-04-05T11:52:46.977525",
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
   "id": "ed1f378c",
   "metadata": {
    "papermill": {
     "duration": 0.132188,
     "end_time": "2022-04-05T11:52:47.373238",
     "exception": false,
     "start_time": "2022-04-05T11:52:47.241050",
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
   "id": "07e369c5",
   "metadata": {
    "papermill": {
     "duration": 0.131326,
     "end_time": "2022-04-05T11:52:47.636162",
     "exception": false,
     "start_time": "2022-04-05T11:52:47.504836",
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
   "id": "a84eb0f5",
   "metadata": {
    "papermill": {
     "duration": 0.132188,
     "end_time": "2022-04-05T11:52:47.899619",
     "exception": false,
     "start_time": "2022-04-05T11:52:47.767431",
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
   "id": "7f3f1a6e",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-05T11:52:48.169859Z",
     "iopub.status.busy": "2022-04-05T11:52:48.168018Z",
     "iopub.status.idle": "2022-04-05T11:52:48.218732Z",
     "shell.execute_reply": "2022-04-05T11:52:48.217176Z"
    },
    "papermill": {
     "duration": 0.186352,
     "end_time": "2022-04-05T11:52:48.218875",
     "exception": false,
     "start_time": "2022-04-05T11:52:48.032523",
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
   "id": "cb7e42ba",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-05T11:52:48.491588Z",
     "iopub.status.busy": "2022-04-05T11:52:48.489568Z",
     "iopub.status.idle": "2022-04-05T11:52:48.542403Z",
     "shell.execute_reply": "2022-04-05T11:52:48.540342Z"
    },
    "papermill": {
     "duration": 0.189648,
     "end_time": "2022-04-05T11:52:48.542600",
     "exception": false,
     "start_time": "2022-04-05T11:52:48.352952",
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
   "id": "e303df3c",
   "metadata": {
    "papermill": {
     "duration": 0.134817,
     "end_time": "2022-04-05T11:52:48.810936",
     "exception": false,
     "start_time": "2022-04-05T11:52:48.676119",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**Interpretation:** the p-value is 0.1185, suggesting that there is no significant evidence to show that the model is a poor fit to the data. "
   ]
  },
  {
   "cell_type": "markdown",
   "id": "afcd7997",
   "metadata": {
    "papermill": {
     "duration": 0.134335,
     "end_time": "2022-04-05T11:52:49.083722",
     "exception": false,
     "start_time": "2022-04-05T11:52:48.949387",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Appendix\n",
    "\n",
    "**Calculating the univariate analysis for the 'forward selection method' part above**"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "22fb7ced",
   "metadata": {
    "papermill": {
     "duration": 0.13439,
     "end_time": "2022-04-05T11:52:49.352203",
     "exception": false,
     "start_time": "2022-04-05T11:52:49.217813",
     "status": "completed"
    },
    "tags": []
   },
   "source": []
  },
  {
   "cell_type": "code",
   "execution_count": 14,
   "id": "10a72b59",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-05T11:52:49.625914Z",
     "iopub.status.busy": "2022-04-05T11:52:49.624413Z",
     "iopub.status.idle": "2022-04-05T11:52:49.985184Z",
     "shell.execute_reply": "2022-04-05T11:52:49.983773Z"
    },
    "papermill": {
     "duration": 0.499674,
     "end_time": "2022-04-05T11:52:49.985335",
     "exception": false,
     "start_time": "2022-04-05T11:52:49.485661",
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
    },
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
    },
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
    },
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
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A matrix: 2 × 4 of type dbl</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>Estimate</th><th scope=col>Std. Error</th><th scope=col>z value</th><th scope=col>Pr(&gt;|z|)</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>(Intercept)</th><td>-0.43815351</td><td>0.07627531</td><td>-5.744369</td><td>9.226465e-09</td></tr>\n",
       "\t<tr><th scope=row>SibSp</th><td>-0.06863757</td><td>0.06538012</td><td>-1.049823</td><td>2.937994e-01</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A matrix: 2 × 4 of type dbl\n",
       "\\begin{tabular}{r|llll}\n",
       "  & Estimate & Std. Error & z value & Pr(>\\textbar{}z\\textbar{})\\\\\n",
       "\\hline\n",
       "\t(Intercept) & -0.43815351 & 0.07627531 & -5.744369 & 9.226465e-09\\\\\n",
       "\tSibSp & -0.06863757 & 0.06538012 & -1.049823 & 2.937994e-01\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A matrix: 2 × 4 of type dbl\n",
       "\n",
       "| <!--/--> | Estimate | Std. Error | z value | Pr(&gt;|z|) |\n",
       "|---|---|---|---|---|\n",
       "| (Intercept) | -0.43815351 | 0.07627531 | -5.744369 | 9.226465e-09 |\n",
       "| SibSp | -0.06863757 | 0.06538012 | -1.049823 | 2.937994e-01 |\n",
       "\n"
      ],
      "text/plain": [
       "            Estimate    Std. Error z value   Pr(>|z|)    \n",
       "(Intercept) -0.43815351 0.07627531 -5.744369 9.226465e-09\n",
       "SibSp       -0.06863757 0.06538012 -1.049823 2.937994e-01"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".dl-inline {width: auto; margin:0; padding: 0}\n",
       ".dl-inline>dt, .dl-inline>dd {float: none; width: auto; display: inline-block}\n",
       ".dl-inline>dt::after {content: \":\\0020\"; padding-right: .5ex}\n",
       ".dl-inline>dt:not(:first-of-type) {padding-left: .5ex}\n",
       "</style><dl class=dl-inline><dt>(Intercept)</dt><dd>0.645226726283567</dd><dt>SibSp</dt><dd>0.933665011102071</dd></dl>\n"
      ],
      "text/latex": [
       "\\begin{description*}\n",
       "\\item[(Intercept)] 0.645226726283567\n",
       "\\item[SibSp] 0.933665011102071\n",
       "\\end{description*}\n"
      ],
      "text/markdown": [
       "(Intercept)\n",
       ":   0.645226726283567SibSp\n",
       ":   0.933665011102071\n",
       "\n"
      ],
      "text/plain": [
       "(Intercept)       SibSp \n",
       "  0.6452267   0.9336650 "
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
       "\t<tr><th scope=row>(Intercept)</th><td>0.5552380</td><td>0.7488431</td></tr>\n",
       "\t<tr><th scope=row>SibSp</th><td>0.8170399</td><td>1.0575496</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A matrix: 2 × 2 of type dbl\n",
       "\\begin{tabular}{r|ll}\n",
       "  & 2.5 \\% & 97.5 \\%\\\\\n",
       "\\hline\n",
       "\t(Intercept) & 0.5552380 & 0.7488431\\\\\n",
       "\tSibSp & 0.8170399 & 1.0575496\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A matrix: 2 × 2 of type dbl\n",
       "\n",
       "| <!--/--> | 2.5 % | 97.5 % |\n",
       "|---|---|---|\n",
       "| (Intercept) | 0.5552380 | 0.7488431 |\n",
       "| SibSp | 0.8170399 | 1.0575496 |\n",
       "\n"
      ],
      "text/plain": [
       "            2.5 %     97.5 %   \n",
       "(Intercept) 0.5552380 0.7488431\n",
       "SibSp       0.8170399 1.0575496"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A matrix: 2 × 4 of type dbl</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>Estimate</th><th scope=col>Std. Error</th><th scope=col>z value</th><th scope=col>Pr(&gt;|z|)</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>(Intercept)</th><td>-0.5530505</td><td>0.07689347</td><td>-7.192424</td><td>6.365087e-13</td></tr>\n",
       "\t<tr><th scope=row>Parch</th><td> 0.2033171</td><td>0.08461546</td><td> 2.402836</td><td>1.626847e-02</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A matrix: 2 × 4 of type dbl\n",
       "\\begin{tabular}{r|llll}\n",
       "  & Estimate & Std. Error & z value & Pr(>\\textbar{}z\\textbar{})\\\\\n",
       "\\hline\n",
       "\t(Intercept) & -0.5530505 & 0.07689347 & -7.192424 & 6.365087e-13\\\\\n",
       "\tParch &  0.2033171 & 0.08461546 &  2.402836 & 1.626847e-02\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A matrix: 2 × 4 of type dbl\n",
       "\n",
       "| <!--/--> | Estimate | Std. Error | z value | Pr(&gt;|z|) |\n",
       "|---|---|---|---|---|\n",
       "| (Intercept) | -0.5530505 | 0.07689347 | -7.192424 | 6.365087e-13 |\n",
       "| Parch |  0.2033171 | 0.08461546 |  2.402836 | 1.626847e-02 |\n",
       "\n"
      ],
      "text/plain": [
       "            Estimate   Std. Error z value   Pr(>|z|)    \n",
       "(Intercept) -0.5530505 0.07689347 -7.192424 6.365087e-13\n",
       "Parch        0.2033171 0.08461546  2.402836 1.626847e-02"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".dl-inline {width: auto; margin:0; padding: 0}\n",
       ".dl-inline>dt, .dl-inline>dd {float: none; width: auto; display: inline-block}\n",
       ".dl-inline>dt::after {content: \":\\0020\"; padding-right: .5ex}\n",
       ".dl-inline>dt:not(:first-of-type) {padding-left: .5ex}\n",
       "</style><dl class=dl-inline><dt>(Intercept)</dt><dd>0.575192527295791</dd><dt>Parch</dt><dd>1.22546098130117</dd></dl>\n"
      ],
      "text/latex": [
       "\\begin{description*}\n",
       "\\item[(Intercept)] 0.575192527295791\n",
       "\\item[Parch] 1.22546098130117\n",
       "\\end{description*}\n"
      ],
      "text/markdown": [
       "(Intercept)\n",
       ":   0.575192527295791Parch\n",
       ":   1.22546098130117\n",
       "\n"
      ],
      "text/plain": [
       "(Intercept)       Parch \n",
       "  0.5751925   1.2254610 "
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
       "\t<tr><th scope=row>(Intercept)</th><td>0.4941937</td><td>0.6681342</td></tr>\n",
       "\t<tr><th scope=row>Parch</th><td>1.0388432</td><td>1.4493761</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A matrix: 2 × 2 of type dbl\n",
       "\\begin{tabular}{r|ll}\n",
       "  & 2.5 \\% & 97.5 \\%\\\\\n",
       "\\hline\n",
       "\t(Intercept) & 0.4941937 & 0.6681342\\\\\n",
       "\tParch & 1.0388432 & 1.4493761\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A matrix: 2 × 2 of type dbl\n",
       "\n",
       "| <!--/--> | 2.5 % | 97.5 % |\n",
       "|---|---|---|\n",
       "| (Intercept) | 0.4941937 | 0.6681342 |\n",
       "| Parch | 1.0388432 | 1.4493761 |\n",
       "\n"
      ],
      "text/plain": [
       "            2.5 %     97.5 %   \n",
       "(Intercept) 0.4941937 0.6681342\n",
       "Parch       1.0388432 1.4493761"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A matrix: 2 × 4 of type dbl</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>Estimate</th><th scope=col>Std. Error</th><th scope=col>z value</th><th scope=col>Pr(&gt;|z|)</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>(Intercept)</th><td>-0.94132990</td><td>0.095129144</td><td>-9.895284</td><td>4.363702e-23</td></tr>\n",
       "\t<tr><th scope=row>Fare</th><td> 0.01519687</td><td>0.002231678</td><td> 6.809614</td><td>9.786127e-12</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A matrix: 2 × 4 of type dbl\n",
       "\\begin{tabular}{r|llll}\n",
       "  & Estimate & Std. Error & z value & Pr(>\\textbar{}z\\textbar{})\\\\\n",
       "\\hline\n",
       "\t(Intercept) & -0.94132990 & 0.095129144 & -9.895284 & 4.363702e-23\\\\\n",
       "\tFare &  0.01519687 & 0.002231678 &  6.809614 & 9.786127e-12\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A matrix: 2 × 4 of type dbl\n",
       "\n",
       "| <!--/--> | Estimate | Std. Error | z value | Pr(&gt;|z|) |\n",
       "|---|---|---|---|---|\n",
       "| (Intercept) | -0.94132990 | 0.095129144 | -9.895284 | 4.363702e-23 |\n",
       "| Fare |  0.01519687 | 0.002231678 |  6.809614 | 9.786127e-12 |\n",
       "\n"
      ],
      "text/plain": [
       "            Estimate    Std. Error  z value   Pr(>|z|)    \n",
       "(Intercept) -0.94132990 0.095129144 -9.895284 4.363702e-23\n",
       "Fare         0.01519687 0.002231678  6.809614 9.786127e-12"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".dl-inline {width: auto; margin:0; padding: 0}\n",
       ".dl-inline>dt, .dl-inline>dd {float: none; width: auto; display: inline-block}\n",
       ".dl-inline>dt::after {content: \":\\0020\"; padding-right: .5ex}\n",
       ".dl-inline>dt:not(:first-of-type) {padding-left: .5ex}\n",
       "</style><dl class=dl-inline><dt>(Intercept)</dt><dd>0.390108686435372</dd><dt>Fare</dt><dd>1.01531292542392</dd></dl>\n"
      ],
      "text/latex": [
       "\\begin{description*}\n",
       "\\item[(Intercept)] 0.390108686435372\n",
       "\\item[Fare] 1.01531292542392\n",
       "\\end{description*}\n"
      ],
      "text/markdown": [
       "(Intercept)\n",
       ":   0.390108686435372Fare\n",
       ":   1.01531292542392\n",
       "\n"
      ],
      "text/plain": [
       "(Intercept)        Fare \n",
       "  0.3901087   1.0153129 "
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
       "\t<tr><th scope=row>(Intercept)</th><td>0.3228641</td><td>0.4688783</td></tr>\n",
       "\t<tr><th scope=row>Fare</th><td>1.0110823</td><td>1.0199700</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A matrix: 2 × 2 of type dbl\n",
       "\\begin{tabular}{r|ll}\n",
       "  & 2.5 \\% & 97.5 \\%\\\\\n",
       "\\hline\n",
       "\t(Intercept) & 0.3228641 & 0.4688783\\\\\n",
       "\tFare & 1.0110823 & 1.0199700\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A matrix: 2 × 2 of type dbl\n",
       "\n",
       "| <!--/--> | 2.5 % | 97.5 % |\n",
       "|---|---|---|\n",
       "| (Intercept) | 0.3228641 | 0.4688783 |\n",
       "| Fare | 1.0110823 | 1.0199700 |\n",
       "\n"
      ],
      "text/plain": [
       "            2.5 %     97.5 %   \n",
       "(Intercept) 0.3228641 0.4688783\n",
       "Fare        1.0110823 1.0199700"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# model 1's predictor: sex\n",
    "model1 <- glm(Survived ~ Sex, data = titanic, family = binomial)\n",
    "summary(model1)$coef\n",
    "\n",
    "exp(coefficients(model1))\n",
    "exp(confint(model1))\n",
    "\n",
    "# model 2's predictor: age\n",
    "model2 <- glm(Survived ~ Age, data = titanic, family = binomial)\n",
    "summary(model2)$coef\n",
    "\n",
    "exp(coefficients(model2))\n",
    "exp(confint(model2))\n",
    "\n",
    "# model 3's predictor: # of siblings / spouses aboard the Titanic\n",
    "model3 <- glm(Survived ~ SibSp, data = titanic, family = binomial)\n",
    "summary(model3)$coef\n",
    "\n",
    "exp(coefficients(model3))\n",
    "exp(confint(model3))\n",
    "\n",
    "# model 4's predictor: # of parents / children aboard the Titanic\n",
    "model4 <- glm(Survived ~ Parch, data = titanic, family = binomial)\n",
    "summary(model4)$coef\n",
    "\n",
    "exp(coefficients(model4))\n",
    "exp(confint(model4))\n",
    "\n",
    "# model 5'predictor: Passenger Fare\n",
    "model5 <- glm(Survived ~ Fare, data = titanic, family = binomial)\n",
    "summary(model5)$coef\n",
    "\n",
    "exp(coefficients(model5))\n",
    "exp(confint(model5))"
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
   "duration": 18.93572,
   "end_time": "2022-04-05T11:52:50.275193",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2022-04-05T11:52:31.339473",
   "version": "2.3.3"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
