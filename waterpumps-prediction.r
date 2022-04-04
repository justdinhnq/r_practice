{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "12b32ff1",
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "execution": {
     "iopub.execute_input": "2022-04-04T10:17:31.223416Z",
     "iopub.status.busy": "2022-04-04T10:17:31.220129Z",
     "iopub.status.idle": "2022-04-04T10:17:34.298811Z",
     "shell.execute_reply": "2022-04-04T10:17:34.297569Z"
    },
    "papermill": {
     "duration": 3.107714,
     "end_time": "2022-04-04T10:17:34.298999",
     "exception": false,
     "start_time": "2022-04-04T10:17:31.191285",
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
       "'water-pump'"
      ],
      "text/latex": [
       "'water-pump'"
      ],
      "text/markdown": [
       "'water-pump'"
      ],
      "text/plain": [
       "[1] \"water-pump\""
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
    "train_df <- read.csv(\"../input/water-pump/train_features.csv\")\n",
    "test_df <- read.csv(\"../input/water-pump/test_features.csv\")\n",
    "labels <- read.csv(\"../input/water-pump/train_labels.csv\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "29408d48",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-04T10:17:34.401772Z",
     "iopub.status.busy": "2022-04-04T10:17:34.364892Z",
     "iopub.status.idle": "2022-04-04T10:17:34.819074Z",
     "shell.execute_reply": "2022-04-04T10:17:34.817098Z"
    },
    "papermill": {
     "duration": 0.489635,
     "end_time": "2022-04-04T10:17:34.819258",
     "exception": false,
     "start_time": "2022-04-04T10:17:34.329623",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "'data.frame':\t59400 obs. of  40 variables:\n",
      " $ id                   : int  69572 8776 34310 67743 19728 9944 19816 54551 53934 46144 ...\n",
      " $ amount_tsh           : num  6000 0 25 0 0 20 0 0 0 0 ...\n",
      " $ date_recorded        : chr  \"2011-03-14\" \"2013-03-06\" \"2013-02-25\" \"2013-01-28\" ...\n",
      " $ funder               : chr  \"Roman\" \"Grumeti\" \"Lottery Club\" \"Unicef\" ...\n",
      " $ gps_height           : int  1390 1399 686 263 0 0 0 0 0 0 ...\n",
      " $ installer            : chr  \"Roman\" \"GRUMETI\" \"World vision\" \"UNICEF\" ...\n",
      " $ longitude            : num  34.9 34.7 37.5 38.5 31.1 ...\n",
      " $ latitude             : num  -9.86 -2.15 -3.82 -11.16 -1.83 ...\n",
      " $ wpt_name             : chr  \"none\" \"Zahanati\" \"Kwa Mahundi\" \"Zahanati Ya Nanyumbu\" ...\n",
      " $ num_private          : int  0 0 0 0 0 0 0 0 0 0 ...\n",
      " $ basin                : chr  \"Lake Nyasa\" \"Lake Victoria\" \"Pangani\" \"Ruvuma / Southern Coast\" ...\n",
      " $ subvillage           : chr  \"Mnyusi B\" \"Nyamara\" \"Majengo\" \"Mahakamani\" ...\n",
      " $ region               : chr  \"Iringa\" \"Mara\" \"Manyara\" \"Mtwara\" ...\n",
      " $ region_code          : int  11 20 21 90 18 4 17 17 14 18 ...\n",
      " $ district_code        : int  5 2 4 63 1 8 3 3 6 1 ...\n",
      " $ lga                  : chr  \"Ludewa\" \"Serengeti\" \"Simanjiro\" \"Nanyumbu\" ...\n",
      " $ ward                 : chr  \"Mundindi\" \"Natta\" \"Ngorika\" \"Nanyumbu\" ...\n",
      " $ population           : int  109 280 250 58 0 1 0 0 0 0 ...\n",
      " $ public_meeting       : chr  \"True\" \"\" \"True\" \"True\" ...\n",
      " $ recorded_by          : chr  \"GeoData Consultants Ltd\" \"GeoData Consultants Ltd\" \"GeoData Consultants Ltd\" \"GeoData Consultants Ltd\" ...\n",
      " $ scheme_management    : chr  \"VWC\" \"Other\" \"VWC\" \"VWC\" ...\n",
      " $ scheme_name          : chr  \"Roman\" \"\" \"Nyumba ya mungu pipe scheme\" \"\" ...\n",
      " $ permit               : chr  \"False\" \"True\" \"True\" \"True\" ...\n",
      " $ construction_year    : int  1999 2010 2009 1986 0 2009 0 0 0 0 ...\n",
      " $ extraction_type      : chr  \"gravity\" \"gravity\" \"gravity\" \"submersible\" ...\n",
      " $ extraction_type_group: chr  \"gravity\" \"gravity\" \"gravity\" \"submersible\" ...\n",
      " $ extraction_type_class: chr  \"gravity\" \"gravity\" \"gravity\" \"submersible\" ...\n",
      " $ management           : chr  \"vwc\" \"wug\" \"vwc\" \"vwc\" ...\n",
      " $ management_group     : chr  \"user-group\" \"user-group\" \"user-group\" \"user-group\" ...\n",
      " $ payment              : chr  \"pay annually\" \"never pay\" \"pay per bucket\" \"never pay\" ...\n",
      " $ payment_type         : chr  \"annually\" \"never pay\" \"per bucket\" \"never pay\" ...\n",
      " $ water_quality        : chr  \"soft\" \"soft\" \"soft\" \"soft\" ...\n",
      " $ quality_group        : chr  \"good\" \"good\" \"good\" \"good\" ...\n",
      " $ quantity             : chr  \"enough\" \"insufficient\" \"enough\" \"dry\" ...\n",
      " $ quantity_group       : chr  \"enough\" \"insufficient\" \"enough\" \"dry\" ...\n",
      " $ source               : chr  \"spring\" \"rainwater harvesting\" \"dam\" \"machine dbh\" ...\n",
      " $ source_type          : chr  \"spring\" \"rainwater harvesting\" \"dam\" \"borehole\" ...\n",
      " $ source_class         : chr  \"groundwater\" \"surface\" \"surface\" \"groundwater\" ...\n",
      " $ waterpoint_type      : chr  \"communal standpipe\" \"communal standpipe\" \"communal standpipe multiple\" \"communal standpipe multiple\" ...\n",
      " $ waterpoint_type_group: chr  \"communal standpipe\" \"communal standpipe\" \"communal standpipe\" \"communal standpipe\" ...\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "'unique funder: 1898'"
      ],
      "text/latex": [
       "'unique funder: 1898'"
      ],
      "text/markdown": [
       "'unique funder: 1898'"
      ],
      "text/plain": [
       "[1] \"unique funder: 1898\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "'unique installer: 2146'"
      ],
      "text/latex": [
       "'unique installer: 2146'"
      ],
      "text/markdown": [
       "'unique installer: 2146'"
      ],
      "text/plain": [
       "[1] \"unique installer: 2146\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "[1] \"columns with missing values: \"\n"
     ]
    },
    {
     "data": {
      "text/html": [],
      "text/latex": [],
      "text/markdown": [],
      "text/plain": [
       "named integer(0)"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# view its structure\n",
    "str(train_df)\n",
    "sprintf(\"unique funder: %s\", n_distinct(train_df$funder))\n",
    "sprintf(\"unique installer: %s\", n_distinct(train_df$installer))\n",
    "\n",
    "\n",
    "# find columns with missing values\n",
    "print(\"columns with missing values: \")\n",
    "which(colSums(is.na(train_df)) > 0)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "115b4525",
   "metadata": {
    "papermill": {
     "duration": 0.03901,
     "end_time": "2022-04-04T10:17:34.899611",
     "exception": false,
     "start_time": "2022-04-04T10:17:34.860601",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### Data Wrangling\n",
    "1. change categorical variables into factors: funder, installer\n",
    "2. set date format: date_recorded\n",
    "3. lowercase: funder, installer, wpt_name, basin, subvillage, region, lga, ward, recorded_by, scheme_management, scheme_name, permit, extraction_type, extraction_type_group, extraction_type_class, management, management_group, payment, payment_type, water_quality, quality_group, quantity, quantity_group, source, source_type, source_class, waterpoint_type"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "5fca42f8",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-04T10:17:34.983882Z",
     "iopub.status.busy": "2022-04-04T10:17:34.981717Z",
     "iopub.status.idle": "2022-04-04T10:17:35.677065Z",
     "shell.execute_reply": "2022-04-04T10:17:35.676007Z"
    },
    "papermill": {
     "duration": 0.738786,
     "end_time": "2022-04-04T10:17:35.677232",
     "exception": false,
     "start_time": "2022-04-04T10:17:34.938446",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "char_cols <- which(unlist(lapply(train_df, is.character)) == TRUE)\n",
    "\n",
    "# Note: ignore this step because it costs a lot of time\n",
    "# remove leading and trailing spaces from all character columns\n",
    "# train_df[, char_cols] <- trimws(train_df[, char_cols], which = c(\"both\"))\n",
    "\n",
    "train_df <- train_df %>%\n",
    "    mutate_at(char_cols, tolower) "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "2fd84cb3",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-04T10:17:35.757775Z",
     "iopub.status.busy": "2022-04-04T10:17:35.755984Z",
     "iopub.status.idle": "2022-04-04T10:17:35.806202Z",
     "shell.execute_reply": "2022-04-04T10:17:35.804332Z"
    },
    "papermill": {
     "duration": 0.09197,
     "end_time": "2022-04-04T10:17:35.806363",
     "exception": false,
     "start_time": "2022-04-04T10:17:35.714393",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "'data.frame':\t59400 obs. of  2 variables:\n",
      " $ id          : int  69572 8776 34310 67743 19728 9944 19816 54551 53934 46144 ...\n",
      " $ status_group: Factor w/ 3 levels \"functional\",\"functional needs repair\",..: 1 1 1 3 1 1 3 3 3 1 ...\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'functional'</li><li>'functional needs repair'</li><li>'non functional'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'functional'\n",
       "\\item 'functional needs repair'\n",
       "\\item 'non functional'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'functional'\n",
       "2. 'functional needs repair'\n",
       "3. 'non functional'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] \"functional\"              \"functional needs repair\"\n",
       "[3] \"non functional\"         "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "label_col = c(\"status_group\")\n",
    "\n",
    "labels <- labels %>% \n",
    "    mutate_at(label_col, as.factor)\n",
    "str(labels)\n",
    "\n",
    "# we have 3 levels: 'functional'. 'functional needs repair'. 'non functional'\n",
    "levels(labels$status_group)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "c392d377",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-04T10:17:35.896264Z",
     "iopub.status.busy": "2022-04-04T10:17:35.894272Z",
     "iopub.status.idle": "2022-04-04T10:17:36.103828Z",
     "shell.execute_reply": "2022-04-04T10:17:36.102817Z"
    },
    "papermill": {
     "duration": 0.256533,
     "end_time": "2022-04-04T10:17:36.104066",
     "exception": false,
     "start_time": "2022-04-04T10:17:35.847533",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "'data.frame':\t59400 obs. of  40 variables:\n",
      " $ id                   : int  69572 8776 34310 67743 19728 9944 19816 54551 53934 46144 ...\n",
      " $ amount_tsh           : num  6000 0 25 0 0 20 0 0 0 0 ...\n",
      " $ date_recorded        : chr  \"2011-03-14\" \"2013-03-06\" \"2013-02-25\" \"2013-01-28\" ...\n",
      " $ funder               : chr  \"roman\" \"grumeti\" \"lottery club\" \"unicef\" ...\n",
      " $ gps_height           : int  1390 1399 686 263 0 0 0 0 0 0 ...\n",
      " $ installer            : chr  \"roman\" \"grumeti\" \"world vision\" \"unicef\" ...\n",
      " $ longitude            : num  34.9 34.7 37.5 38.5 31.1 ...\n",
      " $ latitude             : num  -9.86 -2.15 -3.82 -11.16 -1.83 ...\n",
      " $ wpt_name             : chr  \"none\" \"zahanati\" \"kwa mahundi\" \"zahanati ya nanyumbu\" ...\n",
      " $ num_private          : int  0 0 0 0 0 0 0 0 0 0 ...\n",
      " $ basin                : Factor w/ 9 levels \"internal\",\"lake nyasa\",..: 2 5 6 8 5 6 1 4 4 5 ...\n",
      " $ subvillage           : chr  \"mnyusi b\" \"nyamara\" \"majengo\" \"mahakamani\" ...\n",
      " $ region               : Factor w/ 21 levels \"arusha\",\"dar es salaam\",..: 4 10 9 13 5 21 18 18 20 5 ...\n",
      " $ region_code          : int  11 20 21 90 18 4 17 17 14 18 ...\n",
      " $ district_code        : int  5 2 4 63 1 8 3 3 6 1 ...\n",
      " $ lga                  : chr  \"ludewa\" \"serengeti\" \"simanjiro\" \"nanyumbu\" ...\n",
      " $ ward                 : chr  \"mundindi\" \"natta\" \"ngorika\" \"nanyumbu\" ...\n",
      " $ population           : int  109 280 250 58 0 1 0 0 0 0 ...\n",
      " $ public_meeting       : Factor w/ 3 levels \"\",\"false\",\"true\": 3 1 3 3 3 3 3 3 3 3 ...\n",
      " $ recorded_by          : Factor w/ 1 level \"geodata consultants ltd\": 1 1 1 1 1 1 1 1 1 1 ...\n",
      " $ scheme_management    : Factor w/ 13 levels \"\",\"company\",\"none\",..: 9 4 9 9 1 9 9 1 9 1 ...\n",
      " $ scheme_name          : chr  \"roman\" \"\" \"nyumba ya mungu pipe scheme\" \"\" ...\n",
      " $ permit               : Factor w/ 3 levels \"\",\"false\",\"true\": 2 3 3 3 3 3 3 3 3 3 ...\n",
      " $ construction_year    : int  1999 2010 2009 1986 0 2009 0 0 0 0 ...\n",
      " $ extraction_type      : Factor w/ 18 levels \"afridev\",\"cemo\",..: 4 4 4 15 4 15 16 9 5 9 ...\n",
      " $ extraction_type_group: Factor w/ 13 levels \"afridev\",\"gravity\",..: 2 2 2 11 2 11 12 6 3 6 ...\n",
      " $ extraction_type_class: Factor w/ 7 levels \"gravity\",\"handpump\",..: 1 1 1 6 1 6 2 2 2 2 ...\n",
      " $ management           : Factor w/ 12 levels \"company\",\"other\",..: 8 12 8 8 2 8 8 12 8 8 ...\n",
      " $ management_group     : Factor w/ 5 levels \"commercial\",\"other\",..: 5 5 5 5 2 5 5 5 5 5 ...\n",
      " $ payment              : Factor w/ 7 levels \"never pay\",\"other\",..: 3 1 5 1 1 5 1 7 1 1 ...\n",
      " $ payment_type         : Factor w/ 7 levels \"annually\",\"monthly\",..: 1 3 6 3 3 6 3 7 3 3 ...\n",
      " $ water_quality        : Factor w/ 8 levels \"coloured\",\"fluoride\",..: 7 7 7 7 7 5 7 4 5 7 ...\n",
      " $ quality_group        : Factor w/ 6 levels \"colored\",\"fluoride\",..: 3 3 3 3 3 5 3 4 5 3 ...\n",
      " $ quantity             : Factor w/ 5 levels \"dry\",\"enough\",..: 2 3 2 1 4 2 2 2 4 2 ...\n",
      " $ quantity_group       : Factor w/ 5 levels \"dry\",\"enough\",..: 2 3 2 1 4 2 2 2 4 2 ...\n",
      " $ source               : Factor w/ 10 levels \"dam\",\"hand dtw\",..: 9 6 1 4 6 5 4 8 4 8 ...\n",
      " $ source_type          : Factor w/ 7 levels \"borehole\",\"dam\",..: 7 4 2 1 4 3 1 6 1 6 ...\n",
      " $ source_class         : Factor w/ 3 levels \"groundwater\",..: 1 2 2 1 2 3 1 1 1 1 ...\n",
      " $ waterpoint_type      : Factor w/ 7 levels \"cattle trough\",..: 2 2 3 3 2 3 5 5 5 5 ...\n",
      " $ waterpoint_type_group: Factor w/ 6 levels \"cattle trough\",..: 2 2 2 2 2 2 4 4 4 4 ...\n"
     ]
    }
   ],
   "source": [
    "#char_cols\n",
    "c <- 1:length(char_cols)\n",
    "\n",
    "for (x in c) {\n",
    "    index <- char_cols[x]\n",
    "    count_unique_values <- n_distinct(train_df[, index])\n",
    "    \n",
    "    #print(paste(\"index \", index, \": \", count_unique_values))\n",
    "    \n",
    "    if (count_unique_values < 30) {\n",
    "        # ignore the step of 'if' : \"none\", \"\" then change to N/A and drop or impute\n",
    "        # that job would be D.A jobs, ha ha! \n",
    "        train_df[, index] <- as.factor(train_df[, index])\n",
    "    }\n",
    "        \n",
    "}\n",
    "\n",
    "str(train_df)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "fbc0883e",
   "metadata": {
    "papermill": {
     "duration": 0.042498,
     "end_time": "2022-04-04T10:17:36.189920",
     "exception": false,
     "start_time": "2022-04-04T10:17:36.147422",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# **Problem**: predict faulty Tanzania Water Pumps"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "1f68362f",
   "metadata": {
    "papermill": {
     "duration": 0.043629,
     "end_time": "2022-04-04T10:17:36.276594",
     "exception": false,
     "start_time": "2022-04-04T10:17:36.232965",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
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
   "duration": 8.618317,
   "end_time": "2022-04-04T10:17:36.430326",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2022-04-04T10:17:27.812009",
   "version": "2.3.3"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
