.data
	m:.space 4		# Numar linii
	n:.space 4		# Numar coloane
	p:.space 4		# Numar perechi
	
	lineIndex:.space 4
	colIndex:.space 4   
	kIndex:.space 4
	matrix:.zero 1600
	matrix1:.zero 1600       
	
	k:.space 4		# Numar iteratii
	x:.space 4		# Linie element
	y:.space 4		# Coloana element
	cnt:.space 4
	val:.space 4	 #<----------------
	val1:.space 4		# Valori folosite de regula pentru "cmp"
	val2:.space 4       #<----------------
	cn:.space 4		# Copie modificata a lui n
	fp:.space 4
	
	formatScanf:.asciz "%d"
	formatPrintf:.asciz "%d "
	endl:.asciz "\n"
	mode_r:.asciz "r"
         read:.asciz "in.txt"
         write:.asciz "out.txt"
         mode_w:.asciz "w"
.text
.global main

main:

	push $mode_r
	push $read
	call fopen			#DESCHIDERE FISIER
	addl $8, %esp
	
	movl %eax , fp
	
	
	movl $0, kIndex		# initializare "kIndex" cu 0
	
	push $m
	push $formatScanf
	push fp
	call fscanf
	add $12, %esp
	
	push $n
	push $formatScanf
	push fp
	call fscanf
	add $12, %esp
	
	push $p
	push $formatScanf
	push fp
	call fscanf
	add $12, %esp
	
	
	mov n , %eax			#prelucrare n pentru a ma afla in interiorul matricei extinse
	movl %eax, cn
	addl $2, cn
	
	movl $matrix, %edi
	mov $0,%ecx	
for_p:
	cmp p,%ecx
	je citire_k
	
	push %ecx
	
	push $x
	push $formatScanf
	push fp
	call fscanf
	add $12, %esp
	
	push $y
	push $formatScanf
	push fp
	call fscanf
	add $12, %esp
	
	pop %ecx
	
	incl x
	incl y
	
	movl x, %eax
	mull cn
	addl y, %eax
	
	movl $1, (%edi,%eax,4)
	inc %ecx
	jmp for_p
	
citire_k:
	push $k
	push $formatScanf
	push fp
	call fscanf
	add $12, %esp
	
	push fp
	call fclose
	add $4, %esp
	
	push $mode_w
	push $write
	call fopen			#DESCHIDERE FISIER afisare
	addl $8, %esp
	
	movl %eax , fp
	jmp et_for_k
	
	
cont_for_lines:
	push $endl
	push fp			
	call fprintf
	add $8, %esp
	
	incl lineIndex
	jmp for_lines
	
et_afis:
	movl $matrix, %edi
	movl $1,  lineIndex
	for_lines:
		
		mov lineIndex, %ecx
		cmp m, %ecx
		jg et_exit
		movl $1, colIndex
		
		for_col:
			
			mov colIndex, %ecx
			cmp n, %ecx
			jg cont_for_lines
			
			movl lineIndex, %eax
			mull cn
			add colIndex, %eax
			incl colIndex
			
			movl (%edi,%eax,4), %ebx
			
			push %ebx
			push $formatPrintf
			push fp
			call fprintf
			add $12, %esp
			
			jmp for_col
			

				EVOLUTIA_CELULELOR:
	
cont_for:
	incl lineIndex
	jmp for_lines1
	
cont_for_k:
	incl kIndex
	jmp et_for_k
	
et_for_k:
	movl kIndex , %ecx
	cmp k, %ecx
	je et_afis
        		
et_parcurgere:      
		movl $1, lineIndex
	for_lines1:
		mov lineIndex, %ecx
		cmp m , %ecx
		jg et_interschimbare
		movl $1, colIndex
		
		for_col1:
			mov colIndex, %ecx
			cmp n , %ecx
			jg cont_for
			
			movl $0, %eax			# initializare val1 (care va selecta pe rand celulele 
			addl cn, %eax			# din jur)ul celulei curente)
			movl %eax ,val1
			
			movl lineIndex, %eax
			mull cn
			addl colIndex, %eax
			incl colIndex
			
			movl $0 , cnt
			movl $0, val
			
			caz_0:
			mov %eax, %edx
			inc %edx			#dreapta
			movl (%edi,%edx,4), %ebx
			cmp %ebx , val
			je caz_1
			incl cnt
			
			caz_1:
			mov %eax, %edx
			dec %edx		#staga
			movl (%edi,%edx,4), %ebx
			cmp %ebx, val
			je caz_2
			incl cnt
			
			caz_2:
			mov %eax, %edx
			addl val1, %edx		#jos
			movl (%edi,%edx,4), %ebx
			cmp %ebx, val
			je caz_3
			incl cnt
			
			caz_3:

			mov %eax, %edx
			subl val1, %edx		#sus
			movl (%edi,%edx,4), %ebx
			cmp %ebx, val
			je caz_4
			incl cnt
			
			caz_4:
			incl val1
			mov %eax, %edx
			addl val1, %edx		#diag dreapta jos
			movl (%edi,%edx,4), %ebx
			cmp %ebx, val
			je caz_5
			incl cnt
			
			caz_5:
			mov %eax, %edx
			subl val1, %edx		#diag stanga sus
			movl (%edi,%edx,4) ,%ebx
			cmp %ebx, val
			je caz_6
			incl cnt
			
			caz_6:
			decl val1
			decl val1
			mov %eax, %edx
			addl val1,%edx		#diag stanga jos
			movl (%edi,%edx,4) ,%ebx
			cmp %ebx, val
			je caz_7
			incl cnt
			
			caz_7:
			mov %eax, %edx
			subl val1, %edx		#diag dreapta sus
			movl (%edi,%edx,4), %ebx
			cmp %ebx, val
			je et_schimbare
			incl cnt
			

		et_schimbare:
			
			mov %eax, %ecx
			movl (%edi,%eax,4), %ebx
			movl cnt , %eax			# cnt in %eax
			
			movl $0, val
			movl $0, %edx
			cmp %ebx , val
			je caz_schimbare_2
			
			movl $2 , %edx
			cmp %edx, %eax
			je adaugare_1
			
			movl $3 , %edx
			cmp %edx, %eax
			je adaugare_1
			
			lea matrix1, %edi
			movl $0,(%edi,%ecx,4)
			lea matrix, %edi
		
			jmp for_col1
			
		caz_schimbare_2:
		
			movl $3, %edx
			cmp %edx , %eax
			jne for_col1
			
		adaugare_1:
			lea matrix1,%edi
			movl $1,(%edi,%ecx,4)
			lea matrix, %edi
			
		 jmp for_col1
	
	
cont_for2:
	incl lineIndex
	jmp for_lines2
		 	
et_interschimbare:

	movl $1,  lineIndex
	for_lines2:
		
		mov lineIndex, %ecx
		cmp m, %ecx
		jg cont_for_k
		movl $1, colIndex
		
		for_col2:
			
			mov colIndex, %ecx
			cmp n, %ecx
			jg cont_for2
			
			movl lineIndex, %eax
			mull cn
			add colIndex, %eax
			incl colIndex
			
			lea matrix1, %edi
			movl (%edi,%eax,4), %ebx
			lea matrix, %edi
			movl %ebx, (%edi,%eax,4)
			
			jmp for_col2
	
et_exit:
	push $endl
	push fp			
	call fprintf
	add $8, %esp
	
	push fp
	call fclose
	add $4, %esp
	
	pushl $0
	call fflush
	addl $4, %esp
	
	mov $1,%eax
	mov $0,%ebx
	int $0x80
