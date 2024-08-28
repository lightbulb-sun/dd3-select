.memorymap
defaultslot 0
slotsize $2000
slot 0 $8000
slot 1 $a000
slot 2 $c000
slot 3 $e000
.endme

.rombankmap
bankstotal 145
banksize $10
banks 1
banksize $2000
banks 16
banksize $400
banks 128
.endro

.background "ddragon3-jp.nes"

.equ    NEW_BUTTONS_P1          $97
.equ    NEW_BUTTONS_P2          $98
.equ    MASK_BUTTON_SELECT      $20

.bank 16 slot 3
.orga $e40a
        jmp     my_code

.bank 14 slot 1
.orga $ab80
my_code:
.check_for_select_p1
        ; replace original instruction
        and     #MASK_BUTTON_SELECT
        bne     .open_player_select
.check_for_select_p2
        lda     NEW_BUTTONS_P2
        and     #MASK_BUTTON_SELECT
        bne     .open_player_select
.do_nothing
        jmp     $e40e
.open_player_select
        jmp     $e416
