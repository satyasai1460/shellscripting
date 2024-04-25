INPUT=$1
WORD=$(echo ${INPUT} | tr '[:upper:]' '[:lower:]')
LENGTH=$(expr ${#WORD} - 1)
NEWWORD=''
for ((i = $LENGTH; i >= o; i--)); do
    CHAR=${WORD:$i:1}
    NEWWORD=$NEWWORD$CHAR
done

if [ ${NEWWORD} = ${WORD} ]; then
    echo "$WORD is a Palindrome"
else
    echo "$WORD is not a Palindrome"
fi
