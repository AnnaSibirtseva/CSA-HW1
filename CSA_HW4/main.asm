default rel

global InputFromFileFish: function
global InputRandomFish: function
global OutputFish: function
global InputFromFileBeast: function
global InputRandomBeast: function
global OutputBeast: function
global InputFromFileBird: function
global InputRandomBird: function
global OutputBird: function
global Quotient: function
global InputFromFileAnimal: function
global InputRandomAnimal: function
global OutputAnimal: function
global CreateContainer: function
global InputFromFile: function
global InputRandom: function
global Output: function
global BinarySearch: function
global SortContainerDataWithInsertionSort: function
global IncorrectCommand: function
global IncorrectContainerSize: function
global Started: function
global Finished: function
global Filled: function
global Sorted: function
global Printed: function
global main: function

extern strcmp
extern fopen
extern clock
extern exit
extern strlen
extern rand
extern __mingw_vfprintf
extern __mingw_vfscanf
extern ___chkstk_ms
extern __main
extern __imp_toupper
extern __imp___acrt_iob_func


SECTION .text   align=16 execute

.text:  ; Local function
fscanf: push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     qword [rbp+10H], rcx
        mov     qword [rbp+18H], rdx
        mov     qword [rbp+20H], r8
        mov     qword [rbp+28H], r9
        lea     rax, [rbp+20H]
        mov     qword [rbp-10H], rax
        mov     rdx, qword [rbp-10H]
        mov     rax, qword [rbp+18H]
        mov     r8, rdx
        mov     rdx, rax
        mov     rcx, qword [rbp+10H]
        call    __mingw_vfscanf
        mov     dword [rbp-4H], eax
        mov     eax, dword [rbp-4H]
        leave
        ret

fprintf:; Local function
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     qword [rbp+10H], rcx
        mov     qword [rbp+18H], rdx
        mov     qword [rbp+20H], r8
        mov     qword [rbp+28H], r9
        lea     rax, [rbp+20H]
        mov     qword [rbp-10H], rax
        mov     rdx, qword [rbp-10H]
        mov     rax, qword [rbp+18H]
        mov     r8, rdx
        mov     rdx, rax
        mov     rcx, qword [rbp+10H]
        call    __mingw_vfprintf
        mov     dword [rbp-4H], eax
        mov     eax, dword [rbp-4H]
        leave
        ret

printf: ; Local function
        push    rbp
        mov     rbp, rsp
        push    rbx
        sub     rsp, 56
        mov     qword [rbp+10H], rcx
        mov     qword [rbp+18H], rdx
        mov     qword [rbp+20H], r8
        mov     qword [rbp+28H], r9
        lea     rax, [rbp+18H]
        mov     qword [rbp-20H], rax
        mov     rbx, qword [rbp-20H]
        mov     ecx, 1
        mov     rax, qword [rel __imp___acrt_iob_func]
        call    rax
        mov     r8, rbx
        mov     rdx, qword [rbp+10H]
        mov     rcx, rax
        call    __mingw_vfprintf
        mov     dword [rbp-14H], eax
        mov     eax, dword [rbp-14H]
        mov     rbx, qword [rbp-8H]
        leave
        ret

;------------------------------------------------------------------------------
; --------------------------------- FISH --------------------------------------
;------------------------------------------------------------------------------

; Implementation of the method to filling parameters from file for fish.
InputFromFileFish:; Function begin
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     qword [rbp+10H], rcx
        mov     qword [rbp+18H], rdx
        mov     dword [rbp-4H], 1
        lea     rdx, [rbp-4H]
        mov     rax, qword [rbp+18H]
        mov     r8, rdx
        lea     rdx, [rel ?_091]
        mov     rcx, rax
        call    fscanf
        mov     eax, dword [rbp-4H]
        cmp     eax, 5
        ja      ?_006
        mov     eax, eax
        lea     rdx, [rax*4]
        lea     rax, [rel ?_093]
        mov     eax, dword [rdx+rax]
        cdqe
        lea     rdx, [rel ?_093]
        add     rax, rdx
        jmp     rax

?_001:  mov     rax, qword [rbp+10H]
        mov     dword [rax], 0
        jmp     ?_007

?_002:  mov     rax, qword [rbp+10H]
        mov     dword [rax], 1
        jmp     ?_007

?_003:  mov     rax, qword [rbp+10H]
        mov     dword [rax], 2
        jmp     ?_007

?_004:  mov     rax, qword [rbp+10H]
        mov     dword [rax], 3
        jmp     ?_007

?_005:  mov     rax, qword [rbp+10H]
        mov     dword [rax], 4
        jmp     ?_007

?_006:  mov     rax, qword [rbp+10H]
        mov     dword [rax], 4
        lea     rax, [rel ?_092]
        mov     rcx, rax
        call    printf
        nop
?_007:  nop
        leave
        ret
; InputFromFileFish End of function

; Implementation of the method to filling parameters with random numbers for fish.
InputRandomFish:; Function begin
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     qword [rbp+10H], rcx
        call    rand
        movsxd  rdx, eax
        imul    rdx, rdx, 1717986919
        shr     rdx, 32
        sar     edx, 1
        mov     ecx, eax
        sar     ecx, 31
        sub     edx, ecx
        mov     ecx, edx
        shl     ecx, 2
        add     ecx, edx
        sub     eax, ecx
        mov     edx, eax
        lea     eax, [rdx+1H]
        mov     dword [rbp-4H], eax
        cmp     dword [rbp-4H], 4
        jz      ?_011
        cmp     dword [rbp-4H], 4
        jg      ?_012
        cmp     dword [rbp-4H], 3
        jz      ?_010
        cmp     dword [rbp-4H], 3
        jg      ?_012
        cmp     dword [rbp-4H], 1
        jz      ?_008
        cmp     dword [rbp-4H], 2
        jz      ?_009
        jmp     ?_012

?_008:  mov     rax, qword [rbp+10H]
        mov     dword [rax], 0
        jmp     ?_013

?_009:  mov     rax, qword [rbp+10H]
        mov     dword [rax], 1
        jmp     ?_013

?_010:  mov     rax, qword [rbp+10H]
        mov     dword [rax], 2
        jmp     ?_013

?_011:  mov     rax, qword [rbp+10H]
        mov     dword [rax], 3
        jmp     ?_013

?_012:  mov     rax, qword [rbp+10H]
        mov     dword [rax], 4
        nop
?_013:  nop
        leave
        ret
; InputRandomFish End of function

; Implementation of the method for printing information about fish.
OutputFish:; Function begin
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     qword [rbp+10H], rcx
        mov     qword [rbp+18H], rdx
        mov     rax, qword [rbp+18H]
        lea     rdx, [rel ?_094]
        mov     rcx, rax
        call    fprintf
        mov     rax, qword [rbp+10H]
        mov     eax, dword [rax]
        cmp     eax, 4
        jz      ?_017
        cmp     eax, 4
        ja      ?_018
        cmp     eax, 3
        jz      ?_016
        cmp     eax, 3
        ja      ?_018
        cmp     eax, 1
        jz      ?_014
        cmp     eax, 2
        jz      ?_015
        jmp     ?_018

?_014:  mov     rax, qword [rbp+18H]
        lea     rdx, [rel ?_095]
        mov     rcx, rax
        call    fprintf
        jmp     ?_019

?_015:  mov     rax, qword [rbp+18H]
        lea     rdx, [rel ?_096]
        mov     rcx, rax
        call    fprintf
        jmp     ?_019

?_016:  mov     rax, qword [rbp+18H]
        lea     rdx, [rel ?_097]
        mov     rcx, rax
        call    fprintf
        jmp     ?_019

?_017:  mov     rax, qword [rbp+18H]
        lea     rdx, [rel ?_098]
        mov     rcx, rax
        call    fprintf
        jmp     ?_019

?_018:  mov     rax, qword [rbp+18H]
        lea     rdx, [rel ?_099]
        mov     rcx, rax
        call    fprintf
        nop
?_019:  nop
        leave
        ret
; OutputFish End of function

