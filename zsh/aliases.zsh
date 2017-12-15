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

