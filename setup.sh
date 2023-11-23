#!/bin/zsh

# create files
echo "creating files"
mkdir lib
touch lib/2000.txt lib/2001.txt

for i in $(seq 0 21); do
    if (( i == 19 )); then
        continue
    fi

    local year=$((2002+$i))
    touch lib/${year}a.txt lib/${year}b.txt
done

touch lib/2021falla.txt lib/2021springa.txt lib/2021springa.txt lib/2021springb.txt

# fill files with curl
echo "fetching files from aops website"
lead='https://artofproblemsolving.com/wiki/index.php/'
mid='_AMC_10'
trail='_Answer_Key'
curl "${lead}2000${mid}${trail}" | grep "<li>" > lib/2000.txt
curl "${lead}2001${mid}${trail}" | grep "<li>" > lib/2001.txt

for i in $(seq 0 21); do
    if (( i == 19 )); then
        continue
    fi

    local year=$((2002+$i))
    curl "${lead}${year}${mid}A${trail}" | grep "<li>" > "lib/${year}a.txt"
    curl "${lead}${year}${mid}B${trail}" | grep "<li>" > "lib/${year}b.txt"
done

curl "https://artofproblemsolving.com/wiki/index.php/2021_Fall_AMC_10A_Answer_Key" | grep "<li>" > "lib/2021falla.txt"
curl "https://artofproblemsolving.com/wiki/index.php/2021_Fall_AMC_10B_Answer_Key" | grep "<li>" > "lib/2021fallb.txt"
curl "https://artofproblemsolving.com/wiki/index.php/2021_AMC_10A_Answer_Key" | grep "<li>" > "lib/2021springa.txt"
curl "https://artofproblemsolving.com/wiki/index.php/2021_AMC_10A_Answer_Key" | grep "<li>" > "lib/2021springb.txt"

# delete extra html and only keep the letter answer
echo "filtering files"
sed -i "" "s/				<div id=\"mw-content-text\" lang=\"en\" dir=\"ltr\" class=\"mw-content-ltr\"><div class=\"mw-parser-output\"><ol>//g" "lib/2000.txt"
sed -i "" "s/				<div id=\"mw-content-text\" lang=\"en\" dir=\"ltr\" class=\"mw-content-ltr\"><div class=\"mw-parser-output\"><ol>//g" "lib/2001.txt"
sed -i "" "s/<li>//g" "lib/2000.txt"
sed -i "" "s/<li>//g" "lib/2001.txt"
sed -i "" "s/<\/li>//g" "lib/2000.txt"
sed -i "" "s/<\/li>//g" "lib/2001.txt"
sed -i "" "s/<\/ol>//g" "lib/2000.txt"
sed -i "" "s/<\/ol>//g" "lib/2001.txt"

for i in $(seq 0 21); do
    if (( i == 19 )); then
        continue
    fi

    local year=$((2002+$i))
    sed -i "" "s/				<div id=\"mw-content-text\" lang=\"en\" dir=\"ltr\" class=\"mw-content-ltr\"><div class=\"mw-parser-output\"><ol>//g" "lib/${year}a.txt"
    sed -i "" "s/				<div id=\"mw-content-text\" lang=\"en\" dir=\"ltr\" class=\"mw-content-ltr\"><div class=\"mw-parser-output\"><ol>//g" "lib/${year}b.txt"
    sed -i "" "s/ (Note: This problem was originally stated incorrectly, and all contestants received full credit regardless of their answer.)//g" "lib/${year}a.txt"
    sed -i "" "s/ (Note: This problem was originally stated incorrectly, and all contestants received full credit regardless of their answer.)//g" "lib/${year}b.txt"
    sed -i "" "s/<li>//g" "lib/${year}a.txt"
    sed -i "" "s/<li>//g" "lib/${year}b.txt"
    sed -i "" "s/<\/li>//g" "lib/${year}a.txt"
    sed -i "" "s/<\/li>//g" "lib/${year}b.txt"
    sed -i "" "s/<\/ol>//g" "lib/${year}a.txt"
    sed -i "" "s/<\/ol>//g" "lib/${year}b.txt"
done

sed -i "" "s/				<div id=\"mw-content-text\" lang=\"en\" dir=\"ltr\" class=\"mw-content-ltr\"><div class=\"mw-parser-output\"><ol>//g" "lib/2021falla.txt"
sed -i "" "s/				<div id=\"mw-content-text\" lang=\"en\" dir=\"ltr\" class=\"mw-content-ltr\"><div class=\"mw-parser-output\"><ol>//g" "lib/2021fallb.txt"
sed -i "" "s/				<div id=\"mw-content-text\" lang=\"en\" dir=\"ltr\" class=\"mw-content-ltr\"><div class=\"mw-parser-output\"><ol>//g" "lib/2021springa.txt"
sed -i "" "s/				<div id=\"mw-content-text\" lang=\"en\" dir=\"ltr\" class=\"mw-content-ltr\"><div class=\"mw-parser-output\"><ol>//g" "lib/2021springb.txt"
sed -i "" "s/ (Note: This problem was originally stated incorrectly, and all contestants received full credit regardless of their answer.)//g" "lib/2021falla.txt"
sed -i "" "s/ (Note: This problem was originally stated incorrectly, and all contestants received full credit regardless of their answer.)//g" "lib/2021fallb.txt"
sed -i "" "s/ (Note: This problem was originally stated incorrectly, and all contestants received full credit regardless of their answer.)//g" "lib/2021springa.txt"
sed -i "" "s/ (Note: This problem was originally stated incorrectly, and all contestants received full credit regardless of their answer.)//g" "lib/2021springb.txt"
sed -i "" "s/<li>//g" "lib/2021falla.txt"
sed -i "" "s/<li>//g" "lib/2021fallb.txt"
sed -i "" "s/<li>//g" "lib/2021springa.txt"
sed -i "" "s/<li>//g" "lib/2021springb.txt"
sed -i "" "s/<\/li>//g" "lib/2021falla.txt"
sed -i "" "s/<\/li>//g" "lib/2021fallb.txt"
sed -i "" "s/<\/li>//g" "lib/2021springa.txt"
sed -i "" "s/<\/li>//g" "lib/2021springb.txt"
sed -i "" "s/<\/ol>//g" "lib/2021falla.txt"
sed -i "" "s/<\/ol>//g" "lib/2021fallb.txt"
sed -i "" "s/<\/ol>//g" "lib/2021springa.txt"
sed -i "" "s/<\/ol>//g" "lib/2021springb.txt"
echo "setup complete"