;------------------------------------------------------------------------------
; --------------------------------- BEAST -------------------------------------
;------------------------------------------------------------------------------

; Implementation of the method to filling parameters from file for beats.
InputFromFileBeast:; Function begin
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     qword [rbp+10H], rcx
        mov     qword [rbp+18H], rdx
        mov     dword [rbp-4H], 1
        lea     rdx, [rbp-4H]
        mov     rax, qword [rbp+18H]
        mov     r8, rdx
        lea     rdx, [rel ?_091]
        mov     rcx, rax
        call    fscanf
        mov     eax, dword [rbp-4H]
        cmp     eax, 4
        jz      ?_023
        cmp     eax, 4
        jg      ?_024
        cmp     eax, 3
        jz      ?_022
        cmp     eax, 3
        jg      ?_024
        cmp     eax, 1
        jz      ?_020
        cmp     eax, 2
        jz      ?_021
        jmp     ?_024

?_020:  mov     rax, qword [rbp+10H]
        mov     dword [rax], 0
        jmp     ?_025

?_021:  mov     rax, qword [rbp+10H]
        mov     dword [rax], 1
        jmp     ?_025

?_022:  mov     rax, qword [rbp+10H]
        mov     dword [rax], 2
        jmp     ?_025

?_023:  mov     rax, qword [rbp+10H]
        mov     dword [rax], 3
        jmp     ?_025

?_024:  mov     rax, qword [rbp+10H]
        mov     dword [rax], 3
        lea     rax, [rel ?_100]
        mov     rcx, rax
        call    printf
        nop
?_025:  nop
        leave
        ret
; InputFromFileBeast End of function

; Implementation of the method to filling parameters with random numbers for beats.
InputRandomBeast:; Function begin
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     qword [rbp+10H], rcx
        call    rand
        cdq
        shr     edx, 30
        add     eax, edx
        and     eax, 03H
        sub     eax, edx
        add     eax, 1
        mov     dword [rbp-4H], eax
        cmp     dword [rbp-4H], 3
        jz      ?_028
        cmp     dword [rbp-4H], 3
        jg      ?_029
        cmp     dword [rbp-4H], 1
        jz      ?_026
        cmp     dword [rbp-4H], 2
        jz      ?_027
        jmp     ?_029

?_026:  mov     rax, qword [rbp+10H]
        mov     dword [rax], 0
        jmp     ?_030

?_027:  mov     rax, qword [rbp+10H]
        mov     dword [rax], 1
        jmp     ?_030

?_028:  mov     rax, qword [rbp+10H]
        mov     dword [rax], 2
        jmp     ?_030

?_029:  mov     rax, qword [rbp+10H]
        mov     dword [rax], 3
        nop
?_030:  nop
        leave
        ret
; InputRandomBeast End of function

; Implementation of the method for printing information about beast.
OutputBeast:; Function begin
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     qword [rbp+10H], rcx
        mov     qword [rbp+18H], rdx
        mov     rax, qword [rbp+18H]
        lea     rdx, [rel ?_101]
        mov     rcx, rax
        call    fprintf
        mov     rax, qword [rbp+10H]
        mov     eax, dword [rax]
        cmp     eax, 3
        jz      ?_033
        cmp     eax, 3
        ja      ?_034
        cmp     eax, 1
        jz      ?_031
        cmp     eax, 2
        jz      ?_032
        jmp     ?_034

?_031:  mov     rax, qword [rbp+18H]
        lea     rdx, [rel ?_102]
        mov     rcx, rax
        call    fprintf
        jmp     ?_035

?_032:  mov     rax, qword [rbp+18H]
        lea     rdx, [rel ?_103]
        mov     rcx, rax
        call    fprintf
        jmp     ?_035

?_033:  mov     rax, qword [rbp+18H]
        lea     rdx, [rel ?_104]
        mov     rcx, rax
        call    fprintf
        jmp     ?_035

?_034:  mov     rax, qword [rbp+18H]
        lea     rdx, [rel ?_105]
        mov     rcx, rax
        call    fprintf
        nop
?_035:  nop
        leave
        ret
; OutputBeast End of function

;------------------------------------------------------------------------------
; ---------------------------------- BIRD -------------------------------------
;------------------------------------------------------------------------------

; Implementation of the method to filling parameters from file for bird.
InputFromFileBird:; Function begin
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     qword [rbp+10H], rcx
        mov     qword [rbp+18H], rdx
        mov     dword [rbp-4H], 1
        lea     rdx, [rbp-4H]
        mov     rax, qword [rbp+18H]
        mov     r8, rdx
        lea     rdx, [rel ?_091]
        mov     rcx, rax
        call    fscanf
        mov     eax, dword [rbp-4H]
        test    eax, eax
        jnz     ?_036
        mov     rax, qword [rbp+10H]
        mov     dword [rax], 0
        jmp     ?_037

?_036:  mov     edx, dword [rbp-4H]
        mov     rax, qword [rbp+10H]
        mov     dword [rax], edx
        nop
?_037:  nop
        leave
        ret
; InputFromFileBird End of function

; Implementation of the method to filling parameters with random numbers for bird.
InputRandomBird:; Function begin
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     qword [rbp+10H], rcx
        call    rand
        cdq
        shr     edx, 31
        add     eax, edx
        and     eax, 01H
        sub     eax, edx
        mov     dword [rbp-4H], eax
        cmp     dword [rbp-4H], 0
        jnz     ?_038
        mov     rax, qword [rbp+10H]
        mov     dword [rax], 0
        jmp     ?_039

?_038:  mov     rax, qword [rbp+10H]
        mov     edx, dword [rbp-4H]
        mov     dword [rax], edx
        nop
?_039:  nop
        leave
        ret
; InputRandomBird End of function

; Implementation of the method for printing information about bird.
OutputBird:; Function begin
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     qword [rbp+10H], rcx
        mov     qword [rbp+18H], rdx
        mov     rax, qword [rbp+10H]
        mov     eax, dword [rax]
        test    eax, eax
        jnz     ?_040
        mov     rax, qword [rbp+18H]
        lea     rdx, [rel ?_106]
        mov     rcx, rax
        call    fprintf
        jmp     ?_041

?_040:  mov     rax, qword [rbp+18H]
        lea     rdx, [rel ?_107]
        mov     rcx, rax
        call    fprintf
?_041:  nop
        leave
        ret
; OutputBird End of function

;------------------------------------------------------------------------------
; -------------------------------- ANIMAL -------------------------------------
;------------------------------------------------------------------------------

; Implementation of the method for finding the coefficient.
Quotient:; Function begin
        push    rbp
        mov     rbp, rsp
        push    rbx
        sub     rsp, 56
        mov     qword [rbp+10H], rcx
        pxor    xmm0, xmm0
        movsd   qword [rbp-18H], xmm0
        mov     dword [rbp-1CH], 0
        jmp     ?_043

?_042:  mov     rdx, qword [rbp+10H]
        mov     eax, dword [rbp-1CH]
        cdqe
        movzx   eax, byte [rdx+rax]
        movsx   eax, al
        pxor    xmm0, xmm0
        cvtsi2sd xmm0, eax
        movsd   xmm1, qword [rbp-18H]
        addsd   xmm0, xmm1
        movsd   qword [rbp-18H], xmm0
        add     dword [rbp-1CH], 1
?_043:  mov     eax, dword [rbp-1CH]
        movsxd  rbx, eax
        mov     rax, qword [rbp+10H]
        mov     rcx, rax
        call    strlen
        cmp     rbx, rax
        jc      ?_042
        mov     rax, qword [rbp+10H]
        mov     eax, dword [rax+0CH]
        pxor    xmm1, xmm1
        cvtsi2sd xmm1, eax
        movsd   xmm0, qword [rbp-18H]
        divsd   xmm0, xmm1
        movq    rax, xmm0
        movq    xmm0, rax
        mov     rbx, qword [rbp-8H]
        leave
        ret
; Quotient End of function

