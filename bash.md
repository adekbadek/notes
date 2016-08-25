# bash

Bourne Again Shell

## Kernel and Shell

  - __Kernel__ is the Core of the OS, OSX uses the Mach Kernel
  - __Shell__ is the outer layer of the OS, the interface to communicate with the Kernel, OSX uses the bash shell. You can switch between shells, it's just the interface - not like the OS


## Commands

  - Echo - `echo <statement>` print to stdout
    - `echo hello $name` is ok, but special chars must be escaped
    - `echo 'hello $name'` will print literally, not interpreting the variable
    - `echo "hello $name"` will interpret the var and escape characters
    - `echo` (without args) prints an empty line
    - `echo -e \<escaped_sequence>m` - for colors and styles
      - e.g. color `echo -e '\033[34;42mColored Text\033[0m'` - `34` means blue font, `42` means green for background
      - e.g. underline `echo -e '\033[4;31mError\033[0m'` - `4` is underline, `0` at the end resets styles
      - you can use `tput` for a more verbose way of defining styles, e.g. `echo -e $(tput setaf 1)"red string"`
        - `tput sgr0` resets styles


  - Viewing files
    - `more <file>` - browse file page by page
    - `head <file>` - print first lines
    - `tail <file>` - print last lines


  - Expansions
    - brace expansion: `touch file_{0..1000}` creates 1001 files, `echo {1..10..2}` - prints ints from 1 to 10, counting by 2s (1,3,5,7,9)


  - Piping - pipe takes the result of one command and pipes it into another one, e.g. `ls | more` displays list of files with pagination

  - Redirection - `>`, works with `stdin`, `stdout`, and `stderr`. `stdout` and `stderr` can be represented by `1` and `2`,
    - i.e.: `cp -v * ../somefolder 1>../success.txt 2> ../error.txt` copies everything from current dir (with verbosity), but prints `stdout` and `stderr` to files, _not_ to terminal - it's redirecting
    - `1` and `2` can be together represented by `&`
    - redirecting to `/dev/null` trashes the output


  - `grep` - use as `grep <pattern> <file>`, option `-i` makes it case-insensitive


## Scripting

  - start with hashbang aka shebang - `#!/bin/bash` - which specifies the path to bash executable
  - commented lines start with `#`
  - `chmod +x <filename>` to make the script executable
  - assign the result of a command to a variable - `where=$(pwd)`

### Variables

  - `name=Walpurgia`, `town="Little Bindle"`, `len=134` declare a variable
  - `declare -i d=32` marks that variable as an integer
  - `declare -r d=32` marks that variable as read-only
  - `declare -l d=LsadfW # => lsadfw` lowercases
  - `declare -u d=Lssdfw # => LSSDFW` uppercases
  - `$name` calls a variable

#### Special variables

  - `$HOME`, `$PWD`, `$PATH`, `$HOSTNAME`, `$BASH_VERSION`
  - `$MACHTYPE` returns the machine type
  - `$SECONDS` returns no. of seconds the bash session has been running (in script, from when the script started)
  - `$0` returns the name of the script

### Math

  - bash only works with integers, but you can use `bc` program to get floats - `echo 1/3 | bc -l`
  - arithmetic operations must be enclosed as `((expression))`
  - assign to a variable - `four=$((3+1))`
  - Operators:
    - `/`, `*`, `+`, `-`, `%`
    - `**` is exponentiation
    - `++`, `--`, `+=`, `-=`, `*=`, `/=`

### Comparison operations

  - `[[ expression ]]` return `1` or `0`, `0` means success, `1` is failure
  - `[[ $a < $b ]]`, and others: `>`, `>=`, `<=`, `==`, `!=`
  - logic - `[[ $a && $b ]]` and `||`, and `[[ ! $b ]]`
  - `[[ -z $a ]]` - is it null?
  - `[[ -n $a ]]` - is it not null?
  - `[[ $string =~ [<regexp>] ]]` - regex

### String operations

  - concatenation: `$c=$a$b`
  - character count: `${#c}`
  - substring:
    - `d=${c:3}` - `d` is `c` from 3rd char to end
    - `e=${c:3:10}` - chars 3 to 10
  - replace: `${<stringname>/<searchterm>/<replacewith>}`, e.g. `${name/Bogdan/Peter}`
    - to replace all instances double the first `/`
    - replace only if search term is at the beginning - add `#` before search term
    - replace only if at the end - `%` before search term
    - wildcards - `${name/B*/Nikolai}`

### Handy helpers

  - date formatting - `date +"<format string>"`, e.g. `date +"%d, %m, %Y"`
  - `printf -v d` assigns the output to variable `d`
  - `printf` - lets you print out data with a particular format - e.g. `printf "Name:\t%s\nID:\t%04d\n" "Adam" "43"` will print
```
Name:	Adam
ID:	  0043
```

### Arrays

  - `fruits=("banana" "apple"  "pear")`,
    - retrieve: `echo ${fruits[0]}` (whole array - `echo ${fruits[@]}`, last elem. - `echo ${fruits[@]: -1}`)
    - set: `fruits[1]="orange"`
    - push: `fruits+="kiwi"`
    - get length: `echo ${#fruits[@]}`
  - Associative arrays (key-value pairs) - bash version >=4
```bash
declare -A myarray
myarray[color]=blue
myarray["Home Address"]="12 James Street"
echo ${myarray[color]}
```

### Files, but not binaries

  - write to file `echo "Some text" > file.txt`
  - read a file `cat < file.txt`
  - zero out a file `> file.txt`
  - append to file `echo "Some more text" >> file.txt`

### Control structures

  - 'if' statement
```bash
if <expression>
then
      echo "True"
elif <expression 2>; then
      echo "First was false, this is true"
fi
```

  - 'while' loop, can be reversed, as with 'until' instead of while
```bash
while <expression>; do
      # ...
done
```

  - 'for in' and 'for' loops
```bash
for <variable> in <collection>
do
    # ...
done
```
```bash
for (( i=0; i<=10; i++ ))
do
    # ...
done
```
```bash
# with an associative aray:
for key in "${!myarray[@]}"
do
    echo "$key has value ${myarray[$key]}"
done
```
  - case
```bash
a="dog"
case $a in
      cat) echo "Feline";;
      dog|puppy) echo "Canine";;
      *) echo "No match";;
esac
```

### Functions

```bash
function greet {
  echo "Hello, $1"
}
greet Pedro # Hello, Pedro
```

  - `$@` is an array with all arguments

## User input

  - `$1`, `$2`, etc. are arguments passed to the script
  - `$#` contains the number of arguments

### Flags

```bash
# here colons after flags mean we expect the values fo be there, they are not optional
# colon at the beginning of flags list means they can be additional flags, then represented by '?)' in case
while getopts u:p: option
do
  case $option in
    u) user=$OPTARG;;
    p) pass=$OPTARG;;
  esac
done
echo "User: $user, password: $pass"
```

### Input - `read` keyword

```bash
echo "What is your name?"
read name
echo "$name, that's a nice name"
```
  - `read -s password`, `-s` is 'silent' flag
  - in one line: `read -p "Why me?" reason`

### Select

```bash
select animal in "cat" "dog" "bird"
do
  echo "You've selected $animal"
  break
done
```

### Prompting and defaults

```bash
if [ $# -lt 3 ]; then
  echo "This command requires three arguments"
else
  echo "All right, carry on"
fi
```
```bash
read -p "Favourite writer? [Vonnegut] " a
# here we test for not null, but we can test regex or sth else as well
while [[ -z "$a" ]]; do
  a="Vonnegut"
done
echo "$a was selected"
```
