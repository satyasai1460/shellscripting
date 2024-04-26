WORD=$1
LENGTH=$(expr ${#WORD} - 1)
NEWWORD=''

if [ $# -le 0 ]; then
    echo "Please give atleast 1 argument"
else
    echo "The given WORD to check palindrome is $WORD"
fi

for ((i = $LENGTH; i >= 0; i--)); do
    CHAR=${WORD:$i:1}
    NEWWORD=$NEWWORD$CHAR
done

if [ ${NEWWORD} = ${WORD} ]; then
    echo "$WORD is PALINDROME"
else
    echo "$WORD is not PALINDROME"
fi
