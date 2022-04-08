{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "d6ca3544",
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "execution": {
     "iopub.execute_input": "2022-04-08T21:36:14.082282Z",
     "iopub.status.busy": "2022-04-08T21:36:14.078984Z",
     "iopub.status.idle": "2022-04-08T21:36:15.227019Z",
     "shell.execute_reply": "2022-04-08T21:36:15.226411Z"
    },
    "papermill": {
     "duration": 1.159182,
     "end_time": "2022-04-08T21:36:15.227195",
     "exception": false,
     "start_time": "2022-04-08T21:36:14.068013",
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
   "id": "b638ece3",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-08T21:36:15.279783Z",
     "iopub.status.busy": "2022-04-08T21:36:15.250951Z",
     "iopub.status.idle": "2022-04-08T21:36:15.315163Z",
     "shell.execute_reply": "2022-04-08T21:36:15.313878Z"
    },
    "papermill": {
     "duration": 0.077296,
     "end_time": "2022-04-08T21:36:15.315297",
     "exception": false,
     "start_time": "2022-04-08T21:36:15.238001",
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
   "duration": 4.429164,
   "end_time": "2022-04-08T21:36:15.434945",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2022-04-08T21:36:11.005781",
   "version": "2.3.3"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
