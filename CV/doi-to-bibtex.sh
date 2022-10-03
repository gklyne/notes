#!/bin/bash

url=$1
curl -LH 'Accept: application/x-bibtex' $url

