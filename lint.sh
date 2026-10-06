terraform fmt -recursive
find . -name "*.md" -exec perl -pi -e '
s/\| -/\|--/g;
s/- \|/--|/g;
s/\| :-/\|:--/g;
s/-: \|/--:|/g;
' {} +
yamllint .
