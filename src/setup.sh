#!/bin/bash

clear
echo "Configuring environment to run the Coffee Companion"
bundle install
echo "..."
echo "Launching the Coffee Companion"
ruby coffee_companion.rb