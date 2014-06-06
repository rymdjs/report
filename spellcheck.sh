#!/usr/bin/env bash

echo "** Misspelled English words **"
cat sections/*.tex abstracts/abstract_english.tex \ # Fetch content
  | aspell \  # Pipe into aspell
  --personal ./wordlist \  # Use list of ignored words
  -W 3   \ # Ignore words with a length <= 3
  -d en  \ # Use English
  list   \ # List results to stdout
  | sort | uniq -u # Sort and remove duplicates

echo "** Misspelled Swedish words in abstract **"
cat abstracts/abstract_swedish.tex \
  | aspell \
  --personal ./ordlista \ # Use Swedish list of ignored words
  -d sv \ # Use Swedish
  list  \
  | sort | uniq -u
