ls -al
pwd
date
cal
touch file1.txt
mkdir dir1
mv file1.txt dir1/
rm -rf dir1
echo "Hello World"
echo "Hello World" > file1.txt
echo "Hello World" >> file1.txt
echo "Hello World" > file1.txt
sed -e 's/Hello/Hi/' file1.txt
cut -d: -f1 /etc/passwd
cut -d: -f1,3,6 /etc/passwd
cut -d: -f1,3,6 /etc/passwd | sort
cut -d: -f1,3,6 /etc/passwd | sort | uniq
cut -d: -f1,3,6 /etc/passwd | sort | uniq | wc -l
cut -d: -f1,3,6 /etc/passwd | sort | uniq | wc -l | awk '{print $1}'
cut -d: -f1,3,6 /etc/passwd | sort | uniq | wc -l | awk '{print $1}' | xargs -I {} echo "Number of users: {}"
cut -d: -f1,3,6 /etc/passwd | sort | uniq | wc -l | awk '{print $1}' | xargs -I {} echo "Number of users: {}"