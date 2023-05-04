.686
.model flat, c

public objetosc_stozka

.code
objetosc_stozka PROC
	push ebp
	mov ebp, esp

	push eax
	push ebx
	push ecx

	mov eax, [ebp+8]				; big_r
	mov ebx, [ebp+12]				; small_r
	mov ecx, [ebp+16]				; h

	finit

	fild dword PTR [ebp+8]
	fst st(1)
	fmul st(0), st(1)				; ST(0) := R^2, ST(1) := R
	
	fld dword PTR [ebp+12]
	fmul st(0), st(2)
	fstp st(2)						; ST(0) := rR, ST(1) := R^2
	faddp							; ST(0) := rR + R^2

	fld dword PTR [ebp+12]
	fld dword PTR [ebp+12]
	fmulp
	faddp							; ST(0) := rR + R^2 + r^2

	fld dword PTR [ebp+16]
	fmulp							; ST(0) := h(rR + R^2 + r^2)

	fldpi
	fmulp							; ST(0) := PI h(rR + R^2 + r^2)

	push 3
	fild dword PTR [esp]
	pop eax
	fdivp							; ST(0) := 1/3 * PI h(rR + R^2 + r^2)

	pop ecx
	pop ebx
	pop eax

	pop ebp
	ret
objetosc_stozka ENDP
end