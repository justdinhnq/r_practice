{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "c5081792",
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "execution": {
     "iopub.execute_input": "2022-04-10T17:30:17.473684Z",
     "iopub.status.busy": "2022-04-10T17:30:17.469675Z",
     "iopub.status.idle": "2022-04-10T17:30:20.734979Z",
     "shell.execute_reply": "2022-04-10T17:30:20.734209Z"
    },
    "papermill": {
     "duration": 3.328167,
     "end_time": "2022-04-10T17:30:20.735136",
     "exception": false,
     "start_time": "2022-04-10T17:30:17.406969",
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
      "\n",
      "Loading required package: lattice\n",
      "\n",
      "\n",
      "Attaching package: ‘caret’\n",
      "\n",
      "\n",
      "The following object is masked from ‘package:purrr’:\n",
      "\n",
      "    lift\n",
      "\n",
      "\n",
      "The following object is masked from ‘package:httr’:\n",
      "\n",
      "    progress\n",
      "\n",
      "\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "'cusersmarildownloadsgermancsv'"
      ],
      "text/latex": [
       "'cusersmarildownloadsgermancsv'"
      ],
      "text/markdown": [
       "'cusersmarildownloadsgermancsv'"
      ],
      "text/plain": [
       "[1] \"cusersmarildownloadsgermancsv\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "library(tidyverse) # metapackage of all tidyverse packages\n",
    "library(rsample)\n",
    "\n",
    "library(class)\n",
    "library(caret)\n",
    "\n",
    "list.files(path = \"../input\")\n",
    "\n",
    "# ref: https://www.edureka.co/blog/knn-algorithm-in-r/#Practical%20Implementation%20Of%20KNN%20Algorithm%20In%20R\n",
    "# dataset: https://www.kaggle.com/code/gauravduttakiit/creditability-prediction-eda"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "69a0f60e",
   "metadata": {
    "papermill": {
     "duration": 0.062551,
     "end_time": "2022-04-10T17:30:20.864792",
     "exception": false,
     "start_time": "2022-04-10T17:30:20.802241",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**7 steps:**\n",
    "1. Problem Statement\n",
    "2. Data Cleaning\n",
    "3. Data Normalization\n",
    "4. Data Splicing\n",
    "5. building a ML model\n",
    "6. Model evaluation\n",
    "7. Optimization"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "e0b5d47b",
   "metadata": {
    "papermill": {
     "duration": 0.063448,
     "end_time": "2022-04-10T17:30:20.990744",
     "exception": false,
     "start_time": "2022-04-10T17:30:20.927296",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "#### 1. Problem Statement\n",
    "\n",
    "To study a bank credit dataset and build a Machine Learning model that predicts whether an applicant’s loan can be approved or not based on his socio-economic profile.\n",
    "\n",
    "**Logic:**\n",
    "\n",
    "This problem statement can be solved using the KNN algorithm that will classify the applicant’s loan request into two classes:\n",
    "\n",
    "1. Approved\n",
    "2. Disapproved"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "9316f9d2",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-10T17:30:21.152439Z",
     "iopub.status.busy": "2022-04-10T17:30:21.121107Z",
     "iopub.status.idle": "2022-04-10T17:30:21.204928Z",
     "shell.execute_reply": "2022-04-10T17:30:21.203266Z"
    },
    "papermill": {
     "duration": 0.150768,
     "end_time": "2022-04-10T17:30:21.205081",
     "exception": false,
     "start_time": "2022-04-10T17:30:21.054313",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "'data.frame':\t1000 obs. of  21 variables:\n",
      " $ Creditability                    : int  1 1 1 1 1 1 1 1 1 1 ...\n",
      " $ Account_Balance                  : int  1 1 2 1 1 1 1 1 4 2 ...\n",
      " $ Duration_of_Credit_monthly       : int  18 9 12 12 12 10 8 6 18 24 ...\n",
      " $ Payment_Status_of_Previous_Credit: int  4 4 2 4 4 4 4 4 4 2 ...\n",
      " $ Purpose                          : int  2 0 9 0 0 0 0 0 3 3 ...\n",
      " $ Credit_Amount                    : int  1049 2799 841 2122 2171 2241 3398 1361 1098 3758 ...\n",
      " $ Value_Savings_Stocks             : int  1 1 2 1 1 1 1 1 1 3 ...\n",
      " $ Length_of_current_employment     : int  2 3 4 3 3 2 4 2 1 1 ...\n",
      " $ Instalment_per_cent              : int  4 2 2 3 4 1 1 2 4 1 ...\n",
      " $ Sex_Marital_Status               : int  2 3 2 3 3 3 3 3 2 2 ...\n",
      " $ Guarantors                       : int  1 1 1 1 1 1 1 1 1 1 ...\n",
      " $ Duration_in_Current_address      : int  4 2 4 2 4 3 4 4 4 4 ...\n",
      " $ Most_valuable_available_asset    : int  2 1 1 1 2 1 1 1 3 4 ...\n",
      " $ Age_years                        : int  21 36 23 39 38 48 39 40 65 23 ...\n",
      " $ Concurrent_Credits               : int  3 3 3 3 1 3 3 3 3 3 ...\n",
      " $ Type_of_apartment                : int  1 1 1 1 2 1 2 2 2 1 ...\n",
      " $ No_of_Credits_at_this_Bank       : int  1 2 1 2 2 2 2 1 2 1 ...\n",
      " $ Occupation                       : int  3 3 2 2 2 2 2 2 1 1 ...\n",
      " $ No_of_dependents                 : int  1 2 1 2 1 2 1 2 1 1 ...\n",
      " $ Telephone                        : int  1 1 1 1 1 1 1 1 1 1 ...\n",
      " $ Foreign_Worker                   : int  1 1 1 2 2 2 2 2 1 1 ...\n"
     ]
    }
   ],
   "source": [
    "loan <- read.csv(\"../input/cusersmarildownloadsgermancsv/german.csv\", sep = \";\")\n",
    "str(loan)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "c7a53b13",
   "metadata": {
    "papermill": {
     "duration": 0.064254,
     "end_time": "2022-04-10T17:30:21.333165",
     "exception": false,
     "start_time": "2022-04-10T17:30:21.268911",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "#### 2. Data Cleaning\n",
    "- 21 predictor variables to decide where or not an applicant's loan must be approved.\n",
    "- Some are not essential in predicting the applicant's loan and must be removed because they will only increase the complexity of the ML model:\n",
    "    + Telephone, Concurrent_Credits, Duration_in_Current_address, Type_of_apartment, etc."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "f2e5c0c3",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-10T17:30:21.464635Z",
     "iopub.status.busy": "2022-04-10T17:30:21.463073Z",
     "iopub.status.idle": "2022-04-10T17:30:21.493002Z",
     "shell.execute_reply": "2022-04-10T17:30:21.491695Z"
    },
    "papermill": {
     "duration": 0.096666,
     "end_time": "2022-04-10T17:30:21.493130",
     "exception": false,
     "start_time": "2022-04-10T17:30:21.396464",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 8</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>Creditability</th><th scope=col>Account_Balance</th><th scope=col>Age_years</th><th scope=col>Sex_Marital_Status</th><th scope=col>Occupation</th><th scope=col>Purpose</th><th scope=col>Credit_Amount</th><th scope=col>Purpose.1</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>1</td><td>1</td><td>21</td><td>2</td><td>3</td><td>2</td><td>1049</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>1</td><td>1</td><td>36</td><td>3</td><td>3</td><td>0</td><td>2799</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>1</td><td>2</td><td>23</td><td>2</td><td>2</td><td>9</td><td> 841</td><td>9</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>1</td><td>1</td><td>39</td><td>3</td><td>2</td><td>0</td><td>2122</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>1</td><td>1</td><td>38</td><td>3</td><td>2</td><td>0</td><td>2171</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>1</td><td>1</td><td>48</td><td>3</td><td>2</td><td>0</td><td>2241</td><td>0</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 8\n",
       "\\begin{tabular}{r|llllllll}\n",
       "  & Creditability & Account\\_Balance & Age\\_years & Sex\\_Marital\\_Status & Occupation & Purpose & Credit\\_Amount & Purpose.1\\\\\n",
       "  & <int> & <int> & <int> & <int> & <int> & <int> & <int> & <int>\\\\\n",
       "\\hline\n",
       "\t1 & 1 & 1 & 21 & 2 & 3 & 2 & 1049 & 2\\\\\n",
       "\t2 & 1 & 1 & 36 & 3 & 3 & 0 & 2799 & 0\\\\\n",
       "\t3 & 1 & 2 & 23 & 2 & 2 & 9 &  841 & 9\\\\\n",
       "\t4 & 1 & 1 & 39 & 3 & 2 & 0 & 2122 & 0\\\\\n",
       "\t5 & 1 & 1 & 38 & 3 & 2 & 0 & 2171 & 0\\\\\n",
       "\t6 & 1 & 1 & 48 & 3 & 2 & 0 & 2241 & 0\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 8\n",
       "\n",
       "| <!--/--> | Creditability &lt;int&gt; | Account_Balance &lt;int&gt; | Age_years &lt;int&gt; | Sex_Marital_Status &lt;int&gt; | Occupation &lt;int&gt; | Purpose &lt;int&gt; | Credit_Amount &lt;int&gt; | Purpose.1 &lt;int&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 1 | 1 | 21 | 2 | 3 | 2 | 1049 | 2 |\n",
       "| 2 | 1 | 1 | 36 | 3 | 3 | 0 | 2799 | 0 |\n",
       "| 3 | 1 | 2 | 23 | 2 | 2 | 9 |  841 | 9 |\n",
       "| 4 | 1 | 1 | 39 | 3 | 2 | 0 | 2122 | 0 |\n",
       "| 5 | 1 | 1 | 38 | 3 | 2 | 0 | 2171 | 0 |\n",
       "| 6 | 1 | 1 | 48 | 3 | 2 | 0 | 2241 | 0 |\n",
       "\n"
      ],
      "text/plain": [
       "  Creditability Account_Balance Age_years Sex_Marital_Status Occupation Purpose\n",
       "1 1             1               21        2                  3          2      \n",
       "2 1             1               36        3                  3          0      \n",
       "3 1             2               23        2                  2          9      \n",
       "4 1             1               39        3                  2          0      \n",
       "5 1             1               38        3                  2          0      \n",
       "6 1             1               48        3                  2          0      \n",
       "  Credit_Amount Purpose.1\n",
       "1 1049          2        \n",
       "2 2799          0        \n",
       "3  841          9        \n",
       "4 2122          0        \n",
       "5 2171          0        \n",
       "6 2241          0        "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# narrow down 21 variables to 8 predictor variables\n",
    "necessary_predictors <- c(\n",
    "    'Creditability', 'Account_Balance', 'Age_years', \n",
    "    'Sex_Marital_Status', 'Occupation', 'Purpose', \n",
    "    'Credit_Amount', 'Purpose'\n",
    ")\n",
    "\n",
    "loan.subset <- loan[necessary_predictors]\n",
    "head(loan.subset)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "0107f019",
   "metadata": {
    "papermill": {
     "duration": 0.065346,
     "end_time": "2022-04-10T17:30:21.624004",
     "exception": false,
     "start_time": "2022-04-10T17:30:21.558658",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "#### 3. Data Normalization\n",
    "Notice the 'Credit_Amount' variable, its value scale is in 1000s, whereas the rest of the variables are in single digits or 2 digits."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "53fe74f6",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-10T17:30:21.762702Z",
     "iopub.status.busy": "2022-04-10T17:30:21.761050Z",
     "iopub.status.idle": "2022-04-10T17:30:21.796746Z",
     "shell.execute_reply": "2022-04-10T17:30:21.795223Z"
    },
    "papermill": {
     "duration": 0.10603,
     "end_time": "2022-04-10T17:30:21.796885",
     "exception": false,
     "start_time": "2022-04-10T17:30:21.690855",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 7</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>Account_Balance</th><th scope=col>Age_years</th><th scope=col>Sex_Marital_Status</th><th scope=col>Occupation</th><th scope=col>Purpose</th><th scope=col>Credit_Amount</th><th scope=col>Purpose.1</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>0.0000000</td><td>0.03571429</td><td>0.3333333</td><td>0.6666667</td><td>0.2</td><td>0.04396390</td><td>0.2</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>0.0000000</td><td>0.30357143</td><td>0.6666667</td><td>0.6666667</td><td>0.0</td><td>0.14025531</td><td>0.0</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>0.3333333</td><td>0.07142857</td><td>0.3333333</td><td>0.3333333</td><td>0.9</td><td>0.03251898</td><td>0.9</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>0.0000000</td><td>0.35714286</td><td>0.6666667</td><td>0.3333333</td><td>0.0</td><td>0.10300429</td><td>0.0</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>0.0000000</td><td>0.33928571</td><td>0.6666667</td><td>0.3333333</td><td>0.0</td><td>0.10570045</td><td>0.0</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>0.0000000</td><td>0.51785714</td><td>0.6666667</td><td>0.3333333</td><td>0.0</td><td>0.10955211</td><td>0.0</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 7\n",
       "\\begin{tabular}{r|lllllll}\n",
       "  & Account\\_Balance & Age\\_years & Sex\\_Marital\\_Status & Occupation & Purpose & Credit\\_Amount & Purpose.1\\\\\n",
       "  & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t1 & 0.0000000 & 0.03571429 & 0.3333333 & 0.6666667 & 0.2 & 0.04396390 & 0.2\\\\\n",
       "\t2 & 0.0000000 & 0.30357143 & 0.6666667 & 0.6666667 & 0.0 & 0.14025531 & 0.0\\\\\n",
       "\t3 & 0.3333333 & 0.07142857 & 0.3333333 & 0.3333333 & 0.9 & 0.03251898 & 0.9\\\\\n",
       "\t4 & 0.0000000 & 0.35714286 & 0.6666667 & 0.3333333 & 0.0 & 0.10300429 & 0.0\\\\\n",
       "\t5 & 0.0000000 & 0.33928571 & 0.6666667 & 0.3333333 & 0.0 & 0.10570045 & 0.0\\\\\n",
       "\t6 & 0.0000000 & 0.51785714 & 0.6666667 & 0.3333333 & 0.0 & 0.10955211 & 0.0\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 7\n",
       "\n",
       "| <!--/--> | Account_Balance &lt;dbl&gt; | Age_years &lt;dbl&gt; | Sex_Marital_Status &lt;dbl&gt; | Occupation &lt;dbl&gt; | Purpose &lt;dbl&gt; | Credit_Amount &lt;dbl&gt; | Purpose.1 &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|\n",
       "| 1 | 0.0000000 | 0.03571429 | 0.3333333 | 0.6666667 | 0.2 | 0.04396390 | 0.2 |\n",
       "| 2 | 0.0000000 | 0.30357143 | 0.6666667 | 0.6666667 | 0.0 | 0.14025531 | 0.0 |\n",
       "| 3 | 0.3333333 | 0.07142857 | 0.3333333 | 0.3333333 | 0.9 | 0.03251898 | 0.9 |\n",
       "| 4 | 0.0000000 | 0.35714286 | 0.6666667 | 0.3333333 | 0.0 | 0.10300429 | 0.0 |\n",
       "| 5 | 0.0000000 | 0.33928571 | 0.6666667 | 0.3333333 | 0.0 | 0.10570045 | 0.0 |\n",
       "| 6 | 0.0000000 | 0.51785714 | 0.6666667 | 0.3333333 | 0.0 | 0.10955211 | 0.0 |\n",
       "\n"
      ],
      "text/plain": [
       "  Account_Balance Age_years  Sex_Marital_Status Occupation Purpose\n",
       "1 0.0000000       0.03571429 0.3333333          0.6666667  0.2    \n",
       "2 0.0000000       0.30357143 0.6666667          0.6666667  0.0    \n",
       "3 0.3333333       0.07142857 0.3333333          0.3333333  0.9    \n",
       "4 0.0000000       0.35714286 0.6666667          0.3333333  0.0    \n",
       "5 0.0000000       0.33928571 0.6666667          0.3333333  0.0    \n",
       "6 0.0000000       0.51785714 0.6666667          0.3333333  0.0    \n",
       "  Credit_Amount Purpose.1\n",
       "1 0.04396390    0.2      \n",
       "2 0.14025531    0.0      \n",
       "3 0.03251898    0.9      \n",
       "4 0.10300429    0.0      \n",
       "5 0.10570045    0.0      \n",
       "6 0.10955211    0.0      "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# normalization\n",
    "normalize <- function(x) {\n",
    "    return ((x - min(x)) / (max(x) - min(x)))\n",
    "}\n",
    "\n",
    "# storing the normalized dataset\n",
    "# removing the 'Creditability' variable since it's the response variable that needs to be predicted.\n",
    "loan_norm <- as.data.frame(\n",
    "    lapply(loan.subset[, 2:8], normalize)\n",
    ")\n",
    "\n",
    "head(loan_norm)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "b40076d9",
   "metadata": {
    "papermill": {
     "duration": 0.070396,
     "end_time": "2022-04-10T17:30:21.934667",
     "exception": false,
     "start_time": "2022-04-10T17:30:21.864271",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "#### 4. Data Splicing\n",
    "Splitting the dataset into training and testing dataset."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "1b89c467",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-10T17:30:22.079484Z",
     "iopub.status.busy": "2022-04-10T17:30:22.077882Z",
     "iopub.status.idle": "2022-04-10T17:30:22.101639Z",
     "shell.execute_reply": "2022-04-10T17:30:22.100197Z"
    },
    "papermill": {
     "duration": 0.097707,
     "end_time": "2022-04-10T17:30:22.101770",
     "exception": false,
     "start_time": "2022-04-10T17:30:22.004063",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "set.seed(123)\n",
    "\n",
    "# take sample by 70%\n",
    "sample <- sample(\n",
    "    x = 1:nrow(loan_norm),\n",
    "    size=nrow(loan_norm)*0.7,\n",
    "    replace = FALSE\n",
    ")\n",
    "\n",
    "training_data <- loan.subset[sample, ]\n",
    "testing_data <- loan.subset[-sample, ]\n",
    "\n",
    "train_classes <- loan.subset[sample, 1]\n",
    "test_classes <- loan.subset[-sample, 1]"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "5ee6807d",
   "metadata": {
    "papermill": {
     "duration": 0.069649,
     "end_time": "2022-04-10T17:30:22.239845",
     "exception": false,
     "start_time": "2022-04-10T17:30:22.170196",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "#### 5. Building a ML model using the KNN algorithm\n",
    "Step 1. find the optimal K value\n",
    "- the square root of the total number of observations will give the optimal K value\n",
    "\n",
    "Step 2. create a model"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "d0e16539",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-10T17:30:22.381581Z",
     "iopub.status.busy": "2022-04-10T17:30:22.380028Z",
     "iopub.status.idle": "2022-04-10T17:30:22.398748Z",
     "shell.execute_reply": "2022-04-10T17:30:22.397353Z"
    },
    "papermill": {
     "duration": 0.090746,
     "end_time": "2022-04-10T17:30:22.398883",
     "exception": false,
     "start_time": "2022-04-10T17:30:22.308137",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "total_rows <- nrow(training_data)  # input: dataframe\n",
    "sqrt <- sqrt(total_rows)\n",
    "\n",
    "num_up <- ceiling(sqrt) # k = 27\n",
    "num_down <- floor(sqrt) # k = 26"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "df3886b6",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-10T17:30:22.540164Z",
     "iopub.status.busy": "2022-04-10T17:30:22.538555Z",
     "iopub.status.idle": "2022-04-10T17:30:22.567163Z",
     "shell.execute_reply": "2022-04-10T17:30:22.565967Z"
    },
    "papermill": {
     "duration": 0.101158,
     "end_time": "2022-04-10T17:30:22.567309",
     "exception": false,
     "start_time": "2022-04-10T17:30:22.466151",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# cl: a list of classes\n",
    "# @return Factor of classifications of test set.\n",
    "knn_26_pred <- knn(\n",
    "    training_data, testing_data, cl = train_classes, k = num_up\n",
    ")\n",
    "\n",
    "knn_27_pred <- knn(\n",
    "    training_data, testing_data, cl = train_classes, k = num_down\n",
    ")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "2cb996d6",
   "metadata": {
    "papermill": {
     "duration": 0.070657,
     "end_time": "2022-04-10T17:30:22.707186",
     "exception": false,
     "start_time": "2022-04-10T17:30:22.636529",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "#### 6. Model Evaluation\n",
    "\n",
    "calculating the accuracy of the models:"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "146d3036",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-10T17:30:22.852870Z",
     "iopub.status.busy": "2022-04-10T17:30:22.851875Z",
     "iopub.status.idle": "2022-04-10T17:30:22.878487Z",
     "shell.execute_reply": "2022-04-10T17:30:22.876986Z"
    },
    "papermill": {
     "duration": 0.101607,
     "end_time": "2022-04-10T17:30:22.878616",
     "exception": false,
     "start_time": "2022-04-10T17:30:22.777009",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "69"
      ],
      "text/latex": [
       "69"
      ],
      "text/markdown": [
       "69"
      ],
      "text/plain": [
       "[1] 69"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "68.6666666666667"
      ],
      "text/latex": [
       "68.6666666666667"
      ],
      "text/markdown": [
       "68.6666666666667"
      ],
      "text/plain": [
       "[1] 68.66667"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "accuracy_26 <- 100 * sum(knn_26_pred == test_classes)/NROW(test_classes)\n",
    "accuracy_27 <- 100 * sum(knn_27_pred == test_classes)/NROW(test_classes)\n",
    "\n",
    "accuracy_26   # 69: better \n",
    "accuracy_27   # 68.67"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "8707af26",
   "metadata": {
    "papermill": {
     "duration": 0.074138,
     "end_time": "2022-04-10T17:30:23.027102",
     "exception": false,
     "start_time": "2022-04-10T17:30:22.952964",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**OR** even using the confusion matrix:"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "ffd778fd",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-10T17:30:23.184327Z",
     "iopub.status.busy": "2022-04-10T17:30:23.183669Z",
     "iopub.status.idle": "2022-04-10T17:30:23.252086Z",
     "shell.execute_reply": "2022-04-10T17:30:23.250536Z"
    },
    "papermill": {
     "duration": 0.149349,
     "end_time": "2022-04-10T17:30:23.252212",
     "exception": false,
     "start_time": "2022-04-10T17:30:23.102863",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "Confusion Matrix and Statistics\n",
       "\n",
       "           test_classes\n",
       "knn_26_pred   0   1\n",
       "          0   8   6\n",
       "          1  87 199\n",
       "                                          \n",
       "               Accuracy : 0.69            \n",
       "                 95% CI : (0.6343, 0.7419)\n",
       "    No Information Rate : 0.6833          \n",
       "    P-Value [Acc > NIR] : 0.4291          \n",
       "                                          \n",
       "                  Kappa : 0.0712          \n",
       "                                          \n",
       " Mcnemar's Test P-Value : <2e-16          \n",
       "                                          \n",
       "            Sensitivity : 0.08421         \n",
       "            Specificity : 0.97073         \n",
       "         Pos Pred Value : 0.57143         \n",
       "         Neg Pred Value : 0.69580         \n",
       "             Prevalence : 0.31667         \n",
       "         Detection Rate : 0.02667         \n",
       "   Detection Prevalence : 0.04667         \n",
       "      Balanced Accuracy : 0.52747         \n",
       "                                          \n",
       "       'Positive' Class : 0               \n",
       "                                          "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "table_26 <- table(knn_26_pred, test_classes)\n",
    "confusionMatrix(table_26)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "e3a2de3c",
   "metadata": {
    "papermill": {
     "duration": 0.074664,
     "end_time": "2022-04-10T17:30:23.401181",
     "exception": false,
     "start_time": "2022-04-10T17:30:23.326517",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "So, from the output, we can see that our model predicts the outcome with an accuracy of 69% which is good since we worked with a small data set. \n",
    "\n",
    "A point to remember is that the more data (optimal data) you feed the machine, the more efficient the model will be."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "06686f36",
   "metadata": {
    "papermill": {
     "duration": 0.075913,
     "end_time": "2022-04-10T17:30:23.552273",
     "exception": false,
     "start_time": "2022-04-10T17:30:23.476360",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "#### 7. Optimization"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "aee85f1d",
   "metadata": {
    "papermill": {
     "duration": 0.074788,
     "end_time": "2022-04-10T17:30:23.702221",
     "exception": false,
     "start_time": "2022-04-10T17:30:23.627433",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "In order to improve the accuracy of the model, you can use a number of techniques such as Elbow method and maximum percentage graph.\n",
    "\n",
    "Now, with K values ranging from 1 to 28, you can check which K value will result in the most accurate model."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "602db179",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-10T17:30:23.858218Z",
     "iopub.status.busy": "2022-04-10T17:30:23.856937Z",
     "iopub.status.idle": "2022-04-10T17:30:23.989438Z",
     "shell.execute_reply": "2022-04-10T17:30:23.987418Z"
    },
    "papermill": {
     "duration": 0.212728,
     "end_time": "2022-04-10T17:30:23.989685",
     "exception": false,
     "start_time": "2022-04-10T17:30:23.776957",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "[1] \"Accuracy score with (k =  1 ):  56\"\n",
      "[1] \"Accuracy score with (k =  2 ):  56\"\n",
      "[1] \"Accuracy score with (k =  3 ):  59.3333333333333\"\n",
      "[1] \"Accuracy score with (k =  4 ):  62\"\n",
      "[1] \"Accuracy score with (k =  5 ):  63\"\n",
      "[1] \"Accuracy score with (k =  6 ):  64.3333333333333\"\n",
      "[1] \"Accuracy score with (k =  7 ):  65\"\n",
      "[1] \"Accuracy score with (k =  8 ):  66.6666666666667\"\n",
      "[1] \"Accuracy score with (k =  9 ):  67\"\n",
      "[1] \"Accuracy score with (k =  10 ):  67.6666666666667\"\n",
      "[1] \"Accuracy score with (k =  11 ):  66.6666666666667\"\n",
      "[1] \"Accuracy score with (k =  12 ):  67.6666666666667\"\n",
      "[1] \"Accuracy score with (k =  13 ):  68\"\n",
      "[1] \"Accuracy score with (k =  14 ):  68.6666666666667\"\n",
      "[1] \"Accuracy score with (k =  15 ):  67.3333333333333\"\n",
      "[1] \"Accuracy score with (k =  16 ):  68\"\n",
      "[1] \"Accuracy score with (k =  17 ):  69\"\n",
      "[1] \"Accuracy score with (k =  18 ):  68.3333333333333\"\n",
      "[1] \"Accuracy score with (k =  19 ):  69\"\n",
      "[1] \"Accuracy score with (k =  20 ):  69\"\n",
      "[1] \"Accuracy score with (k =  21 ):  68.6666666666667\"\n",
      "[1] \"Accuracy score with (k =  22 ):  68.6666666666667\"\n",
      "[1] \"Accuracy score with (k =  23 ):  68.6666666666667\"\n",
      "[1] \"Accuracy score with (k =  24 ):  68.6666666666667\"\n",
      "[1] \"Accuracy score with (k =  25 ):  68.6666666666667\"\n",
      "[1] \"Accuracy score with (k =  26 ):  69\"\n",
      "[1] \"Accuracy score with (k =  27 ):  69\"\n",
      "[1] \"Accuracy score with (k =  28 ):  69\"\n"
     ]
    }
   ],
   "source": [
    "getAccuracy <- function(x) {\n",
    "    knn_pred <- knn(\n",
    "        train = training_data,\n",
    "        test = testing_data,\n",
    "        cl = train_classes,\n",
    "        k = x\n",
    "    )\n",
    "    accuracy <- 100 * sum(test_classes == knn_pred)/NROW(test_classes)\n",
    "    \n",
    "    print(paste(\"Accuracy score with (k = \", x, \"): \", accuracy))\n",
    "    \n",
    "    return(accuracy)\n",
    "}\n",
    "\n",
    "optimal_list <- 1\n",
    "for (i in 1:28) {\n",
    "    accuracy <- getAccuracy(i)\n",
    "    optimal_list[i] <- accuracy\n",
    "}"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "5de3cd40",
   "metadata": {
    "papermill": {
     "duration": 0.077451,
     "end_time": "2022-04-10T17:30:24.145057",
     "exception": false,
     "start_time": "2022-04-10T17:30:24.067606",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "From the output you can see that for K = 17, we achie the maximum accuracy, i.e. 69%.\n",
    "\n",
    "We can also represent this graphically:"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "id": "c34db7a5",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-10T17:30:24.300495Z",
     "iopub.status.busy": "2022-04-10T17:30:24.298649Z",
     "iopub.status.idle": "2022-04-10T17:30:24.508317Z",
     "shell.execute_reply": "2022-04-10T17:30:24.507125Z"
    },
    "papermill": {
     "duration": 0.28803,
     "end_time": "2022-04-10T17:30:24.508438",
     "exception": false,
     "start_time": "2022-04-10T17:30:24.220408",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "iVBORw0KGgoAAAANSUhEUgAAA0gAAANICAIAAAByhViMAAAABmJLR0QA/wD/AP+gvaeTAAAg\nAElEQVR4nOzdeUBN6eMG8PcubdpL0aLFMtmV0VAmZAlFsmYnRWPPvkwhSYwthojJXvxQEYUx\nY42ylpSsiShtWnXb7r2/P+58G1OpW917z72n5/PXOOf0nqcp9TjL+zL4fD4BAAAAANnHpDoA\nAAAAAIgGih0AAAAATaDYAQAAANAEih0AAAAATaDYAQAAANAEih0AAAAATaDYAQAAANAEih0A\nAAAATaDYAQAAANAEih0AAAAATaDYAQAAANAEih0AAAAATaDYAQAAANAEih0AAAAATaDYAQAA\nANAEih0AAAAATaDYAQAAANAEih0AAAAATaDYAQAAANAEih0AAAAATaDYAQAAANAEih0AAAAA\nTaDYAQAAANAEih0AAAAATaDYAQAAANAEih0AAAAATaDYAQAAANAEih0AAAAATaDYAQAAANAE\nih0AAAAATaDYAQAAANAEih0AAAAATaDYAQAAANAEih0AAAAATaDYAQAAANAEih0AAAAATaDY\nAQAAANAEih0AAAAATaDYAQAAANAEih0AAAAATaDYAQAAANAEih0AAAAATaDYAQAAANAEih0A\nAAAATaDYAQAAANAEih0AAAAATaDYAQAAANAEih0AAAAATaDYAQAAANAEih0AAAAATaDYAQAA\nANAEih0AAAAATaDYAQAAANAEih0AAAAATaDYAQAAANAEih0AAAAATaDYAQAAANAEih0AAAAA\nTaDYAQAAANAEih0AAAAATaDYAQAAANAEih0AAAAATaDYAQAAANAEih0AAAAATaDYAQAAANAE\nih0AAAAATaDYAQAAANAEih0AAAAATaDYAQAAANAEih0AAAAATaDYAQAAANAEih0AAAAATaDY\nAQAAANAEih0AAAAATaDYAQAAANAEih0AAAAATaDYAQAAANAEih0AAAAATaDYAQAAANAEih0A\nAAAATaDYAQAAANAEih0AAAAATaDYAQAAANAEih0AAAAATaDYAQAAANAEih0AAAAATaDYAQAA\nANAEih0AAAAATaDYAQAAANAEih0AAAAATaDYAQAAANAEih0AAAAATaDYAQAAANAEih0AAAAA\nTaDYAQAAANAEih0AAAAATbCpDiADCgoKjh07xuFwqA4CAAAAUkFJSWnGjBnq6upUB6kOxa5+\n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\nXLmy7nXPzpw58/z5861btw4ZMkRiwQCgGcIVO4BmYfDgwYMHD6Y6xT/09PS2bNmyZcsWqoNI\nzqRJk0xMTAYOHEh1EACgOVyxAwAQOyUlJbQ6AJAAFDsAerp3757EZh4GAAApgWIHQEORkZE2\nNjZ+fn71HsnhcISfXLeJysrKvn79KplzSV5WVtbatWs7d+6spKSkpqZmY2Nz6NChyspKqnMB\nQPOCYgdANy9fvpwyZYqWlpaHh0e9B48dO9bKykoyy8Xa2dnR9Xbk/fv3u3Xr5ufn9/Xr1yFD\nhvTu3TshIWHOnDkDBgzIz8+nOh0ANCModgC0UlRUNGbMmK9fv545c0aYVRx++umnhISEo0eP\nijvY+fPnb9++/dNPP4n7RJKXnZ09YsQIDodz+vTp1NTUiIiIa9eupaenL1u27O7du1OnTqU6\nIAA0Iyh2APTB4/GmTJny/PnzHTt22NraCvMhy5cvb9Wq1bp168R6Q5bL5f76668qKiqenp7i\nOwtVdu7cmZOTc/jwYWdn56r1JJSVlbdv3z5jxozIyMi7d+9SmxAAmg8UOwD6WL9+/cWLF6dN\nm7Zo0SIhP0RFRWXt2rXp6el79+4VX7AjR448f/582bJlrVq1Et9ZqHLx4kUjI6OxY8fW3LV0\n6VJCyKVLlyQeCgCaKRQ7AJo4f/68r6+vhYWFkOuWVpk7d267du38/Py+fPkijmClpaUbN27U\n0dERtBz6SUtL69y5c61rv3bq1InBYHz48EHyqQCgeUKxA6CD5OTkGTNm6OrqRkREKCkpNehj\n5eTkvL298/Pzt27dKo5su3fvTktL8/LyousCqQoKCqWlpbXuKisr4/P5CgoKEo4EAM0Wih2A\nzMvLy3N0dORwOGfOnKl7xdLvmTx5cs+ePffs2ZOWlibabPn5+b/99pupqemcOXNEO7L06Nq1\n66NHj4qLi2vuunnzpuAASWcCgOYKxQ5AtglemHjz5s3vv//er1+/xg3CYDA2b95cWlrq7e0t\n2nibN2/+8uWLr68vja9aTZs2rbi4eM2aNdW2FxUVrV27VlFRcfz48ZQEA4BmCMUOQLatWrXq\n8uXLv/zyi7u7e1PGGTp06KBBg44ePZqUlCSqbJ8+fdq3b1+PHj2cnZ1FNaYUmj59uq2t7d69\ne8eOHRsTE1NaWpqXlxcaGtqnT59nz575+Pi0adOG6owA0Fyg2AHIsLNnz27fvr1v3767d+9u\n+mhbtmzh8XginJFEMIvKb7/9xmTS+UcNi8U6f/68s7NzWFiYtbW1kpKSlpbWuHHjUlJSduzY\nsXz5cqoDAkAzwqY6AAA0XlxcnKmp6blz5+Tl5Zs+Wq9evcaNG3f27Nm7d+/27du3iaO9fPny\n+PHj/fv3t7Oza3o2Kaempnb69OnVq1efP3/+7du38vLy5ubmEyZMoOX0LgAgzVDsAGTY5s2b\nN2/eLMIBfX19z58/v3r16jt37jRxqFWrVnG53C1btogkmEwwNzc3NzenOgUANGt0vj8CAA3V\noUMHV1fX6OjoixcvNmWc+/fvR0REjB8/vk+fPqLKBgAA9UKxA5B2PB4vISHhr7/+iomJ4XA4\n4j6dt7e3qqrqypUrKysrGz3I6tWrWSyWyN+xBQCAuqHYAUgvHo+3a9cuAwODHj16DBkyxNra\nWltbe/78+QUFBeI7qa6u7qJFi168eHHy5MnGjRAREXHz5s3Zs2d37NhRtNkAAKBuKHYAUorH\n402aNGnp0qWKioq//vprYGDg1q1bzc3NAwIC+vTpk52dLb5Tr1q1SldX19PTsxEXCLlc7tq1\na5WVlb28vMSRDQAA6oBiByClAgMDz5w5M2HChOTk5E2bNs2ZM2flypX37t3btWvXixcv5s2b\nJ75Tq6qqrl69+tOnTwEBAQ392OPHjyclJS1ZskRPT08c2QAAoA4odgBSaufOnfr6+kePHlVU\nVPx2u4eHx5gxY0JDQ8W6tPz8+fPbtm3r6+ubl5cn/EeVlpZu2LChZcuWmLwNAIASKHYA0ig9\nPf3NmzejRo1SUlKquXfixIl8Pr/pM5LUQV5efv369Xl5edu3bxf+o/bu3fvhw4dff/1VXV1d\nfNkAAOB7UOwApFFOTg4hRF9fv9a9BgYGVceIz9SpU83NzXft2vXx40dhjs/Pz9+yZYuxsfHc\nuXPFGgwAAL4HxQ5AGmlpaRFCsrKyat2bmZlJCNHU1BRrBiaTuWnTJg6H4+PjI8zxW7duzc3N\n9fHxUVBQEGswAAD4HhQ7AGlkYGBgbGwcERFRVlZWc++5c+cIIU1f9ateDg4Otra2QUFBycnJ\ndR+Znp6+Z8+ebt26TZkyRdypAADge1DsAKQRg8FYtGjR+/fv58+fX22i4KNHj546dcrBwaFd\nu3YSSLJlyxYej1fv3CUbNmwoKSnZsmULk4mfKgAAlMFasQBSauHChX/99VdQUND9+/dnzpxp\namqam5sbHh5++fJlY2PjwMBAycT46aefnJycwsLC0tLS2rRpU+sxRUVFR44c6devn729vWRS\nAQBArVDsAKSUnJzchQsXfH19d+3aVTV7CIvFmjRpkr+/v66ursSS7N27d8iQId97k4MQoqKi\ncuDAgYEDB0osEgAA1ArFDoB6JSUlGzduPHny5K1bt769wSonJ7dhw4ZVq1Y9ePDg8+fPampq\nlpaWLVu2lHA8fX39ul90ZTAYrq6uEssDAADfg2IHQLFLly4tXLgwNTX1p59+ErwMW42SklL/\n/v0lHwwAAGQOHnMGoJK3t/fIkSPz8vL27t0bExMj7hlMAACA3nDFDkBc0tLSIiIi3rx5w2Qy\nu3bt6ujoqK2tXe0YU1NTNze3jRs3ysrKqtnZ2REREc+fP+fxeGZmZo6OjnU8ewcAABKGYgcg\nehUVFWvWrNmzZ09FRUXVRmVl5U2bNnl4eHx75PTp06dPny7xgI3B5/O3bt26ceNGDodTtXHx\n4sUrVqzw9vZmsVgUZgMAAAHcigUQPVdX1x07dvTq1Ss8PPzjx4/v3r07fvy4oaHhkiVLfH19\nqU7XSL/++uuaNWvatWsXEhKSmpqalpZ27ty57t27+/r6LliwgOp0AABACK7YAYjcn3/+eeLE\niVGjRoWGhlZdxzIxMRk9enT//v29vb0nTJjQoUMHakM21LNnz3777TcrK6u///5bSUlJsNHQ\n0NDR0XHkyJEHDhyYMmXKzz//TG1IAADAFTsAETty5AiTydy7d2+1u5MqKio7d+6sqKg4efIk\nVdka7fjx41wud/fu3VWtTkBOTm7v3r0MBuPo0aMURQMAgH+h2AGI2NOnTzt16mRoaFhzl42N\njYKCQkJCguRTNdHTp0/V1dUtLS1r7mrfvr2xsfHTp08lnwoAAKpBsQMQMQ6Ho6ysXOsuJpOp\npKRUUlIi4UhNV1JS8r1PihCioqIii58UAAD9oNgBiJiBgcHbt2+5XG7NXZ8/f87Pz6/1Yp6U\nMzQ0zMrKys/Pr7mrrKwsNTVVFj8pAAD6QbEDEDF7e/vc3NyQkJCau/bt20cIGT58uMRDNZW9\nvX1lZeX+/ftr7jp69GhxcbEsflIAAPSDYgcgYvPmzWvVqtXcuXPDwsKqNnK53N9//93Pz8/C\nwmL06NEUxmucSZMmderUad26dQcPHuTxeIKNfD7/1KlTS5YsMTIymj17NrUJAQCAYLoTAJHT\n0NC4ePGig4PD2LFjO3bsaGlpWVlZGR0dnZaW1r59+/Pnz8viXL5ycnIRERGDBw92d3f38/Oz\ntrZmMpn3799//fp169atL168WMcTeAAAIDG4YgcgepaWlgkJCR4eHsXFxSdOnDh16lSLFi02\nbNjw5MkTIyMjqtM1Uvv27ePj4z09PdlsdkhIyMmTJ8vLy5cvX56QkNC9e3eq0wEAACG4Ygcg\nJq1bt961a9euXbs4HA6LxZKXl6c6kQhoaGj4+Pj4+PiUlZXx+XxFRUWqEwEAwH+g2AGIV7UZ\nfelBQUGB6ggAAFAL3IoFAAAAoAkUOwAAAACaQLEDEL3Kysrs7GyqUwAAQLODYgcgeitXrjQx\nMSkvL6c6CAAANC8odgAixuPx/u///s/Q0JAeb8ICAIAMQbEDELGYmJj09PTx48dTHQQAAJod\nFDsAEROsJDZmzBiqgwAAQLODYgcgYufPnzcxMbGwsKA6CAAANDsodgCi9OTJk5SUlDFjxjAY\nDKqzAABAs4NiByBKuA8LAAAUQrEDEKWwsLDWrVtbWVlRHQQAAJojWVwrlp+dVqzTRvV/f+Q9\nvRV5+/HzYp6CaWdL+6HWaizcAgNqPH/+PDk5ed68eUwm/skEAAAUkLFil/pnwPRF65L423Jf\nuhBCOFm3pg51DovPrDqghV7PnacuuffXoy4jNF+4DwsAANSSpWKXE7ej0/AV5QzlIa5tCCF8\nbpGzhcPF9K/dh8+cMKiXoRov8eHVvUFR84f00Ex9N0Ffmeq80OyEhYVpa2v379+f6iAAANBM\nyVKx2+vsW85o8UdsiksvHUJIRrTbxfSvPVdeerzV4Z8jZi9c4brPyHqhh3PYhDvTqMwKzU9q\namp8fLyLiwubLUt/rQAAgE5k6UmgfamFmj/sFrQ6QkhqSAIhJGid3bfH6Paev8NMK+fJFgry\nQfN27tw5Pp+P+7AAAEAhWSp2WmwmS6HqnQnClGcSQowUql8daaujyC3PkGgyAELCwsJUVVUH\nDRpEdRAAAGi+ZKnYeXTR/JK84n5BueCP7WbaEEI2Ps769hh+ZZ5vfI6S9ggK8kEz9unTp/v3\n748YMUJRUZHqLAAA0HzJUrGbHOwrV5k2sNPAfaF3Cip5Oj/uW9G39YGhI47cTBEcUJLxcImj\nxd3Csv7r1lAbFZqb8PBwHo+H+7AAAEAtWXrKW/0Ht7iz6QMnbVwwrt9iBY32HX9ora5fVvBo\nlm27RTpGhsplr99ncfn8vrP9L8ztRHVYaF7CwsKUlJSGDx9OdRAAAGjWZKnYEULMRq9LyRgX\nsDMg/OK1+OTHL8u5gu3F2R8ymMaDJrhPm7t8av92wg/I5XKjoqJKS0vrOCY1NZUQwuPxmhAc\n6Cw3N/fOnTsjR45UVsYkOwAAQCUZK3aEEAXNzkt89i7xIYRf8SUn5yungiWvqKyiqa4i14jR\nbty44ejoKMyR7969a8T40BycP3++srIS92EBAIByslfs/l1SjCGnpaOnRXhPb0WGNnZJMVtb\n24iIiLqv2AUEBNy8edPU1LTJyYGewsLC5OTkHBwc6j8UAABAnGSs2Il8STEWizVy5Mi6j4mK\niiKEYPVPqFVRUdH169cHDRqkqalJdRYAAGjuZKnYYUkxkEKCK75jx46lOggAAIBMFTssKQZS\nKCwsjMViCfmkJgAAgFjJ0u1FLCkG0qakpOTq1as2Nja6urpUZwEAAJCpYoclxUDaXL58+evX\nr3gfFgAApIQsFTssKQbSJiwsjMFgODk5UR0EAACAENkqdlhSDKRKRUVFVFRU796927RpQ3UW\nAAAAQmTr5QksKQZS5dq1a/n5+bgPCwAA0kOWrtiRf5YUS9jpOd+6o2568uNbt58Ithdnf8jg\nKA6a4H7i5pvog4vZDZiiGKCRwsLCCCEodgAAID1k6YqdgGiXFANoHC6XGxER0aNHj3btGrA2\nMQAAgFjJXrH71z9LigFQ4NatW9nZ2QsWLKA6CAAAwL9k7FYsgJQQ3IfFghMAACBVUOwAGozP\n51+4cKFDhw5dunShOgsAAMC/UOwAGiw2Nvbjx4/jxo2jOggAAMB/oNgBNBjuwwIAgHRCsQNo\nsPDwcGNj4549e1IdBAAA4D9Q7AAaJi4u7u3bt2PGjGEwMF8iAABIFxQ7gIbBvMQAACC1UOwA\nGiY0NLRVq1ZWVlZUBwEAAKgOxQ6gAV69epWcnDxmzBgWi0V1FgAAgOpQ7AAa4OzZswT3YQEA\nQFqh2AE0QFhYmIaGRv/+/akOAgAAUAsUOwBhpaamxsXFOTk5ycnJUZ0FAACgFih2AMIKDQ3l\n8/m4DwsAAFILxQ5AWGFhYSoqKkOGDKE6CAAAQO1Q7ACE8vnz59jY2BEjRigqKlKdBQAAoHYo\ndgBCCQsL4/F4uA8LAADSDMUOQCihoaGKiorDhg2jOggAAMB3odgB1C83N/f27dvDhg1TVVWl\nOgsAAMB3odgB1O/ChQuVlZW4DwsAAFIOxQ6gfuHh4XJyciNGjKA6CAAAQF1Q7ADql5KSMmzY\nME1NTaqDAAAA1IVNdQAAGRATEyMvL091CgAAgHqg2AHUT01NjeoIAAAA9cOtWAAAAACaQLED\nAAAAoAkUO4DacTic/Px8qlMAAAA0AIodwH+UlZVt3769S5cuLVq00NTU1NDQmDx5clJSEtW5\nAAAA6oeXJwD+lZeXZ2dn9+jRIz09vcmTJysrKyclJZ0+fTo8PPzYsWMTJkygOiAAAEBdUOwA\n/jVz5sxHjx55enp6eXlVzW/y8OHDsWPHTps2rVu3bp06daI2IQAAQB1wKxbgH3FxcREREVOn\nTvXx8fl21jpLS8uwsLDKysrNmzdTGA8AAKBeKHYA/7h8+TIhZO7cuTV39erVy9LS8urVqxIP\nBQAA0AAodgD/SE9PJ4R06NCh1r0dOnTIzs4uKyuTbCgAAIAGQLED+IeysjIhpKioqNa9RUVF\n8vLyWFgMAACkGYodwD/Mzc0JIX/++WfNXRwOJzo6ukePHgwGQ+K5AAAAhIViB/CPESNG6Orq\nent7v3///tvtfD5/xYoVubm5s2bNoiobAACAMFDsAP6hqqp64MCBrKwsS0vLnTt3JiYmfvjw\nITIyctiwYfv27Rs0aJCbmxvVGQEAAOqCeewA/jV69Ojw8PBffvll2bJlVRuZTKarq6u/vz+b\njb8vAAAg1fCLCuA/HB0dhw4devny5SdPnnA4HBMTk+HDh7dt25bqXAAAAPVDsQOoTkFBwcnJ\nycnJieogAAAADYNn7AAAAABoAsUOmruCgoJJkyZFR0dTHQQAAKCpUOygWePxeFOmTDl9+nRa\nWhrVWQAAAJoKxQ6aNS8vr8jIyGnTpk2aNInqLAAAAE2FYgfNV3h4uJ+fX8+ePQMDA6nOAgAA\nIAIodtBMJScnz5w5s1WrVhcuXFBSUqI6DgAAgAhguhNojr58+TJy5EgOh3Pp0iVDQ0Oq4wAA\nAIgGih00O1wud+rUqW/fvg0MDLSxsaE6DgAAgMjgViw0OytXrrx8+fLcuXPnzJlDdRYAAABR\nQrGD5iU4OHjnzp3W1tb+/v5UZwEAABAxFDtoRuLj4+fMmaOvr3/27Fl5eXmq4wAAAIgYih00\nF7m5uWPGjOHxeOfPn9fX16c6DgAAgOjh5QloLhYsWPDu3btjx45ZWlpSnQUAAEAsUOyguRg9\nerSNjc306dOpDgIAACAuKHbQXEyYMIHqCAAAAOKFZ+wAAAAAaAJX7IA+ysvLw8PDb926lZOT\no6WlZWNjM27cOAUFBapzAQAASAiKHdDE/fv3J06cmJqaWrUlMDBwzZo1wcHBWF4CAACaCdyK\nBTpISkqys7PLzs7+7bffPn78yOfz09PTd+3aVVBQMHz48Li4OKoDAgAASAKKHdDB0qVLS0pK\nrly5smLFCgMDA0KInp6eh4fH33//XVFRsWjRIqoDAgAASAKKHci8z58///XXX+PGjfv555+r\n7erVq9fUqVOjo6O/vUULAABAVyh2IPNevHjB4/H69etX617BA3bPnz+XbCgAAAAKoNiBzCsr\nKyOEfG/tV8FbseXl5RLNBAAAQAUUO5B5JiYmhJCkpKRa9yYmJhJCjI2NJRkJAACAEih2IPPM\nzMzMzMyOHTuWmZlZbdeXL1+CgoKMjIzMzc0pyQYAACBJKHZAB35+fnl5eUOGDHn69GnVRsEc\nKJmZmVu2bGEwGBTGAwAAkAz6FLtp06Yt3vyM6hRAjdGjR+/YsSM5OdnCwqJ79+729vbm5ubd\nu3ePi4vbvHnzpEmTqA4IAAAgCfQpdidPngy9lk51CqDMkiVLHj58OGPGjKKioujo6Pz8/ClT\npty/f3/NmjVURwMAAJAQWVpSLCXY/8SbgjoOKEoN9vaOFfz3+vXrJRIKpIi5ufmRI0eoTgEA\nAEAZWSp2H8J+3xCWUscBhaknNmz4579R7AAAAKC5kaVi1+/U3S3znFcH3VbUMt/0u2d75f+E\nd3Jy0u66PmiTBVXxAAAAAKglS8WOKd961R+37O23jp3h5bl4886Qs3OHtP32AMWWVqNGDaUq\nHgAAAAC1ZO/liW5jVj1LvT+zx5f5Q38YvmhPbiWP6kRAvaioqNDQUKpTAAAAUEz2ih0hREHb\nYv9fby9sn31v/5J2nYafi8+hOhFQqbS0dPr06du2baM6CAAAAMVkstgRQghhjly6/318uDXr\ngXMv45m+/0d1HqDM2bNnc3NzMVkdAACALD1jV5NGF8fIxLd7l07x8GrkL3UulxsVFVVaWlrH\nMampqYQQHg/3fKVUYGCgkpLStGnTqA4CAABAMdkudoQQBltr4Z7L8IyobAAAIABJREFU9iOP\nX3qep2LYqaEffuPGDUdHR2GOfPfuXcPTgdglJyffu3dv+vTpWlpaVGcBAACgmCwWO352WrFO\nG9X//ZH39Fbk7WcZJTyFVkpphdw2aqwGrApqa2sbERFR9xW7gICAmzdvmpqaNiEziMv+/fv5\nfL67uzvVQQAAAKgnY8Uu9c+A6YvWJfG35b50IYRwsm5NHeocFp9ZdUALvZ47T11y768n5IAs\nFmvkyJF1HxMVFUUIYTJl93lE2uJwOCdPnuzWrZuVlRXVWQAAAKhXV7H79OmT8AMZGBg0OUw9\ncuJ2dBq+opyhPMS1DSGEzy1ytnC4mP61+/CZEwb1MlTjJT68ujcoav6QHpqp7yboK4s7D1Du\n9OnTeXl5Pj4+VAcBAACQCnUVO0NDQ+EH4vP5TQ5Tj73OvuWMFn/Eprj00iGEZES7XUz/2nPl\npcdbHf45YvbCFa77jKwXejiHTbiDR+npLzAwsEWLFpMnT6Y6CAAAgFSoq9i5ublJLIcw9qUW\nav4QKGh1hJDUkARCSNA6u2+P0e09f4fZ+iVPthCCYkdzCQkJ9+/fd3V11dTUpDoLAACAVKir\n2B06dEhiOYShxWbmK1S9M0GY8kxCiJFC9U+hrY4i93WGRJMBFQ4cOEAIwWsTAAAAVRr2QgCv\n8kv05dCA3Tv8fDcRQr6mvpfk3G4eXTS/JK+4X1Au+GO7mTaEkI2Ps749hl+Z5xufo6Q9QoK5\ngALFxcXBwcE9evSwtLSkOgsAAIC0aECxy7gR0KdNGxv7cfM9lq/19CKExHsP1TK13PPnB7HF\n+4/Jwb5ylWkDOw3cF3qnoJKn8+O+FX1bHxg64sjNFMEBJRkPlzha3C0s679ujWQiAVVOnTpV\nWFg4d+5cqoMAAABIEWGLXfHH/7MYtuhxjvxkD0/fpZ0FGw3sx2plPV3i0O3Iu0KxJfyX+g9u\ncWc3aHyJXTCun7aKdkdz6wcs/bKCR7Ns26nqGncyba1m0Hv35fd9Z/tfmNvgmYpBtgQGBqqo\nqGAZMQAAgG8JW+zOOHtkcxWPJbwL3uUzze6fmU1Mxvs+TTynRorXTj4jtoT/YTZ6XUpGwk7P\n+dYdddOTH9+6/USwvTj7QwZHcdAE9xM330QfXMxuwBTFIHvi4+MfP348ZcoUNTU1qrMAAABI\nEWEnKN4al6vVZf/UThrVtquaOu7t2tIlYQchEnqFVkGz8xKfvUt8COFXfMnJ+cqpYMkrKqto\nqqvISSYAUC4gIIAQMmfOHKqDAAAASBdhi11mBVfD0KTWXXpGLbiJ6SJLJDyGnJaOHtYHbW6K\ni4tPnz5taWnZs2dPqrMAAABIF2FvxQ7TVMx5fKy2OYh5R+9nK6j3F2UogO87ceJEUVERZjkB\nAACoSdhit3apxdfME4NXHf7K+6bd8SvCNww/kfn1h1m/iiUdQA2HDh1SVVWdMGEC1UEAAACk\njrC3YrutiFxwwWzvb666J7b2MskjhMx2mZIYHRn7pkC9w/hLm3qJMyTAP+7fvx8XFzd//nxV\nVdX6jwYAAGhmhL1ix2Cp74l+c9Rnfjt21u2YbELIH0dD4vM0Jy/d8TzxtKE8S5whAf4RGBhI\npG+xOwAAACkh7BU7QgiDpTLDc+8Mz71f0t9nfilWUNMyMdJr2MoVAE1QUFBw5swZKysrc3Nz\nqrMAAABII2GLWed+Y7YdjvjM4RJCtPSNO3Xt0hatDiTr+PHjX79+xWsTAAAA3yNsN3sRfX6l\n6yhDTT2H6UvPXk/gijUUQG0OHjyooaExfvx4qoMAAABIKWGLXe7rB/t9l9uYKUad2DVhUA9N\n4x/nr9vzMCVfrOEAqty9ezcxMXH69OktWrSgOgsAAICUErbYabbr9cvabTeefshMvrdnw+Lu\nKukBPot7t9fu8s0tWgDxEbw2MXv2bKqDAAAASK8GPyan29Fq4Xr/6KSMT89u7/h1rmrmHcEt\nWnGEAxDIz88PDQ21sbHp2rUr1VkAAACkV6Pff+B9LeGUV1Tw+YQQwi3LFl0kgOqOHj1aUlKC\n1yYAAADq1oDpTgghhF+ecPtyWFhoWNj5Zx+LCCGqbXrMWr50orOzWNIBEEII+eOPP7S1tceO\nHUt1EAAAAKkmbLG7f+V0WFhoWPilNzmlhBClVh2nLnR2njjR3rojJj0Bsbp161ZSUtLSpUsV\nFRWpzgIAACDVhC12fYZPIoQoaJqOn+PsPHGi44Aecgxx5gL4H8FrE66urlQHAQAAkHbCFjvH\nGUucJ04cbWepxEShA8nJzc0NDw+3tbXt3Lkz1VkAAACknbDF7sLRnYQQXuWX6Ks3El6lFhRz\n1vzq+TX1vZKJMW7FgvgcOXKktLQUr00AAAAIowGtLONGQJ82bWzsx833WL7W04sQEu89VMvU\ncs+fH8QWD5o1Pp9/6NChli1bOjk5UZ0FAABABghb7Io//p/FsEWPc+Qne3j6Lv3nppiB/Vit\nrKdLHLodeVcotoTQfF2/fv3Vq1ezZs1SUFCgOgsAAIAMELbYnXH2yOYqHkt4F7zLZ5qdgWCj\nyXjfp4nn1Ejx2slnxJYQmq/AwEAGg+Hm5kZ1EAAAANkgbLHbGper1WX3/7d35/ExnA8cx5/d\nzX1KIiEiiThyUeJW2qr7Kq1b3UVpS5WqUm1JHaWto+66qZZfUUo1PVDqPhJ1ZoVcgkgIkghy\n7e7vj2iqEcmKJJOZ/bz/6Kt5ZoyveT0v/XZmnpn+AeXyjNv7dFlUq/ytM3OKOxhM3c2bN3fs\n2NG6desaNWpInQUAAHkwttglZulsK1fJd5O7l40uM77YEgFCCCE2bNiQkZExfPhwqYMAACAb\nxha79k5WSWHrDPls0a89dtPSsXlxhgKEeOmll8aPH//qq69KHQQAANkwtthNer/uvcT1rSes\nvqd/pN0ZsrYFd1ifeM93yMclkg4mrG7dul9++aW5ubnUQQAAkA1j32P33PhfRm33W/TlULf1\nXzSockcI8eYb/c4d/OVoZIpjjZ47pzcoyZAAAAAonLFX7FQaxwUHI9dOG1nN7Mb+IzeFECvX\nbjh1x6nv+3PCz/2vsoWmJEMCAACgcMZesRNCqDR2gz5ZNOiTRbfjLyfeTrN0cK7i5c5nJwAA\nAMqIpyh2uZwreTtXKvYkMF1paWmrV6/euXNnTEyMhYVF3bp1Bw0a1KZNG6lzAQAgMwUVu2vX\nrhl/IA8Pj2cOA1N07ty5V199NTo62tbW1tfX9/79+xs2bPj+++/79u27Zs0aCwsLqQMCACAb\nBRW7ypUrG38ggyG/d6EABbpz5067du1u3bq1YMGC4cOH53w6LC4ubuzYsRs2bLC3t//mm2+k\nzggAgGwUVOz4lBNK2pw5c+Lj49etWzdw4MDcQS8vr82bN7dv337FihVjxozx9/eXMCEAADJS\nULFbsWJFqeWAadq6dau3t/eAAQPyjKvV6kmTJu3ateunn36aOHGiJNkAAJAdVrVCMgaDITo6\nOigoSKVSPb61bt26Qojo6OhSzwUAgFxR7CAZlUqlVqt1Ol2+W3PG1WqmKAAAxuK/mpCSn59f\naGhovt3u6NGjOTuUeigAAOSKYgcp9e7dOyEhYd68eXnG09PTg4ODLSwsunXrJkkwAADkiGIH\nKY0ePTogIGDChAkffvhhfHy8EEKv1x8+fLhVq1YnTpyYOHGit7e31BkBAJANih2kZGNj8/vv\nvzdo0OCrr77y8PCoWLGig4NDs2bNjh49OmHChODgYKkDAgAgJ8Z+UqzHiEn9+vXr8lJNTYnG\ngenx9PQ8cuTI9u3bd+zYER0dbWNjExQUNHDgwICAAKmjAQAgM8YWux+Xz/xx+Uy7yrX79O3X\nt1+/FrX5gBiKjVqt7tq1a9euXaUOAgCAvBl7Kzb84I7Jo/p6ZF5a+eWElnUqu9dqPn7m8r/j\nUks0HAAAAIxnbLELaNb5s4XfX0hIPrl784fDultdPTp70oj6VZwDX3h1xtJN0cmZJZoSAAAA\nhXrKxRMqi7qtenyxYkv07dtHflk/un/75L9DPnmnd43yTk1fGbR44x9JmfqSyQkFSkxM1Gq1\nUqcAAEA5ir4qVq0xs7K2tbc1F0LodfePhawf1bddJSfvEV/+XnzxoFgGg+GVV15p3bq11EEA\nAFCOpyt2uoybf/64clS/Tp6OTo3bv/7F8k1pbvXfnTxv3+krd6+dWTHrg9oOt5dPaD98z7US\nigvF+OGHH0JDQ19//XWpgwAAoBzGrordvvbrbdu2/fzboduZOpVK5R3Uclz37j16dG/i5/bP\nLpWHTfhqwIjOVk7Nd045LVqxbBZPlJWV9emnnzo6On700UdSZwEAQDmMLXavvTFWpdL4Nm77\nVvfu3bt3q+fjlP/hrH0qVqxYJcil+BJCgZYvXx4ZGfn555+7uDBVAAAoNsYWu+D567t3f62W\nh13Bu2ksPa9fv/7MqaBkaWlp06dPd3d3f++996TOAgCAohj7jN2U0f1rVTLf9e38Dz/akjvY\nsXv/mct33NMbSiYblGnu3LkJCQnBwcE2NjZSZwEAQFGMLXb6rBvDm3i1HTTmm++O5w7+vm3D\npBGvVmk4OCGLt5zAKElJSXPmzPH19R0yZIjUWQAAUBpji93J4I4rjt9oOHD6H7s/zB1MvnJ2\n9vAXk05+23bCkZKJB6WZNm1aamrq559/bmZm7GMAAADASMYWu6nLwm3d+h9Z93ETv/K5g/Ye\nNcct2/eWu92ltVNLJh4UJTY2dtmyZQ0bNuzWrZvUWQAAUCBji91fKRnOQQM1+R2hZ8PymamH\nizMUFOqTTz7JyMiYNWuWSqWSOgsAAApk9LdibczTYk/lu+nMpbtmNn7FFwnKdObMmY0bN3bs\n2LFly5ZSZwEAQJmMLXbBHT2TL02csOlsnvGIHZM/uHDbvfknxR0MSjNhwgQhxPTp06UOAgCA\nYhn7AHurlZua7W72Ze/aO5d069KqceXydukpiSf37dz4x99mNjXXfdehRFNC7vbv3//bb78N\nGDCgbt26UmcBAECxjC125rZ1d184NOHNUUu3b5v119bc8cCW/ReuXtrc0bJk4kEJDAbDxIkT\nLSwsgoODpc4CAICSPcUrJyxd6n699dCspNijJ84m3E61sHf2D2oS6JX/t8WAXFu2bDly5MiY\nMWOqVq0qdRYAAJTsqd8lZlW+yssdqjw6cuGblk2n3L2deKLYQkFBdDrdlClT7O3tP/roI6mz\nAACgcE9R7C7vWrto297Ym/f/O6w///uh1IxyxRsLirFixQqtVjtt2jQ3NzepswAAoHDGFrv4\nvRP92n+Zkd9nYc3tKr42/ttiTQWFePDgwYwZM9zc3N577z2pswAAoHzGvu5k+dBvsjRO3x6L\nvH/35sfPuXi0+F96evrdm7FzBgZau7VYFtyqRFNCpubOnXv16tXg4GB7e3upswAAoHzGFrs1\n1+85+80Z0KiatV35wRNq3jq91tLS0q6899jVRxve3tb5i7zvtwPu3LkzZ86cqlWrDh06VOos\nAACYBGOL3c0sna23Z86/uzTyy0jee09vEEKoNPZTXvE89fVnJRUQsjV9+vQ7d+7MnDnTwsJC\n6iwAAJgEY4tdkK1FasSZnH+3cmpt0Gd8l/hwFYW1u3XGnd0lkg6ydfny5cWLFzdo0KBnz55S\nZwEAwFQYW+zGNa2QHD1h0vo9t7P0Vs6d3C00C2YcEEIIQ/b/tsWZWdcowYyQocmTJ2dkZMyc\nOVOlUkmdBQAAU2HsqtiO3y7x9npt5sDWf3td+7V5pXkdPF9f0rHJpdccko/vikyu0X9aiaZ8\nVGZK3NHDx89cvOlevWbHDi9aq/P2hvPbN59Ky+zXr1+pRUIeer1+06ZNbdu2bd26tdRZAAAw\nIcYWO2vXTuejDnzx1WorV2shRPeNv/Zr2+m7P7ap1Bb1enz008p2JRnyX0eXj37t3SWJmbqc\nH+28Gy/dHtK/jvOj+2wf8+bHsSkUOwmp1epjx45VrlxZ6iAAAJiWp3hBsU2lJp/Na/Lwl1n7\nrz8Qtfjm1Ww7d2drTclky+vG8eBmby0SmnIDxrzTxL9iXOjvi9eEDG4UaBEZ2cvTrnQywEi1\na9eWOgIAACbHqGfs9Fk3x44d+8WPl/OMO7hWLrVWJ4RYNXCBUNuuOx317bzp74wYNWvFzxF7\n5lrpbr750ogH+b05GQAAwKQYVezU5q6/Ll+8aGl4Sacp2NLYuy615vcPdModqdT8vT2fPZ8a\nu6H7yggJgwEAAJQFxq6KXTv+xcQjY8PvZ5domoKl6fRWrp55BhtN/KV9eevdY7pIm81khYaG\njhkzplWrVs2bNx8yZMjOnTv1er3UoQAAMFHGPmPXJHjPBnX/ls+1Gz95VIv6Ac721nkWo3p7\nexd7uDxalrP6JezLNF1rO82/v7lK47hu5yT35ye377HwcshYXq1RarKyst55552VK1cKIcqV\nK2dpabl///41a9a89NJLmzdvdnNzkzogAAAmx9grdubm5q9P+yEpZu8Hg7vVfy7Ap0peJRny\noYnD/NPv7K7/evC5+HuPjrs1/mTLsIArv77/wnvLUnQ8bFdK3n333ZUrV7Zv3/7vv/++c+dO\nQkLClStXRo0adeDAgU6dOmVlZUkdEAAAk2PsFbthw4aVaA5j1Jv66+shARs3T629ZUZF76qL\nQ093dbHO2fTqkgOTrjf6fMFbFTd86Z52r+Dj4NmdOnVq+fLl7dq127lzp0bzcAFN5cqVFy5c\n6OjoOGPGjDVr1gwfPlzakAAAmBpji93SpUtLNIcx1OZu34VFtJo5dd1Pu8OjrqRk/3txTm3m\nPGNHuP+M0Z8vWn8hnYftStymTZsMBsO0adNyW12ujz/+eP78+Zs2baLYAQBQyp7iPXZlgdqs\n/NBPFwz9NL9tKosBn3wz4JPF1y6dvxR7zcgD6nS6kJCQ9PT0AvaJjY0VQrAm4FGXLl0yMzOr\nX7/+45usra2fe+65iAjWKQMAUNqMLXY+Pj4F7xATE/PMYYxkuHklzdXT/p8f9af/+mV/WHia\n3tInsGHHdk09atT2qGHs23H37t3bpUsXY/YsxT+gDOh0OpVK9aTvwKrVanowAAClz9hiZ2eX\n99MOWfduRcUmZBsMluWCOreuXtzB8hf7x5KBoyefN3x1K+INIcSDG3/1b9d766nE3B1s3OvN\n3bhzRHN3Iw/YokWLHTt2FHzFbsmSJfv27Su02pqUatWqZWVlnTt37rnnnsuzKTMz8/z584+P\nAwCAkmZssTt79uzjg5kpF2d/MOCTVWGWzVYUa6r8Jf09J6DD+EyVbZuhnkIIg+5u77qdfo6/\nV7vD4F6tGlR20J878fuiVSEj29Rxio3pVcnWmGNqNJrOnTsXvE9ISIgQQq02dgWxKejevfvs\n2bOnTp26adOmPNftFixYkJyc3K1bN6myAQBgsp6prFg4+k5acWSkp+3G8a0vZ+iKK9OTLOo9\n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"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Accuracy plot\n",
    "plot(\n",
    "    optimal_list,\n",
    "    type = \"b\",\n",
    "    xlab = \"K-value\",\n",
    "    ylab = \"Accuracy level\"\n",
    ")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "12b55804",
   "metadata": {
    "papermill": {
     "duration": 0.078799,
     "end_time": "2022-04-10T17:30:24.665848",
     "exception": false,
     "start_time": "2022-04-10T17:30:24.587049",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "The above graph shows that for K value of 17 we get the maximum accuracy.\n",
    "\n",
    "Now we can build a model with K value as 17."
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
   "duration": 10.521816,
   "end_time": "2022-04-10T17:30:24.854146",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2022-04-10T17:30:14.332330",
   "version": "2.3.3"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
