#!/bin/bash
for bg in {40..47}; do
  for fg in {30..37}; do
    echo -e "\e[${fg};${bg}m fg=${fg}, bg=${bg} \e[0m"
  done
done