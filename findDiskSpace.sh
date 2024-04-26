WORD=$1
LENGTH=$(expr ${#WORD} - 1)
NEWWORD=''

# if [ $# -le 0 ]; then
#     echo "Please give atleast 1 argument"
# else

for ((i = $LENGTH; i >= 0; i--)); do
    CHAR=${WORD:$i:1}
    NEWWORD=$NEWWORD$CHAR
done
# fi

if [ ${WORD} = ${NEWWORD} ]; then
    echo "$WORD is PALINDROME"
else
    echo "$WORD is not PALINDROME"
fi
