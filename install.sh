{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "c9973f39-6d0a-47db-b13d-2d014cc81643",
   "metadata": {},
   "outputs": [],
   "source": [
    "#!/bin/bash\n",
    "ENVNAME=\"gnnetwork\"\n",
    "\n",
    "is_installed=$(conda info --envs | grep $ENVNAME -c)\n",
    "\n",
    "if [[ \"${is_installed}\" == \"0\" ]];then\n",
    "  conda create -n $ENVNAME python = 3.9 -y;\n",
    "fi\n",
    "\n",
    "if [[ `command -v activate` ]]\n",
    "then\n",
    "  source `which activate` $ENVNAME\n",
    "else\n",
    "  conda activate $ENVNAME\n",
    "fi\n",
    "\n",
    "# Check to make sure grapharm is activated\n",
    "if [[ \"${CONDA_DEFAULT_ENV}\" != $ENVNAME ]]\n",
    "then\n",
    "  echo \"Could not run conda activate $ENVNAME, please check the errors\";\n",
    "  exit 1;\n",
    "fi\n",
    "\n"
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "Python 3 (ipykernel)",
   "language": "python",
   "name": "python3"
  },
  "language_info": {
   "codemirror_mode": {
    "name": "ipython",
    "version": 3
   },
   "file_extension": ".py",
   "mimetype": "text/x-python",
   "name": "python",
   "nbconvert_exporter": "python",
   "pygments_lexer": "ipython3",
   "version": "3.11.4"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
