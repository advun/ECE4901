#Psudocode:

      #function sum(integer array a[], integer n){
  		#sum = 0;
  		#i = 0;
      #while (i<n){
   			#sum = sum + a[i];
   			#i = i+1;}
   		#Return sum; }

#$a0 = $a[], $a1 = n

	 addi $sp, $sp, -8 # make room for two items
	 sw $s1, 4($sp) # save register $s1
	 sw $s0, 0($sp) # save register $s0

# $s0 = sum, $s1 = i

	 add $s1, $zero, $zero #initialize i = 0
	 add $s0, $zero, $zero #initialize sum = 0


Loop: 	 add $t1, $s1, $s1 # $t1 = 2i
 	 add $t1, $t1, $t1 # $t1 = 4i
 	 add $t1, $t1, $a0 # $t1 = &a[i]
 	 lw $t0, 0($t1) # $t0 = a[i]

      	 add $s0, $s0, $t0  #sum = sum + a[i]
 	 addi $s1, $s1, 1 #i += 1
 
   	 slt $t0, $s1, $a1  #check if i < n, return 1 if true
   	 beq $t0, $zero, Exit #exit loop when i>=n
	 j Loop #else, jump to loop
     
Exit:
         add $v0, $s0, $zero  #set $v0 = sum
	 
	 lw $s1, 4($sp) # load original register $s1
   	 lw $s0, 0($sp) # load original register $s0
	 addi $sp, $sp, 8 #delete 2 items

	 jr $ra #return to caller