; Implementation of the method for creating animal with chosen parameters.
InputFromFileAnimal:; Function begin
        push    rbp
        mov     rbp, rsp
        push    rbx
        sub     rsp, 88
        mov     qword [rbp+10H], rcx
        mov     qword [rbp+18H], rdx
        lea     rcx, [rbp-25H]
        lea     rdx, [rbp-18H]
        lea     rax, [rbp-1CH]
        mov     qword [rsp+20H], rax
        mov     r9, rcx
        mov     r8, rdx
        lea     rax, [rel ?_108]
        mov     rdx, rax
        mov     rcx, qword [rbp+10H]
        call    fscanf
        mov     eax, dword [rbp-1CH]
        test    eax, eax
        jle     ?_044
        mov     eax, dword [rbp-1CH]
        cmp     eax, 999999
        jle     ?_045
?_044:  lea     rax, [rel ?_109]
        mov     rcx, rax
        call    printf
        mov     ecx, 4294967295
        call    exit
?_045:  mov     dword [rbp-14H], 0
        jmp     ?_047

?_046:  mov     eax, dword [rbp-14H]
        cdqe
        movzx   ecx, byte [rbp+rax-25H]
        mov     rdx, qword [rbp+18H]
        mov     eax, dword [rbp-14H]
        cdqe
        mov     byte [rdx+rax], cl
        add     dword [rbp-14H], 1
?_047:  mov     eax, dword [rbp-14H]
        movsxd  rbx, eax
        lea     rax, [rbp-25H]
        mov     rcx, rax
        call    strlen
        cmp     rbx, rax
        jc      ?_046
        lea     rax, [rbp-25H]
        mov     rcx, rax
        call    strlen
        cmp     rax, 8
        ja      ?_048
        lea     rax, [rbp-25H]
        mov     rcx, rax
        call    strlen
        mov     rdx, qword [rbp+18H]
        mov     byte [rdx+rax], 0
?_048:  mov     edx, dword [rbp-1CH]
        mov     rax, qword [rbp+18H]
        mov     dword [rax+0CH], edx
        mov     eax, dword [rbp-18H]
        cmp     eax, 3
        jz      ?_051
        cmp     eax, 3
        jg      ?_052
        cmp     eax, 1
        jz      ?_049
        cmp     eax, 2
        jz      ?_050
        jmp     ?_052

?_049:  mov     rax, qword [rbp+18H]
        mov     dword [rax+10H], 0
        mov     rax, qword [rbp+18H]
        add     rax, 20
        mov     rdx, qword [rbp+10H]
        mov     rcx, rax
        call    InputFromFileBeast
        jmp     ?_053

?_050:  mov     rax, qword [rbp+18H]
        mov     dword [rax+10H], 1
        mov     rax, qword [rbp+18H]
        add     rax, 20
        mov     rdx, qword [rbp+10H]
        mov     rcx, rax
        call    InputFromFileBird
        jmp     ?_053

?_051:  mov     rax, qword [rbp+18H]
        mov     dword [rax+10H], 2
        mov     rax, qword [rbp+18H]
        add     rax, 20
        mov     rdx, qword [rbp+10H]
        mov     rcx, rax
        call    InputFromFileFish
        jmp     ?_053

?_052:  lea     rax, [rel ?_110]
        mov     rcx, rax
        call    printf
        mov     ecx, 4294967295
        call    exit
?_053:  nop
        mov     rbx, qword [rbp-8H]
        leave
        ret
; InputFromFileAnimal End of function

; Implementation of the method for creating animal with random parameters.
InputRandomAnimal:; Function begin
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     qword [rbp+10H], rcx
        mov     qword [rbp+18H], rdx
        call    rand
        movsxd  rdx, eax
        imul    rdx, rdx, -1840700269
        shr     rdx, 32
        add     edx, eax
        sar     edx, 2
        mov     ecx, eax
        sar     ecx, 31
        sub     edx, ecx
        mov     ecx, edx
        shl     ecx, 3
        sub     ecx, edx
        sub     eax, ecx
        mov     edx, eax
        lea     eax, [rdx+3H]
        mov     dword [rbp-8H], eax
        call    rand
        movsxd  rdx, eax
        imul    rdx, rdx, 1321528399
        shr     rdx, 32
        sar     edx, 3
        mov     ecx, eax
        sar     ecx, 31
        sub     edx, ecx
        imul    ecx, edx, 26
        sub     eax, ecx
        mov     edx, eax
        movsxd  rdx, edx
        mov     rax, qword [rbp+18H]
        add     rax, rdx
        movzx   eax, byte [rax]
        movsx   eax, al
        mov     ecx, eax
        mov     rax, qword [rel __imp_toupper]
        call    rax
        mov     edx, eax
        mov     rax, qword [rbp+10H]
        mov     byte [rax], dl
        mov     dword [rbp-4H], 1
        jmp     ?_057

?_054:  mov     eax, dword [rbp-4H]
        cmp     eax, dword [rbp-8H]
        jl      ?_055
        mov     rdx, qword [rbp+10H]
        mov     eax, dword [rbp-4H]
        cdqe
        mov     byte [rdx+rax], 0
        jmp     ?_056

?_055:  call    rand
        movsxd  rdx, eax
        imul    rdx, rdx, 1321528399
        shr     rdx, 32
        sar     edx, 3
        mov     ecx, eax
        sar     ecx, 31
        sub     edx, ecx
        imul    ecx, edx, 26
        sub     eax, ecx
        mov     edx, eax
        movsxd  rdx, edx
        mov     rax, qword [rbp+18H]
        add     rax, rdx
        movzx   ecx, byte [rax]
        mov     rdx, qword [rbp+10H]
        mov     eax, dword [rbp-4H]
        cdqe
        mov     byte [rdx+rax], cl
?_056:  add     dword [rbp-4H], 1
?_057:  cmp     dword [rbp-4H], 9
        jle     ?_054
        call    rand
        movsxd  rdx, eax
        imul    rdx, rdx, 351843721
        shr     rdx, 32
        sar     edx, 13
        mov     ecx, eax
        sar     ecx, 31
        sub     edx, ecx
        imul    ecx, edx, 100000
        sub     eax, ecx
        mov     edx, eax
        add     edx, 1
        mov     rax, qword [rbp+10H]
        mov     dword [rax+0CH], edx
        call    rand
        movsxd  rdx, eax
        imul    rdx, rdx, 1431655766
        shr     rdx, 32
        mov     ecx, eax
        sar     ecx, 31
        sub     edx, ecx
        mov     ecx, edx
        add     ecx, ecx
        add     ecx, edx
        sub     eax, ecx
        mov     edx, eax
        lea     eax, [rdx+1H]
        mov     dword [rbp-0CH], eax
        cmp     dword [rbp-0CH], 3
        jz      ?_060
        cmp     dword [rbp-0CH], 3
        jg      ?_061
        cmp     dword [rbp-0CH], 1
        jz      ?_058
        cmp     dword [rbp-0CH], 2
        jz      ?_059
        jmp     ?_061

?_058:  mov     rax, qword [rbp+10H]
        mov     dword [rax+10H], 0
        mov     rax, qword [rbp+10H]
        add     rax, 20
        mov     rcx, rax
        call    InputRandomBeast
        mov     rax, qword [rbp+10H]
        jmp     ?_062

?_059:  mov     rax, qword [rbp+10H]
        mov     dword [rax+10H], 1
        mov     rax, qword [rbp+10H]
        add     rax, 20
        mov     rcx, rax
        call    InputRandomBird
        mov     rax, qword [rbp+10H]
        jmp     ?_062

?_060:  mov     rax, qword [rbp+10H]
        mov     dword [rax+10H], 2
        mov     rax, qword [rbp+10H]
        add     rax, 20
        mov     rcx, rax
        call    InputRandomFish
        mov     rax, qword [rbp+10H]
        jmp     ?_062

?_061:  lea     rax, [rel ?_110]
        mov     rcx, rax
        call    printf
        mov     ecx, 4294967295
        call    exit
?_062:  leave
        ret
; InputRandomAnimal End of function

