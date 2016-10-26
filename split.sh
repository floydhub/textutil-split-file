#!/bin/bash
# Reading in command line arguments

for i in "$@"
do
case $i in
    -i=*|--input=*)
    INPUT="${i#*=}"
    shift # past argument=value
    ;;
    -r=*|--ratio=*)
    RATIO="${i#*=}"
    shift # past argument=value
    ;;
    -p1=*|--part1=*)
    PART1="${i#*=}"
    shift # past argument=value
    ;;
    -p2=*|--part2=*)
    PART2="${i#*=}"
    shift # past argument=value
    ;;
    # --default)
    # DEFAULT=YES
    # shift # past argument with no value
    # ;;
    *)
    # unknown option
    ;;
esac
done

echo "INPUT = ${INPUT}"
echo "RATIO = ${RATIO}"
echo "PART1 = ${PART1}"
echo "PART2 = ${PART2}"

# Split total lines using ratio. Add 1 because csplit argument is not inclusive
LINES="$(echo "$(wc -l < ${INPUT}) * ${RATIO} + 1" | bc)"
# Round to integer
LINES=$( printf "%.0f" $LINES )
echo "PART1 LINES = ${LINES}"

csplit ${INPUT} ${LINES} -f part

mv part00 ${PART1}
mv part01 ${PART2}