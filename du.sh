FILESYSTEM=$(df -h | egrep -v 'loop|xvda|tmpfs' | awk -F ' ' '{print $1}' | tail -1 | sed "s/%//g")
PERCENTAGE=$(df -h | egrep -v 'loop|xvda|tmpfs' | awk -F ' ' '{print $5}' | tail -1 | sed "s/%//g")

echo $FILESYSTEM
echo $PERCENTAGE

if [ $PERCENTAGE -lt 50 ]; then
    echo "You've used $PERCENTAGE% of Disk space...It's in good state"
else
    echo "You've used the disk space more than 50%"
fi
