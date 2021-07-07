#! /bin/bash
echo "****"
echo "In order to use this Jupyter notebook, use the 127.0.0.1 (localhost)"
echo "http link produced by Jupyter below. and navigate using the browser on the VM host (e.g., your laptop)"
echo "Vagrant is already set up to forward this port properly."
echo "****"
echo "Sleeping for 5 seconds..."
sleep 5
echo "Running jupyter notebook with cmd: jupyter lab --ip=0.0.0.0 --port 13337 --no-browser"
jupyter lab --ip=0.0.0.0 --port 13337 --no-browser
##
