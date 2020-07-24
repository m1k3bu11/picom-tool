# picom-tool
Auto configure transparent windows using xprop. 

This is a very simple bash script that will run xprop, gather the window information, then write to picom.conf. If the window you click is not in picom.conf it will add a value for focused and unfocused which can be configured by editing the variables in the script. If the window is already transparent, it will change picom to make it non transparent. This happens on the fly, so if you quickly want to make firefox transparent or vice versa this will do that for you. 

Dependencies: xprop (install xorg-xprop in Arch), sponge (found in moreutils in Arch), and obviously picom. You will also need to edit your picom.conf to match the formating found here:
opacity-rule = [ 
	"100:class_g = 'vlc' && focused",
	"100:class_g = 'vlc' && !focused",
	"100:class_g = 'firefox' && focused",
	"100:class_g = 'firefox' && !focused",
	"80:class_g = '' && focused",
	"70:class_g = '' && !focused",
	"80:class_g = '' && focused",
	"70:class_g = '' && !focused",
	"80:class_g = '' && focused",
	"70:class_g = '' && !focused",
	"80:class_g = 'Termite' && focused", 
	"60:class_g = 'Termite' && !focused",
];
Notice the focused then unfocused lines and the tabs before the lines.

If you wish to bind this to a key in i3 use this format in i3's config file:
bindsym --release $mod+t exec --no-startup-id notify-send "$(bash ~/.config/picom-tool.sh)"

If your picom.conf file is not located in ~/.config/ you will have to edit the bash script variable mydir. Transfoc and transunfoc variables are the values for the transparency for focused and not focused windows and can be changed. 
