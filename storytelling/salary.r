{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "af23a461",
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "execution": {
     "iopub.execute_input": "2022-04-09T06:15:13.170433Z",
     "iopub.status.busy": "2022-04-09T06:15:13.166932Z",
     "iopub.status.idle": "2022-04-09T06:15:14.646855Z",
     "shell.execute_reply": "2022-04-09T06:15:14.647377Z"
    },
    "papermill": {
     "duration": 1.52272,
     "end_time": "2022-04-09T06:15:14.647686",
     "exception": false,
     "start_time": "2022-04-09T06:15:13.124966",
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
       "'salary'"
      ],
      "text/latex": [
       "'salary'"
      ],
      "text/markdown": [
       "'salary'"
      ],
      "text/plain": [
       "[1] \"salary\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "library(tidyverse) # metapackage of all tidyverse packages\n",
    "\n",
    "list.files(path = \"../input\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "0586f898",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-09T06:15:14.772452Z",
     "iopub.status.busy": "2022-04-09T06:15:14.735574Z",
     "iopub.status.idle": "2022-04-09T06:15:14.811388Z",
     "shell.execute_reply": "2022-04-09T06:15:14.809719Z"
    },
    "papermill": {
     "duration": 0.120329,
     "end_time": "2022-04-09T06:15:14.811536",
     "exception": false,
     "start_time": "2022-04-09T06:15:14.691207",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>YearsExperience</th><th scope=col>Salary</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>1.1</td><td>39343</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>1.3</td><td>46205</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>1.5</td><td>37731</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>2.0</td><td>43525</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>2.2</td><td>39891</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>2.9</td><td>56642</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 2\n",
       "\\begin{tabular}{r|ll}\n",
       "  & YearsExperience & Salary\\\\\n",
       "  & <dbl> & <int>\\\\\n",
       "\\hline\n",
       "\t1 & 1.1 & 39343\\\\\n",
       "\t2 & 1.3 & 46205\\\\\n",
       "\t3 & 1.5 & 37731\\\\\n",
       "\t4 & 2.0 & 43525\\\\\n",
       "\t5 & 2.2 & 39891\\\\\n",
       "\t6 & 2.9 & 56642\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 2\n",
       "\n",
       "| <!--/--> | YearsExperience &lt;dbl&gt; | Salary &lt;int&gt; |\n",
       "|---|---|---|\n",
       "| 1 | 1.1 | 39343 |\n",
       "| 2 | 1.3 | 46205 |\n",
       "| 3 | 1.5 | 37731 |\n",
       "| 4 | 2.0 | 43525 |\n",
       "| 5 | 2.2 | 39891 |\n",
       "| 6 | 2.9 | 56642 |\n",
       "\n"
      ],
      "text/plain": [
       "  YearsExperience Salary\n",
       "1 1.1             39343 \n",
       "2 1.3             46205 \n",
       "3 1.5             37731 \n",
       "4 2.0             43525 \n",
       "5 2.2             39891 \n",
       "6 2.9             56642 "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "data <- read.csv('../input/salary/Salary.csv')\n",
    "head(data)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "95345cfb",
   "metadata": {
    "papermill": {
     "duration": 0.041917,
     "end_time": "2022-04-09T06:15:14.895493",
     "exception": false,
     "start_time": "2022-04-09T06:15:14.853576",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### Way.1 - Z-score normalization (standardization)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "715b7639",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-09T06:15:14.986499Z",
     "iopub.status.busy": "2022-04-09T06:15:14.984884Z",
     "iopub.status.idle": "2022-04-09T06:15:15.058157Z",
     "shell.execute_reply": "2022-04-09T06:15:15.056476Z"
    },
    "papermill": {
     "duration": 0.121484,
     "end_time": "2022-04-09T06:15:15.058412",
     "exception": false,
     "start_time": "2022-04-09T06:15:14.936928",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>YearsExperience</th><th scope=col>Salary</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>-1.4393847</td><td>-1.386782</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>-1.3841149</td><td>-1.173429</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>-1.3288450</td><td>-1.436902</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>-1.1906704</td><td>-1.256755</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>-1.1354005</td><td>-1.369743</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>-0.9419561</td><td>-0.848922</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 2\n",
       "\\begin{tabular}{r|ll}\n",
       "  & YearsExperience & Salary\\\\\n",
       "  & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t1 & -1.4393847 & -1.386782\\\\\n",
       "\t2 & -1.3841149 & -1.173429\\\\\n",
       "\t3 & -1.3288450 & -1.436902\\\\\n",
       "\t4 & -1.1906704 & -1.256755\\\\\n",
       "\t5 & -1.1354005 & -1.369743\\\\\n",
       "\t6 & -0.9419561 & -0.848922\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 2\n",
       "\n",
       "| <!--/--> | YearsExperience &lt;dbl&gt; | Salary &lt;dbl&gt; |\n",
       "|---|---|---|\n",
       "| 1 | -1.4393847 | -1.386782 |\n",
       "| 2 | -1.3841149 | -1.173429 |\n",
       "| 3 | -1.3288450 | -1.436902 |\n",
       "| 4 | -1.1906704 | -1.256755 |\n",
       "| 5 | -1.1354005 | -1.369743 |\n",
       "| 6 | -0.9419561 | -0.848922 |\n",
       "\n"
      ],
      "text/plain": [
       "  YearsExperience Salary   \n",
       "1 -1.4393847      -1.386782\n",
       "2 -1.3841149      -1.173429\n",
       "3 -1.3288450      -1.436902\n",
       "4 -1.1906704      -1.256755\n",
       "5 -1.1354005      -1.369743\n",
       "6 -0.9419561      -0.848922"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 1 × 9</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Min</th><th scope=col>Q1</th><th scope=col>Median</th><th scope=col>Q3</th><th scope=col>Max</th><th scope=col>Mean</th><th scope=col>SD</th><th scope=col>n</th><th scope=col>Missing</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>-1.439385</td><td>-0.789964</td><td>-0.2787179</td><td>0.8128615</td><td>1.987346</td><td>-5.404283e-17</td><td>1</td><td>35</td><td>0</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 1 × 9\n",
       "\\begin{tabular}{lllllllll}\n",
       " Min & Q1 & Median & Q3 & Max & Mean & SD & n & Missing\\\\\n",
       " <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <int> & <int>\\\\\n",
       "\\hline\n",
       "\t -1.439385 & -0.789964 & -0.2787179 & 0.8128615 & 1.987346 & -5.404283e-17 & 1 & 35 & 0\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 1 × 9\n",
       "\n",
       "| Min &lt;dbl&gt; | Q1 &lt;dbl&gt; | Median &lt;dbl&gt; | Q3 &lt;dbl&gt; | Max &lt;dbl&gt; | Mean &lt;dbl&gt; | SD &lt;dbl&gt; | n &lt;int&gt; | Missing &lt;int&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|\n",
       "| -1.439385 | -0.789964 | -0.2787179 | 0.8128615 | 1.987346 | -5.404283e-17 | 1 | 35 | 0 |\n",
       "\n"
      ],
      "text/plain": [
       "  Min       Q1        Median     Q3        Max      Mean          SD n  Missing\n",
       "1 -1.439385 -0.789964 -0.2787179 0.8128615 1.987346 -5.404283e-17 1  35 0      "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 1 × 9</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Min</th><th scope=col>Q1</th><th scope=col>Median</th><th scope=col>Q3</th><th scope=col>Max</th><th scope=col>Mean</th><th scope=col>SD</th><th scope=col>n</th><th scope=col>Missing</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>-1.436902</td><td>-0.8372003</td><td>-0.08029805</td><td>0.9103068</td><td>1.726206</td><td>-1.905532e-16</td><td>1</td><td>35</td><td>0</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 1 × 9\n",
       "\\begin{tabular}{lllllllll}\n",
       " Min & Q1 & Median & Q3 & Max & Mean & SD & n & Missing\\\\\n",
       " <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <int> & <int>\\\\\n",
       "\\hline\n",
       "\t -1.436902 & -0.8372003 & -0.08029805 & 0.9103068 & 1.726206 & -1.905532e-16 & 1 & 35 & 0\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 1 × 9\n",
       "\n",
       "| Min &lt;dbl&gt; | Q1 &lt;dbl&gt; | Median &lt;dbl&gt; | Q3 &lt;dbl&gt; | Max &lt;dbl&gt; | Mean &lt;dbl&gt; | SD &lt;dbl&gt; | n &lt;int&gt; | Missing &lt;int&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|\n",
       "| -1.436902 | -0.8372003 | -0.08029805 | 0.9103068 | 1.726206 | -1.905532e-16 | 1 | 35 | 0 |\n",
       "\n"
      ],
      "text/plain": [
       "  Min       Q1         Median      Q3        Max      Mean          SD n \n",
       "1 -1.436902 -0.8372003 -0.08029805 0.9103068 1.726206 -1.905532e-16 1  35\n",
       "  Missing\n",
       "1 0      "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "scaling <- scale(data, center = TRUE, scale = TRUE)\n",
    "standardize_salary <- as.data.frame(scaling)\n",
    "\n",
    "head(standardize_salary)\n",
    "\n",
    "# Descriptive statistics\n",
    "# sample mean ~ 1 and s.d = 1\n",
    "\n",
    "standardize_salary %>%\n",
    "    summarise(\n",
    "        Min = min(YearsExperience, na.rm = TRUE),\n",
    "        Q1 = quantile(YearsExperience, probs = .25, na.rm = TRUE),\n",
    "        Median = median(YearsExperience),\n",
    "        Q3 = quantile(YearsExperience, probs = .75, na.rm = TRUE),\n",
    "        Max = max(YearsExperience, na.rm = TRUE),\n",
    "        Mean = mean(YearsExperience, na.rm = TRUE),\n",
    "        SD = sd(YearsExperience, na.rm = TRUE),\n",
    "        n = n(),\n",
    "        Missing = sum(is.na(YearsExperience))\n",
    "    )\n",
    "\n",
    "standardize_salary %>%\n",
    "    summarise(\n",
    "        Min = min(Salary, na.rm = TRUE),\n",
    "        Q1 = quantile(Salary, probs = .25, na.rm = TRUE),\n",
    "        Median = median(Salary),\n",
    "        Q3 = quantile(Salary, probs = .75, na.rm = TRUE),\n",
    "        Max = max(Salary, na.rm = TRUE),\n",
    "        Mean = mean(Salary, na.rm = TRUE),\n",
    "        SD = sd(Salary, na.rm = TRUE),\n",
    "        n = n(),\n",
    "        Missing = sum(is.na(Salary))\n",
    "    )"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "4170cb1a",
   "metadata": {
    "papermill": {
     "duration": 0.050018,
     "end_time": "2022-04-09T06:15:15.159214",
     "exception": false,
     "start_time": "2022-04-09T06:15:15.109196",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**Note:**\n",
    "1. median isn't 0\n",
    "2. sample mean ~ 0\n",
    "3. standard deviation = 1\n",
    "4. min value and max value aren't bounded by boundaries"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "515bd41f",
   "metadata": {
    "papermill": {
     "duration": 0.049481,
     "end_time": "2022-04-09T06:15:15.258141",
     "exception": false,
     "start_time": "2022-04-09T06:15:15.208660",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### Way 2. Robust Scalar"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "b7433e63",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-09T06:15:15.363312Z",
     "iopub.status.busy": "2022-04-09T06:15:15.361612Z",
     "iopub.status.idle": "2022-04-09T06:15:15.438970Z",
     "shell.execute_reply": "2022-04-09T06:15:15.437647Z"
    },
    "papermill": {
     "duration": 0.13115,
     "end_time": "2022-04-09T06:15:15.439162",
     "exception": false,
     "start_time": "2022-04-09T06:15:15.308012",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>YearsExperience</th><th scope=col>Salary</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>-0.7241379</td><td>-0.7476270</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>-0.6896552</td><td>-0.6255371</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>-0.6551724</td><td>-0.7763079</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>-0.5689655</td><td>-0.6732201</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>-0.5344828</td><td>-0.7378769</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>-0.4137931</td><td>-0.4398402</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 2\n",
       "\\begin{tabular}{r|ll}\n",
       "  & YearsExperience & Salary\\\\\n",
       "  & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t1 & -0.7241379 & -0.7476270\\\\\n",
       "\t2 & -0.6896552 & -0.6255371\\\\\n",
       "\t3 & -0.6551724 & -0.7763079\\\\\n",
       "\t4 & -0.5689655 & -0.6732201\\\\\n",
       "\t5 & -0.5344828 & -0.7378769\\\\\n",
       "\t6 & -0.4137931 & -0.4398402\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 2\n",
       "\n",
       "| <!--/--> | YearsExperience &lt;dbl&gt; | Salary &lt;dbl&gt; |\n",
       "|---|---|---|\n",
       "| 1 | -0.7241379 | -0.7476270 |\n",
       "| 2 | -0.6896552 | -0.6255371 |\n",
       "| 3 | -0.6551724 | -0.7763079 |\n",
       "| 4 | -0.5689655 | -0.6732201 |\n",
       "| 5 | -0.5344828 | -0.7378769 |\n",
       "| 6 | -0.4137931 | -0.4398402 |\n",
       "\n"
      ],
      "text/plain": [
       "  YearsExperience Salary    \n",
       "1 -0.7241379      -0.7476270\n",
       "2 -0.6896552      -0.6255371\n",
       "3 -0.6551724      -0.7763079\n",
       "4 -0.5689655      -0.6732201\n",
       "5 -0.5344828      -0.7378769\n",
       "6 -0.4137931      -0.4398402"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 1 × 9</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Min</th><th scope=col>Q1</th><th scope=col>Median</th><th scope=col>Q3</th><th scope=col>Max</th><th scope=col>Mean</th><th scope=col>SD</th><th scope=col>n</th><th scope=col>Missing</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>-0.7241379</td><td>-0.3189655</td><td>0</td><td>0.6810345</td><td>1.413793</td><td>0.1738916</td><td>0.6238982</td><td>35</td><td>0</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 1 × 9\n",
       "\\begin{tabular}{lllllllll}\n",
       " Min & Q1 & Median & Q3 & Max & Mean & SD & n & Missing\\\\\n",
       " <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <int> & <int>\\\\\n",
       "\\hline\n",
       "\t -0.7241379 & -0.3189655 & 0 & 0.6810345 & 1.413793 & 0.1738916 & 0.6238982 & 35 & 0\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 1 × 9\n",
       "\n",
       "| Min &lt;dbl&gt; | Q1 &lt;dbl&gt; | Median &lt;dbl&gt; | Q3 &lt;dbl&gt; | Max &lt;dbl&gt; | Mean &lt;dbl&gt; | SD &lt;dbl&gt; | n &lt;int&gt; | Missing &lt;int&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|\n",
       "| -0.7241379 | -0.3189655 | 0 | 0.6810345 | 1.413793 | 0.1738916 | 0.6238982 | 35 | 0 |\n",
       "\n"
      ],
      "text/plain": [
       "  Min        Q1         Median Q3        Max      Mean      SD        n \n",
       "1 -0.7241379 -0.3189655 0      0.6810345 1.413793 0.1738916 0.6238982 35\n",
       "  Missing\n",
       "1 0      "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 1 × 9</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Min</th><th scope=col>Q1</th><th scope=col>Median</th><th scope=col>Q3</th><th scope=col>Max</th><th scope=col>Mean</th><th scope=col>SD</th><th scope=col>n</th><th scope=col>Missing</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>-0.7763079</td><td>-0.4331326</td><td>0</td><td>0.5668674</td><td>1.033761</td><td>0.04595006</td><td>0.5722437</td><td>35</td><td>0</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 1 × 9\n",
       "\\begin{tabular}{lllllllll}\n",
       " Min & Q1 & Median & Q3 & Max & Mean & SD & n & Missing\\\\\n",
       " <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <int> & <int>\\\\\n",
       "\\hline\n",
       "\t -0.7763079 & -0.4331326 & 0 & 0.5668674 & 1.033761 & 0.04595006 & 0.5722437 & 35 & 0\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 1 × 9\n",
       "\n",
       "| Min &lt;dbl&gt; | Q1 &lt;dbl&gt; | Median &lt;dbl&gt; | Q3 &lt;dbl&gt; | Max &lt;dbl&gt; | Mean &lt;dbl&gt; | SD &lt;dbl&gt; | n &lt;int&gt; | Missing &lt;int&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|\n",
       "| -0.7763079 | -0.4331326 | 0 | 0.5668674 | 1.033761 | 0.04595006 | 0.5722437 | 35 | 0 |\n",
       "\n"
      ],
      "text/plain": [
       "  Min        Q1         Median Q3        Max      Mean       SD        n \n",
       "1 -0.7763079 -0.4331326 0      0.5668674 1.033761 0.04595006 0.5722437 35\n",
       "  Missing\n",
       "1 0      "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# write the robust scalar formula\n",
    "robust_scalar<- function(x){\n",
    "    (x- median(x)) / ( quantile(x,probs = .75)-quantile(x,probs = .25) )\n",
    "}\n",
    "\n",
    "# then apply to the dataframe\n",
    "robust_scalar_salary <- as.data.frame(\n",
    "    lapply(data, robust_scalar)\n",
    ")\n",
    "\n",
    "head(robust_scalar_salary)\n",
    "\n",
    "# Descriptive statistics\n",
    "robust_scalar_salary %>% summarise(Min = min(YearsExperience,na.rm = TRUE),\n",
    "                              Q1 = quantile(YearsExperience,probs = .25,na.rm = TRUE),\n",
    "                              Median = median(YearsExperience, na.rm = TRUE),\n",
    "                              Q3 = quantile(YearsExperience,probs = .75,na.rm = TRUE),\n",
    "                              Max = max(YearsExperience,na.rm = TRUE),\n",
    "                              Mean = mean(YearsExperience, na.rm = TRUE),\n",
    "                              SD = sd(YearsExperience, na.rm = TRUE),\n",
    "                              n = n(),\n",
    "                              Missing = sum(is.na(YearsExperience)))\n",
    "\n",
    "robust_scalar_salary %>% summarise(Min = min(Salary,na.rm = TRUE),\n",
    "                               Q1 = quantile(Salary,probs = .25,na.rm = TRUE),\n",
    "                               Median = median(Salary, na.rm = TRUE),\n",
    "                               Q3 = quantile(Salary,probs = .75,na.rm = TRUE),\n",
    "                               Max = max(Salary,na.rm = TRUE),\n",
    "                               Mean = mean(Salary, na.rm = TRUE),\n",
    "                               SD = sd(Salary, na.rm = TRUE),\n",
    "                               n = n(),\n",
    "                               Missing = sum(is.na(Salary)))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "e983e716",
   "metadata": {
    "papermill": {
     "duration": 0.05764,
     "end_time": "2022-04-09T06:15:15.555493",
     "exception": false,
     "start_time": "2022-04-09T06:15:15.497853",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**Note:**\n",
    "- median = 0\n",
    "- sample mean != 0\n",
    "- standard deviation != 1\n",
    "- min value and max value aren't bounded"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "3fc11274",
   "metadata": {
    "papermill": {
     "duration": 0.058358,
     "end_time": "2022-04-09T06:15:15.672648",
     "exception": false,
     "start_time": "2022-04-09T06:15:15.614290",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "#### Way 3. Min-Max Normalization"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "88359f3d",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-09T06:15:15.794018Z",
     "iopub.status.busy": "2022-04-09T06:15:15.792254Z",
     "iopub.status.idle": "2022-04-09T06:15:15.859584Z",
     "shell.execute_reply": "2022-04-09T06:15:15.857834Z"
    },
    "papermill": {
     "duration": 0.129461,
     "end_time": "2022-04-09T06:15:15.859756",
     "exception": false,
     "start_time": "2022-04-09T06:15:15.730295",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>YearsExperience</th><th scope=col>Salary</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>0.00000000</td><td>0.01584524</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>0.01612903</td><td>0.08329565</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>0.03225806</td><td>0.00000000</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>0.07258065</td><td>0.05695244</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>0.08870968</td><td>0.02123184</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>0.14516129</td><td>0.18588672</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 2\n",
       "\\begin{tabular}{r|ll}\n",
       "  & YearsExperience & Salary\\\\\n",
       "  & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t1 & 0.00000000 & 0.01584524\\\\\n",
       "\t2 & 0.01612903 & 0.08329565\\\\\n",
       "\t3 & 0.03225806 & 0.00000000\\\\\n",
       "\t4 & 0.07258065 & 0.05695244\\\\\n",
       "\t5 & 0.08870968 & 0.02123184\\\\\n",
       "\t6 & 0.14516129 & 0.18588672\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 2\n",
       "\n",
       "| <!--/--> | YearsExperience &lt;dbl&gt; | Salary &lt;dbl&gt; |\n",
       "|---|---|---|\n",
       "| 1 | 0.00000000 | 0.01584524 |\n",
       "| 2 | 0.01612903 | 0.08329565 |\n",
       "| 3 | 0.03225806 | 0.00000000 |\n",
       "| 4 | 0.07258065 | 0.05695244 |\n",
       "| 5 | 0.08870968 | 0.02123184 |\n",
       "| 6 | 0.14516129 | 0.18588672 |\n",
       "\n"
      ],
      "text/plain": [
       "  YearsExperience Salary    \n",
       "1 0.00000000      0.01584524\n",
       "2 0.01612903      0.08329565\n",
       "3 0.03225806      0.00000000\n",
       "4 0.07258065      0.05695244\n",
       "5 0.08870968      0.02123184\n",
       "6 0.14516129      0.18588672"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 1 × 9</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Min</th><th scope=col>Q1</th><th scope=col>Median</th><th scope=col>Q3</th><th scope=col>Max</th><th scope=col>Mean</th><th scope=col>SD</th><th scope=col>n</th><th scope=col>Missing</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>0</td><td>0.1895161</td><td>0.3387097</td><td>0.6572581</td><td>1</td><td>0.4200461</td><td>0.2918234</td><td>35</td><td>0</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 1 × 9\n",
       "\\begin{tabular}{lllllllll}\n",
       " Min & Q1 & Median & Q3 & Max & Mean & SD & n & Missing\\\\\n",
       " <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <int> & <int>\\\\\n",
       "\\hline\n",
       "\t 0 & 0.1895161 & 0.3387097 & 0.6572581 & 1 & 0.4200461 & 0.2918234 & 35 & 0\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 1 × 9\n",
       "\n",
       "| Min &lt;dbl&gt; | Q1 &lt;dbl&gt; | Median &lt;dbl&gt; | Q3 &lt;dbl&gt; | Max &lt;dbl&gt; | Mean &lt;dbl&gt; | SD &lt;dbl&gt; | n &lt;int&gt; | Missing &lt;int&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|\n",
       "| 0 | 0.1895161 | 0.3387097 | 0.6572581 | 1 | 0.4200461 | 0.2918234 | 35 | 0 |\n",
       "\n"
      ],
      "text/plain": [
       "  Min Q1        Median    Q3        Max Mean      SD        n  Missing\n",
       "1 0   0.1895161 0.3387097 0.6572581 1   0.4200461 0.2918234 35 0      "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 1 × 9</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Min</th><th scope=col>Q1</th><th scope=col>Median</th><th scope=col>Q3</th><th scope=col>Max</th><th scope=col>Mean</th><th scope=col>SD</th><th scope=col>n</th><th scope=col>Missing</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>0</td><td>0.1895925</td><td>0.4288832</td><td>0.7420577</td><td>1</td><td>0.454269</td><td>0.3161448</td><td>35</td><td>0</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 1 × 9\n",
       "\\begin{tabular}{lllllllll}\n",
       " Min & Q1 & Median & Q3 & Max & Mean & SD & n & Missing\\\\\n",
       " <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <int> & <int>\\\\\n",
       "\\hline\n",
       "\t 0 & 0.1895925 & 0.4288832 & 0.7420577 & 1 & 0.454269 & 0.3161448 & 35 & 0\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 1 × 9\n",
       "\n",
       "| Min &lt;dbl&gt; | Q1 &lt;dbl&gt; | Median &lt;dbl&gt; | Q3 &lt;dbl&gt; | Max &lt;dbl&gt; | Mean &lt;dbl&gt; | SD &lt;dbl&gt; | n &lt;int&gt; | Missing &lt;int&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|\n",
       "| 0 | 0.1895925 | 0.4288832 | 0.7420577 | 1 | 0.454269 | 0.3161448 | 35 | 0 |\n",
       "\n"
      ],
      "text/plain": [
       "  Min Q1        Median    Q3        Max Mean     SD        n  Missing\n",
       "1 0   0.1895925 0.4288832 0.7420577 1   0.454269 0.3161448 35 0      "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# formula\n",
    "norm_minmax <- function(x) {\n",
    "    (x- min(x)) /(max(x)-min(x))\n",
    "}\n",
    "\n",
    "# apply to dataframe\n",
    "normalize_salary <- as.data.frame(\n",
    "    lapply(data, norm_minmax)\n",
    ")\n",
    "\n",
    "head(normalize_salary)\n",
    "\n",
    "normalize_salary %>%\n",
    "    summarize(\n",
    "        Min = min(YearsExperience,na.rm = TRUE),\n",
    "        Q1 = quantile(YearsExperience,probs = .25,na.rm = TRUE),\n",
    "        Median = median(YearsExperience, na.rm = TRUE),\n",
    "        Q3 = quantile(YearsExperience,probs = .75,na.rm = TRUE),\n",
    "        Max = max(YearsExperience,na.rm = TRUE),\n",
    "        Mean = mean(YearsExperience, na.rm = TRUE),\n",
    "        SD = sd(YearsExperience, na.rm = TRUE),\n",
    "        n = n(),\n",
    "        Missing = sum(is.na(YearsExperience))\n",
    "    )\n",
    "\n",
    "normalize_salary %>%\n",
    "    summarize(\n",
    "        Min = min(Salary,na.rm = TRUE),\n",
    "        Q1 = quantile(Salary,probs = .25,na.rm = TRUE),\n",
    "        Median = median(Salary, na.rm = TRUE),\n",
    "        Q3 = quantile(Salary,probs = .75,na.rm = TRUE),\n",
    "        Max = max(Salary,na.rm = TRUE),\n",
    "        Mean = mean(Salary, na.rm = TRUE),\n",
    "        SD = sd(Salary, na.rm = TRUE),\n",
    "        n = n(),\n",
    "        Missing = sum(is.na(Salary))\n",
    "    )"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "b4b7b677",
   "metadata": {
    "papermill": {
     "duration": 0.066489,
     "end_time": "2022-04-09T06:15:15.994778",
     "exception": false,
     "start_time": "2022-04-09T06:15:15.928289",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**Note:** \n",
    "1. 'min' value of the feature gets normalized to 0\n",
    "2. 'max' value of the feature gets normalized to 1\n",
    "3. the remaining values [0, 1]"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "c11e11a2",
   "metadata": {
    "papermill": {
     "duration": 0.066865,
     "end_time": "2022-04-09T06:15:16.128556",
     "exception": false,
     "start_time": "2022-04-09T06:15:16.061691",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "#### Way 4. Mean Normalization"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "1aebf5cb",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-09T06:15:16.267413Z",
     "iopub.status.busy": "2022-04-09T06:15:16.265716Z",
     "iopub.status.idle": "2022-04-09T06:15:16.300379Z",
     "shell.execute_reply": "2022-04-09T06:15:16.298729Z"
    },
    "papermill": {
     "duration": 0.105072,
     "end_time": "2022-04-09T06:15:16.300556",
     "exception": false,
     "start_time": "2022-04-09T06:15:16.195484",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>YearsExperience</th><th scope=col>Salary</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>-0.4200461</td><td>-0.4384237</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>-0.4039171</td><td>-0.3709733</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>-0.3877880</td><td>-0.4542690</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>-0.3474654</td><td>-0.3973165</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>-0.3313364</td><td>-0.4330371</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>-0.2748848</td><td>-0.2683823</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 2\n",
       "\\begin{tabular}{r|ll}\n",
       "  & YearsExperience & Salary\\\\\n",
       "  & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t1 & -0.4200461 & -0.4384237\\\\\n",
       "\t2 & -0.4039171 & -0.3709733\\\\\n",
       "\t3 & -0.3877880 & -0.4542690\\\\\n",
       "\t4 & -0.3474654 & -0.3973165\\\\\n",
       "\t5 & -0.3313364 & -0.4330371\\\\\n",
       "\t6 & -0.2748848 & -0.2683823\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 2\n",
       "\n",
       "| <!--/--> | YearsExperience &lt;dbl&gt; | Salary &lt;dbl&gt; |\n",
       "|---|---|---|\n",
       "| 1 | -0.4200461 | -0.4384237 |\n",
       "| 2 | -0.4039171 | -0.3709733 |\n",
       "| 3 | -0.3877880 | -0.4542690 |\n",
       "| 4 | -0.3474654 | -0.3973165 |\n",
       "| 5 | -0.3313364 | -0.4330371 |\n",
       "| 6 | -0.2748848 | -0.2683823 |\n",
       "\n"
      ],
      "text/plain": [
       "  YearsExperience Salary    \n",
       "1 -0.4200461      -0.4384237\n",
       "2 -0.4039171      -0.3709733\n",
       "3 -0.3877880      -0.4542690\n",
       "4 -0.3474654      -0.3973165\n",
       "5 -0.3313364      -0.4330371\n",
       "6 -0.2748848      -0.2683823"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "mean_norm_minmax <- function(x) {\n",
    "    (x- mean(x)) /(max(x)-min(x))\n",
    "}\n",
    "\n",
    "mean_normalize_salary <- as.data.frame(\n",
    "    lapply(data, mean_norm_minmax)\n",
    ")\n",
    "\n",
    "head(mean_normalize_salary)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "0e770fac",
   "metadata": {
    "papermill": {
     "duration": 0.069005,
     "end_time": "2022-04-09T06:15:16.439206",
     "exception": false,
     "start_time": "2022-04-09T06:15:16.370201",
     "status": "completed"
    },
    "tags": []
   },
   "source": []
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
   "duration": 7.115263,
   "end_time": "2022-04-09T06:15:16.619804",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2022-04-09T06:15:09.504541",
   "version": "2.3.3"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
