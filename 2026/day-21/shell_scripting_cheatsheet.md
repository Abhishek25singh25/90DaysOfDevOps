# Shell Scripting – 1 Page Quick Revision

## Basics

```bash
#!/bin/bash
```
Defines Bash interpreter.

Run script:
```bash
chmod +x script.sh
./script.sh
bash script.sh
```

Variables:
```bash
NAME="DevOps"
echo $NAME
```

User input:
```bash
read -p "Enter name: " NAME
```

Arguments:
```bash
$1   # first argument
$#   # total arguments
$@   # all arguments
$?   # last exit status
```

---

## Conditionals

String:
```bash
[ "$a" = "$b" ]
[ -z "$a" ]
```

Integer:
```bash
[ "$a" -eq 5 ]
[ "$a" -gt 5 ]
```

File:
```bash
[ -f file ]
[ -d dir ]
```

If statement:
```bash
if [ condition ]; then
  echo "Yes"
else
  echo "No"
fi
```

Case:
```bash
case $1 in
  start) echo "Start";;
  stop) echo "Stop";;
esac
```

---

## Loops

For:
```bash
for i in 1 2 3; do
  echo $i
done
```

While:
```bash
while [ $i -le 5 ]; do
  ((i++))
done
```

Loop files:
```bash
for file in *.log; do
  echo $file
done
```

---

## Functions

```bash
greet() {
  echo "Hello $1"
}
greet DevOps
```

Local variable:
```bash
local var="inside"
```

---

## Text Processing

Grep:
```bash
grep -i "error" file
```

Awk:
```bash
awk '{print $1}' file
```

Sed:
```bash
sed -i 's/old/new/g' file
```

Cut:
```bash
cut -d',' -f1 file.csv
```

Sort / Uniq:
```bash
sort file
uniq -c file
```

Tail logs:
```bash
tail -f app.log
```

---

## Useful One-Liners

Delete files older than 7 days:
```bash
find . -type f -mtime +7 -delete
```

Check service:
```bash
systemctl is-active nginx
```

Disk usage > 80%:
```bash
df -h | awk '$5+0 > 80'
```

Count lines:
```bash
wc -l *.log
```

---

## Error Handling

Exit codes:
```bash
exit 0
echo $?
```

Safe mode:
```bash
set -e
set -u
set -o pipefail
```

Debug:
```bash
set -x
```

Trap:
```bash
trap 'rm -f temp.txt' EXIT
```

---

End
