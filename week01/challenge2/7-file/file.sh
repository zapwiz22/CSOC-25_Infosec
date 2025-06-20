sh FILE
# This is a shell archive (produced by GNU sharutils 4.15.2).
# To extract the files from this archive, save it to some FILE, remove
# everything before the '#!/bin/sh' line above, then type 'sh FILE'.
#
lock_dir=_sh00046
# Made on 2023-03-16 01:40 UTC by <root@e076735df429>.
# Source directory was '/app'.
#
# Existing files will *not* be overwritten, unless '-c' is specified.
#
# This shar contains:
# length mode       name
# ------ ---------- ------------------------------------------
#   1092 -rw-r--r-- flag
#
MD5SUM=${MD5SUM-md5sum}
f=$(${MD5SUM} --version | egrep '^md5sum .*(core|text)utils')
test -n "${f}" && md5check=true || md5check=false
${md5check} ||
  echo 'Note: not verifying md5sums.  Consider installing GNU coreutils.'
if test "X$1" = "X-c"; then
  keep_file=''
else
  keep_file=true
fi
echo=echo
save_IFS="${IFS}"
IFS="${IFS}:"
gettext_dir=
locale_dir=
set_echo=false

for dir in $PATH; do
  if test -f $dir/gettext &&
    ($dir/gettext --version >/dev/null 2>&1); then
    case $($dir/gettext --version 2>&1 | sed 1q) in
    *GNU*)
      gettext_dir=$dir
      set_echo=true
      break
      ;;
    esac
  fi
done

if ${set_echo}; then
  set_echo=false
  for dir in $PATH; do
    if test -f $dir/shar &&
      ($dir/shar --print-text-domain-dir >/dev/null 2>&1); then
      locale_dir=$($dir/shar --print-text-domain-dir)
      set_echo=true
      break
    fi
  done

  if ${set_echo}; then
    TEXTDOMAINDIR=$locale_dir
    export TEXTDOMAINDIR
    TEXTDOMAIN=sharutils
    export TEXTDOMAIN
    echo="$gettext_dir/gettext -s"
  fi
fi
IFS="$save_IFS"
if (
  echo "testing\c"
  echo 1,2,3
) | grep c >/dev/null; then
  if (
    echo -n test
    echo 1,2,3
  ) | grep n >/dev/null; then
    shar_n= shar_c='
'
  else shar_n=-n shar_c=; fi
else shar_n= shar_c='\c'; fi
f=shar-touch.$$
st1=200112312359.59
st2=123123592001.59
st2tr=123123592001.5 # old SysV 14-char limit
st3=1231235901

if touch -am -t ${st1} ${f} >/dev/null 2>&1 &&
  test ! -f ${st1} && test -f ${f}; then
  shar_touch='touch -am -t $1$2$3$4$5$6.$7 "$8"'

elif touch -am ${st2} ${f} >/dev/null 2>&1 &&
  test ! -f ${st2} && test ! -f ${st2tr} && test -f ${f}; then
  shar_touch='touch -am $3$4$5$6$1$2.$7 "$8"'

elif touch -am ${st3} ${f} >/dev/null 2>&1 &&
  test ! -f ${st3} && test -f ${f}; then
  shar_touch='touch -am $3$4$5$6$2 "$8"'

else
  shar_touch=:
  echo
  ${echo} 'WARNING: not restoring timestamps.  Consider getting and
installing GNU '\''touch'\'', distributed in GNU coreutils...'
  echo
fi
rm -f ${st1} ${st2} ${st2tr} ${st3} ${f}
#
if test ! -d ${lock_dir}; then
  :
else
  ${echo} "lock directory ${lock_dir} exists"
  exit 1
fi
if mkdir ${lock_dir}; then
  ${echo} "x - created lock directory ${lock_dir}."
else
  ${echo} "x - failed to create lock directory ${lock_dir}."
  exit 1
fi
# ============= flag ==============
if test -n "${keep_file}" && test -f 'flag'; then
  ${echo} "x - SKIPPING flag (file already exists)"

else
  ${echo} "x - extracting flag (text)"
  sed 's/^X//' <<'SHAR_EOF' | uudecode &&
begin 600 flag
M(3QA<F-H/@IF;&%G+R`@("`@("`@("`@,"`@("`@("`@("`@,"`@("`@,"`@
M("`@-C0T("`@("`Q,#(T("`@("`@8`K'<>H`.Y*D@0`````!````$F2#<P4`
M``#^`69L86<``$)::#DQ05DF4UF(WJSO```@____Y)U_U<SW/^OTZ?'U_=L^
M[6U=O_O(8_WQ_?;^]R_>L[`!&U8(`T&F0VH`T&@:```#0!IH``&@'J:#1HT`
M]"`!H-``!M0;4VH>IM3,:FH@T:&(#3)B:`T,F@:-!IDTT-&AHP3(&@T-,0T&
M(&0Q#1IH/2`,(-H1H`R9`%4T3)H>D:`TR9&AHT`R!H&09#",0``8C0#$,@,@
MR8F@`TT:!H:!D8C0`0`@`"01`H!^_$QU,`V*$A`!6'F(]N[-;FC]^&3PR1#9
MPR,KRW><F<49%$Q!!N[Y?=40;N##KW4D[`_\>RXRA?-VG(E/=DW&Q`:DU8G>
MMFW,-D>1C@-1P&"MR*[TX&O7KM9]S5=DU0VC=9?.T'0?DVD+/#[?',M)']85
M*8@&IZ7%1U*=`[3V(?.C;*QER!+T,)6UYG?BLMV7!\L\;3$+^W%89SR(9RO(
M>+3K'>QL]21+'O&!V`_:4<<C7R!.D'BG?GI\GT1*W#AC625`V>W`87AZF@[I
M:]!!QL1^'NUJ#8O\=0A54@29A#E-6B(?TR(09S3_#,Z0H'SQBO?]^LMC2G$!
MA!19*?93"DWLZ`^I!$.L*!%ILMU#!AJ3SP_!>:^5PJIFC)-,*5ERC!7="@"$
M,$;I*<PV8-8[\ORRQ:K_%W)%.%"0B-ZL[\=Q``````````````$`````````
M"P``````5%)!24Q%4B$A(0``````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
,````````````````
`
end
SHAR_EOF
    (
      set 20 23 03 16 01 40 19 'flag'
      eval "${shar_touch}"
    ) &&
    chmod 0644 'flag'
  if test $? -ne 0; then
    ${echo} "restore of flag failed"
  fi
  if ${md5check}; then
    (
      ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'flag': 'MD5 check failed'
    ) <<\SHAR_EOF
0838b0ca0f0415b3cb6f24da377204de  flag
SHAR_EOF

  else
    test $(LC_ALL=C wc -c <'flag') -ne 1092 &&
      ${echo} "restoration warning:  size of 'flag' is not 1092"
  fi
fi
if rm -fr ${lock_dir}; then
  ${echo} "x - removed lock directory ${lock_dir}."
else
  ${echo} "x - failed to remove lock directory ${lock_dir}."
  exit 1
fi
exit 0
