#!/bin/bash

# Leiame abifailid ka siis, kui käivitame mängu teisest kaustast.
cd -- "$(dirname -- "$0")" || exit 1

source ./files.sh || exit 1
source ./input.sh || exit 1
source ./lottery_functions.sh || exit 1
source ./result.sh || exit 1

# Programmi põhiosa
show_header
clear_files player_numbers.txt lottery_numbers.txt || exit 1
read_player || exit 1
read_player_numbers player_numbers.txt || exit 1
show_numbers "Sinu numbrid:" player_numbers.txt
generate_lottery_numbers lottery_numbers.txt || exit 1
show_numbers "Võidunumbrid:" lottery_numbers.txt
check_matches player_numbers.txt lottery_numbers.txt
get_result "$tabamused"
show_result "$nimi" "$tabamused" "$tulemus"
save_result "$nimi" "$tabamused" "$tulemus" player_numbers.txt lottery_numbers.txt || exit 1
