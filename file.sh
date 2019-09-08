for Y in {2019..2019}
do
  mkdir $Y
  for M in {01..01}
  do
    cd $Y
    mkdir $M
    cd ../
    for D in {20..20}
    do
      cd $Y/$M
      mkdir $D
      cd $D
      echo "Committed on $M/$D/$Y" > commit.md
      cd ../../../
      export GIT_COMMITTER_DATE="$Y-$M-$D 12:00:00"
      export GIT_AUTHOR_DATE="$Y-$M-$D 12:00:00"
      git add $Y/$M/$D/commit.md -f
      git commit --date="$Y-$M-$D 12:00:00" -m "$M $D $Y"
      git push origin master
    done
  done
done