; Implementation of the method for printing animal information.
OutputAnimal:; Function begin
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     qword [rbp+10H], rcx
        mov     qword [rbp+18H], rdx
        mov     rax, qword [rbp+10H]
        mov     ecx, dword [rax+0CH]
        mov     rdx, qword [rbp+10H]
        mov     rax, qword [rbp+18H]
        mov     r9d, ecx
        mov     r8, rdx
        lea     rdx, [rel ?_111]
        mov     rcx, rax
        call    fprintf
        mov     rcx, qword [rbp+10H]
        call    Quotient
        movq    rax, xmm0
        mov     rdx, rax
        movq    xmm0, rdx
        mov     rdx, rax
        mov     rax, qword [rbp+18H]
        movapd  xmm2, xmm0
        mov     r8, rdx
        lea     rdx, [rel ?_112]
        mov     rcx, rax
        call    fprintf
        mov     rax, qword [rbp+10H]
        mov     eax, dword [rax+10H]
        cmp     eax, 2
        jz      ?_063
        cmp     eax, 2
        ja      ?_066
        test    eax, eax
        jz      ?_065
        cmp     eax, 1
        jz      ?_064
        jmp     ?_066

?_063:  mov     rax, qword [rbp+10H]
        lea     rcx, [rax+14H]
        mov     rax, qword [rbp+18H]
        mov     rdx, rax
        call    OutputFish
        jmp     ?_067

?_064:  mov     rax, qword [rbp+10H]
        lea     rcx, [rax+14H]
        mov     rax, qword [rbp+18H]
        mov     rdx, rax
        call    OutputBird
        jmp     ?_067

?_065:  mov     rax, qword [rbp+10H]
        lea     rcx, [rax+14H]
        mov     rax, qword [rbp+18H]
        mov     rdx, rax
        call    OutputBeast
        jmp     ?_067

?_066:  mov     rax, qword [rbp+18H]
        lea     rdx, [rel ?_113]
        mov     rcx, rax
        call    fprintf
        mov     ecx, 4294967295
        call    exit
?_067:  nop
        leave
        ret
; OutputAnimal End of function

;------------------------------------------------------------------------------
; ------------------------------ CONTAINER ------------------------------------
;------------------------------------------------------------------------------

; Implementation of the method for creating a new container.
CreateContainer:; Function begin
        push    rbp
        mov     rbp, rsp
        mov     qword [rbp+10H], rcx
        mov     dword [rbp+18H], edx
        mov     rax, qword [rbp+10H]
        mov     edx, dword [rbp+18H]
        mov     dword [rax], edx
        nop
        pop     rbp
        ret
; CreateContainer End of function

; Implementation of the method for reading animal data from the given file.
InputFromFile:; Function begin
        push    rbp
        mov     rbp, rsp
        and     rsp, 0FFFFFFFFFFFFFFF0H
        sub     rsp, 64
        mov     qword [rbp+10H], rcx
        mov     qword [rbp+18H], rdx
        mov     dword [rsp+3CH], 0
        jmp     ?_069

?_068:  lea     rdx, [rsp+20H]
        mov     rax, qword [rbp+18H]
        mov     rcx, rax
        call    InputFromFileAnimal
        mov     rcx, qword [rbp+10H]
        mov     eax, dword [rsp+3CH]
        movsxd  rdx, eax
        mov     rax, rdx
        add     rax, rax
        add     rax, rdx
        shl     rax, 3
        add     rcx, rax
        mov     rax, qword [rsp+20H]
        mov     rdx, qword [rsp+28H]
        mov     qword [rcx+4H], rax
        mov     qword [rcx+0CH], rdx
        mov     rax, qword [rsp+30H]
        mov     qword [rcx+14H], rax
        add     dword [rsp+3CH], 1
?_069:  mov     rax, qword [rbp+10H]
        mov     eax, dword [rax]
        cmp     dword [rsp+3CH], eax
        jl      ?_068
        nop
        nop
        leave
        ret
; InputFromFile End of function

; Implementation of the method for filling in the container with random animals.
InputRandom:; Function begin
        push    rbp
        mov     rbp, rsp
        and     rsp, 0FFFFFFFFFFFFFFF0H
        sub     rsp, 64
        mov     qword [rbp+10H], rcx
        mov     rax, qword 6867666564636261H
        mov     rdx, qword 706F6E6D6C6B6A69H
        mov     qword [rsp+20H], rax
        mov     qword [rsp+28H], rdx
        mov     rax, qword 7877767574737271H
        mov     qword [rsp+30H], rax
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [rsp+38H], 31353
        mov     dword [rsp+3CH], 0
        jmp     ?_071

?_070:  mov     eax, dword [rsp+3CH]
        movsxd  rdx, eax
        mov     rax, rdx
        add     rax, rax
        add     rax, rdx
        shl     rax, 3
        mov     rdx, qword [rbp+10H]
        add     rax, rdx
        lea     rcx, [rax+4H]
        lea     rax, [rsp+20H]
        mov     rdx, rax
        call    InputRandomAnimal
        add     dword [rsp+3CH], 1
?_071:  mov     rax, qword [rbp+10H]
        mov     eax, dword [rax]
        cmp     dword [rsp+3CH], eax
        jl      ?_070
        nop
        nop
        leave
        ret
; InputRandom End of function

; Implementation of the method  for printing container information.
Output: ; Function begin
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     qword [rbp+10H], rcx
        mov     qword [rbp+18H], rdx
        mov     rax, qword [rbp+10H]
        mov     ecx, dword [rax]
        mov     rax, qword [rbp+18H]
        lea     rdx, [rel ?_116]
        mov     qword [rsp+20H], rdx
        mov     r9d, ecx
        lea     r8, [rel ?_114]
        lea     rdx, [rel ?_115]
        mov     rcx, rax
        call    fprintf
        mov     dword [rbp-4H], 0
        jmp     ?_073

?_072:  mov     eax, dword [rbp-4H]
        lea     edx, [rax+1H]
        mov     rax, qword [rbp+18H]
        lea     r9, [rel ?_117]
        mov     r8d, edx
        lea     rdx, [rel ?_118]
        mov     rcx, rax
        call    fprintf
        mov     eax, dword [rbp-4H]
        movsxd  rdx, eax
        mov     rax, rdx
        add     rax, rax
        add     rax, rdx
        shl     rax, 3
        mov     rdx, qword [rbp+10H]
        add     rax, rdx
        lea     rcx, [rax+4H]
        mov     rax, qword [rbp+18H]
        mov     rdx, rax
        call    OutputAnimal
        mov     rax, qword [rbp+18H]
        lea     r8, [rel ?_119]
        lea     rdx, [rel ?_120]
        mov     rcx, rax
        call    fprintf
        add     dword [rbp-4H], 1
?_073:  mov     rax, qword [rbp+10H]
        mov     eax, dword [rax]
        cmp     dword [rbp-4H], eax
        jl      ?_072
        nop
        nop
        leave
        ret
; Output End of function

;------------------------------------------------------------------------------
; ------------- BEGINNING OF BINARY INTERSECTION SORT CODE --------------------
;------------------------------------------------------------------------------

; A binary search based function to find the position where item should be inserted in [low..high]
BinarySearch:; Function begin
        push    rbp
        mov     rbp, rsp
        push    rsi
        push    rbx
        sub     rsp, 16
        and     rsp, 0FFFFFFFFFFFFFFF0H
        sub     rsp, 80
        movaps  oword [rsp+50H], xmm6
        mov     qword [rbp+10H], rcx
        mov     rbx, rdx
        mov     dword [rbp+20H], r8d
        mov     dword [rbp+28H], r9d
        mov     eax, dword [rbp+28H]
        cmp     eax, dword [rbp+20H]
        jg      ?_075
        mov     rcx, rbx
        call    Quotient
        movapd  xmm6, xmm0
        mov     eax, dword [rbp+20H]
        movsxd  rdx, eax
        mov     rax, rdx
        add     rax, rax
        add     rax, rdx
        shl     rax, 3
        mov     rdx, rax
        mov     rax, qword [rbp+10H]
        add     rax, rdx
        mov     rcx, rax
        call    Quotient
        movq    rax, xmm0
        movq    xmm1, rax
        comisd  xmm1, xmm6
        jbe     ?_074
        mov     eax, dword [rbp+20H]
        add     eax, 1
        jmp     ?_078

