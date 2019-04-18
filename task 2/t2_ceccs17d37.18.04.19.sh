
#!/bin/sh
pdftotext -nopgbrk s1_result1.pdf
grep --no-group-separator -A3 'CHN17CS' s1_result1.txt | tr '\n' ' ' | sed 's/\ CHN/\nCHN/g' > s1_result.txt
sed -i 's/(O)/ 10  /g' s1_result.txt
sed -i 's/(A+)/ 9  /g' s1_result.txt
sed -i 's/(A)/ 8.5  /g' s1_result.txt
sed -i 's/(B+)/ 8  /g' s1_result.txt
sed -i 's/(B)/ 7  /g' s1_result.txt
sed -i 's/(C)/  6  /g' s1_result.txt
sed -i 's/(P)/  5  /g' s1_result.txt
sed -i 's/(F)/  0  /g' s1_result.txt
sed -i 's/(FE)/  0  /g' s1_result.txt
sed -i 's/(I)/ 0 /g' s1_result.txt
awk '{s=$3*4+$6*4+$9*4+$12*3+$15*3+$18*3+$21*1+$24*1+$27*1}{r=s/24}{print r}' s1_result.txt >s1_sgpa.txt
awk '{print $1}' s1_result.txt >s1_reg.txt
paste -d ' \t ' s1_reg.txt s1_sgpa.txt >s1_res.txt
awk 'NR==FNR {seen[$3]=1; next} seen[$1]==1 {seen[$2]++; print $2}' s4d.txt s1_res.txt >s1_ssgpa.txt
awk '{print $3}' s4d.txt >s1_reg1.txt
paste -d ' \t ' s1_reg1.txt s1_sgpa.txt >s1_final.txt
pdftotext -nopgbrk s2_result2.pdf
grep --no-group-separator -A3 'CHN17CS' s2_result2.txt | tr '\n' ' ' | sed 's/\ CHN/\nCHN/g' > s2_result.txt
sed -i 's/(O)/ 10  /g' s2_result.txt
sed -i 's/(A+)/  9  /g' s2_result.txt
sed -i 's/(A)/  8.5  /g' s2_result.txt
sed -i 's/(B+)/  8  /g' s2_result.txt
sed -i 's/(B)/  7  /g' s2_result.txt
sed -i 's/(C)/  6  /g' s2_result.txt
sed -i 's/(P)/  5  /g' s2_result.txt
sed -i 's/(F)/  0  /g' s2_result.txt
sed -i 's/(FE)/  0  /g' s2_result.txt
sed -i 's/(I)/ 0 /g' s2_result.txt
awk '{s=$3*4+$6*3+$9*3+$12*1+$15*1+$18*4+$21*3+$24*3+$27*1}{r=s/23}{print r}' s2_result.txt >s2_sgpa.txt
awk '{print $1}' s2_result.txt >s2_reg2.txt
paste -d ' \t ' s2_reg2.txt s2_sgpa.txt >result.txt
awk 'NR==FNR {seen[$3]=1; next} seen[$1]==1 {seen[$2]++; print $2}' s4d.txt result.txt >s2_ssgpa.txt
awk '{print $3}' s4d.txt >s2_reg1.txt
paste -d ' \t ' s1_reg1.txt s2_ssgpa.txt >s2_final.txt
paste -d ' \t ' s1_final.txt s2_ssgpa.txt >s1_s2_result.txt
awk '{s=$2+$3}{r=s/2}{print r}' s1_s2_result.txt >cgpa.txt
paste -d ' \t ' s1_reg1.txt cgpa.txt >final_cgpa.txt
awk '{print $4}' s4d.txt >name.txt
echo "Reg no.  Name  s1_sgpa  s2_sgpa  Final_cgpa"
paste -d ' \t  \t ' reg1.txt name.txt >abc.txt
paste -d ' \t  \t ' A.txt s1_sgpa.txt >def.txt
paste -d ' \t  \t ' B.txt s2_sgpa.txt >ghi.txt
paste -d ' \t  \t ' C.txt cgpa.txt >s4dfinal.txt
echo
cat s4d_final.txt
