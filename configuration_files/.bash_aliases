alias n3="sudo vpnc RedCentric_N3.conf"
alias leicester="sudo vpnc iomart_leicester.conf"
alias nottingham="sudo vpnc iomart_nottingham.conf"
alias greggs="/usr/local/bin/greggs.sh &"
alias web_greggs="google-chrome https://remoteportal.co.uk/login/web_console#"

# All vpnc sessions are called as root, need to use sudo to close them also.
alias vpncd="sudo /usr/sbin/vpnc-disconnect"


# SonicWall NetExtender CLI
alias centiq='echo y | netExtender -u ssleaford  -p FatElvis1977! -d INT 164.40.215.6:6443'


# NHS Highland remote desktop server
alias highland='rdesktop 10.250.129.251 -g 1280x800 -u centiq01 -d nhsh -p C0nquerer' 

# NHS Golden Jubilee remote desktop server
alias golden_jubilee='rdesktop 10.248.94.77 -g 1280x800 -u centiqadm -d nwtc -p C3nt1qadm1n!'

# NHS Lanarkshire sclamgmt1
alias lanarkshire='rdesktop sclamgmt1 -g 1280x800 -u centiq -p Cahth01'

# NHS Lanarkshire sclamgmt2
alias lanarkshire2='rdesktop sclamgmt2 -g 1280x800 -u centiq -p CenSup01'

# NHS Lanarkshire HRM-Vcenter
alias hrm_vcenter='rdesktop hrm-vcenter -g 1280x800 -u centiq -p CenSup01'

# NHS Lanarkshire GJH-Vcenter
alias gjh_vcenter='rdesktop gjh-vcenter -g 1280x800 -u centiq -p CenSup01'
# NHS GGC CRIS remote desktop server

alias ggc_cris='rdesktop 10.241.8.27 -g 1024x768 -u hssadmin -p criscr15'

# Remmon01 using admin switch
alias remmon01='rdesktop -0 remmon01 -g 1280x800 &'

alias remmon02='ssh simon@remmon02 -Y'



# NHS Grampian scgrmgmt1
alias grampian='rdesktop 10.251.17.54 -g 1280x800 -u centiq -d nhsg -p Ch10gra!'