?_074:  mov     eax, dword [rbp+20H]
        jmp     ?_078

?_075:  mov     edx, dword [rbp+20H]
        mov     eax, dword [rbp+28H]
        add     eax, edx
        mov     edx, eax
        shr     edx, 31
        add     eax, edx
        sar     eax, 1
        mov     dword [rsp+4CH], eax
        mov     rcx, rbx
        call    Quotient
        movq    rsi, xmm0
        mov     eax, dword [rsp+4CH]
        movsxd  rdx, eax
        mov     rax, rdx
        add     rax, rax
        add     rax, rdx
        shl     rax, 3
        mov     rdx, rax
        mov     rax, qword [rbp+10H]
        add     rax, rdx
        mov     rcx, rax
        call    Quotient
        movq    xmm2, rsi
        ucomisd xmm2, xmm0
        jpe     ?_076
        movq    xmm3, rsi
        ucomisd xmm3, xmm0
        jnz     ?_076
        mov     eax, dword [rsp+4CH]
        add     eax, 1
        jmp     ?_078

?_076:  mov     rcx, rbx
        call    Quotient
        movapd  xmm6, xmm0
        mov     eax, dword [rsp+4CH]
        movsxd  rdx, eax
        mov     rax, rdx
        add     rax, rax
        add     rax, rdx
        shl     rax, 3
        mov     rdx, rax
        mov     rax, qword [rbp+10H]
        add     rax, rdx
        mov     rcx, rax
        call    Quotient
        movq    rax, xmm0
        movq    xmm4, rax
        comisd  xmm4, xmm6
        jbe     ?_077
        mov     eax, dword [rsp+4CH]
        lea     ecx, [rax+1H]
        mov     rax, qword [rbx]
        mov     rdx, qword [rbx+8H]
        mov     qword [rsp+20H], rax
        mov     qword [rsp+28H], rdx
        mov     rax, qword [rbx+10H]
        mov     qword [rsp+30H], rax
        mov     edx, dword [rbp+28H]
        lea     rax, [rsp+20H]
        mov     r9d, edx
        mov     r8d, ecx
        mov     rdx, rax
        mov     rcx, qword [rbp+10H]
        call    BinarySearch
        jmp     ?_078

?_077:  mov     eax, dword [rsp+4CH]
        lea     ecx, [rax-1H]
        mov     rax, qword [rbx]
        mov     rdx, qword [rbx+8H]
        mov     qword [rsp+20H], rax
        mov     qword [rsp+28H], rdx
        mov     rax, qword [rbx+10H]
        mov     qword [rsp+30H], rax
        mov     edx, dword [rbp+20H]
        lea     rax, [rsp+20H]
        mov     r9d, ecx
        mov     r8d, edx
        mov     rdx, rax
        mov     rcx, qword [rbp+10H]
        call    BinarySearch
?_078:  movaps  xmm6, oword [rsp+50H]
        lea     rsp, [rbp-10H]
        pop     rbx
        pop     rsi
        pop     rbp
        ret
; BinarySearch End of function

; Function to sort an array all_animals[] of size 'n'
SortContainerDataWithInsertionSort:; Function begin
        push    rbp
        mov     rbp, rsp
        and     rsp, 0FFFFFFFFFFFFFFF0H
        add     rsp, -128
        mov     qword [rbp+10H], rcx
        mov     rax, qword [rbp+10H]
        mov     eax, dword [rax]
        mov     dword [rsp+74H], eax
        mov     rax, qword [rbp+10H]
        add     rax, 4
        mov     qword [rsp+68H], rax
        mov     dword [rsp+7CH], 1
        jmp     ?_082

?_079:  mov     eax, dword [rsp+7CH]
        sub     eax, 1
        mov     dword [rsp+78H], eax
        mov     eax, dword [rsp+7CH]
        movsxd  rdx, eax
        mov     rax, rdx
        add     rax, rax
        add     rax, rdx
        shl     rax, 3
        mov     rdx, rax
        mov     rax, qword [rsp+68H]
        lea     rcx, [rdx+rax]
        mov     rax, qword [rcx]
        mov     rdx, qword [rcx+8H]
        mov     qword [rsp+40H], rax
        mov     qword [rsp+48H], rdx
        mov     rax, qword [rcx+10H]
        mov     qword [rsp+50H], rax
        mov     rax, qword [rsp+40H]
        mov     rdx, qword [rsp+48H]
        mov     qword [rsp+20H], rax
        mov     qword [rsp+28H], rdx
        mov     rax, qword [rsp+50H]
        mov     qword [rsp+30H], rax
        mov     ecx, dword [rsp+78H]
        lea     rdx, [rsp+20H]
        mov     rax, qword [rsp+68H]
        mov     r9d, ecx
        mov     r8d, 0
        mov     rcx, rax
        call    BinarySearch
        mov     dword [rsp+64H], eax
        jmp     ?_081

?_080:  mov     eax, dword [rsp+78H]
        movsxd  rdx, eax
        mov     rax, rdx
        add     rax, rax
        add     rax, rdx
        shl     rax, 3
        mov     rdx, rax
        mov     rax, qword [rsp+68H]
        lea     r8, [rdx+rax]
        mov     eax, dword [rsp+78H]
        cdqe
        lea     rdx, [rax+1H]
        mov     rax, rdx
        add     rax, rax
        add     rax, rdx
        shl     rax, 3
        mov     rdx, rax
        mov     rax, qword [rsp+68H]
        lea     rcx, [rdx+rax]
        mov     rax, qword [r8]
        mov     rdx, qword [r8+8H]
        mov     qword [rcx], rax
        mov     qword [rcx+8H], rdx
        mov     rax, qword [r8+10H]
        mov     qword [rcx+10H], rax
        sub     dword [rsp+78H], 1
?_081:  mov     eax, dword [rsp+78H]
        cmp     eax, dword [rsp+64H]
        jge     ?_080
        mov     eax, dword [rsp+78H]
        cdqe
        lea     rdx, [rax+1H]
        mov     rax, rdx
        add     rax, rax
        add     rax, rdx
        shl     rax, 3
        mov     rdx, rax
        mov     rax, qword [rsp+68H]
        lea     rcx, [rdx+rax]
        mov     rax, qword [rsp+40H]
        mov     rdx, qword [rsp+48H]
        mov     qword [rcx], rax
        mov     qword [rcx+8H], rdx
        mov     rax, qword [rsp+50H]
        mov     qword [rcx+10H], rax
        add     dword [rsp+7CH], 1
?_082:  mov     eax, dword [rsp+7CH]
        cmp     eax, dword [rsp+74H]
        jl      ?_079
        nop
        nop
        leave
        ret
; SortContainerDataWithInsertionSort End of function

;------------------------------------------------------------------------------
; ----------------- BEGINNING OF PROGRAM MESSAGES OUTPUT  ---------------------
;------------------------------------------------------------------------------

IncorrectCommand:; Function begin
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        lea     rax, [rel ?_121]
        mov     rcx, rax
        call    printf
        nop
        leave
        ret
; IncorrectCommand End of function

IncorrectContainerSize:; Function begin
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        lea     rax, [rel ?_122]
        mov     rcx, rax
        call    printf
        nop
        leave
        ret
; IncorrectContainerSize End of function

Started:; Function begin
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        lea     rax, [rel ?_123]
        mov     rcx, rax
        call    printf
        nop
        leave
        ret
; Started End of function

Finished:; Function begin
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        lea     rax, [rel ?_124]
        mov     rcx, rax
        call    printf
        nop
        leave
        ret
; Finished End of function

Filled: ; Function begin
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        lea     rax, [rel ?_125]
        mov     rcx, rax
        call    printf
        nop
        leave
        ret
; Filled End of function

Sorted: ; Function begin
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        lea     rax, [rel ?_126]
        mov     rcx, rax
        call    printf
        nop
        leave
        ret
