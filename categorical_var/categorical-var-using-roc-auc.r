{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "8a4f7542",
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "execution": {
     "iopub.execute_input": "2022-04-05T17:59:46.583643Z",
     "iopub.status.busy": "2022-04-05T17:59:46.580820Z",
     "iopub.status.idle": "2022-04-05T17:59:47.966834Z",
     "shell.execute_reply": "2022-04-05T17:59:47.965855Z"
    },
    "papermill": {
     "duration": 1.417954,
     "end_time": "2022-04-05T17:59:47.967021",
     "exception": false,
     "start_time": "2022-04-05T17:59:46.549067",
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
      "text/html": [],
      "text/latex": [],
      "text/markdown": [],
      "text/plain": [
       "character(0)"
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
    "\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "02282313",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-05T17:59:48.074786Z",
     "iopub.status.busy": "2022-04-05T17:59:48.040879Z",
     "iopub.status.idle": "2022-04-05T17:59:48.206022Z",
     "shell.execute_reply": "2022-04-05T17:59:48.204220Z"
    },
    "papermill": {
     "duration": 0.204085,
     "end_time": "2022-04-05T17:59:48.206191",
     "exception": false,
     "start_time": "2022-04-05T17:59:48.002106",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "'data.frame':\t32 obs. of  11 variables:\n",
      " $ mpg : num  21 21 22.8 21.4 18.7 18.1 14.3 24.4 22.8 19.2 ...\n",
      " $ cyl : num  6 6 4 6 8 6 8 4 4 6 ...\n",
      " $ disp: num  160 160 108 258 360 ...\n",
      " $ hp  : num  110 110 93 110 175 105 245 62 95 123 ...\n",
      " $ drat: num  3.9 3.9 3.85 3.08 3.15 2.76 3.21 3.69 3.92 3.92 ...\n",
      " $ wt  : num  2.62 2.88 2.32 3.21 3.44 ...\n",
      " $ qsec: num  16.5 17 18.6 19.4 17 ...\n",
      " $ vs  : num  0 0 1 1 0 1 0 1 1 1 ...\n",
      " $ am  : num  1 1 1 0 0 0 0 0 0 0 ...\n",
      " $ gear: num  4 4 4 3 3 3 3 4 4 4 ...\n",
      " $ carb: num  4 4 1 1 2 1 4 2 2 4 ...\n"
     ]
    }
   ],
   "source": [
    "# loading package\n",
    "library(dplyr)\n",
    "library(caTools)          # Logistic regression\n",
    "library(ROCR)             # ROC curve to evaluate model\n",
    "\n",
    "# summary of dataset mtcars (motor trend car road test)\n",
    "# 'mtcars' comprises fuel consumption, performance and 10 aspects of automobile design for 32 automobiles\n",
    "str(mtcars)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "6aedbfbd",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-05T17:59:48.279367Z",
     "iopub.status.busy": "2022-04-05T17:59:48.277205Z",
     "iopub.status.idle": "2022-04-05T17:59:48.352834Z",
     "shell.execute_reply": "2022-04-05T17:59:48.351065Z"
    },
    "papermill": {
     "duration": 0.112939,
     "end_time": "2022-04-05T17:59:48.353005",
     "exception": false,
     "start_time": "2022-04-05T17:59:48.240066",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "\n",
       "Call:\n",
       "glm(formula = vs ~ wt + disp, family = binomial, data = train_df)\n",
       "\n",
       "Deviance Residuals: \n",
       "     Min        1Q    Median        3Q       Max  \n",
       "-1.72533  -0.48848  -0.07587   0.58544   1.85238  \n",
       "\n",
       "Coefficients:\n",
       "            Estimate Std. Error z value Pr(>|z|)  \n",
       "(Intercept)  3.14543    3.06008   1.028   0.3040  \n",
       "wt           0.73478    1.64436   0.447   0.6550  \n",
       "disp        -0.02723    0.01570  -1.734   0.0829 .\n",
       "---\n",
       "Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1\n",
       "\n",
       "(Dispersion parameter for binomial family taken to be 1)\n",
       "\n",
       "    Null deviance: 31.841  on 22  degrees of freedom\n",
       "Residual deviance: 17.665  on 20  degrees of freedom\n",
       "AIC: 23.665\n",
       "\n",
       "Number of Fisher Scoring iterations: 6\n"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "[1] \"Accuracy =  0.888888888888889\"\n"
     ]
    }
   ],
   "source": [
    "# spliting dataset\n",
    "split <- sample.split(mtcars, SplitRatio = 0.8)  # 80% for train data\n",
    "\n",
    "train_df <- subset(mtcars, split == \"TRUE\")\n",
    "test_df <- subset(mtcars, split == \"FALSE\")\n",
    "\n",
    "# training model\n",
    "model <- glm(vs ~ wt + disp, data = train_df, family = binomial)\n",
    "\n",
    "summary(model)\n",
    "\n",
    "# predict test data based on model\n",
    "predict_prob <- predict(model, test_df, type = \"response\")\n",
    "\n",
    "# changing probabilities into the categorical dependent variable\n",
    "predict_cat <- ifelse(predict_prob > 0.5, 1, 0)\n",
    "\n",
    "# calculating the accuracy\n",
    "error_rate <- mean(predict_cat != test_df$vs)\n",
    "\n",
    "accuracy <- 1 - error_rate\n",
    "print(paste('Accuracy = ', accuracy))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "05d68243",
   "metadata": {
    "papermill": {
     "duration": 0.03465,
     "end_time": "2022-04-05T17:59:48.423614",
     "exception": false,
     "start_time": "2022-04-05T17:59:48.388964",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "The predictor 'wt' influences the dependent variable 'vs' positively and one unit increase in 'wt' increases the log of odds for vs=1 by 1.4124. \n",
    "\n",
    "The predictor 'disp' influences the dependent variable 'vs' negatively and one unit increase in 'disp' decreases the log of odds for vs=1 by 0.0317.\n",
    "\n",
    "The null deviance is 31.841 (fit the dependent variable 'vs' with intercept) and the residual deviance is 14.457 (fit the dependent variable 'vs' with all independent variables)\n",
    "\n",
    "The AIC (Alkaline Information criteria) value is 16.482 (the lesser the better for the model).\n",
    "\n",
    "Accuracy comes out to be 0.67 or 67%."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "42b0bd14",
   "metadata": {
    "papermill": {
     "duration": 0.034618,
     "end_time": "2022-04-05T17:59:48.492890",
     "exception": false,
     "start_time": "2022-04-05T17:59:48.458272",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "The model is evaluated using the Confusion matrix, AUC (Area under the ROC curve), and ROC (Receiver operating characteristics) curve. \n",
    "\n",
    "In the confusion matrix, we shouldn't always look for accuracy but also for sensitivity and specificity. \n",
    "\n",
    "ROC and AUC curve is plotted."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "977ccb15",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-05T17:59:48.568713Z",
     "iopub.status.busy": "2022-04-05T17:59:48.566601Z",
     "iopub.status.idle": "2022-04-05T17:59:50.858033Z",
     "shell.execute_reply": "2022-04-05T17:59:50.856180Z"
    },
    "papermill": {
     "duration": 2.330718,
     "end_time": "2022-04-05T17:59:50.858216",
     "exception": false,
     "start_time": "2022-04-05T17:59:48.527498",
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
    },
    {
     "data": {
      "text/plain": [
       "Confusion Matrix and Statistics\n",
       "\n",
       "          Reference\n",
       "Prediction 0 1\n",
       "         0 5 0\n",
       "         1 1 3\n",
       "                                          \n",
       "               Accuracy : 0.8889          \n",
       "                 95% CI : (0.5175, 0.9972)\n",
       "    No Information Rate : 0.6667          \n",
       "    P-Value [Acc > NIR] : 0.1431          \n",
       "                                          \n",
       "                  Kappa : 0.7692          \n",
       "                                          \n",
       " Mcnemar's Test P-Value : 1.0000          \n",
       "                                          \n",
       "            Sensitivity : 0.8333          \n",
       "            Specificity : 1.0000          \n",
       "         Pos Pred Value : 1.0000          \n",
       "         Neg Pred Value : 0.7500          \n",
       "             Prevalence : 0.6667          \n",
       "         Detection Rate : 0.5556          \n",
       "   Detection Prevalence : 0.5556          \n",
       "      Balanced Accuracy : 0.9167          \n",
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
    "# evaluating model accuracy using confusion matrix\n",
    "# predicted values: predict_cat vs. actual values: test_df$vs\n",
    "# table(predict_cat, test_df$vs): the equivalent function but only shows the table\n",
    "library(caret)\n",
    "\n",
    "# because the classes of 'predict_cat' and 'test_df$vs' are both numeric. \n",
    "# It should be converted into factors\n",
    "\n",
    "data_factor <- as.factor(predict_cat)\n",
    "ref_factor <- as.factor(test_df$vs)\n",
    "\n",
    "confusionMatrix(data = data_factor, reference = ref_factor)\n",
    "\n",
    "# error rate = 1 - accuracy"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "7b74f095",
   "metadata": {
    "papermill": {
     "duration": 0.040731,
     "end_time": "2022-04-05T17:59:50.940577",
     "exception": false,
     "start_time": "2022-04-05T17:59:50.899846",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**Note: values in the matrix will change each time this file is run again. It's ok!**\n",
    "\n",
    "**Interpretation for the confusion matrix:** \n",
    "- the model has predicted 0 as 0, **5 times** and 0 as 1, **0 time**\n",
    "- the model has predicted 1 as 0, 2 times and 1 as 1, 2 times.\n",
    "- the accuracy of the model is 77.8%\n",
    "\n",
    "The accuracy score reads as 77.8% for the given data and observations. Now it's straightforward that the error rate will be 22.2%. \n",
    "\n",
    "Cool! The model has wrongly predicted 22.2% of the values and the error rate is 22.2%"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "769cd07e",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-05T17:59:51.029973Z",
     "iopub.status.busy": "2022-04-05T17:59:51.027946Z",
     "iopub.status.idle": "2022-04-05T17:59:51.064134Z",
     "shell.execute_reply": "2022-04-05T17:59:51.062420Z"
    },
    "papermill": {
     "duration": 0.082426,
     "end_time": "2022-04-05T17:59:51.064301",
     "exception": false,
     "start_time": "2022-04-05T17:59:50.981875",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "0.916666666666667"
      ],
      "text/latex": [
       "0.916666666666667"
      ],
      "text/markdown": [
       "0.916666666666667"
      ],
      "text/plain": [
       "[1] 0.9166667"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# ROC-AUC curve\n",
    "ROC_predict <- prediction(predict_cat, test_df$vs)\n",
    "ROC_perform <- performance(ROC_predict, measure = \"tpr\", x.measure = \"fpr\")\n",
    "\n",
    "# Area under the ROC curve\n",
    "auc <- performance(ROC_predict, measure = \"auc\")\n",
    "auc <- auc@y.values[[1]]\n",
    "auc"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "55f3d500",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-05T17:59:51.158321Z",
     "iopub.status.busy": "2022-04-05T17:59:51.156574Z",
     "iopub.status.idle": "2022-04-05T17:59:51.451166Z",
     "shell.execute_reply": "2022-04-05T17:59:51.450585Z"
    },
    "papermill": {
     "duration": 0.343293,
     "end_time": "2022-04-05T17:59:51.451301",
     "exception": false,
     "start_time": "2022-04-05T17:59:51.108008",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "iVBORw0KGgoAAAANSUhEUgAAA0gAAANICAIAAAByhViMAAAABmJLR0QA/wD/AP+gvaeTAAAg\nAElEQVR4nOzdeVzM+R8H8Pd37m6pHElujXuxSBI52o0sybHYFWFZrWTXsjf2+sleso5trWMt\nad3Kpg2LasNax0RkHbWutKSo1EzNfH9/TJJpSmWm73em1/Mxf0zfvt/vvOpb07vP9WVYliUA\nAAAAMH0CrgMAAAAAgGGgsAMAAAAwEyjsAAAAAMwECjsAAAAAM4HCDgAAAMBMoLADAAAAMBMo\n7AAAAADMBAo7AAAAADOBwg4AAADATKCwAwAAADATKOwAAAAAzAQKOwAAAAAzgcIOAAAAwEyg\nsAMAAAAwEyjsAAAAAMwECjsAAAAAM4HCDgAAAMBMoLADAAAAMBMo7AAAAADMBAo7AAAAADOB\nwg4AAADATKCwAwAAADATKOwAAAAAzAQKOwAAAAAzgcIOAAAAwEygsAMAAAAwEyjsAAAAAMwE\nCjsAAAAAM4HCDgAAAMBMoLADAAAAMBMo7AAAAADMBAo7AAAAADOBwg4AAADATKCwAwAAADAT\nKOwAAAAAzAQKOwAAAAAzgcIOAAAAwEygsAMAAAAwEyjsAAAAAMwECjsAqGua4jtM5QQCib1T\ni8EBb+67kFvZGYofXv5h6fsjvHq4OjtZiKX2Ts4de3oHf7A0+d/8ql/6/oUDX7w7o19XeRMH\nO4mFrUur9l6vBH73c3SemjX0VwkAwAGGZfF2BgB1SlN8Ryhp+szdhGLHHxT/TO9gr7M9OWLe\nq/NW3igsqXiIQGg9duGPkV9M0PM/q6Zw5Zwx83/Yr9ToedOzbTt4ZVTU6z0dq/cVAADwFAo7\nAKhr1SzsiMjGZerDG+vLb/n9Y7+XP/+t6qM6T1yesmUuU34TW7LYr/2S2PQqjhJKm0UcV0x7\nwaE6wQAA+AldsQDApab9tt8rJyvz5rG9q1vJRNrP5t3csPNeYdnON35bMOyLWO1zRiDxfePD\nnQcSz128cDwhbtnCyQ5iofZT5yNDh3/1V/lXOfPN8LKqTiCynfhuWFziiYtpF44d3D1ndG/t\ndrXyVvDAV+4Wa4z69QIAGBVa7ACgrpVvsWs2MO7m4Zd0djj9Sfeen53VPn897f4mN3siYtUP\nPRs2Sn6oJCKByHZZXOo7g13KH/Xgn53u3SekPSomIqHY4a/7mT2sxUSkUd1ua9civaiEiAQi\n+9XJl2b2cip/YNTsbhPWpGifvxL7715fV0N/xQAAdQQtdgDAO429G1fceD02UFvVEVHvJQd0\nqjoismsf8PvWSdrn6uLsqZ8ptM9vxL+hreqIqNv7v+lUdUQ05ptfbUWlb4ZnV/zzzHiq3Evf\nvTerf7e2DraWEkvb5vIXX5v75d93Csvvc9i/tXYuiJXT2PLbH2WtK5sm8tG/D7UbU8PdtVuE\n4oZElJUcOcaza0MLyb9KteLzFx/PKREcfaAsf6rdg1y0n5JYyQvKDRy8q/gtdMootxZNraSy\nJi3cvF6euDbmpPqZXxUAmAcWAKBuqVWZZW9BzQbGVdzh5PvdynaIzynSbtzQs5F2i0Boc6Ww\nRP+pNcreNhLtbtZNpmu37RnQrOxsSQ+Ueo+7mXbh/Pnz58+fT7ucW3X4rOSIdpbiiu+lIlnz\nbxPulO32x6hW2u2WjmPKH15w56eyQz7MeKDdeH55n9IvTWR/7/QK+8dVZnpRSeH9WIYpHS44\nKPJKuTOVdLEqjdF6zP4nr/ttoJh5anihluug2TeUlXzTAMCMoMUOALjEljx6UE5O9n9n/tg8\n/rtU7Wcb9/l8aAOp9nnE5QfaJ1ZNp7eRCfWfjpG826mh9mlB1obcEpaIYv8pPVBq17+frUTv\ncc3cOnTq1KlTp05ube2qSKt6mOw5+K3Lj4qJiGEY1w7duslbixiGiEqKbix4ySOloLgGX7we\n6tnD388peTLOT2bv+3ZzG+1zxef7yrYXZP5w7vFrTV7aV/vk1oH3Br+zqZhliche7h4w4dUh\nHh20n7r+x+o+Pl8+XzYAMAEo7ACAS7eTRjcop6Fj4x6DX79WVEJEDl3G/H5wweMdNWU1k9TO\no4oTuvQsLexYVn3uUTERaUfdEZHEpvdzpj06d+rlwmIiEogbrku+9e+Fs2cvXr1xYq2dSEBE\nJYXXZqxOe57za0oebr9T6OE/7Yuvvvvu6/81EAqIaNYXvbSfzflnUaaqtOa79svP2idSu34f\ntdEWo+q3Jn7PsiwRtXk1IuvCsR2RWw/8eSHl1ze1e94++sl757KfJx4A8B8KOwDgI4duk/46\nsbWbtZ5Oz6oJxE/e1rKLNURU1vzFMDU+m44PdmZon7gM+XGqe+n8jya9pm0c0d3FxcXFxeXR\nb+ef8yVeWvHXn7t++mB+aOg77zUQMUTUcvRyCyFDRJqSBx+k3NPutm116VjANpOWaVsvC+78\n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\noNbEYrG3t7evr2+vXr0SEhJQ1QG8Rh6li4lqvskexYpUNqCYq91m/9WbO75YPrxvd1FR7pPq\n/ypJrpb511Hpe798vzMvL+vFZrma3qDv6e6pPSFHz2Y/Knv1siTttz+eqnJGXy26ZvYrvwxZ\n+SWRtKrw8ePS8iqejl4rQzMTQ+1my9CioXMCQM1VVlbOnTv30KFDY8eOPXr0qLGxMdOJAFit\nTT3jTrRVWfxwtVov/Cx44WfyPsbRmbP+pznrtz7ITMvMflDrg4oWdjln19pN/K5SImf1Uduw\n3dSP975ZXqXgaJtbtq/TpgsqhsPEANRZUVHR1KlTL1y4MGvWrF27dulgTwVAQ/LqGVAsUlnz\nhGJ4Hbv17titd62rihZ2Py/8qYpntvfin9PtTb4eyt/Teuvt2KlVz/J+/tApILFPqP87yo7b\nTMRicUxMTEVFxWvuyc7OJiKJRPKae1oQoZA4HOpd+78kAGC/nJwcJycnoVDo4+OzZcsWLrc5\nDw8CUFdt6hwpJlN8v+rXX399zQv19PScnJx4PJ6KgsmlaGG3O7fU3C5szsCuRDRvTc9NPnt0\ndWfo6nZauetSTOs2LoHXkz5lxbM50dM/OtlNJ6LcXIVG2Z09e3by5MmK3JmVldWkZBpDKCQb\nGzIza/hOAGCTtLQ0gUBw//79wMDA1atXMx0HQG3k1lmxk72bVZDu4dHAeLVTp06NGzdOFanq\nK3gULeweVYnbdHo+K89ioF1l8d5SibQVl8PhGflNsp7wQwB9GqncxI0jlYry8vIUv3/MmDFR\nUVGvX7Hbtm3buXPnbG1tm5xO/YlElJFBAgHTOQDgzVy8eNHFxeXZs2cHDhzw9PRkOg6AOmlX\nz4qdrYX9pkP+r3mhnp7emDFjVBOq3oJH0cLuf610Mm6mEL1DRHpm46SSsP35Ze+3b0VE+u31\nK4tOKzFrU+gY9r906ZLi9/N4PBcXl9ffExMTQ0R4ZkFElJZGIhE22AGol2PHjs2cOZPH40VH\nRzs6Ojb8AgCoIaeeFTtjK213d3cGAhFR/QWPosXKh0PbFt9Zs27fmcIqiZ65c3sdXvDXCURE\n0uqIo/e09LspMWtTcHhGgwYNGoTz6VUELbEA6mbr1q1ubm4mJiYXLlxAVQfQCB3qGVCso7IB\nxYqor+BRdMXOae+2TjZTv5077prNg9hRHbYIrD23OQ3OnGpc/OepW8XdZn+p7MANKMrNunkz\n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\nJ3M9FfsgP/fKlat37heXlpVLLNvZO3bsrejb4xk513U129NWTrAsu2nTpk2bNnl4eBw7dqxr\n166mqw0AAACeyLpS716xGiKiomI0KG41VvNw78eborbHpWbfqf9oR4XX/OVr3l4zTy5hTF9b\nyzTZ60StVi9ZsiQuLs7Ly+vIkSNOTk4mrQ0AAACeUPRqeIpObovFE62jUf++ZOjArzIKxdL2\nwyfMGNC35zNOcgsLSaVKVXSv4MbVzNSUcx+9FrQz7qjyx52dZPw+y5yeTo6O5Opa/5GSkpKA\ngICkpKSZM2fu2bPHysrK9NUBAACATvbVxmbs+Lh4wpyC3Y+vTv0qo3D0y5F7Nq9ybddA5Vp1\n4Z6IkIVhcZNWL8+MHm/yAptNq6WLF2n48PqPFBQU+Pr6/vLLL0uXLo2OjpZIzOkXBAAAIDxV\nM3Y1J+10DYrt+Dhjx+9prdre/OqqzTMrUz4NbTDVEZFI5rjg7fhtwztcj99o4tpa5vp1Kimp\nf4FdTk7O2LFjL1y4EBYWtn37dqQ6AAAAzmX/+qQpcc0vzNi13sXSChvF9KfuNmSsS8X/Mk1Q\nj/50KydqX2B3/vx5Pz+/wsLC6OjoFStWcFMYAAAA1GZe19iZ04zdTEerB9mbC9TapnbSPv5i\nb56lwxRTFaUX3cqJGjN2x48ff/7550tLSw8fPoxUBwAAwB9VM3Z1voiKHvJxxs6cgt1bEVNU\nD1M8vQJ3fftzqaZeeGZVWSkHl0/quy2veHxYGBcFNlt6Oslk5O6u+27nzp2+vr5SqTQ5OdnX\n15fb0gAAAKAmD/eGt8vt+dig2JxOxfZe/HXM+ckvfXZg4dT9Ypl9j949OznLLSykGrXq4b38\nnKvX75dXMgzjvWprQkhfrottklJJ/fqRTEZEkZGR69at6969+7Fjx9zdG3nvAAAAAIe0RDUb\nqZmwQXFLG/eaU7AjEi3fcsJn4aGtsXsST6VlX75wNbNqaBmRhWvPfpO8pwQtD505tDO3VT5F\nYSHdukWTJmk0mtDQ0M8++6x///7Hjh3r3JnfZQMAALRJWVn17hWrWzxRZMQGxXo37jWvYEdE\n1Hn4rHeHz3qXiK18XFT0qPSxWmZlbSt3sOJ/U2Kd9HQiUvXrt2j+/L17906YMOHgwYN2dnZc\nlwUAAAANULibut1Jaxr3ml+wq8ZIrBycrBy4LqPF0tMfEM366qszSuWCBQu++OILmUzGdU0A\n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\nAAjE/wMcGehBlDHxtAAAAABJRU5ErkJggg=="
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
    "# plotting curve\n",
    "plot(\n",
    "    ROC_perform, \n",
    "    colorize = TRUE,\n",
    "    print.cutoffs.at = seq(0.1, by = 0.1), # start at the point of 0.1 \n",
    "    main = \"ROC curve\"\n",
    ")\n",
    "abline(a = 0, b = 1) # 45-degree line\n",
    "\n",
    "auc <- round(auc, 4)\n",
    "legend(.6, .4, auc, title = \"AUC\", cex = 1)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "6bc84caa",
   "metadata": {
    "papermill": {
     "duration": 0.04722,
     "end_time": "2022-04-05T17:59:51.545377",
     "exception": false,
     "start_time": "2022-04-05T17:59:51.498157",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "In the ROC curve, the more the area under the curve (AUC), the better the model.\n",
    "\n",
    "AUC is 0.8571."
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
   "duration": 8.436098,
   "end_time": "2022-04-05T17:59:51.703456",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2022-04-05T17:59:43.267358",
   "version": "2.3.3"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
