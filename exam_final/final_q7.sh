#! /bin/dash

filename=$1

for d in "$@"
do
    if  echo $d | grep -qE ".*\.{1}.*"
    then
        echo "# $d already has an extension"
    fi
    
    
    if cat "$d" | head -n 1 | grep -vEq "^#!.*"
    then
        echo "# $d does not have a #! line"
    elif cat "$d" | head -n 1 | grep -vEq "^#!.*(perl|python|sh).*"
    then
        echo "# $d no extension for #! line"
    else
        # If Perl 
        if cat "$d" | head -n 1 | grep -Eq "^#!.*perl.*"
        then
            # CHECK IF EXIST
            if [ -e "$d.pl" ]
            then
                echo "# $d.pl already exists"
            else
                echo "mv $d $d.pl"
            fi
        fi
        # If python
        if cat "$d" | head -n 1 | grep -Eq "^#!.*python.*"
        then
            # CHECK IF EXIST
            if [ -e "$d.py" ]
            then
                echo "# $d.py already exists"
            else
                echo "mv $d $d.py"
            fi
        fi
        # If sh 
        if cat "$d" | head -n 1 | grep -Eq "^#!.*sh.*"
        then
            # CHECK IF EXIST
            if [ -e "$d.sh" ]
            then
                echo "# $d.sh already exists"
            else
                echo "mv $d $d.sh"
            fi
        fi
    
    fi
    
    
done
