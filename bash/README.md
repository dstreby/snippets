       _  _   _    __               ___     _          __
     _| || |_| |  / /   _ ___ _ __ / / |__ (_)_ __    / /__ _ ____   __
    |_  ..  _| | / / | | / __| '__/ /| '_ \| | '_ \  / / _ \ '_ \ \ / /
    |_      _|_|/ /| |_| \__ \ | / / | |_) | | | | |/ /  __/ | | \ V /
      |_||_| (_)_/  \__,_|___/_|/_/  |_.__/|_|_| |_/_/ \___|_| |_|\_/
     _               _
    | |__   __ _ ___| |__
    | '_ \ / _` / __| '_ \
    | |_) | (_| \__ \ | | |
    |_.__/ \__,_|___/_| |_|

----

## Contents:

#### [increment_padded_num](increment_padded_num.sh)  
A bash function to increment a zero padded integer

#### [tcpdump-req-resp-imbalance](tcpdump-req-resp-imbalance.sh)
A quick and dirty script to parse tcpdump pcap files and identify
potential missing HTTP responses (e.g. will identify a transaction for
which there are more requests than responses)

#### [jumblesort](jumblesort/jumblesort.sh)
Solution to [jumble sort challenge](jumblesort/README.md)

#### [prase_script_args](parse_script_args.sh)  
Function template for parsing runtime arguments passed to a script

#### [progress_bar](progress_bar.sh)  
Draw / Re-draw a progress bar in the shell

#### [sanity](sanity.sh)  
Little bash routines for improved sanity. 
* Setting runtime vars (script directory, script name)
* Safe iteration through a file
* Error / Verbose echo functions
* Standard test functions (file, dir, sym-link)

#### [show_usage](show_usage.sh)  
Simple function template for printing a script's usage statement
