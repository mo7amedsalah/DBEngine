


echo "your table name must be string only"
echo "Enter your table name:"
read filename
if [ -f "$filename" ];
then
 echo `rm $filename`
 echo "your file deleted successfully"
else
echo "your file doesn't exist"
fi