; Sorted End of function

Printed:; Function begin
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        lea     rax, [rel ?_127]
        mov     rcx, rax
        call    printf
        nop
        leave
        ret
; Printed End of function

;------------------------------------------------------------------------------
; --------------------- BEGINNING OF MAIN PROGRAM CODE ------------------------
;------------------------------------------------------------------------------

main:   ; Function begin
        push    rbp
        mov     rbp, rsp
        and     rsp, 0FFFFFFFFFFFFFFF0H
        mov     eax, 240096
        call    ___chkstk_ms
        sub     rsp, rax
        mov     dword [rbp+10H], ecx
        mov     qword [rbp+18H], rdx
        call    __main
        cmp     dword [rbp+10H], 5
        jz      ?_083
        call    IncorrectCommand
        mov     eax, 1
        jmp     ?_090

?_083:  call    clock
        mov     dword [rsp+3A9DCH], eax
        call    Started
        mov     dword [rsp+2CH], 0
        mov     rax, qword [rbp+18H]
        add     rax, 16
        mov     rax, qword [rax]
        lea     rdx, [rel ?_128]
        mov     rcx, rax
        call    fopen
        mov     qword [rsp+3A9D0H], rax
        cmp     qword [rsp+3A9D0H], 0
        jnz     ?_084
        mov     rax, qword [rbp+18H]
        add     rax, 16
        mov     rax, qword [rax]
        mov     rdx, rax
        lea     rax, [rel ?_129]
        mov     rcx, rax
        call    printf
?_084:  lea     rdx, [rsp+2CH]
        mov     rax, qword [rsp+3A9D0H]
        mov     r8, rdx
        lea     rdx, [rel ?_091]
        mov     rcx, rax
        call    fscanf
        mov     eax, dword [rsp+2CH]
        test    eax, eax
        jle     ?_085
        mov     eax, dword [rsp+2CH]
        cmp     eax, 10000
        jle     ?_086
?_085:  call    IncorrectContainerSize
        mov     eax, 4294967295
        jmp     ?_090

?_086:  mov     edx, dword [rsp+2CH]
        lea     rax, [rsp+30H]
        mov     rcx, rax
        call    CreateContainer
        mov     rax, qword [rbp+18H]
        add     rax, 8
        mov     rax, qword [rax]
        lea     rdx, [rel ?_130]
        mov     rcx, rax
        call    strcmp
        test    eax, eax
        jnz     ?_087
        mov     rdx, qword [rsp+3A9D0H]
        lea     rax, [rsp+30H]
        mov     rcx, rax
        call    InputFromFile
        jmp     ?_089

?_087:  mov     rax, qword [rbp+18H]
        add     rax, 8
        mov     rax, qword [rax]
        lea     rdx, [rel ?_131]
        mov     rcx, rax
        call    strcmp
        test    eax, eax
        jnz     ?_088
        lea     rax, [rsp+30H]
        mov     rcx, rax
        call    InputRandom
        jmp     ?_089

?_088:  call    IncorrectCommand
        mov     eax, 4294967295
        jmp     ?_090

?_089:  call    Filled
        mov     rax, qword [rbp+18H]
        add     rax, 24
        mov     rax, qword [rax]
        lea     rdx, [rel ?_132]
        mov     rcx, rax
        call    fopen
        mov     qword [rsp+3A9C8H], rax
        mov     rax, qword [rbp+18H]
        add     rax, 32
        mov     rax, qword [rax]
        lea     rdx, [rel ?_132]
        mov     rcx, rax
        call    fopen
        mov     qword [rsp+3A9C0H], rax
        mov     rdx, qword [rsp+3A9C8H]
        lea     rax, [rsp+30H]
        mov     rcx, rax
        call    Output
        call    Printed
        lea     rax, [rsp+30H]
        mov     rcx, rax
        call    SortContainerDataWithInsertionSort
        call    Sorted
        mov     rdx, qword [rsp+3A9C0H]
        lea     rax, [rsp+30H]
        mov     rcx, rax
        call    Output
        call    Printed
        call    Finished
        call    clock
        mov     dword [rsp+3A9BCH], eax
        mov     eax, dword [rsp+3A9BCH]
        sub     eax, dword [rsp+3A9DCH]
        pxor    xmm0, xmm0
        cvtsi2sd xmm0, eax
        movsd   xmm1, qword [rel ?_134]
        divsd   xmm0, xmm1
        movq    rax, xmm0
        mov     rdx, rax
        movq    xmm0, rdx
        movapd  xmm1, xmm0
        mov     rdx, rax
        lea     rax, [rel ?_133]
        mov     rcx, rax
        call    printf
        mov     eax, 0
?_090:  leave
        ret
; main End of function

        nop                                             ; 120D _ 90
        nop                                             ; 120E _ 90
        nop                                             ; 120F _ 90


SECTION .data   align=16 noexecute                      ; section number 2, data


SECTION .bss    align=16 noexecute                      ; section number 3, bss


SECTION .rdata  align=16 noexecute                      ; section number 4, const

?_091:                                                  ; byte
        db 25H, 64H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0000 _ %d......

?_092:                                                  ; byte
        db 59H, 6FH, 75H, 72H, 20H, 69H, 6EH, 70H       ; 0008 _ Your inp
        db 75H, 74H, 20H, 66H, 6FH, 72H, 20H, 66H       ; 0010 _ ut for f
        db 69H, 73H, 68H, 20H, 68H, 61H, 62H, 69H       ; 0018 _ ish habi
        db 74H, 61H, 74H, 20H, 77H, 61H, 73H, 20H       ; 0020 _ tat was 
        db 69H, 6EH, 63H, 6FH, 72H, 72H, 65H, 63H       ; 0028 _ incorrec
        db 74H, 2CH, 20H, 73H, 6FH, 20H, 70H, 72H       ; 0030 _ t, so pr
        db 6FH, 67H, 72H, 61H, 6DH, 20H, 61H, 73H       ; 0038 _ ogram as
        db 73H, 69H, 67H, 6EH, 65H, 64H, 20H, 74H       ; 0040 _ signed t
        db 68H, 65H, 20H, 64H, 65H, 66H, 61H, 75H       ; 0048 _ he defau
        db 6CH, 74H, 20H, 6FH, 6EH, 65H, 20H, 28H       ; 0050 _ lt one (
        db 77H, 68H, 69H, 63H, 68H, 20H, 69H, 73H       ; 0058 _ which is
        db 20H, 70H, 6FH, 6EH, 64H, 29H, 0AH, 00H       ; 0060 _  pond)..

?_093:                                                  ; switch/case jump table
        dd ?_006-$                                      ; 0068 _ 00000167 (rel)
        dd ?_001-$+4H                                   ; 006C _ 0000012F (rel)
        dd ?_002-$+8H                                   ; 0070 _ 0000013F (rel)
        dd ?_003-$+0CH                                  ; 0074 _ 0000014F (rel)
        dd ?_004-$+10H                                  ; 0078 _ 0000015F (rel)
        dd ?_005-$+14H                                  ; 007C _ 0000016F (rel)

?_094:                                                  ; byte
        dd ?_135-?_093                                  ; 0080 _ 73277449 (refpoint)
        dd 66206120H, 2C687369H                         ; 0084 _ 1713398048 745042793 
        dd 646E6120H, 20746920H                         ; 008C _ 1684955424 544500000 
        dd 6576696CH, 6E692073H                         ; 0094 _ 1702259052 1852383347 
        dd 65687420H                                    ; 009C _ 1701344288 
        db 20H, 00H                                     ; 00A0 _  .

?_095:                                                  ; byte
        db 72H, 69H, 76H, 65H, 72H, 2EH, 20H, 0AH       ; 00A2 _ river. .
        db 00H                                          ; 00AA _ .

?_096:                                                  ; byte
        db 73H, 65H, 61H, 2EH, 20H, 0AH, 00H            ; 00AB _ sea. ..

?_097:                                                  ; byte
        db 6CH, 61H, 6BH, 65H, 2EH, 20H, 0AH, 00H       ; 00B2 _ lake. ..

