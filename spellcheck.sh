#!/usr/bin/env bash

echo "** Misspelled English words **"

cat sections/*.tex abstracts/abstract_english.tex \
  | aspell \
  --personal ./wordlist \
  -W 3   \
  -d en  \
  list   \
  | sort | uniq -u;

echo "** Misspelled Swedish words in abstract **"
cat abstracts/abstract_swedish.tex \
  | aspell \
  --personal ./ordlista \
  -d sv \
  list  \
  | sort | uniq -u;
