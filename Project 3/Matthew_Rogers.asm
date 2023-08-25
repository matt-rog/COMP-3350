;Matthew Rogers
;
;Matthew_Rogers.asm
;I used Wikipedia.org to learn how a genetic algorithm works.

;This program add and subtracts 32-bit Integers

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD


.data
    shift dword 2
    input byte 1,3,5,7,9,11,12
    output byte lengthof input dup(?)	
.code
	main proc
		mov EAX, 0
		mov EBX, 0 
		mov ECX, 0 

		mov ECX, LENGTHOF input ;ECX = length of the input array
		sub ECX, shift			; ECX = ECX - shift
		mov ESI, OFFSET input   ; Store address of input in ESI
		mov EDI, OFFSET output	; Store address of output in EDI
		add EDI, shift			; address of EDI + 3
    l1:	
		mov AL, [ESI] ;Move the value from input to al
		mov [EDI], AL ;Move the value from al into output
		add EDI, 1 ;increment EDI
		add ESI, 1 ;increment ESI
    loop l1

		mov ECX, shift ;This loop will iterate 'shift'-times
		mov EDI, OFFSET output ;points back at the first index of output array
    l2:
		mov al, [ESI] ;Move the values from input into al
		mov [EDI], AL ;Move the value from al into output index
		add ESI, 1 ;Increment the input index
		add EDI, 1 ;Increment the output index
	loop l2

INVOKE ExitProcess,0
main ENDP
END main

