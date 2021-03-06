#!/usr/bin/env bash

if [ -e /tmp/my_taskid ]
then

  id=$(cat /tmp/my_taskid)

  if [ $id = '-' ]
  then
    info=$(cat /tmp/my_task_info)
    if [ $(timew get dom.active) -eq 0 ]
    then
      dunstify "start clock"
      timew start "$info"
    else
      dunstify "stop clock"
      timew stop "$info"
    fi
  else
    if [ $(timew get dom.active) -eq 0 ]
    then
      dunstify "start clock"
      task $id start
    else
      dunstify "stop clock"
      task $id stop
    fi
  fi

else

  if [ $(timew get dom.active) -eq 0 ]
  then
    dunstify "start clock"
    timew start "Performe miscellania activity"
  else
    dunstify "stop clock"
    timew stop "Performe miscellania activity"
  fi

fi
