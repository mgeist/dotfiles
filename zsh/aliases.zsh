listdb() {
  psql \
  --no-align --tuples-only --command "SELECT datname FROM pg_database WHERE datistemplate=false" \
  | grep -v "^\\postgres\$"
}

copydb() {
  createdb -O `whoami` -T $1 $2
}

setdb() {
  export DATABASE_URL=postgresql://`whoami`@localhost:5432/$1
}

unsetdb() {
  unset DATABASE_URL
}

whichdb() {
  echo ${DATABASE_URL##*/}
}

getpr() {
  if (( $1 ));
  then
    REMOTE="upstream"
    PR_ID=$1
  else
    REMOTE=$1
    PR_ID=$2
  fi
  git fetch $REMOTE pull/$PR_ID/head
  git checkout -b pr$PR_ID FETCH_HEAD
}

unhookdb() {
  psql -d "$1" -U $USER -c "
    SELECT pg_terminate_backend(pg_stat_activity.pid)
      FROM pg_stat_activity
      WHERE pg_stat_activity.datname = '$1'
      AND pid <> pg_backend_pid();
  "
}