?_098:                                                  ; byte
        db 6FH, 63H, 65H, 61H, 6EH, 2EH, 20H, 0AH       ; 00BA _ ocean. .
        db 00H                                          ; 00C2 _ .

?_099:                                                  ; byte
        db 70H, 6FH, 6EH, 64H, 2EH, 20H, 0AH, 00H       ; 00C3 _ pond. ..
        db 00H, 00H, 00H, 00H, 00H                      ; 00CB _ .....

?_100:                                                  ; byte
        db 59H, 6FH, 75H, 72H, 20H, 69H, 6EH, 70H       ; 00D0 _ Your inp
        db 75H, 74H, 20H, 66H, 6FH, 72H, 20H, 62H       ; 00D8 _ ut for b
        db 65H, 61H, 73H, 74H, 20H, 6EH, 75H, 74H       ; 00E0 _ east nut
        db 72H, 69H, 74H, 69H, 6FH, 6EH, 20H, 77H       ; 00E8 _ rition w
        db 61H, 73H, 20H, 69H, 6EH, 63H, 6FH, 72H       ; 00F0 _ as incor
        db 72H, 65H, 63H, 74H, 2CH, 20H, 73H, 6FH       ; 00F8 _ rect, so
        db 20H, 70H, 72H, 6FH, 67H, 72H, 61H, 6DH       ; 0100 _  program
        db 20H, 61H, 73H, 73H, 69H, 67H, 6EH, 65H       ; 0108 _  assigne
        db 64H, 20H, 74H, 68H, 65H, 20H, 64H, 65H       ; 0110 _ d the de
        db 66H, 61H, 75H, 6CH, 74H, 20H, 6FH, 6EH       ; 0118 _ fault on
        db 65H, 20H, 28H, 77H, 68H, 69H, 63H, 68H       ; 0120 _ e (which
        db 20H, 69H, 73H, 20H, 6FH, 6DH, 6EH, 69H       ; 0128 _  is omni
        db 76H, 6FH, 72H, 65H, 73H, 29H, 0AH, 00H       ; 0130 _ vores)..

?_101:                                                  ; byte
        db 49H, 74H, 27H, 73H, 20H, 61H, 20H, 62H       ; 0138 _ It's a b
        db 65H, 61H, 73H, 74H, 20H, 61H, 6EH, 64H       ; 0140 _ east and
        db 20H, 69H, 74H, 27H, 73H, 20H, 00H            ; 0148 _  it's .

?_102:                                                  ; byte
        db 63H, 61H, 72H, 6EH, 69H, 76H, 6FH, 72H       ; 014F _ carnivor
        db 65H, 73H, 2EH, 0AH, 00H                      ; 0157 _ es...

?_103:                                                  ; byte
        db 68H, 65H, 72H, 62H, 69H, 76H, 6FH, 72H       ; 015C _ herbivor
        db 65H, 73H, 2EH, 0AH, 00H                      ; 0164 _ es...

?_104:                                                  ; byte
        db 69H, 6EH, 73H, 65H, 63H, 74H, 69H, 76H       ; 0169 _ insectiv
        db 6FH, 72H, 65H, 73H, 2EH, 0AH, 00H            ; 0171 _ ores...

?_105:                                                  ; byte
        db 6FH, 6DH, 6EH, 69H, 76H, 6FH, 72H, 65H       ; 0178 _ omnivore
        db 73H, 2EH, 0AH, 00H, 00H, 00H, 00H, 00H       ; 0180 _ s.......

?_106:                                                  ; byte
        db 49H, 74H, 27H, 73H, 20H, 61H, 20H, 62H       ; 0188 _ It's a b
        db 69H, 72H, 64H, 20H, 61H, 6EH, 64H, 20H       ; 0190 _ ird and 
        db 69H, 74H, 27H, 73H, 20H, 6EH, 6FH, 74H       ; 0198 _ it's not
        db 20H, 6DH, 69H, 67H, 72H, 61H, 74H, 6FH       ; 01A0 _  migrato
        db 72H, 79H, 2EH, 0AH, 00H, 00H, 00H, 00H       ; 01A8 _ ry......

?_107:                                                  ; byte
        db 49H, 74H, 27H, 73H, 20H, 61H, 20H, 62H       ; 01B0 _ It's a b
        db 69H, 72H, 64H, 20H, 61H, 6EH, 64H, 20H       ; 01B8 _ ird and 
        db 69H, 74H, 27H, 73H, 20H, 6DH, 69H, 67H       ; 01C0 _ it's mig
        db 72H, 61H, 74H, 6FH, 72H, 79H, 2EH, 0AH       ; 01C8 _ ratory..
        db 00H                                          ; 01D0 _ .

?_108:                                                  ; byte
        db 25H, 64H, 20H, 25H, 73H, 20H, 25H, 64H       ; 01D1 _ %d %s %d
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H            ; 01D9 _ .......

?_109:                                                  ; byte
        db 49H, 6EH, 63H, 6FH, 72H, 72H, 65H, 63H       ; 01E0 _ Incorrec
        db 74H, 20H, 61H, 6EH, 69H, 6DH, 61H, 6CH       ; 01E8 _ t animal
        db 20H, 77H, 65H, 69H, 67H, 68H, 74H, 2CH       ; 01F0 _  weight,
        db 20H, 6DH, 75H, 73H, 74H, 20H, 62H, 65H       ; 01F8 _  must be
        db 20H, 70H, 6FH, 73H, 69H, 74H, 69H, 76H       ; 0200 _  positiv
        db 65H, 20H, 69H, 6EH, 74H, 65H, 67H, 65H       ; 0208 _ e intege
        db 72H, 2DH, 74H, 79H, 70H, 65H, 20H, 62H       ; 0210 _ r-type b
        db 69H, 67H, 67H, 65H, 72H, 20H, 74H, 68H       ; 0218 _ igger th
        db 61H, 6EH, 20H, 7AH, 65H, 72H, 6FH, 2EH       ; 0220 _ an zero.
        db 0AH, 00H                                     ; 0228 _ ..

?_110:                                                  ; byte
        db 49H, 6EH, 76H, 61H, 6CH, 69H, 64H, 20H       ; 022A _ Invalid 
        db 61H, 6EH, 69H, 6DH, 61H, 6CH, 20H, 74H       ; 0232 _ animal t
        db 79H, 70H, 65H, 2EH, 0AH, 00H                 ; 023A _ ype...

?_111:                                                  ; byte
        db 41H, 6EH, 69H, 6DH, 61H, 6CH, 20H, 25H       ; 0240 _ Animal %
        db 73H, 20H, 77H, 69H, 74H, 68H, 20H, 77H       ; 0248 _ s with w
        db 65H, 69H, 67H, 68H, 74H, 20H, 25H, 64H       ; 0250 _ eight %d
        db 20H, 67H, 72H, 61H, 6DH, 73H, 2EH, 20H       ; 0258 _  grams. 
        db 0AH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0260 _ ........

?_112:                                                  ; byte
        db 49H, 74H, 27H, 73H, 20H, 71H, 75H, 6FH       ; 0268 _ It's quo
        db 74H, 69H, 65H, 6EH, 74H, 20H, 66H, 72H       ; 0270 _ tient fr
        db 6FH, 6DH, 20H, 6EH, 61H, 6DH, 65H, 20H       ; 0278 _ om name 
        db 74H, 6FH, 20H, 77H, 65H, 69H, 67H, 68H       ; 0280 _ to weigh
        db 74H, 20H, 69H, 73H, 20H, 25H, 66H, 2EH       ; 0288 _ t is %f.
        db 20H, 0AH, 00H                                ; 0290 _  ..

?_113:                                                  ; byte
        db 49H, 6EH, 63H, 6FH, 72H, 72H, 65H, 63H       ; 0293 _ Incorrec
        db 74H, 20H, 61H, 6EH, 69H, 6DH, 61H, 6CH       ; 029B _ t animal
        db 2EH, 00H                                     ; 02A3 _ ..

