#!/bin/bash -e

set | grep 'http_proxy' | cut -d'=' -f 2
