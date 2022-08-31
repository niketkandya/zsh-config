alias now='date +"%Y-%m-%dT%H:%M:%S"'
alias ist='TZ=Asia/Calcutta date'
alias epoch='date +%s'
alias tsess="tmux display-message -p '#S'"
alias zshenv="vim ~/.zshenv"

SSHOPTS='-o UserKnownHostsFile="/dev/null" -o StrictHostKeyChecking=no -o LogLevel=quiet'

run() {
  sep
  echo "$(now) CMD: $*"
  $*
  sep
}

sep() {
  tput setab 7
  printf "%*s" $( tput cols ) ""
  tput setab 0
  echo
}

join_by() {
  local delim=$1
  shift
  echo -n "$1"
  shift
  printf "%s" "${@/#/$delim}"
}

colist() {
  local list=$1
  run join_by "," "${list}"
}

swap () {
        local TMPFILE=tmp.$$
        mv "$1" $TMPFILE && mv "$2" "$1" && mv $TMPFILE "$2"
}

### HOSTS ###
hostsfile () {
        local filename="$HOME/tmp/$(tsess)-hosts.txt"
        if [ ! -f $filename ]
        then
                cp $(ls -1 $HOME/tmp/*hosts.txt | head -n 1) $filename
        fi
        echo $filename
}

_hosts () {
        local def=$(hostsfile)
        local filename=${1:-def}
        touch $filename
        cat $filename
}

#ADD
_addhost() {
        local filename=${1:-$(hostsfile)}
        touch $filename
        echo $2 >> $filename
}

#DEL
_delhost() {
        local filename=${1:-$(hostsfile)}
        local temp=$(tempfile)
        local host=$2

        sed "/^$host/d" $filename > $temp
        mv $temp $filename
}

#CLEAR
_clhosts() {
        local filename=${1:-$(hostsfile)}
        touch $filename
        truncate -s 0 $filename
}

pssh() {
    my_ssh_cmd parallel-ssh -i -l root -h $(hostsfile) -x $SSHOPTS  $@
}

pscp() {
    my_ssh_cmd parallel-rsync -v -a -z -l root -h $(hostsfile) -x $SSHOPTS $@
}


swaphfiles () {
        touch $(hostsfile).backup
        swap $(hostsfile) $(hostsfile).backup
}

source ~/.googleenv