?_114:                                                  ; byte
        db 20H, 2DH, 2DH, 2DH, 2DH, 20H, 43H, 4FH       ; 02A5 _  ---- CO
        db 4EH, 54H, 41H, 49H, 4EH, 45H, 52H, 20H       ; 02AD _ NTAINER 
        db 57H, 49H, 54H, 48H, 20H, 53H, 49H, 5AH       ; 02B5 _ WITH SIZ
        db 45H, 20H, 00H                                ; 02BD _ E .

?_115:                                                  ; byte
        db 25H, 73H, 20H, 25H, 64H, 20H, 25H, 73H       ; 02C0 _ %s %d %s
        db 00H                                          ; 02C8 _ .

?_116:                                                  ; byte
        db 20H, 2DH, 2DH, 2DH, 2DH, 20H, 0AH, 00H       ; 02C9 _  ---- ..

?_117:                                                  ; byte
        db 2EH, 20H, 00H                                ; 02D1 _ . .

?_118:                                                  ; byte
        db 25H, 64H, 20H, 25H, 73H, 00H                 ; 02D4 _ %d %s.

?_119:                                                  ; byte
        db 20H, 2DH, 2DH, 2DH, 2DH, 2DH, 2DH, 2DH       ; 02DA _  -------
        db 2DH, 2DH, 2DH, 2DH, 2DH, 2DH, 2DH, 2DH       ; 02E2 _ --------
        db 2DH, 2DH, 2DH, 2DH, 2DH, 2DH, 2DH, 2DH       ; 02EA _ --------
        db 2DH, 2DH, 2DH, 20H, 0AH, 00H                 ; 02F2 _ --- ..

?_120:                                                  ; byte
        db 25H, 73H, 00H, 00H, 00H, 00H, 00H, 00H       ; 02F8 _ %s......

?_121:                                                  ; byte
        db 49H, 6EH, 63H, 6FH, 72H, 72H, 65H, 63H       ; 0300 _ Incorrec
        db 74H, 20H, 63H, 6FH, 6DH, 6DH, 61H, 6EH       ; 0308 _ t comman
        db 64H, 21H, 0AH, 20H, 20H, 57H, 61H, 69H       ; 0310 _ d!.  Wai
        db 74H, 65H, 64H, 3AH, 0AH, 20H, 20H, 20H       ; 0318 _ ted:.   
        db 20H, 20H, 63H, 6FH, 6DH, 6DH, 61H, 6EH       ; 0320 _   comman
        db 64H, 20H, 2DH, 66H, 20H, 3CH, 69H, 6EH       ; 0328 _ d -f <in
        db 66H, 69H, 6CH, 65H, 3EH, 20H, 3CH, 6FH       ; 0330 _ file> <o
        db 75H, 74H, 66H, 69H, 6CH, 65H, 30H, 31H       ; 0338 _ utfile01
        db 3EH, 20H, 3CH, 6FH, 75H, 74H, 66H, 69H       ; 0340 _ > <outfi
        db 6CH, 65H, 30H, 32H, 3EH, 0AH, 20H, 20H       ; 0348 _ le02>.  
        db 4FH, 72H, 3AH, 0AH, 20H, 20H, 20H, 20H       ; 0350 _ Or:.    
        db 20H, 63H, 6FH, 6DH, 6DH, 61H, 6EH, 64H       ; 0358 _  command
        db 20H, 2DH, 6EH, 20H, 3CH, 69H, 6EH, 66H       ; 0360 _  -n <inf
        db 69H, 6CH, 65H, 3EH, 20H, 3CH, 6FH, 75H       ; 0368 _ ile> <ou
        db 74H, 66H, 69H, 6CH, 65H, 30H, 31H, 3EH       ; 0370 _ tfile01>
        db 20H, 3CH, 6FH, 75H, 74H, 66H, 69H, 6CH       ; 0378 _  <outfil
        db 65H, 30H, 32H, 3EH, 0AH, 00H, 00H, 00H       ; 0380 _ e02>....

?_122:                                                  ; byte
        db 49H, 6EH, 63H, 6FH, 72H, 72H, 65H, 63H       ; 0388 _ Incorrec
        db 74H, 20H, 63H, 6FH, 6EH, 74H, 61H, 69H       ; 0390 _ t contai
        db 6EH, 65H, 72H, 20H, 73H, 69H, 7AH, 65H       ; 0398 _ ner size
        db 21H, 20H, 4DH, 75H, 73H, 74H, 20H, 62H       ; 03A0 _ ! Must b
        db 65H, 20H, 69H, 6EH, 74H, 65H, 67H, 65H       ; 03A8 _ e intege
        db 72H, 20H, 62H, 65H, 74H, 77H, 65H, 65H       ; 03B0 _ r betwee
        db 6EH, 20H, 31H, 20H, 61H, 6EH, 64H, 20H       ; 03B8 _ n 1 and 
        db 31H, 30H, 30H, 30H, 30H, 20H, 0AH, 00H       ; 03C0 _ 10000 ..

?_123:                                                  ; byte
        db 20H, 20H, 2AH, 2AH, 2AH, 20H, 53H, 54H       ; 03C8 _   *** ST
        db 41H, 52H, 54H, 45H, 44H, 20H, 2AH, 2AH       ; 03D0 _ ARTED **
        db 2AH, 20H, 20H, 0AH, 00H                      ; 03D8 _ *  ..

?_124:                                                  ; byte
        db 20H, 20H, 2AH, 2AH, 2AH, 20H, 46H, 49H       ; 03DD _   *** FI
        db 4EH, 49H, 53H, 48H, 45H, 44H, 20H, 2AH       ; 03E5 _ NISHED *
        db 2AH, 2AH, 20H, 20H, 0AH, 00H                 ; 03ED _ **  ..

?_125:                                                  ; byte
        db 20H, 20H, 2AH, 2AH, 2AH, 20H, 46H, 49H       ; 03F3 _   *** FI
        db 4CH, 4CH, 45H, 44H, 20H, 2AH, 2AH, 2AH       ; 03FB _ LLED ***
        db 20H, 20H, 0AH, 00H                           ; 0403 _   ..

?_126:                                                  ; byte
        db 20H, 20H, 2AH, 2AH, 2AH, 20H, 53H, 4FH       ; 0407 _   *** SO
        db 52H, 54H, 45H, 44H, 20H, 2AH, 2AH, 2AH       ; 040F _ RTED ***
        db 20H, 20H, 0AH, 00H                           ; 0417 _   ..

?_127:                                                  ; byte
        db 20H, 20H, 2AH, 2AH, 2AH, 20H, 50H, 52H       ; 041B _   *** PR
        db 49H, 4EH, 54H, 45H, 44H, 20H, 2AH, 2AH       ; 0423 _ INTED **
        db 2AH, 20H, 20H, 0AH, 00H                      ; 042B _ *  ..

?_128:                                                  ; byte
        db 72H, 00H                                     ; 0430 _ r.

?_129:                                                  ; byte
        db 43H, 6FH, 75H, 6CH, 64H, 20H, 6EH, 6FH       ; 0432 _ Could no
        db 74H, 20H, 6FH, 70H, 65H, 6EH, 20H, 66H       ; 043A _ t open f
        db 69H, 6CH, 65H, 3AH, 20H, 25H, 73H, 2EH       ; 0442 _ ile: %s.
        db 0AH, 00H                                     ; 044A _ ..

?_130:                                                  ; byte
        db 2DH, 66H, 00H                                ; 044C _ -f.

?_131:                                                  ; byte
        db 2DH, 6EH, 00H                                ; 044F _ -n.

?_132:                                                  ; byte
        db 77H, 00H                                     ; 0452 _ w.

?_133:                                                  ; byte
        db 20H, 20H, 52H, 55H, 4EH, 54H, 49H, 4DH       ; 0454 _   RUNTIM
        db 45H, 3AH, 20H, 25H, 66H, 2EH, 00H, 00H       ; 045C _ E: %f...
        db 00H, 00H, 00H, 00H                           ; 0464 _ ....

?_134:  dq 408F400000000000H                            ; 0468 _ 1000.0 


