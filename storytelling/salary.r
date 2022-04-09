{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "3e60efa6",
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "execution": {
     "iopub.execute_input": "2022-04-09T04:43:37.256753Z",
     "iopub.status.busy": "2022-04-09T04:43:37.254136Z",
     "iopub.status.idle": "2022-04-09T04:43:38.444841Z",
     "shell.execute_reply": "2022-04-09T04:43:38.444140Z"
    },
    "papermill": {
     "duration": 1.217228,
     "end_time": "2022-04-09T04:43:38.445000",
     "exception": false,
     "start_time": "2022-04-09T04:43:37.227772",
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
   "id": "314df38c",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-09T04:43:38.535286Z",
     "iopub.status.busy": "2022-04-09T04:43:38.502421Z",
     "iopub.status.idle": "2022-04-09T04:43:38.569026Z",
     "shell.execute_reply": "2022-04-09T04:43:38.567768Z"
    },
    "papermill": {
     "duration": 0.096688,
     "end_time": "2022-04-09T04:43:38.569173",
     "exception": false,
     "start_time": "2022-04-09T04:43:38.472485",
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
   "id": "82d67abb",
   "metadata": {
    "papermill": {
     "duration": 0.025028,
     "end_time": "2022-04-09T04:43:38.620761",
     "exception": false,
     "start_time": "2022-04-09T04:43:38.595733",
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
   "id": "bbd14f65",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-09T04:43:38.676058Z",
     "iopub.status.busy": "2022-04-09T04:43:38.674608Z",
     "iopub.status.idle": "2022-04-09T04:43:38.738787Z",
     "shell.execute_reply": "2022-04-09T04:43:38.737272Z"
    },
    "papermill": {
     "duration": 0.092793,
     "end_time": "2022-04-09T04:43:38.738948",
     "exception": false,
     "start_time": "2022-04-09T04:43:38.646155",
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
   "id": "890d8dd6",
   "metadata": {
    "papermill": {
     "duration": 0.0309,
     "end_time": "2022-04-09T04:43:38.801100",
     "exception": false,
     "start_time": "2022-04-09T04:43:38.770200",
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
   "id": "b014feb4",
   "metadata": {
    "papermill": {
     "duration": 0.030806,
     "end_time": "2022-04-09T04:43:38.864008",
     "exception": false,
     "start_time": "2022-04-09T04:43:38.833202",
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
   "id": "b11e3ab5",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-09T04:43:38.930645Z",
     "iopub.status.busy": "2022-04-09T04:43:38.929107Z",
     "iopub.status.idle": "2022-04-09T04:43:38.997270Z",
     "shell.execute_reply": "2022-04-09T04:43:38.995988Z"
    },
    "papermill": {
     "duration": 0.102785,
     "end_time": "2022-04-09T04:43:38.997396",
     "exception": false,
     "start_time": "2022-04-09T04:43:38.894611",
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
   "id": "dff9a743",
   "metadata": {
    "papermill": {
     "duration": 0.035706,
     "end_time": "2022-04-09T04:43:39.069013",
     "exception": false,
     "start_time": "2022-04-09T04:43:39.033307",
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
   "id": "91152dc6",
   "metadata": {
    "papermill": {
     "duration": 0.035607,
     "end_time": "2022-04-09T04:43:39.140388",
     "exception": false,
     "start_time": "2022-04-09T04:43:39.104781",
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
   "id": "6b3083dc",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-09T04:43:39.217253Z",
     "iopub.status.busy": "2022-04-09T04:43:39.215867Z",
     "iopub.status.idle": "2022-04-09T04:43:39.273466Z",
     "shell.execute_reply": "2022-04-09T04:43:39.272132Z"
    },
    "papermill": {
     "duration": 0.097431,
     "end_time": "2022-04-09T04:43:39.273603",
     "exception": false,
     "start_time": "2022-04-09T04:43:39.176172",
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
   "id": "af5e27c2",
   "metadata": {
    "papermill": {
     "duration": 0.041385,
     "end_time": "2022-04-09T04:43:39.356252",
     "exception": false,
     "start_time": "2022-04-09T04:43:39.314867",
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
   "id": "26d9e263",
   "metadata": {
    "papermill": {
     "duration": 0.041393,
     "end_time": "2022-04-09T04:43:39.438674",
     "exception": false,
     "start_time": "2022-04-09T04:43:39.397281",
     "status": "completed"
    },
    "tags": []
   },
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "420dcd31",
   "metadata": {
    "papermill": {
     "duration": 0.041866,
     "end_time": "2022-04-09T04:43:39.521613",
     "exception": false,
     "start_time": "2022-04-09T04:43:39.479747",
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
   "duration": 5.35215,
   "end_time": "2022-04-09T04:43:39.671882",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2022-04-09T04:43:34.319732",
   "version": "2.3.3"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
