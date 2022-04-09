{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "60ba5875",
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "execution": {
     "iopub.execute_input": "2022-04-09T11:47:44.110707Z",
     "iopub.status.busy": "2022-04-09T11:47:44.107454Z",
     "iopub.status.idle": "2022-04-09T11:47:45.367172Z",
     "shell.execute_reply": "2022-04-09T11:47:45.366162Z"
    },
    "papermill": {
     "duration": 1.320837,
     "end_time": "2022-04-09T11:47:45.367405",
     "exception": false,
     "start_time": "2022-04-09T11:47:44.046568",
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
   "id": "a39ed23a",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-09T11:47:45.498401Z",
     "iopub.status.busy": "2022-04-09T11:47:45.468509Z",
     "iopub.status.idle": "2022-04-09T11:47:45.535060Z",
     "shell.execute_reply": "2022-04-09T11:47:45.533615Z"
    },
    "papermill": {
     "duration": 0.118752,
     "end_time": "2022-04-09T11:47:45.535208",
     "exception": false,
     "start_time": "2022-04-09T11:47:45.416456",
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
   "id": "960f3f84",
   "metadata": {
    "papermill": {
     "duration": 0.049393,
     "end_time": "2022-04-09T11:47:45.634303",
     "exception": false,
     "start_time": "2022-04-09T11:47:45.584910",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### No-outlier Way.1 - Z-score normalization (standardization)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "38102ad7",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-09T11:47:45.740575Z",
     "iopub.status.busy": "2022-04-09T11:47:45.739120Z",
     "iopub.status.idle": "2022-04-09T11:47:45.807136Z",
     "shell.execute_reply": "2022-04-09T11:47:45.805692Z"
    },
    "papermill": {
     "duration": 0.123545,
     "end_time": "2022-04-09T11:47:45.807280",
     "exception": false,
     "start_time": "2022-04-09T11:47:45.683735",
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
   "id": "6c4f885e",
   "metadata": {
    "papermill": {
     "duration": 0.054768,
     "end_time": "2022-04-09T11:47:45.916714",
     "exception": false,
     "start_time": "2022-04-09T11:47:45.861946",
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
   "id": "3562e2b3",
   "metadata": {
    "papermill": {
     "duration": 0.054912,
     "end_time": "2022-04-09T11:47:46.026821",
     "exception": false,
     "start_time": "2022-04-09T11:47:45.971909",
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
   "id": "f48c857f",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-09T11:47:46.142326Z",
     "iopub.status.busy": "2022-04-09T11:47:46.140615Z",
     "iopub.status.idle": "2022-04-09T11:47:46.211978Z",
     "shell.execute_reply": "2022-04-09T11:47:46.210458Z"
    },
    "papermill": {
     "duration": 0.130409,
     "end_time": "2022-04-09T11:47:46.212110",
     "exception": false,
     "start_time": "2022-04-09T11:47:46.081701",
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
   "id": "cbfaa4b5",
   "metadata": {
    "papermill": {
     "duration": 0.060311,
     "end_time": "2022-04-09T11:47:46.332991",
     "exception": false,
     "start_time": "2022-04-09T11:47:46.272680",
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
   "id": "1104e3b4",
   "metadata": {
    "papermill": {
     "duration": 0.06044,
     "end_time": "2022-04-09T11:47:46.453932",
     "exception": false,
     "start_time": "2022-04-09T11:47:46.393492",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "#### No-outlier Way 3. Min-Max Normalization"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "d2460220",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-09T11:47:46.581008Z",
     "iopub.status.busy": "2022-04-09T11:47:46.579293Z",
     "iopub.status.idle": "2022-04-09T11:47:46.640578Z",
     "shell.execute_reply": "2022-04-09T11:47:46.639215Z"
    },
    "papermill": {
     "duration": 0.125833,
     "end_time": "2022-04-09T11:47:46.640704",
     "exception": false,
     "start_time": "2022-04-09T11:47:46.514871",
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
   "id": "5d7e3671",
   "metadata": {
    "papermill": {
     "duration": 0.066653,
     "end_time": "2022-04-09T11:47:46.773471",
     "exception": false,
     "start_time": "2022-04-09T11:47:46.706818",
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
   "id": "edd900e4",
   "metadata": {
    "papermill": {
     "duration": 0.068327,
     "end_time": "2022-04-09T11:47:46.909032",
     "exception": false,
     "start_time": "2022-04-09T11:47:46.840705",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "#### No-outlier Way 4. Mean Normalization"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "c41cb691",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-09T11:47:47.047456Z",
     "iopub.status.busy": "2022-04-09T11:47:47.046054Z",
     "iopub.status.idle": "2022-04-09T11:47:47.078468Z",
     "shell.execute_reply": "2022-04-09T11:47:47.076880Z"
    },
    "papermill": {
     "duration": 0.102284,
     "end_time": "2022-04-09T11:47:47.078618",
     "exception": false,
     "start_time": "2022-04-09T11:47:46.976334",
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
   "id": "461b3c5c",
   "metadata": {
    "papermill": {
     "duration": 0.067253,
     "end_time": "2022-04-09T11:47:47.213695",
     "exception": false,
     "start_time": "2022-04-09T11:47:47.146442",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "#### No-outlier Way 5. Unit Length Normalization"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "4edd921b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-09T11:47:47.354359Z",
     "iopub.status.busy": "2022-04-09T11:47:47.352644Z",
     "iopub.status.idle": "2022-04-09T11:47:47.382518Z",
     "shell.execute_reply": "2022-04-09T11:47:47.380983Z"
    },
    "papermill": {
     "duration": 0.101387,
     "end_time": "2022-04-09T11:47:47.382652",
     "exception": false,
     "start_time": "2022-04-09T11:47:47.281265",
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
       "\t<tr><th scope=row>1</th><td>0.02565685</td><td>0.07411198</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>0.03032174</td><td>0.08703820</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>0.03498662</td><td>0.07107539</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>0.04664882</td><td>0.08198978</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>0.05131371</td><td>0.07514427</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>0.06764080</td><td>0.10669880</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 2\n",
       "\\begin{tabular}{r|ll}\n",
       "  & YearsExperience & Salary\\\\\n",
       "  & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t1 & 0.02565685 & 0.07411198\\\\\n",
       "\t2 & 0.03032174 & 0.08703820\\\\\n",
       "\t3 & 0.03498662 & 0.07107539\\\\\n",
       "\t4 & 0.04664882 & 0.08198978\\\\\n",
       "\t5 & 0.05131371 & 0.07514427\\\\\n",
       "\t6 & 0.06764080 & 0.10669880\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 2\n",
       "\n",
       "| <!--/--> | YearsExperience &lt;dbl&gt; | Salary &lt;dbl&gt; |\n",
       "|---|---|---|\n",
       "| 1 | 0.02565685 | 0.07411198 |\n",
       "| 2 | 0.03032174 | 0.08703820 |\n",
       "| 3 | 0.03498662 | 0.07107539 |\n",
       "| 4 | 0.04664882 | 0.08198978 |\n",
       "| 5 | 0.05131371 | 0.07514427 |\n",
       "| 6 | 0.06764080 | 0.10669880 |\n",
       "\n"
      ],
      "text/plain": [
       "  YearsExperience Salary    \n",
       "1 0.02565685      0.07411198\n",
       "2 0.03032174      0.08703820\n",
       "3 0.03498662      0.07107539\n",
       "4 0.04664882      0.08198978\n",
       "5 0.05131371      0.07514427\n",
       "6 0.06764080      0.10669880"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "unit_length <- function(x) {\n",
    "    x / sqrt(sum(x^2))\n",
    "}\n",
    "\n",
    "unit_length_salary <- as.data.frame(\n",
    "    lapply(data, unit_length)\n",
    ")\n",
    "\n",
    "head(unit_length_salary)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "81dfadfc",
   "metadata": {
    "papermill": {
     "duration": 0.069392,
     "end_time": "2022-04-09T11:47:47.521154",
     "exception": false,
     "start_time": "2022-04-09T11:47:47.451762",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "#### Scatter Plot\n",
    "\n",
    "to see the distribution of original, min-max normalized, standardized data, mean normalized, and unit length data."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "2ea7ffe6",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-09T11:47:47.664536Z",
     "iopub.status.busy": "2022-04-09T11:47:47.663172Z",
     "iopub.status.idle": "2022-04-09T11:47:48.130437Z",
     "shell.execute_reply": "2022-04-09T11:47:48.129274Z"
    },
    "papermill": {
     "duration": 0.540361,
     "end_time": "2022-04-09T11:47:48.130581",
     "exception": false,
     "start_time": "2022-04-09T11:47:47.590220",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\nIZWBCvcAAAAASUVORK5CYII="
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
    "# original data\n",
    "ggplot() +\n",
    "    geom_point(\n",
    "        data, \n",
    "        mapping = aes(YearsExperience, Salary), \n",
    "        color = 'darkgreen'\n",
    "    )"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "e4a5b372",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-09T11:47:48.281268Z",
     "iopub.status.busy": "2022-04-09T11:47:48.279008Z",
     "iopub.status.idle": "2022-04-09T11:47:48.706995Z",
     "shell.execute_reply": "2022-04-09T11:47:48.706351Z"
    },
    "papermill": {
     "duration": 0.504019,
     "end_time": "2022-04-09T11:47:48.707138",
     "exception": false,
     "start_time": "2022-04-09T11:47:48.203119",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\ncO7b15/Lsm9bZlH0eb3HTHpszKTHiGjP6ue6XP70QzO2b5zai2jN+i15lFI5guGXafcuzo98\n59Wrbnp1XdLlC7JWTapY9eG51EGki7yI6LNDXx2jrtEVC9dvzqvXa31+PmHWWg/kw4Vzzq3q\ncjED2hBRtV+M499Uu8TurPGOOX8V1Kd4Hz+g3fMH1L9C9KEAAABUF9P9hTiN+NNtD+0rKx9y\n6yz++57HtzV0Pypd+5ldog4svm3tqcqL0j67/+qbb775qLd/gRu6vVc1hjkREZXlzO/fv/+N\nL26vWNK2T18icpe5w1KePM+k2fzgY4ft5YnEWbxx/Lz3Vm2Jc1v3SpxH9ehd8Spr9ob/nigl\nanAXYQVD3G1Xx+gz595/yFb+2RbsfO+pQ8X1OSjfn4+PA2l0tdXE9p0VphKq/mI4CrdOmvV3\n5dGJgr3guzxX+ZV59vxN9/1ywvPYd/E+fkANqhAtdgAhh1mt2mXLVLt2cY3G3auX45prSKxj\nytJdu1RLl2oPHhTj4+Xhw12jRjlq74sAgLqJunZr5l533oPLerYbMO7WkXGUs+qjxcX9x9IP\nHzR0Vw9///Z7HW65LC3j2jFX9U6P2vXLF4vX7O82YfG4OO8tcA3dviq1WU1E776x0NH5/LFj\n+lVdFd722Ytj31373JDLD93ev2uqXHRkxcIPRHX0zDk9mWj6Zsl96dfO69Z+6O23XhqvLvr6\nvQXZkvGtLycYYnUXR9+37uUrJqsf651oOJS5aeGClWnxOuexba9/suzOm29o6KdBRMRUC3+c\n06n/Y+d1uuSu20Zoiw58/N7nV54fs2LzaYO3WZ2rHZTvz6e2A2lMnd6ojeetfvriQU9/Vf6L\nwXNWfvTxibRk2n7As8FV4zo8+/z/zhs+/vFbh7tO7f3olXk5MRo6Xh7OfBTPo2v9ATWoQgQ7\ngNCi3rzZfOedQk4OeaIZ54Z580oWLZLatavtJXPmGObNM3Be/orFi3WDBumWLCkxmer1lZrJ\ndk3uatGyj6vChPgLqVUD2vwBFKz7A0s3Rc95cu77n779IjO3HjF27kf/N9xsanCwMyXf+M8/\n4dOmvfDNV++vcGpSO3R55r3VM+4c6a/tq4rr939X9Nr38+wpO7s+VS3YMTF85c6fpz30zDer\nP1nzSZk+snWvC8Z++cz/XZNoIqKUq1/d832nKXPe/PiN5xzM1LXflYuef+3WDhFEtGL7t/dP\n+s+KN55ZrG7Vq/fA9/461N+2sO8lM6fec//1o69r6KfhEdPr4QPbEu948KXF/31Ondjzoc+3\n935nxDeiPkz0EuyqHZTvz8fHgfjLwKd+/Ln1UzPnfbzkrRfV4Ukjbp3z1UN57dNf8Kzt+eyv\nb1onvrF87dR7P3VxnjBo/E8vnx48cLVnrY/iff+A6o9xry22IUOW5YKCgnpurFarw8LCFHNX\nclEUIyMjiai4uFgx89hFRkZardZQm7Cq0cLDw9Vqtd1ut1jqNUasTqywMKpvX1ZaSlVnKRME\nqWPHwnXrvLbbffedZsIELxN73nqr/dVX665KXfCnedf9gv1kxRI5aXRhh7lcPKereUKEVqv1\nzH+bl1evy3dCH2MsOjq6oKBAMfPYRUdHM8YsFss5zvKNSz+bFb516zZNeIdu7SunOFnYMfrB\nvAHW/FVBLKvRSrJmhLedPXZv/icdoyoWyo6S46fdyYlRPl7YFHCNHUAI0X79NSsupmr/Zsuy\nuGePeuNGry9ZvFjndb6RpUu1Nlsd3bGC/UTY9rGC49RZC48tM+2Z2qCy3W53fn7+qVOnPHd2\natBrAaDlYfcPHzR4+MyK527r7meyilsNui94JfmfoA0LfKojdMUChBTV3r3EmNcrn1V79rgG\nD665fP9+lde2G6eTTZ9uPLS3JFm/qUeHo6nnJQ+9vqegOWuiS92xj5hkq/labfaysvSnZW2r\nmqtqOn78+KFDhyru6WQ0Gjt16hQeHu77VQDQki2YMbTn468MnqC/+7KerPTo56/MOiWZP3/3\nwmDXpQQIdgAhhKvV3sezeVZ5o9fX2kJmzF70/T3TwvXlY81Of5eg6jNdan05V5VfsaEq3UlM\nqHJP2Io346rSXc56BLuTJ0/u37+/6pKysrIdO3b07dvXYFBCZy4ANIUeU39cpZ36/MKlDyx9\nya2N6jHwqs8XzR0d31xPGip9p/7d0rShMWYNwQ4ghLj79qV33/W+6vzzvS4fPNh14IBYLQ0y\nRrcMWrLgjns4rzzRxBpP0J77aQ9zm7uUdZjlih5CVPtpqB5nKM75oUOHGKt+qa4kSVlZWZ07\nd65zDwDQYo168OVRD74c7Cr8wxB368Z/bg12FeVwjR1ACHGMGiV16kQ1LppzXHGFu0sXry+Z\nPNlqNvOqrxAE4pyeufZZmQuM1WzP4yrLnvCtN2izv3SH9fDSXEdETHCb6771ocPhcDqdXi+q\nKy6uY0oqAABoCgh2AKFErS5etsw5YkTlEkGwT5hgeeut2l6RlCSvWlXcp0/luOmoKDnKVNA+\n/qDAahk4yWUiMu19wpF4CxdNNc8D9oRbZE3dYwx9DMxUzJhNAIDmBV2xAKFFjo8vWbxY3LdP\nlZlJarWrZ085MdH3Szp3dq9aVXz4sHjggNi6tZyQIA3tJ/l+CRFnrmLBdry49zLzrsmi9d/y\nxYzJbW8vS5tVn1L1er0oipJU/b0YYyZTwyZeAgAAv0CwAwhFUseOUseO9d+eMUpNlVJTyzNW\n+4yI3JJWseZcb12xVV7lzHe1GlU48A9N/jrRsperI8T4oaro7rx+HamMsTZt2hw7dqzaQs55\nYl1hFAAAmgK6YgEU6PnnrW/9/KDvVEdEsiGZiEhQO2NH2No9aE8cL5s7NeiN0tLS4uLOugkj\nY6xDhw5RUUGYvQkAANBiB6BAGRlu8xOTvv32+BUdFtQS7wTJmOY2Z5zjGwmCkJGRUVRUVFBQ\n4HA4DAZDq1atdDrdOe4WAAAaB8EOQJlS2lLKA7MKi2+Uj/8SUfKVqjSTSCCSPVOccJWptNt8\nX9OdNEREREREhD9vxQgQXKWlpU20Z8897gCaDoIdgJLJ4RkUnlFED6rzf9cffVdlyZTVUa6I\n/ra0KbI6OtjVAQCAnyHYATRvquJt6oI/BedpyZjuaHUlV0d63cwVPcQVPSTAtQEAQIAh2AE0\nV0x2mDIf0WZ/SVR+FZ1x3wx78kRr2we5Gh2jAAAtEUbFAjRXxv0ztdnLKlIdETHJpj/8RtTv\nPXUnPgliYQAAECwIdgDNEpPKtMc/rmWVxZT5sDbn2wCXBAAAQYdgB9AsiWUHmeysdTUTDP++\nFMByAAAgJOAaO4DmiYm+1nJZtOxlkpWLBq/rLRZLaWmpKIpms1mv1zdJhQAAEHAIdgDNkmRM\n56KByTbitd9egrtrLrPb7fv27cvPz/c8ZYzFx8d36NBBFH0mRQAAaA7QFQvQLHFBa2s7ufZU\nx2RdAleFVVsqy/Lff/9dUFBQuR/Os7OzMzMzm6xSAAAIHAQ7gObKmvqotd0jtfTJclvb+2ou\nPX36dFlZGa8RB/Py8iwWSxPUCKBkTzyh7djRlJJiuvpqvcvlhx1eHKlnjE3fV1ht+Zox7Rlj\n3R7Z0qDNqroi2qAxdd9rO6sVf+O9XcwJD/ih7nqLUot3HigkIsbYY4eLG7GHwoN7D2bbPI8b\nvRNlQ7ADaLaYYE2fXjD4L0fr687EO88twkRb2/ttyXfVfEVxca0nQR+rAKCaHTuEiAjz229r\nsrNZYSFbt04VHW2ePl177nsWVMLn0zeftYg7p353TM1YIzarylW28/LxoTIR0j333DPArGnE\nCz+/bOBVs3ac406UDcEOoHmT9Yml3d4pHLylrOMse/IdZelPFw78razDTK/3ga3ZVlefVQBQ\nzdChRlmuvvDNNzU7dpzrv6rtxg87/sMjNrny77HowLOZUuLYOEMjNquq7Y03Zy2//dnNuY0r\nzG0tqvJMctU4/AaZP3/+9THnOmyr/jtxSy3o/IZgB6AEkj7ZlnKvpdOLtnYPSKaOtW1mMpka\nsQoAqpoxQ1vb96Crr641V9VTdMYLqfTvf3ZXXgi75T+ft7nwVbPIGrFZVTG9nlgyNu3Fy8bk\neAtlbuu+J8ZdmhBl0hjDe1w4+ou/y/ccpRbfOHrs0dHDEtqNJ6I2WtWMNR/0jDdrVer49v3e\n3XL6r0VTO7WO1Jpi+l37cN6ZPdtyN9x77ZD4CJNKa2iXccGcZXurvZ1BFB47XGw58V92tqj0\n+T728ECC+b6DhXsWDDTGjq7YiY/i22hVc3b/dkXnOI1ajE5Im/jc1/X4CTR7CHYAoY9rclaZ\n9jxu3nG74cAc0Xqo0Ttq1aqVWq1mNTprzGZzeHj4uRUJ0FJ8+aW6tlXFxbXmqnpiguHVSxOX\nP/5n+XPueHT1sWtfGtS4zaq5ceEPXVzrL5nyY4018v29B7z9h/zih9/8+f1nIyN23trvvD9K\nymfK/HLi5eGXP/bbxnc9T1+59r/3fPDz/l3rbzAfuu+Cbtd9zj/8cctvX8zc8+0bY5Yf9mzz\nxKBRy092eX/l2r/+XPPwJfJTN59/2C7VrMcYf/fxM/ZueCNMJVz2+FAfe/jvwZxX0iI63rn2\ndNaSehb/xoWjMx59P/PAnoWPDXr/6etmZZX4/ogUANOdAIQ05i4J2z5OXbiBiBETKHeV4cgb\nZR2etqXc24i9qVSq7t27Z2Zm2u12xpin+9VsNnfr1q1m2gMAr3xNMeSPHr/+L9x0sscjpdJV\nZpEV7n9mn9xuc5eoaY3drCpRl/bNsknJo65558Hcu9Mrv8uVHH729rERmQAAIABJREFU3b2F\ni46vGJdgJKK+gy/4PSr2wZd2bX++FxHltpv39O3DKzbu9dpXd1/ekYhmvH3+24N++G75i90M\nKuqe/njSjM/+OE1j0oio7aQn35/wwKhYPRF1Spv+8GtXbC9zttNV7zZloikhwUREbtv+23tN\nS5mw6JO7unhWed9DtEHHmKDWGwyVlzP6Lj7ims9enHgREXV+5OPznv5iY5aFUqpPF6AwaLED\nCGmmvU+qCzcSEREn7vnKKxn3Pa0uWN+4HYaHh/fv379z584JCQnJyckZGRl9+vTR6XT+KhhA\n8QYP9jJDpIfB4IdkF9nh2QzVicf/ySOizdOXJlzyikHw8r2rnptVkzjyjf8Oi5160T1lVa7P\ny13/q9rQaXyC0fOUieZH24cfW14+C1L7CV2q7qHVoBjPA3WETtQmdzOUtxBFqwR+Zp8PT7nX\n+Ofyl5576r47bxk+4JY6apJtTw4fsiPpzo3vVG5Z/z34Lj5tYkbFljEqgVrAtXYIdgBeiEeO\n6N96yzRtmn7ePHHPnmCVwVzF2uyvqNqpiHNigu74R43erSAIrVu37tChQ/v27ePi4tBWB9Ag\n779vr23VG284/PAGTDP3quRVj60j2f7oD8dveHHAOW1Ww/1ffxV9+svLXqicFYVzXm24lSgy\nXv5NksKifIw89ZIiJMexK9ITb5r1WbEYfcEVt76+rI6huF9MHvjm/g6//P6K8UwwbdAefBev\nNbe4nskWd8AAdTK8+qrh5ZfJ5SLGiHPjnDm2u+8ue/ZZCngAEm1HvN49grisslS/GBkAAmb+\nfPu991Zv5x42zH3DDf6Yzo6oz3Pjs7tMOZi55QClP9cx6hw3q0ZjPv+nBdd0mnjpilERniVx\ng4e4rLM/yS67pbWRiLhkeWV/UeKkDJ+7qVXh3kdXZ9mz7d+2UgtEZM31FcsyP7jtlvdPLt59\nIMNQGUgatAf/Fq8AaLEDOIv2668Nc+aQZ7JRz/UysqyfP1//3nuBL4YLtU2Lxbio55wXFxef\nOnUqPz/f5ZfZUQGgfm65xVVSUtqtm6zVklpNrVvzLVtKv/nG5q/9h7d7sq82b9TY95NGvqKr\n/R/qem5WU/ptXzzSRfXSN1ln9vPsnR0i7hs8+vPVv2/f8POMG8/faI97/T/dGle8Nrovl51z\nP/816/jhDT8uGjN8GhHt/je35uiJ/B1v9p+05KZ53ww32XJycnJycnJz833vQWRkObz/1Km8\nKh+CP4tXALTYAZxF/847JAhUbYoqxvRvv22bNCnAxUjG9lwdyVxF1XtjicqMvX///X+SVH67\nCEEQUlNTk5OTA1whQEu2fn1ZU+2aqV4a3XbI+/umL+/nh828EJ5b89EHCVef+UYozt+6Puru\nhx65eWSeQ+x8/sglm98ZGt7I+ZbNiVN/eOnIg9NverNEdd75F81cnhk/rtuzgzMuq3IzQ49/\nF71jkeRP7x3w6ZnBYGpDF2dZpo89DHnkautjd3XsN6Y46+Mzu/Fn8QrAQnxWUlmWC2r8KtRG\nrVaHhYVV3N28uRNFMTIykoiKi4sV0x4TGRlptVodDn9chtI0opOSmN37BTT5hw5xs7nqkvDw\ncLVabbfbG3E/LlXxdt2JJWLZAVkT64oeYk+4hZiXL1q6Yx+Z9kwlEogqsqYgiWErpZcdQphw\n9nf09PT0pKSkhlZSlV6v12g0irkLhVarNZvNRJSXl1fnxs0CYyw6OrqgoECuOT1u8xQdHc0Y\ns1gs9lr+7uopJibGXyURUWlpqR/3VpX57HMIgN+hxQ7gbKra/yh8rGog48HZ+sPziJhnJIQ2\nZ6X+6MLiPl/JmthqW9qTJpCgMu5/lrnKp313RfZ9b8eU6FSqNgCOc3bo0OGEhARBwCUWAAAt\nFIIdwFlcfftqfvutelesILg7deL6c70Bjocmb43+0GtEVN7ByiUiEsv2mfY8VnLeoprb2xNu\ndcRfqyrNFKxHuNq0r/DCErY/mqq3ZDPGJclts9mMRqNf6gQAgGYHwQ7gLLZHHtH89ttZl9kJ\nAnFunTrVX2+hO/EpMYH42dmRc03uD8L/s3ffAU1dXQDAz30vexCSsEFBARUUZ3HPKnWhVeus\n1tq6tVr3HtXaaq2jVevoV2eHWqut2lZaR917L0RQwAHKCCuEzPe+P4KIkECEAAHP76/kjXvP\nCygndxpUDNfC1DY6+4Ho/iJu+kUACAWicG8WRd5Xg3vhK00mC8u7I4QQekNglw1CrzC0aJG5\ndSvj+rJLlHVyUq9Zow8Pt1cVdPaDglldbk0MpYktfJiTcVV2sSs343LedTV5FzoZ54jY5AJX\nGo3U/fu4MxhCCL25sMUOoYL03bqltW/PuXCBfviQ8fU1hIaydt1HleFIaSCFJ7oCAEtLCh8U\nRy8ijDHf5AkghOVBdl127yUyJv+Vx4/X+PFHxbFj6YGB2G6HEEJvImyxQ8gCViQydOigHT5c\n36mTfbM6ADAo2ljI6gjF8N1N4sCChxkdN+1c/qwuL0YP5jrAyx7jixe9d+xoqNeT1atF9g0Y\n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\nR/368dfqlpc1C2eNP31QO1+23ZnVqfuJV9/x572x/a3qqV4Fed1nhMs/ueL0Pjmu/GDc0KO7\nZ/3iByd2L3Q7HN6CrqMvnfLx7lDzAwdKn8u123pc/lzNku3v3aWUOnvG5yLisWmnzF756M1j\n22V7HDZn+659r7pj1u46TauJHTk06gPH+uueY9fEe1/s3c5XPH3b248NKs7LctqyC7qcfPbV\nS7fUnhS4bflzl5xxUkGu2+NrP+ScSS//d1czv7cAgCQwgDajdNGPRaRo7BOGEftxiU+z5y3Z\nXV13heDWV7tnORyebtfcePt9d0+9eESJiAy46qnE6KbFN2hK+Y8//fa7fv3Ar391xZl9ReS4\nSYsTo3N75nuLfnlpcd6YK6bMePQvYd14eEwXpWyjJl5/7wMP3H7dRTk2LbvTBRHdMAxjz9rL\nRWT40183HfjDe4crpX798Q7DMGKh74b6XAUn3hzVDcMwsjTl79tJKfuZl/zgl3fdOm54kYgU\nnnpHrBk7cmjU+7v5cgp/2JxvwgvHF7j9I7u4bMOv/OmMv8y66/rzHZrytD838bnb3v9Ntk3z\ndDz5utumT7/jphMK3Joj/4mNFYfdLAAgKSh2aFt+fXJHpdRND54rIkPu/qje6D19Cxye3h/W\naXuv3jpARO77ptwwjL/1bWd3F5WGYjWjt3TJzSo4P/F6bs98pdRZj3yW+DJatU5TquicV2pW\n/vDnp7Rr1+7FnVXGgWLXIGfOoJq36PGqa0p87ryR28Lxl67qaXN2euNAtixNiciUl9ccWDU6\n97oTROSad7YedkfqRTWMg4pd0+994fgCETn5nndqRy8pEZE3ykKGHh6T584qOHtNMJIYqt7z\nTr5DKxzywmE3CwBICood2pbqPf8ucNhEJKvgzL2Jua8DopWrbEr1u+2TugvD5e+KSL/bPzEM\no7Jsz569wZohPR68oXOO2z868eXcnvlKc++IxBNfxkKb3Jrydpv03037Do2RKHbHnH3t7YeY\neteMumsGNr/ktWvHXnSJptQlc9fWLM/SVHbHKw/KX73eY9M6DX35sDtSL6pRp9gd9r0vHF+g\n2Tz/C9e+d+M/RorIK7ur9m1+UEROfXJd3fe+98Rjs+a8edjNAgCSgtudoG1x55/5zx/1GvHY\nV+e9NDfPruoOhfYuiRvGlw9/Xz1c/10VX1aIiMefv/e/r//t9fdWf/1N6abv1nyxcmt52O2v\nXc2ZM6DmOgybq+u/f3vl2GnPfr/4heITTj5lyJDTRp118YQz8+t86LETpz50uKtic4655M17\nZ5087e/tB09/cXKvukP+XgdN+9ndPc7Ldy8pfTu097umd6Re1CP6JoiI3XNCJ2fte9WBPdq3\n/m0RGTbqoBvKDL/2+uEiwS1/OOxmAQCtR7FDm1PQM1dEOnbLrj+gOUWk3x1zHzr4cgoRcfkG\niMgrt42+eMbbXQaOOn/kkLHDzr7t3v5bf3zGTTtrV1PaQds87Y6/7bzmzvnzF7/z3gfL33z6\n+Tkzbr1lyPxVb59R4D6iwN+s3S4igW+X74johXUalShVb02HEkMPH3ZHDo1aqznvVQ3fZk8P\n6yLiPCRVMzcLAGg9ih2wnzv/XJv6Way811lnnVKzMFa99pWFKwv7eyKBjy+d8XbXc2eXLv5x\nzehTjW8tGly3YnV5Qf/BE398+8Qf3y4ia5b8ps+502/+5edf/WVo81Nte/eXk+atH/v76ct+\n8ZvRP124+vHxNUPl614SOavmy3i4dNGeUPaJI9z5Q5vYkdZ8E5p+r7fnIJE3l3+yW4q9NQvf\nmnr9vD15cx79QYs3CwBoPm53Auxnd/e4p0/++nlXL9te+3ixF2684LLLLtukSaxqbdww8gcM\nrhmq2vbhw1sDIg3fRK5yx1+GDBlyyYOf1yzpdtL3RCRWGWt+pFj1unHnP9T+pGkLf/7rxbcN\nXDNnwkOf76n9iO1P/XzBhgNf6S/eMT4Q10+/b0TTO9K01rzXW3xn/xznf6bc/m1o/63xIhUf\nXfWnOYs/6dCazQIAmo8ZO6DWz157bE7PSed0P+HCieMGH5e/6q2X5r35db9r5l3ZwSP6xDEF\nN7z90NibHLcPPsazcfXHT8xe2L3QHdm84s/PvXztZRPqbcrX7ddj2v912W9OO3fj5CF9S/Ty\n7+Y/MdfmKLjngYE163z38h/uXJt/aIzCU2+8+bxjROSvE8/6PFzw5r9/pUROf+DNc57uevcZ\nl1297fXE6XHZXQb/6f/1XXPZD77fw7fynb//851vO3z/5nnnFB1mR1rzTWiSsvkWPHvDcRf+\nqV+PEZOvOKvQUf7qnNnb4tmz/nFNKyMBAJrL7Ks3gFRbNfNkEblxQ1mDo+XrXv/J+BGF/hyn\nJ//4AafePWdJzbWzwU1Lrz775C4F2d7CktPPu2LR6r27Pv19tzyPM6f9lnBsbs/8mitkE6q2\nL//ppWOK2nntmi234JgR46999fPdiaEmbnciIif87D+GYZQuuF5ELnh8dc0Gd//fQzal+l63\nwDCMLE0dO/6t9Yt+d0rvLm67I79zr8tvnbGtzoWuTezIoVHr3u6k6fe+cHyByzus7nu/nT9K\nRF7ZXZX4csOS2eOGn+D1OFzZeYNGXTrvw23N2SwAICl4ViyQkTw2rXDcso2vjjQ7CAAgjXB6\nCwAAgEVQ7AAAACyCiyeAjHThhAn+k9qbnQIAkF44xw4AAMAiOBQLAABgERQ7AAAAi6DYAQAA\nWATFDgAAwCIodgAAABZBsQMAALAIih0AAIBFUOwAAAAsgmIHAABgEf8fH8mhp1V9UBcAAAAA\nSUVORK5CYII="
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
    "color_list <- c(\n",
    "    'MM Normalization' = 'blue', \n",
    "    'z-score standardization' = 'red',\n",
    "    \"Robust Scalar\" = \"darkgrey\", \n",
    "    \"Mean Normalisation\" = \"orange\", \n",
    "    \"Unit Length Normalisation\" = \"black\"\n",
    ")\n",
    "\n",
    "# min-max normalized, standardized data, mean normalized, and unit length data.\n",
    "ggplot() + \n",
    "    geom_point(\n",
    "        normalize_salary, \n",
    "        mapping = aes(YearsExperience, Salary, color = 'MM Normalization')\n",
    "    ) + \n",
    "    geom_point(\n",
    "        standardize_salary, \n",
    "        mapping = aes(YearsExperience, Salary, color = 'z-score standardization')\n",
    "    ) +\n",
    "    geom_point(\n",
    "        robust_scalar_salary, \n",
    "        mapping = aes(x=YearsExperience, y=Salary, color=\"Robust Scalar\")\n",
    "    ) + \n",
    "    geom_point(\n",
    "        mean_normalize_salary, \n",
    "        mapping = aes(x=YearsExperience, y=Salary, color=\"Mean Normalisation\")) + \n",
    "    geom_point(\n",
    "        unit_length_salary, \n",
    "        mapping = aes(x=YearsExperience, y=Salary, color=\"Unit Length Normalisation\")\n",
    "    ) + \n",
    "    scale_color_manual(\n",
    "        name = \"different scaling techniques\", \n",
    "        values = color_list\n",
    "    )"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "98f4c6be",
   "metadata": {
    "papermill": {
     "duration": 0.076137,
     "end_time": "2022-04-09T11:47:48.858226",
     "exception": false,
     "start_time": "2022-04-09T11:47:48.782089",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "As we can see comparing the original data and scaled data, scaling didn't affect the distribution or relationship between salary and years of experience."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "bf3f15c4",
   "metadata": {
    "papermill": {
     "duration": 0.074054,
     "end_time": "2022-04-09T11:47:49.007859",
     "exception": false,
     "start_time": "2022-04-09T11:47:48.933805",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "#### Min-Max Normalization vs. Standardization\n",
    "- are the most commonly methods"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "894d7e02",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-09T11:47:49.161741Z",
     "iopub.status.busy": "2022-04-09T11:47:49.159645Z",
     "iopub.status.idle": "2022-04-09T11:47:49.449111Z",
     "shell.execute_reply": "2022-04-09T11:47:49.448549Z"
    },
    "papermill": {
     "duration": 0.367808,
     "end_time": "2022-04-09T11:47:49.449263",
     "exception": false,
     "start_time": "2022-04-09T11:47:49.081455",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\nonrP6lj2sXHbZn53r4iIbnv2+7O9drZwdMx4+nfv7jt0yqK321Q9+s3k3mN6lxsS82p5/9tr\n9oUWXVcG91vyzdtlvOw/fz5uzICmA7pHVWz8wpcPfzq0zaj7TnwUuWnMqA3Kj+dfz6wD5v6F\n66YXq9lhzPoD73a+cYz2ZKPmSxMbvbfk62qBtlWzxjzQrF7piydb+VtFZMXwLu0GTPv5zUbO\nSWf2mjFr+Q/tKphnD+r6RKs6pds+8MX6XcrZ9ffc+3T/laN+6B+eaamepnT1JF/ZWrfbk61e\nXPDdgsYJf+8YMuCpLtW7b3umVmYtzDjxX6U6Zd6/e+W+OS1yWHwOP/8i7haCXTr+YVXr3daM\nmi1eRELSPEYp1GKyx13/q2vJkiXr1l29N15QUNDGjRtvu0gnX1/DPljd39+Y/6cDAgLcXUIa\nmiYTJ8rUqZJ87Ry4ypVl0SJp3Trr+QICpEIF/zNnrmSbvVVVCQ727Nq1upfX7X8l3cjb22UH\nmAoao+49cvkVu3w5X6/1yeJSicjI3PZz3zG137/1R8c6eviZlKjjrx3TKv5aMzizE4wCey6d\nNrydiNQY/Um9V7/YcSZOMgkW2TZbYcSLi4aN6lrMS0Sqh7/0zOxu++OTK3p69Zj74x2lK3aY\n0DFx1nuDPz7SKtAjs8pNnuFffzmiXNee7z918dEq1zfolb9e/+Bo1MfnVg8u4yMiTVq22hJc\n7Km3Du2f1FBELlZ859UH26ZO3HD2qke7VBORl+c1nddi3dqV0+p4m6VulXFhLy/dekn6h2dR\narp6kiLXxTq0R58YdEcpb2nU4IeVpf70DslqZUO8PRVFtXh5e19fx6yLz/nnX5Rl9SuS866y\nP//8M+eLVK1eIhJl13yvdTtFpDhMgZwyiYJq6lR5/XVJ221z6pR06iQHD0p4eNazjhnT+Kmn\nfsx6GlVVTCZlyZJOhTTVAXmtZEnviIiMD7k2blw8l40HVX29tnnmuAOX5zco9utLy8t0eNc7\n8zuKhw+vnfo61KyKLpHHBoVU/9w55KHjkYuqBOWw2WfGPP7TNyvfOnTs9OlTv21bmzpctZRY\numly8fqDSrZ5e/H9lbIuvmynd2e0+eq5do89cPrz1IEXf9ls8a4+pMzVW8wqJr9nKwc8uvIP\nmdRQRCoPu+FhUSVahDpfWAI9TR7l6nhf3QuFmFX92jmCmZWajm/Z0Q80WdK7QsW7Ot/TskWL\n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\nvXJVa87YE6LN3oE5mXLcGz9UGbJm8RvtnW/vbNOxhf/vjcf3kdEnb3mhDt3sio6YrIufP39+\n7heR80ZctVJGks0jxTLjEUKqAwDkB49nn02X6pzUw4fVo0ddsQRtRq9WG2NKrty5KNicwc/i\n6XULujapGezjEVqm0r2PTbviuFpMStwf4wZ2rlom0DuwRLv+Yw/GpTiH2xOOvTC4Y5lgX6tP\nQP27+37xe6RzeLDF9O7fZ5/t26ZMxSEioiX/O/XJPvWqlPX0DalzV9+Ptl+4edExdj3xwum0\nQ2o+/v7qL+doIqPK+D1xIurIgjt9ivUVkcSL2x/v1bpkoK/Zw7ti7VZTvrz6yZT2ME85/HO3\nGsWtFlNImfDhb3zlHB5/7oeHurYOC/YOKlltxLTVqZ9vZu2kKz6z2b1NqvMoamYfWobtp1uX\n1EYy+yQzWynIbQc7AADyh+nw4cxGWb7+Ovft73yz6wvr/n3p2y3tQj1vHpt8ZWvdbk9Kp9Hf\nbdm5fO7YvR+93OXdwyIievIj/2/vPuOjKNc+jl8zk91sehVCF0IVOAgeKQJSpDcREVGxKwoq\n6hFBQUFUsCI2UFAQKyoiig0OoMgjdg8qKMWKGAgSUkhIsm3mebG4pBECKbO5/X1f8Nmde+ae\na3Yz4Z97WsfuS7YlPPDce+vffLrOd4t7d7ldRETM607rtuD/zPufe/uT95cNit8yrkuH/zvo\nCfT2xlVD4oZM/vizRSIyvVenhz7Wpjz24qfr37y2m1x5ZvNnfyp5Ytkj/+m9e/XVjTsPvv2+\n+eu++LHAFEdUx6FDh+oic3/e90hqfKsr1+/f9ZKI3NZ96Io9pyxetf7rT9be1N+884LOvxX6\nA5080fu8drcs/uGnbc9O7r54xqi7dx00PWkD2w9/+8+Uh194b+UzM9MXX/ZYWl5g5nL6CRZf\nzuLH+NCO0n+JbflbeZ9k6Y06ga9eScc4FAsAgM1M86hNXm8l+/7r84d6T1vT8451s86qX+YM\nhZmrc/3mNRMv6lovUk7ruG5FvZ8ik0Qkc9utL/zq2ZC59Mw4p4j8a33GsIte2esxo9JmLdqe\n9fyfb13cIEpETu/Rc2PiSZMe3Lr53k4i8lfTx2Zc3ldE8tLmPfDF/o8yX+oVHy4inbr08r6d\ndPfE/7tq7bCia+86c/WW7q8+v3zVf5+bff+06x1Rdc4cNua2B+7r1yTaGRHp0jTdEREZGS4i\nJ4+/ffFlNww9KUJEWqdOu+nRYZsPeZq6IkQkfuSy+686S0Ta3PxChxmvfbYrb/d34z8/FP3F\nppdPi3aISNczYmLrnB1YYzn9BIvftWro0RYv/0M7av9JxbYl4OBv5X2SpTdKmsSe8I+BSgh2\nAICQZjZrZuzfX2aTr3//yvTsyfnsrH7TE7tPXz+rb3Bi5o6Lklq/Enh9xc7MZ5rePO7050ad\n3LTX4AE9unfvP3jk8HYpIvLnqk9dCQMCqU5Eoupf/dFHV4vIz5s2OCJbX9IgKjBdM2JuaR53\nzYof5N5OItL8slMC07O3r7Yss3dCsTHCeM8OkWLBTkTa9Rv7UL+xIpK7Z+fa999+Ys49Q9r8\n938ZP7SLLPY/+E3/mfDRqhUPbt3x+++/fvvJe0WbUq9qF3ydHKaLJbte3RmVclUglomIK2n4\noARX2rH6CRZfzuIB0Q3L/tDK77+Ev8r9JEtvFAI4FAsACGnuu+8uc7pVr56/S5cT7tby515/\nxrCfw8/4aM3MsCJnjSc0X5D+t3nN4vWw5Be//HPLh8+NOL3htg9f6H9qw8G3rRUR021qehmH\nbi3LEil2ErphaJZ1+GhmbOLhIOiIi9DD4nPziknbOqnoggUZy88555ztBb7A25j6LUdddevq\nze96C3beueVA0Tn97t3DWjQ8/+5lOUZSz2HjHl/+ctHW8JiSgziaoZUoso5DP2Y/weKPtnjQ\n0T608vsvofxPsvRGIYDPBQAQ0vzdunlmzHDee2/RY7JWcnL+unWV6fa1id0X7zQXb327VUSx\n/wo1I65u3bjg232bHrlvpefRh29r033IjSI/Pn1Gx1unyP2bGwz7V+E9K77O8/472iEi+fte\nTD11ynM//t6tx5ne/Nkv7z10Ub0oEbH8eY/szG44vl2Jtcc1u9ryr1q4x3tLi8AVptbkfj3T\nz1/80tWtgvOEuZq/9/bbkWv+fHnkycGJvkP7RKRZYnjR3rK23/LBrsK9he/Udegikv9XeYFJ\nRJqMbXXo9cXfHZrVIcohIt68/63IKGhW4X6OtvgxP7TjqrNOxT5JlECwAwCEOvfkyd5x45yz\nZulbt1qxsf7Bgz3XX1+ZDnetnHDBoi3txz/bImPrpowj0w3HSV07tyw6Z3id3Mfm3pUZnzJx\n6Glazi9Pzt8R1+oWEUk+9YnhdZcP7Td+8X0T6jsPPD7x5sLocwclhEvCrCtbzp/Y4zzjydta\nxXnemDvps8I666a3L1GAK3HovP4Nbu8xIvrx27u1TFi7ePJjm9LeX35y0Xkc0R3fuLHrOed1\njLxtxogeHeIjtPRfvn1q2h1JHa69r3m8iBia5P22Mz29RVTS6Za5/OFXN1zfp2naDxvvv2W6\niPz4y19nJzUpc/Mb9n+6c0RqvzMvfXrOxHr6/gW3j0+MChOR8Ir1c7TFj/mhldN/cFtSUpID\nncQ1rdAniRIIdgCAWsBMSSmsinukBex6fZ2IbFl0VY9FxaZH1RmXt+/FolPiW8z8YG7G1Cen\nnnlXZlzdRqf1vWrDU7eKiGZEv7blw8lXT7vxwv77/XGn9btqw1OBQ8bGU99sSrzmxpsvGJTh\nNtp0HvTSFwt7xRUbYAu44d1v8ieNnzNxTLo7vHXHPi9ufKt/QsnZRsz75P22sx5etPCSeb/n\nevWUJq36j7v3+XsnBe44dubNZ+dPvrpVl7E5u15Y/eDvk6ad/+TBsA6dz7prxQ8pF7ef1aPd\n4MzMMjdfdzb47/dvT7jy9stH9pXohmOnL1/w9rhpIjENb61IP0db/JgfWjn9F92Wv7up6CeJ\nojSrrJsDhQ7TNDOP8nNZQcnJydnZ2T6fr6pKCgVOpzM2NlZEDhw4EOLf4PFyuVzh4eE5Oao9\nTCY2NtbpdLrd7tzcXLtrqWIJCQn5+flut9vuQqqSYRgJCQkiot5vD4fDERMTU8nfqyKSnJxc\nJfUEVN9+ERMTU009A6GJiycAAAAUQbADAABQBMEOAABAEQQ7AAAARRDsAAAAFEGwAwAAUATB\nDgAAQBEEOwAAAEXw5AkAgM24jTBQVRixAwAAUATBDgAAQBEEOwAAAEUQ7AAAABRBsAMAAFAE\nwQ4AAEARBDsAAABFEOwAAAAUQbADAABQBMEOKMXv17Ky7C4CAIDjRrADjjC2b489//ykxo2T\nWrZMatEiavZs7dAhu4sCAKCiCHbAYY7PP0/o29e5YYPm8YiIlp0d8eijccOGaYWFdpcGAECF\nEOyAw6KnTBG/X0yz6MSwrVtdzz5rV0kAABwXgh0gIqLv3m1s21Yi1YmI6LpzzRo7KgIA4LgR\n7AARET0zs+wG09T376/ZWgAAOEEEO0BExKxXTzStjAZdNxs0qPFyAAA4EQQ7QETErFPH27Wr\n6KX2CNP0nHWWHRUBAHDcCHbAYXlz55rx8UfeB0KepkXNnJnUtGnUXXdpubl21QYAQEUQ7IDD\n/C1aZH3+ecH48f6WLa2oKLEs0TSxLBHR8vIi5s+PHzpUKyiwu0wAAI6KYAccYSUkHJo9O2vT\nJrNBg2CqCzK2bXM984xdtQEAcEwEO6Ak448/jJ07y771ydq1dlQEAECFEOyAkrRybn2SkVGz\ntQAAcBzC7C4AqCjN7TZ+/FFPT/enpvpbtCj77iRVwaxfv/RxWBERXfc3alRNKwUAoPIYsUPt\nEP7mmwmdOsUPGBB7ySUJ3bvHDx4c9sMP1bQus04d7xlnlH3rk1GjqmmlAABUHsEOtUD4m2/G\nXHNN0cOgYZs3xw0fbuzeXU1rzJs710xMFJHD44K6LiLuYcMKx4yppjUCAFB5BDuEPMuKuvtu\n0fViVzOYppaXF/H449W0Tn9qatbnnxdcf72vbVszOdnbvXvuokW5S5aUMYwHAEDI4Bw7hDo9\nLU1PSyujwbIcmzZV33qtuLhDM2fKzJnVtwoAAKoWwQ6hTnO7j9qUn1/GRI/HtWiR8+OP9T17\nfC1bui+80NO/f3UWCABAqCDYIdSZDRpYLpdWWFiyQdd9rVuXnJaeHnf22cavvwYO3Ro//xz+\n7rvuMWNyn3iCo6gAAOXxXx1CneVyuceOLaPBNAsvvbTEtOipU43ffgu0Bv8Nf/318DfeqOYy\nAQCwH8EOtcChu+7y9O4tIqJpYhgiIoaRP2WKZ/DgorNpBw8616wp8/5zrtdeq5FKAQCwE4di\nUQtYUVEHly93rl7tXL9eT0/3t2xZOHq0v02bErPpaWni95exvGkeHsYDAEBpBDvUGp5BgzyD\nBpUzgxUbW3aDppkJCdVSEwAAoYRDsVCH2aCBv0WLMi6SsCxP3752VAQAQI0i2EEpebNni6YV\ny3aaZjZoUDBxYumZtYICY/fuso/eAgBQCxHsoBRvnz45q1b52rY9/N4w3GPGZK9ZYxU/FBu2\neXP8kCFJTZokdOqU1KRJ9NSpWlaWDeUCAFClOMcOqvF27pz94YdaVpaRnu5v1swKDy8xg2Pj\nxrjzzxfTDFw/q7ndrueec3z8cfa6dVZ0tB0lAwBQNRixg5qshARfmzalU52IRN92m5hmsSfP\nWpbxyy8RCxfWXH0AAFQDRuwQ0hxffOEI3OIkNdUzapS/UaNKdqjv3m389FMZDZrmXLcu/5Zb\nKtk/AAA2ItghRGkeT/QNN4S/+aaIBJ4PFvnQQ/kzZhSMH1+ZbvWcnLIbLEs7cKAyPQMAYDsO\nxSJERc6efTjVyeEng2keT9T06Y6PPqpMt2b9+qJpZTToutmkSWV6BgDAdgQ7hCSPx7V0acmJ\nliW6HrF4cWU6NhMTPX36lHGvO9MsPPfcyvQMAIDtCHYIRUZampafX0aDaYZt3VrJzg899JBZ\nt66IHB6603URcZ9zjnvMmEr2DACAvTjHDqHICjvqT6bldFayc3/jxlmffRbx5JPODRv09HRf\nq1aF48Z5hg2rZLcAANiOYIdQZDZsaKak6Pv2BW41d4Smebt0qXz/VlRU/tSp+VOnVr4rAABC\nB4diEZI0LX/KFLGsYhc66LoVHl4waZJ9ZQEAENIIdghRhRdfnPfAA0UfBeFPTT34xhv+Fi1s\nrAoAgFDGoViErsIrrnCPGuXYvFnfu9ffvLm3Y0dxOOwuCgCA0EWwQ0iz4uM9ffrYXQUAALUD\nwQ5K8Hojnn/esWGDnp7ub9688MILvWeeGWjRMzLCvv5a/+svf7Nm3i5dGPMDACiMYIdaT9+/\nP+6cc4wdOwJPHgvbsiV8xQr3mDFWdLRz5Uo9Kys4pz81Ne/RR71du9pYLQAA1Ydgh5Dk87mW\nLnVu2KDv3etPTXVfcEE5B2Sjbr/d2LlT5PCTxwL/hr/+euk5jd9+iz3vvOwNG/ypqdVTNwAA\ndiLYIfTs3x/fr1/Ytm2HR+C2bg1fubJw7Ni8xx4r/SgwLTc3/L33St7u7mhMU3O7I558Mm/e\nvKovGwAAu3G7E4QcY/LksO3bRYqNwLlefdVV1iCcnpYmPt9x9G5Zjq++qooyAQAIOQQ7hBYt\nP19/440yRuB0PXzZstLzWzExx70Or/eESgMAINQR7BBatD17yg5epmn8+msZkxs08Kemlj5E\ne1S67mvbthIFAgAQugh2CC1HHYHTNCs2tsyWQ/feKyIVzXaWVXj11SdWGwAAIY5gh9Bi1a1r\nnXJKmSnN07dvmYt4+vXLeeMNf/Pmh99r2lFDnmHkzZ3r7datamoFACDEEOwQcvwPPVQynGma\nedJJBZMmHW0Rb8+eWZs2ZW7Zkr1uXfbq1Yevuijdc/36hRdfXOUFAwAQIgh2CDlW//45K1f6\nW7U6/F7T3EOHZr//vnPNmpgrrogbMiR60iTHp5+WXtBMSfF16GAlJZXdr6adyJUWAADUHtzH\nDqHI261b1saN+r59enq6v1kz8Xrjzjsv7PvvxTDENB3ffONatqzwiivy7r9fNK3Esv7Gjc36\n9fX09NLjdt7u3WtqCwAAsAEjdghdZt26vg4drJiY6DvvDNuyRUTE7xfLOnxnuyVLwt98s4zF\nNO3QnXeKaRY7mKvrVmxswfXX10zlAADYgmCHUKfl54evXFnmne1cr7xS5iLu0aNzFy0yk5OD\nU7xdumS/+65Zv3711QkAgO04FItQp6elHfXOdj//fLSl3Oec4xk61Ni2TU9P97ds6W/atBpL\nBAAgNBDsEOqs6OiyG451MYTldPo6dJAOHaqlLAAAQg+HYhHqzHr1jvZsCU/v3jVeDgAAoYtg\nh1rg0D33iGWVuBjCTEoq5852AAD8AxHsUAt4+vfPef31oufJefr1y1m92qxTx8aqAAAINZxj\nh9rB27t31mefGbt36+npvubNrcREuysCACDkEOxQe2iav3Fjf+PGdtcBAECI4lAsAACAIgh2\nAAAAiqgFh2INw6hkD7quV76TkKL/fX2oYRhW6Ucy1Ga6rmuaptj3JSKapgX+VW/TRMVdLLg5\n6u1ihmFU/ufQ7/dXVT0AqpYW4r+zTNPUy7qBGQDALhkZGclFHtkHIHTUghG7AwcOVGbxpKSk\nnJwcn89XVfWEAqfTGRMTIyKZmZkhHs2Pl8vlCg8Pz8nJsbuQKhYbG+twONxud15ent21VLH4\n+Pj8/HyPx2N3IVXJMIz4+HgRUe+3h8PhiI6OzsrKsrsQANWiFgS7ygcXy7IUSz/BzVFy09Tb\nKCn+ldlbSTVRbLvU3sVEue8LQBBHOQEAABRBsAMAAFAEwQ4AAEARBDsAAABFEOwAAAAUQbAD\nAABQBMEOAABAEQQ7AAAARRDsAAAAFEGwAwAAUATBDgAAQBEEOwAAAEUQ7AAAABQRZncBqK0c\nH3/sXL9eT0szmzVzjxrla9PG7ooAAPinI9jhuGkeT/SECeGrVommia6L3x/xxBP5kyblT5tm\nd2kAAPyjcSgWxy3ygQfCV60SEbEs8ftFRPz+yHnzwt96y97CAAD4hyPY4Tj5/a7nny9juq67\nliyp8WoAAMARBDscH33/fi0np4wG0wzbvr3GywEAAEcQ7HB8LKfzBJoAAEANINjh+FiJif4W\nLUQv9ZOj697u3e2oCAAAHEaww3E7NG2aWFaxbKfrltOZf/PN9hUFAAAIdjh+nmHDchctMpOT\ng1P8rVodfPNNf+vWNlYFAAC4jx1OhHvkSM/AgWFbt+ppaf5mzXxt24ph2F0UAAD/dAQ7nCAr\nIsJ7+uly+unlz6YVFkY89ZRj/Xrjzz/9LVoUjhnjHj1aNK1migQA4B+FYIdqpKenxw0fbvz+\nu2iaWJa+d69jw4bwFSsOvviiOBx2VwcAgGo4xw7VKOrOO41du0RELEtExDRFxLl+fcRzz9la\nFwAAaiLYobpoBQXh7757ONIVpevhy5fbUREAAIoj2KG66Pv3i89XRoNpGn/8UePlAACgPoId\nqosZG1v2RRKaZiYk1Hg5AACoj2CH6mLFx/s6dSrjGRWW5RkwwI6KAABQHMEO1Sjv3nsth6NY\nttM0s379gptusq8oAACURbBDNfL9+985a9d6zzgjkO0sp7Pwgguy160zExPtLg0AAAVxHztU\nL1+bNjkrV2put75vn79BAx5QAQBA9SHYoSZY4eH+xo3trgIAAMVxKBYAAEARBDsAAABFcCgW\nNSrsf/9zbtig793rb9rUPWKE2bCh3RUBAKAOgh1qitcbPXmya9kysSzRNLGsyDlz8mfOLLj6\narsrAwBAEQQ7HIew7793fvihnpbmb9rUM3y4v1Gjii8b+fDDrldeOfzGskRE83iipk3zN2/u\n6dOnOqoFAOCfhmCHivH7o2+7zfX888XG26ZPL5gwoUKL+3wRixcHFjwy0bJE112LFhHsAACo\nElw8gQqJfOwx19Klh2NZcLxtxgznmjUVWVzfu1fLySmW6gJMM2zLliquFQCAfyqCHSrANF2L\nFommFZtoWaLrEQsXVqiHsKOPDZfTBAAAjgfBDsemZ2ToBw6UPd62dWtFejBTUsz69UtGQxHR\ndW+XLlVRIwAAINihIo4+qGZVcLxN0/JvvfXw+XlBui6GUXDjjZWuDwAAiHDxBCrCTEz0N2li\n7N4tplmsQdd9XbqIiHPNGue6dfqePf5mzdznnus79dTSnRSOGyeFhVGzZ2t5eYEp/oYN8x55\nxHfKKdW/BQAA/CMQ7FAh+VOmxFx3XbHLWnVddL3g2mtjx451rl8vmia6LmvXRixcWDBhwqFZ\ns0p3UnjVVZ5Ro8K++krfs8ffvLmvSxfL6azRzQAAQGkEO1SIe8wYraAgatYsLTc3MMWsXz9v\n7lznO+84168XEbEs8fsDTRELFvjat3ePHl26HzMx0TNwYE1VDQDAPwvBDhVVeOml7hEjHF99\npael+VNTfV26WIYRc+WVZcyq666lS8sMdgAAoPoQ7HAcrIQEz4ABwbd6WlrwhLliTDNs586a\nKwsAAIgIV8WiMqyIiBNoAgAA1YRghxNnJSb6W7YUvdRPkaZ5e/a0oyIAAP7RCHaolEN33hl4\nBMWRSbpuRUTk33yzfUUBAPAPRbBDpXgGDTr4/PNmvXrBKb4OHXLeecefmmpjVQAA/DNx8QQq\nyzN4cGa/fmHbtwfuTudv1qyMR4cBAIDqR7BDVXA4fO3bS/v2dtcBAMA/GodiAQAAFEGwAwAA\nUATBDgAAQBEEOwAAAEUQ7AAAABRBsAMAAFAEwQ4AAEARBDsAAABFEOwAAAAUQbADAABQBMEO\nAABAEQQ7AAAARRDsAAAAFEGwAwAAUATBDgAAQBEEOwAAAEUQ7AAAABRBsAMAAFAEwQ4AAEAR\nBDsAAABFEOwAAAAUQbADAABQBMEOAABAEQQ7AAAARRDsAAAAFEGwAwAAUATBDgAAQBEEOwAA\nAEUQ7AAAABRBsAMAAFAEwQ4AAEARBDsAAABFEOwAAAAUQbADAABQBMEOAABAEQQ7AAAARRDs\nAAAAFEGwAwAAUATBDgAAQBEEOwAAAEUQ7AAAABRBsAMAAFAEwQ4AAEARBDsAAABFEOwAAAAU\nQbADAABQBMEOAABAEQQ7AAAARRDsAAAAFEGwAwAAUATBDgAAQBEEOwAAAEUQ7AAAABRBsAMA\nAFBEmC1rtXxZK59Z+MGn3x0o1Os1ajHi4msHdkyxpRIAAABl2DNi9985k1/+eN+Iyyc9cM/U\nvqnuBXdd99buPFsqAQAAUIYNI3Z+9+6nv8noNefh4W0TRKRF6/Z7vzz/rQVbR97XteaLAQAA\nUIYNI3b+wt+bNG06pFns3xO0jnHh3mxG7AAAACrFhhE7Z1zPRx/tGXzrzdu+ZE9ek8tbBafs\n2bMnJycn8FrTtJSUyp5+ZxhGJXsINcEtCgsLsyzL3mKqlq7rmqaFhdlz9mf10XVdRJTcNE3T\nDMNQbLsC35eo+9ujkt+Xz+eronIAVDHN3liw6+v3H39syf56A5667+ooQwtMvOOOO1avXh14\nnZCQsHbtWvsKBACUlJGRkZycbHcVAMpQE39k56bNvWjCx4EFYDRSAAAS10lEQVTX/Z5+ZVL9\naBHxZO1Y8sTjH2zO7DV6wuwL+7o0rQYqAQAAUFhNjNhZZn7OQU/gtTM2LlLXcnetv2Xyk0b7\nwTdNvKRVsqvE/JmZmQUFBcG3kZGRlVl7QkLCwYMH/X5/ZToJNQ6HIzo6WkSys7MVOxQbHh7u\ndDpzc3PtLqSKRUdHOxwOj8dz6NAhu2upYrGxsYWFhR6Px+5CqpJhGLGxsSKSm5ur2GHHsLCw\nqKio4OkuJ8bv9zNiB4Smmhix0/TI+Pgj4cwy82dPXRB+1qTHr+1T5jBdYmJi8LVpmpmZmZUs\nwDRNxYJd8Lwfv9+vWLAzTdOyLMW+LxEJfE1KbpqouIsF+f1+xTYtcPqgYhsFIMiG853z/3r5\nx3zv5e0jv/n66yN1RDQ/tW18zRcDAACgDBuCXe7Pv4vIcw/MLjoxttG0l+ZzHzsAAIATZ0Ow\nS+kxe1WPml8tAACA4ux5pBgAAACqHMEOAABAEQQ7AAAARRDsAAAAFEGwAwAAUATBDgAAQBEE\nOwAAAEUQ7AAAABRBsAMAAFAEwQ4AAEARBDsAAABFEOwAAAAUQbADAABQBMEOAABAEQQ7AAAA\nRRDsAAAAFEGwAwAAUATBDgAAQBEEOwAAAEUQ7AAAABRBsAMAAFAEwQ4AAEARBDsAAABFEOwA\nAAAUQbADAABQBMEOAABAEQQ7AAAARRDsAAAAFEGwAwAAUATBDgAAQBEEOwAAAEUQ7AAAABRB\nsAMAAFAEwQ4AAEARBDsAAABFEOwAAAAUQbADAABQBMEOAABAEQQ7AAAARRDsAAAAFEGwAwAA\nUATBDgAAQBEEOwAAAEUQ7AAAABRBsAMAAFAEwQ4AAEARBDsAAABFEOwAAAAUQbADAABQBMEO\nAABAEQQ7AAAARRDsAAAAFEGwAwAAUATBDgAAQBEEOwAAAEUQ7AAAABRBsAMAAFAEwQ4AAEAR\nBDsAAABFEOwAAAAUQbADAABQBMEOAABAEQQ7AAAARRDsAAAAFEGwAwAAUATBDgAAQBEEOwAA\nAEUQ7AAAABRBsAMAAFAEwQ4AAEARBDsAAABFEOwAAAAUQbADAABQBMEOAABAEQQ7AAAARRDs\nAAAAFEGwAwAAUATBDgAAQBEEOwAAAEUQ7AAAABRBsAMAAFAEwQ4AAEARBDsAAABFEOwAAAAU\nQbADAABQBMEOAABAEQQ7AAAARRDsAAAAFEGwAwAAUATBDgAAQBEEOwAAAEUQ7AAAABRBsAMA\nAFAEwQ4AAEARBDsAAABFEOwAAAAUQbADAABQBMEOAABAEQQ7AAAARRDsAAAAFEGwAwAAUATB\nDgAAQBEEOwAAAEUQ7AAAABRBsAMAAFAEwQ4AAEARBDsAAABFEOwAAAAUQbADAABQBMEOAABA\nEWF2F3BshmFUsgdd1yvfSUjR9cOJ3DAMy7LsLaZq6bquaZpi35eIaJoW+Fe9TRMVd7Hg5qi3\nixmGUfmfQ7/fX1X1AKhaWoj/zjJNMxhiAAChICMjIzk52e4qAJShFozYHThwoDKLJyUl5eTk\n+Hy+qqonFDidzpiYGBHJzMwM8Wh+vFwuV3h4eE5Ojt2FVLHY2FiHw+F2u/Py8uyupYrFx8fn\n5+d7PB67C6lKhmHEx8eLiHq/PRwOR3R0dFZWlt2FAKgWtSDYVT64WJalWPoJbo6Sm6beRknx\nr8zeSqqJYtul9i4myn1fAII4ygkAAKAIgh0AAIAiCHYAAACKINgBAAAogmAHAACgCIIdAACA\nIgh2AAAAiiDYAQAAKIJgBwAAoAiCHQAAgCIIdgAAAIog2AEAACiCYAcAAKAIgh0AAIAiCHYA\nAACKINgBAAAogmAHAACgCIIdAACAIgh2AAAAiiDYAQAAKIJgBwAAoAiCHQAAgCIIdgAAAIog\n2AEAACiCYAcAAKAIgh0AAIAiCHYAAACKINgBAAAogmAHAACgCIIdAACAIgh2AAAAiiDYAQAA\nKCLM7gKqndfrtSzL7iqqWFZW1tatW0UkNTXVMAy7y6lKpmn6fD67q6h627dvz8vLi42NTUlJ\nsbuWKub1ek3TtLuKKlZYWPjpp5+KSOPGjV0ul93lVCXLsrxer91VAKgumnqh55/gk08+uemm\nm0Rk/fr1cXFxdpeDY7vhhhs+++yzwYMH33PPPXbXgmPbtWvXueeeKyJLly5t166d3eUAQEVx\nKBYAAEARBDsAAABFEOwAAAAUwTl2tVJGRsa3334rIr169XI4HHaXg2PbvHnzgQMHUlJSOGGr\nVsjPzw9cPNG5c+fY2Fi7ywGAiiLYAQAAKIJDsQAAAIog2AEAAChC/RsUq8ryZa18ZuEHn353\noFCv16jFiIuvHdhRtTvfqsLc8OqCdzb+b3eu0bpd58tuuLxZJPtdSGPnAlB7cY5dbbXm7isX\n/Rh72fgxretHfb9+2Qv/3Xn5k8+PbBRtd10o6dcV025+ade4664/JcH33sL5m7WeLy+8jqHy\nUMbOBaD2YuSgVvK7dz/9TUavOQ8Pb5sgIi1at9/75flvLdg68r6udpeG4izPI69tS73g4fP6\npYpI8we18y558OW0yy5uEGV3ZSgbOxeAWo2Bg1rJX/h7k6ZNhzQL3oVB6xgX7s3Os7MmlMWd\ns/GPQn///g0Cb8Pje3SMdn6zId3eqlAOdi4AtRojdrWSM67no4/2DL715m1fsievyeWtbCwJ\nZfIc+l5ETok8cq/BNpFhq7/PkYvsqwnlYucCUKsR7Gq9XV+///hjS7zNBk8f1NDuWlCS6T4k\nIklhR4bGkx2GL6/QvopwHNi5ANQ6BLvaITdt7kUTPg687vf0K5PqR4uIJ2vHkice/2BzZq/R\nE2Zf2NelabbWiDLozggRyfKZ0YYRmHLA6zfinbYWhWNj5wJQSxHsaofoehNeeOHKwGtnbJSI\n5O5af8vkJ432gx985pJWyS5bq8NROaLai2zcUeBrFH442P1U4IvrEW9vVSgfOxeA2otgVzto\nemR8fGTwrWXmz566IPysSY9f24eRhFDmiu9T3/n0mk/+6jeskYh4D337Za5nVD9uiha62LkA\n1GoEu1op/6+Xf8z3Xt4+8puvvw5ODItofmpbhoJCjOacPLr1rUvvWldvStsE76r5cyPrnXVJ\nQ+6IFrrYuQDUatyguFZK/2T6+Ae3lJgY22jaS/O51VbosfxrX3j0tbVfHijUUjv0uvY/VzeP\n4g+q0MXOBaBWI9gBAAAoghsUAwAAKIJgBwAAoAiCHQAAgCIIdgAAAIog2AEAACiCYAcAAKAI\ngh0AAIAiCHYIXd89OkDTtPpnPly6yfSmd41zGWGxb+3Lr8mSMndcpB3d/L2HarIYEZnRJC6m\n3tU1vFIAQMjiDvgIXR0mvX3RvLov/9+t0z67eE63ukWbvrh7+BcH3Z2mrBlZN/Joi1efhoOu\nHNsuofT0jlGOGq5EDwszTP48AwAcxpMnENKydyyo0+Z6R/KQ9L3vxBiHn8nuzvm4/kl986N6\n7PrrozqOGo01mTsuSmr9Ss+lOzde2qIm1wsAQEXwtz5CWnyria9f3jJ//3vDHvk2OPHFCy7J\n9JrXrFhW5anO9GX7q7bHo7P8Hn8l/qqqRKlWodc88RUDAEIYwQ6hbvj8DzpFOzfdMfTzXI+I\nZG2fd83q3SndZj/at37R2fJ2bbxp7MDGJ8WHRyW27th31sL3i4aXbavmj+zdKTkuKswZUS/1\nX5dOeTzTdzhVPdcqKSF1njv7y3G9T4kOT8zzW6Y3Y/5tV/wrNcXlcMQmNTrr/EmfZxRWvODc\nXS/HhBnNL3w5OCV943RN0wbN2ywikYZ+xtPfPXnjsOSoSIfhPKlR20umzM8okrTK2ZDSpc5p\nGl/0HLtyln21TXJckxl7P1rQqUlChNOISmrQZdCl6/48clLg3k0vj+n/76QYV2TcSV0HX7T8\nq/0V/GwBACHEAkLernfGi0jjYc9alm98szg9LOGDjIKiM+SlrUyNcDgiT77susn3zpx6Xq9m\nInLqJc8FWv94d6KuafGte0+ePmvOrDvHDWgrIi0uejfQuqRlYmzjO85vktBv3KR5Tz7lNq25\n/RpomtF37IS758yZfO2oaEOPqne2x7Qsyzqw/UIR6bl0Z/kFf3p3T03TZn2+z7IsX+Hv3eLC\nk/51o9e0LMuK0LX4tvU0LWzAmCvumP6fET0bi0hKjym+CmxI6VJnnxwXnXJVRT6EZa2TXPF9\nGoQbPS++Yd5T86dPGO7QtciThgTWu/f/7oky9Mi6Xa69ZcaMKde3S3LpjsRnf805ZrcAgJBC\nsEPtMKtLXU3Trr9/iIh0nflZida72iY5Itt8WiTtrfzPqSJy7y/ZlmU93zY5zNV4V6Ev2Hpz\ng5iIpOGB10taJmqaNvCJbwJvvfk7dE1rPHhFcOZPbz0jOTn51b/yrb+DXZmc0Z2Ci5j+/Mua\nxbkS+ux1+1+7pKXhrPffv2uL0DURmbR829+zepdc205ELtuQdswNKVGqZRULduUvu6x1koh0\nuWvDkdYxzUTkv1mFlunul+CKSBq0Lc8TaCo4sCHRoad0XXbMbgEAIYVgh9qh4MCaJIchIhFJ\nAzIDY19/8x7aamha+1u+LDrRnf2xiLSf/KVlWYeyDhzIzAs2mf68ifWjXfFnBd4uaZmo6a59\nHn/gra/wD5euxZ580Vd/HCxdRiDYNRx05eRSpk6fV3TO3N2vxYbpTUeN0TVtzJLtwekRuhZV\n9+Ji9Rf8FGno9botP+aGlCjVKhLsjrnsstZJuhG5x31k2V/f6CMiKzLyD+6+X0R6LN5RdNmN\nzy6Y/8zaY3YLAAgp3O4EtYMrccCbV7fqteDHoa8tSQjTijYVZn7gt6wtcztrc0sulbMlR0Qi\n4xMzv1r9/OqNP+z8Zdcfv2/7/ru0bLcr/shszuhTg9dhGOGN1tx38bBpL3VusqxJuy5ndO16\nZt+B540ekFhkpU3HTn3oWFfFRjccs/bu+V2mvX7SaTNevbxV0ab4VsWG/cJczYcmuj7Y9VFh\n5u/lb0iJUo/rQxCRsMh29ZxHltX+3qKDP30kIt37FruhTM8rJ/QUyfvz4WN2CwAIHQQ71BpJ\nLWNEpO7JUSUbdKeItJ+y5KHil1OISHjcqSKy4pazzpv3UYOOfYf36Tqs+6Bb7u6QNr7/9X8d\nmU3Ti/V55pTn/7rs9rfeenfDxk82rV36yjPz/nNz17e2ftQ/yXVcBf+yPV1Ecn/btM9jphRJ\nVKJpJeZ0aGKZ7mNuSOlSj6jIslrZt9kz3aaIOEtVVcFuAQChg2CHWs+VOMTQbvJltxo48Izg\nRF/B9hWrvkvpEOnJ/fz8eR81GvL0rnfHB1ufO3pv3rwd//shO6nDaWPHTx47frKIbPvgnlOG\nzLjxjs0/PtWt4lXt/fiOi178adiDM9bfds9ZN6z6YeHIYFP2jtdEBgbf+t273jlQGPWvXq7E\nbuVsSGU+hPKXjW3ZSWTtpi8zpElscOKHUye8eCDhmSevOOFuAQA1j9udoNYLczW/65TEn168\ndH36kceLLbvu7AsuuOAPXXz52/2WlXjqacGm/L2fzk3LFSn7JnKH9j3VtWvXMfdvDk45+d+n\ni4jvkK/iJfkKdowY/tBJ/5626tZZ797Scdszox/afODIKtKfu/Xtn/9+Z746ZWSu3+x9b6/y\nN6R8lVk2tsntHaKdX0ya/Fvh4VvjeXI+u+SxZ979sk5lugUA1DxG7KCCm95f8EzLiwantjtn\n7IjTWiRu/fC1F9fubH/ZixfXiRRzbL+kiR89NOx6x+TTGkb++sPnzz69KjXF5dn9v8dfXn7l\nBaNLdBV38qx+Jy1af8+ZQ369vGvbZmb27289u8RwJN01p2Nwnt+XP3z79sTSZaT0uO7GoQ1F\nZNHYgZvdSWvX3KmJ9J6zdvDSRjP7X3Dp3tWB0+OiGpz22Lltt11wRefmcd9teP3NDb/V6Xzj\ni4MbH2NDKvMhlEsz4t5+aWKLcx5r37zX5eMGpjiyVz7z9F5/1Pw3LqtkSQCAmmb31RtARW19\ntIuIXPdzVpmt2TtWXzOyV0p8tDMysfWpPWY+80Hw2tm8P9ZdOqhLg6So2JRmvYeOe+eHzP1f\nP3hyQqQz+qQ/3b4lLRODV8gG5KdvuuH8fo2TY8N0IyapYa+RV67cnBFoKud2JyLS7qYvLMva\n9fYEETl74Q/BDjO+fcjQtLbXvm1ZVoSuNR354U/vPHBGmwauMEdi/VYX/mfe3iIXupazIaVL\nLXq7k/KXXdY6KTy2e9Flf3urr4isyMgPvP35g6dH9GwXG+kIj0ro1Pf8Fz/dW5FuAQAhhWfF\nAjUq0tBTRqz/dWUfuwsBACiI02QAAAAUQbADAABQBBdPADXqnNGj4/99kt1VAADUxDl2AAAA\niuBQLAAAgCIIdgAAAIog2AEAACiCYAcAAKAIgh0AAIAiCHYAAACKINgBAAAogmAHAACgCIId\nAACAIv4fd5ZvHKJ7/uwAAAAASUVORK5CYII="
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
    "ggplot() +\n",
    "    geom_point(normalize_salary, mapping = aes(YearsExperience, Salary, color = \"Min-Max Normalisation\")) + \n",
    "    geom_point(standardize_salary, mapping = aes(YearsExperience, Salary, color = \"Z-score Standardisation\")) + \n",
    "    xlim(-3, 3) + ylim(-3, 3) +\n",
    "    scale_color_manual(\n",
    "        name = \"Standardization vs. Normalization\",\n",
    "        values = c(\"Min-Max Normalisation\" = \"darkblue\", \"Z-score Standardisation\" = \"red\")\n",
    "    )"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "745d4b4c",
   "metadata": {
    "papermill": {
     "duration": 0.077571,
     "end_time": "2022-04-09T11:47:49.603946",
     "exception": false,
     "start_time": "2022-04-09T11:47:49.526375",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "As we can see, \n",
    "\n",
    "the normalization data is bounded between 0 and 1, \n",
    "\n",
    "and standardization doesn't have any boundaries."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "1c251c87",
   "metadata": {
    "papermill": {
     "duration": 0.076077,
     "end_time": "2022-04-09T11:47:49.756449",
     "exception": false,
     "start_time": "2022-04-09T11:47:49.680372",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### The effect of Normalization vs. Standardization on KNN Algorithm\n",
    "\n",
    "KNN stands for K Nearest Neighbor"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "id": "62c2d18b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-09T11:47:49.915472Z",
     "iopub.status.busy": "2022-04-09T11:47:49.913903Z",
     "iopub.status.idle": "2022-04-09T11:47:51.937527Z",
     "shell.execute_reply": "2022-04-09T11:47:51.936159Z"
    },
    "papermill": {
     "duration": 2.1044,
     "end_time": "2022-04-09T11:47:51.937664",
     "exception": false,
     "start_time": "2022-04-09T11:47:49.833264",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
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
    }
   ],
   "source": [
    "library(caTools)\n",
    "library(caret)\n",
    "\n",
    "set.seed(101)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "id": "8897300e",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-09T11:47:52.106112Z",
     "iopub.status.busy": "2022-04-09T11:47:52.104770Z",
     "iopub.status.idle": "2022-04-09T11:47:52.935583Z",
     "shell.execute_reply": "2022-04-09T11:47:52.934085Z"
    },
    "papermill": {
     "duration": 0.917196,
     "end_time": "2022-04-09T11:47:52.935731",
     "exception": false,
     "start_time": "2022-04-09T11:47:52.018535",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# Step 1.1 - Original Data\n",
    "sample = sample.split(data$Salary, SplitRatio = .75)\n",
    "\n",
    "train_original = subset(data, sample == TRUE)\n",
    "test_original = subset(data, sample == FALSE)\n",
    "\n",
    "# Step 1.2 - Original Data KNN\n",
    "model_original <- train(\n",
    "    Salary ~ YearsExperience, \n",
    "    data = train_original, \n",
    "    method = \"knn\"\n",
    ")\n",
    "# predict\n",
    "predictions_original <- model_original %>%\n",
    "    predict(test_original)\n",
    "# root mean square error\n",
    "rmse_origin <- RMSE(predictions_original, test_original$Salary)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 13,
   "id": "73f19d40",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-09T11:47:53.123494Z",
     "iopub.status.busy": "2022-04-09T11:47:53.118890Z",
     "iopub.status.idle": "2022-04-09T11:47:53.873254Z",
     "shell.execute_reply": "2022-04-09T11:47:53.871542Z"
    },
    "papermill": {
     "duration": 0.859013,
     "end_time": "2022-04-09T11:47:53.873413",
     "exception": false,
     "start_time": "2022-04-09T11:47:53.014400",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# Step 2.1 - Normalized\n",
    "sample_norm = sample.split(normalize_salary$Salary, SplitRatio = .75)\n",
    "train_norm = subset(normalize_salary, sample_norm == TRUE)\n",
    "test_norm = subset(normalize_salary, sample_norm = FALSE)\n",
    "\n",
    "# Step 2.2 - Normalized Data KNN\n",
    "model_norm <- train(\n",
    "    Salary ~ YearsExperience,\n",
    "    data = train_norm,\n",
    "    method = \"knn\"\n",
    ")\n",
    "# predict\n",
    "predictions_norm <- model_norm %>%\n",
    "    predict(test_norm)\n",
    "# root mean square error\n",
    "rmse_norm <- RMSE(predictions_norm, test_norm$Salary)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 14,
   "id": "9200c5db",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-09T11:47:54.039658Z",
     "iopub.status.busy": "2022-04-09T11:47:54.037814Z",
     "iopub.status.idle": "2022-04-09T11:47:54.790079Z",
     "shell.execute_reply": "2022-04-09T11:47:54.788684Z"
    },
    "papermill": {
     "duration": 0.836225,
     "end_time": "2022-04-09T11:47:54.790263",
     "exception": false,
     "start_time": "2022-04-09T11:47:53.954038",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# Step 3.1 - Standardized\n",
    "sample_stan = sample.split(standardize_salary$Salary, SplitRatio = .75)\n",
    "train_stan = subset(standardize_salary, sample_stan == TRUE)\n",
    "test_stan = subset(standardize_salary, sample_stan == FALSE)\n",
    "\n",
    "# Step 3.2 - Standardized Data KNN\n",
    "model_stan <- train(\n",
    "    Salary ~ YearsExperience,\n",
    "    data = train_stan,\n",
    "    method = \"knn\"\n",
    ")\n",
    "predictions_stan <- model_stan %>%\n",
    "    predict(test_stan)\n",
    "# root mean square error\n",
    "rmse_stan <- RMSE(predictions_stan, test_stan$Salary)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 15,
   "id": "2387637c",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-09T11:47:54.955625Z",
     "iopub.status.busy": "2022-04-09T11:47:54.953781Z",
     "iopub.status.idle": "2022-04-09T11:47:54.978389Z",
     "shell.execute_reply": "2022-04-09T11:47:54.976683Z"
    },
    "papermill": {
     "duration": 0.108807,
     "end_time": "2022-04-09T11:47:54.978536",
     "exception": false,
     "start_time": "2022-04-09T11:47:54.869729",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "[1] \"RMSE Origin:  6148.63276039659\"\n",
      "[1] \"RMSE Normalization:  0.0626789221136382\"\n",
      "[1] \"RMSE Standardization:  0.178284392860972\"\n"
     ]
    }
   ],
   "source": [
    "print(paste(\"RMSE Origin: \", rmse_origin))\n",
    "print(paste(\"RMSE Normalization: \", rmse_norm))\n",
    "print(paste(\"RMSE Standardization: \", rmse_stan))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "4133e323",
   "metadata": {
    "papermill": {
     "duration": 0.08026,
     "end_time": "2022-04-09T11:47:55.140612",
     "exception": false,
     "start_time": "2022-04-09T11:47:55.060352",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Lesser the RMSE, the better fit is our model.\n",
    "\n",
    "We can see the scaled data have performed much better than the original data.\n",
    "\n",
    "And in her min-max normalization has worked better on KNN."
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
   "duration": 14.563101,
   "end_time": "2022-04-09T11:47:55.332889",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2022-04-09T11:47:40.769788",
   "version": "2.3.3"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
