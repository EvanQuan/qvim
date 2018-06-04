# Create different files with different text
echo "PASS" > a.txt
echo "FAIL" > b.txt
# echo "~/.vim/version/b.txt" > path.txt
echo "./b.txt" > path.txt
# Try to copy a.txt contents into b.txt using path.txt contents
cp a.txt $(<path.txt)

echo $(<b.txt)
