if test $# -eq 1
then
  PARENT_BRANCH="master"
  NEW_BRANCH=$1
elif test $# -eq 2
then
  NEW_BRANCH=$1
  PARENT_BRANCH=$2
else
  echo "You must specify at least the name of the new branch" ;
  exit 0 
  #not enough parameters
fi

echo "### Creating branch $NEW_BRANCH from $PARENT_BRANCH" ;

git fetch origin

git branch $NEW_BRANCH origin/$PARENT_BRANCH

git push -u origin $NEW_BRANCH

git checkout $NEW_BRANCH
