{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "ccf48697",
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "execution": {
     "iopub.execute_input": "2022-04-04T02:51:26.951950Z",
     "iopub.status.busy": "2022-04-04T02:51:26.951137Z",
     "iopub.status.idle": "2022-04-04T02:51:29.923898Z",
     "shell.execute_reply": "2022-04-04T02:51:29.922797Z"
    },
    "papermill": {
     "duration": 2.990135,
     "end_time": "2022-04-04T02:51:29.924020",
     "exception": false,
     "start_time": "2022-04-04T02:51:26.933885",
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
   "id": "9c73403b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-04T02:51:29.974155Z",
     "iopub.status.busy": "2022-04-04T02:51:29.948328Z",
     "iopub.status.idle": "2022-04-04T02:51:30.079280Z",
     "shell.execute_reply": "2022-04-04T02:51:30.078280Z"
    },
    "papermill": {
     "duration": 0.144386,
     "end_time": "2022-04-04T02:51:30.079407",
     "exception": false,
     "start_time": "2022-04-04T02:51:29.935021",
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
      " $ waterpoint_type_group: chr  \"communal standpipe\" \"communal standpipe\" \"communal standpipe\" \"communal standpipe\" ...\n",
      "'data.frame':\t14358 obs. of  40 variables:\n",
      " $ id                   : int  50785 51630 17168 45559 49871 52449 24806 28965 36301 54122 ...\n",
      " $ amount_tsh           : num  0 0 0 0 500 0 0 0 30 0 ...\n",
      " $ date_recorded        : chr  \"2013-02-04\" \"2013-02-04\" \"2013-02-01\" \"2013-01-22\" ...\n",
      " $ funder               : chr  \"Dmdd\" \"Government Of Tanzania\" \"\" \"Finn Water\" ...\n",
      " $ gps_height           : int  1996 1569 1567 267 1260 1685 550 234 584 1083 ...\n",
      " $ installer            : chr  \"DMDD\" \"DWE\" \"\" \"FINN WATER\" ...\n",
      " $ longitude            : num  35.3 36.7 34.8 38.1 35 ...\n",
      " $ latitude             : num  -4.06 -3.31 -5 -9.42 -10.95 ...\n",
      " $ wpt_name             : chr  \"Dinamu Secondary School\" \"Kimnyak\" \"Puma Secondary\" \"Kwa Mzee Pange\" ...\n",
      " $ num_private          : int  0 0 0 0 0 0 0 0 0 0 ...\n",
      " $ basin                : chr  \"Internal\" \"Pangani\" \"Internal\" \"Ruvuma / Southern Coast\" ...\n",
      " $ subvillage           : chr  \"Magoma\" \"Kimnyak\" \"Msatu\" \"Kipindimbi\" ...\n",
      " $ region               : chr  \"Manyara\" \"Arusha\" \"Singida\" \"Lindi\" ...\n",
      " $ region_code          : int  21 2 13 80 10 2 11 9 90 3 ...\n",
      " $ district_code        : int  3 2 2 43 3 2 7 4 33 7 ...\n",
      " $ lga                  : chr  \"Mbulu\" \"Arusha Rural\" \"Singida Rural\" \"Liwale\" ...\n",
      " $ ward                 : chr  \"Bashay\" \"Kimnyaki\" \"Puma\" \"Mkutano\" ...\n",
      " $ population           : int  321 300 500 250 60 200 600 1 40 1 ...\n",
      " $ public_meeting       : chr  \"True\" \"True\" \"True\" \"\" ...\n",
      " $ recorded_by          : chr  \"GeoData Consultants Ltd\" \"GeoData Consultants Ltd\" \"GeoData Consultants Ltd\" \"GeoData Consultants Ltd\" ...\n",
      " $ scheme_management    : chr  \"Parastatal\" \"VWC\" \"VWC\" \"VWC\" ...\n",
      " $ scheme_name          : chr  \"\" \"TPRI pipe line\" \"P\" \"\" ...\n",
      " $ permit               : chr  \"True\" \"True\" \"\" \"True\" ...\n",
      " $ construction_year    : int  2012 2000 2010 1987 2000 1990 2007 1982 1997 2003 ...\n",
      " $ extraction_type      : chr  \"other\" \"gravity\" \"other\" \"other\" ...\n",
      " $ extraction_type_group: chr  \"other\" \"gravity\" \"other\" \"other\" ...\n",
      " $ extraction_type_class: chr  \"other\" \"gravity\" \"other\" \"other\" ...\n",
      " $ management           : chr  \"parastatal\" \"vwc\" \"vwc\" \"vwc\" ...\n",
      " $ management_group     : chr  \"parastatal\" \"user-group\" \"user-group\" \"user-group\" ...\n",
      " $ payment              : chr  \"never pay\" \"never pay\" \"never pay\" \"unknown\" ...\n",
      " $ payment_type         : chr  \"never pay\" \"never pay\" \"never pay\" \"unknown\" ...\n",
      " $ water_quality        : chr  \"soft\" \"soft\" \"soft\" \"soft\" ...\n",
      " $ quality_group        : chr  \"good\" \"good\" \"good\" \"good\" ...\n",
      " $ quantity             : chr  \"seasonal\" \"insufficient\" \"insufficient\" \"dry\" ...\n",
      " $ quantity_group       : chr  \"seasonal\" \"insufficient\" \"insufficient\" \"dry\" ...\n",
      " $ source               : chr  \"rainwater harvesting\" \"spring\" \"rainwater harvesting\" \"shallow well\" ...\n",
      " $ source_type          : chr  \"rainwater harvesting\" \"spring\" \"rainwater harvesting\" \"shallow well\" ...\n",
      " $ source_class         : chr  \"surface\" \"groundwater\" \"surface\" \"groundwater\" ...\n",
      " $ waterpoint_type      : chr  \"other\" \"communal standpipe\" \"other\" \"other\" ...\n",
      " $ waterpoint_type_group: chr  \"other\" \"communal standpipe\" \"other\" \"other\" ...\n",
      "'data.frame':\t59400 obs. of  2 variables:\n",
      " $ id          : int  69572 8776 34310 67743 19728 9944 19816 54551 53934 46144 ...\n",
      " $ status_group: chr  \"functional\" \"functional\" \"functional\" \"non functional\" ...\n"
     ]
    }
   ],
   "source": [
    "# view its structure\n",
    "str(train_df)\n",
    "str(test_df)\n",
    "str(labels)"
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
   "duration": 6.838108,
   "end_time": "2022-04-04T02:51:30.211603",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2022-04-04T02:51:23.373495",
   "version": "2.3.3"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
