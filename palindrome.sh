INPUT=$1
WORD=$(echo ${INPUT} | tr '[:upper:]' '[:lower:]')
LENGTH=$(expr ${#WORD} - 1)
NEWWORD=''
for ((i = $LENGTH; i >= o; i--)); do
    CHAR=${WORD:$i:1}
    NEWWORD=$NEWWORD$CHAR
done

if [ ${NEWWORD} = ${WORD} ]; then
    echo "$NEWWORD is a Palindrome"
else
    echo "$NEWWORD is not a Palindrome"
fi
