#!/bin/bash
myvar=$(xprop | grep WM_CLASS | awk '{print $4}' | cut -d '"' -f 2)
mydir=~/.config/
myfile=picom.conf
fullpath=$mydir$myfile
transfoc=80
transunfoc=70

if grep -q $myvar "$fullpath" 
then
	if grep $myvar "$fullpath" | grep 100
	then 
		a="$(grep -n $myvar "$fullpath" | awk '{print $1}' | cut -d ':' -f 1)"
		a_array=($a)
		a1="${a_array[0]}s"
		a2="${a_array[1]}s"
		sed -i "$a1/100/$transfoc/" $fullpath
		sed -i "$a2/100/$transunfoc/" $fullpath
	else
		a="$(grep -n $myvar "$fullpath" | awk '{print $1}' | cut -d ':' -f 1)"
		a_array=($a)
		a1="${a_array[0]}s"
		a2="${a_array[1]}s"
		sed -i "$a1/$transfoc/100/" $fullpath
		sed -i "$a2/$transunfoc/100/" $fullpath

	fi
else
	awk -v transunfoc="\t\"$transunfoc" -v  myvar="\'$myvar\'" -v class=":class_g = " -v anded=" && !focused\"," '/opacity-rule/ { print; print transunfoc class myvar anded; next }1' $fullpath | sponge $fullpath
	awk -v transfoc="\t\"$transfoc" -v  myvar="\'$myvar\'" -v class=":class_g = " -v anded=" && focused\"," '/opacity-rule/ { print; print transfoc class myvar anded; next }1' $fullpath | sponge $fullpath
	
fi
exit

