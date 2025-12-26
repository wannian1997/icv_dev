CURRENT_DIR=$(cd $(dirname $0);pwd)
INTC_DIR=$CURRENT_DIR/intc
file_names=$(ls $INTC_DIR)

intc_test_update(){
    # mv all sv
    for file_name in $file_names
    do
        if [[ $file_name == int_*seq.sv ]]; then
            cp -r ./intc/$file_name ./tc/seq/int_seq
        elif [[ $file_name == test_*.tcl ]]; then
            str_len=${#file_name}
            tree_id_str_len=$str_len-9
            tree_id=${file_name:5:$tree_id_str_len}

            cp -r ./intc/$file_name ./script/tests/tc_int_tree_$tree_id\_*/
            cd ./script/tests/tc_int_tree_$tree_id\_*/
            mv test.tcl test_old.tcl
            mv $file_name test.tcl
            cd ../../../
        fi
        echo -e "\e[32m $file_name \t\t update success. \e[0m"
    done
}


intc_test_update
echo $(date '+%Y-%m-%d %H:%M:%S')
