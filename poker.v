`timescale 1ns/1ps

module poker(type, i0, i1, i2, i3, i4);
//DO NOT CHANGE!
	input  [5:0] i0, i1, i2, i3, i4;
	output [3:0] type;
//---------------------------------------------------

//deflaut wire 'cmp0_1~cmp3_4'	
	wire cmp0_1;
	wire cmp0_2;
	wire cmp0_3;
	wire cmp0_4;
	wire cmp1_2;
	wire cmp1_3;
	wire cmp1_4;
	wire cmp2_3;
	wire cmp2_4;
	wire cmp3_4;
//be used to save is card same or not
	
//  determine is there has two same card or not
	is_same_of_two_card is_same_000(.Z(cmp0_1), .A(i0[3:0]), .B(i1[3:0]));
	is_same_of_two_card is_same_001(.Z(cmp0_2), .A(i0[3:0]), .B(i2[3:0]));
	is_same_of_two_card is_same_002(.Z(cmp0_3), .A(i0[3:0]), .B(i3[3:0]));
	is_same_of_two_card is_same_003(.Z(cmp0_4), .A(i0[3:0]), .B(i4[3:0]));
	is_same_of_two_card is_same_004(.Z(cmp1_2), .A(i1[3:0]), .B(i2[3:0]));
	is_same_of_two_card is_same_005(.Z(cmp1_3), .A(i1[3:0]), .B(i3[3:0]));
	is_same_of_two_card is_same_006(.Z(cmp1_4), .A(i1[3:0]), .B(i4[3:0]));
	is_same_of_two_card is_same_007(.Z(cmp2_3), .A(i2[3:0]), .B(i3[3:0]));
	is_same_of_two_card is_same_008(.Z(cmp2_4), .A(i2[3:0]), .B(i4[3:0]));
	is_same_of_two_card is_same_009(.Z(cmp3_4), .A(i3[3:0]), .B(i4[3:0]));
	
	wire is_same_two_card_1;
	wire is_same_two_card_2;
	wire is_same_two_card_3;
	OR3 or_is_same_2card_1(.Z(is_same_two_card_1),.A(cmp0_1),.B(cmp0_2),.C(cmp0_3));
	OR3 or_is_same_2card_2(.Z(is_same_two_card_2),.A(cmp0_4),.B(cmp1_2),.C(cmp1_3));
	OR4 or_is_same_2card_3(.Z(is_same_two_card_3),.A(cmp1_4),.B(cmp2_3),.C(cmp2_4),.D(cmp3_4));
	
	wire is_same_card_wir;
	OR3 or_is_same_two_card(.Z(is_same_card_wir),.A(is_same_two_card_1),.B(is_same_two_card_2),.C(is_same_two_card_3));
//  output : is_same_card_wir -------------------------------------------------------------------------------------------------------------------	
	
//  determine is five card's suit same or not	
	wire cmp0_1_suit;
	wire cmp0_2_suit;
	wire cmp0_3_suit;
	wire cmp0_4_suit;

	same_suit same_suit_000(.Z(cmp0_1_suit), .A(i0[5:4]), .B(i1[5:4]));
	same_suit same_suit_001(.Z(cmp0_2_suit), .A(i0[5:4]), .B(i2[5:4]));
	same_suit same_suit_002(.Z(cmp0_3_suit), .A(i0[5:4]), .B(i3[5:4]));
	same_suit same_suit_003(.Z(cmp0_4_suit), .A(i0[5:4]), .B(i4[5:4]));
//  output : cmp0_1~cmp0_4_suit-----------------------------------------------------------------------------------------------------------------
	

//--------------------------------------四條---------------------------------------------------------  
	wire four_of_a_kind_i0_i1_i2_i3;
	wire four_of_a_kind_i1_i2_i3_i4;
	wire four_of_a_kind_i2_i3_i4_i0;
	wire four_of_a_kind_i3_i4_i0_i1;
	wire four_of_a_kind_i4_i0_i1_i2;
	
	fourOfAKind fourOfAKind_000(.Z(four_of_a_kind_i0_i1_i2_i3), .A(cmp0_1), .B(cmp0_2), .C(cmp0_3));
	fourOfAKind fourOfAKind_001(.Z(four_of_a_kind_i1_i2_i3_i4), .A(cmp1_2), .B(cmp1_3), .C(cmp1_4));
	fourOfAKind fourOfAKind_002(.Z(four_of_a_kind_i2_i3_i4_i0), .A(cmp2_3), .B(cmp2_4), .C(cmp0_2));
	fourOfAKind fourOfAKind_003(.Z(four_of_a_kind_i3_i4_i0_i1), .A(cmp3_4), .B(cmp0_3), .C(cmp1_3));
	fourOfAKind fourOfAKind_004(.Z(four_of_a_kind_i4_i0_i1_i2), .A(cmp0_4), .B(cmp1_4), .C(cmp2_4));
	
	wire four_of_a_kind_1;
	wire four_of_a_kind_2;
	OR3 OR3_fourOfAKind_1(.Z(four_of_a_kind_1),.A(four_of_a_kind_i0_i1_i2_i3),.B(four_of_a_kind_i1_i2_i3_i4),.C(four_of_a_kind_i2_i3_i4_i0));
	OR2 OR2_fourOfAKind_1(.Z(four_of_a_kind_2),.A(four_of_a_kind_i3_i4_i0_i1),.B(four_of_a_kind_i4_i0_i1_i2));
	
	wire four_of_a_kind;
	OR2 OR2_fourOfAKind(.Z(four_of_a_kind),.A(four_of_a_kind_1),.B(four_of_a_kind_2));
	
	wire four_of_a_kind_IV;
	IV IV_fourOfAKind(.Z(four_of_a_kind_IV),.A(four_of_a_kind));
//	output : four_of_a_kind, four_of_a_kind_IV---------------------------------------------------------------------------------------------------

//--------------------------------------三條、葫蘆----------------------------------------------------
	wire is_three_of_a_kind_i0_i1_i2;
	wire is_three_of_a_kind_i0_i1_i3;
	wire is_three_of_a_kind_i0_i1_i4;
	wire is_three_of_a_kind_i0_i2_i3;
	wire is_three_of_a_kind_i0_i2_i4;
	wire is_three_of_a_kind_i0_i3_i4;
	wire is_three_of_a_kind_i1_i2_i3;
	wire is_three_of_a_kind_i1_i2_i4;
	wire is_three_of_a_kind_i1_i3_i4;
	wire is_three_of_a_kind_i2_i3_i4;
	
	is_three_of_a_kind_or_fh is_three_of_a_kind_or_fh_000(.Z(is_three_of_a_kind_i0_i1_i2), .Y(is_full_house_i0_i1_i2), .A(cmp0_1), .B(cmp0_2), .C(cmp3_4));
	is_three_of_a_kind_or_fh is_three_of_a_kind_or_fh_001(.Z(is_three_of_a_kind_i0_i1_i3), .Y(is_full_house_i0_i1_i3), .A(cmp0_1), .B(cmp0_3), .C(cmp2_4));
	is_three_of_a_kind_or_fh is_three_of_a_kind_or_fh_002(.Z(is_three_of_a_kind_i0_i1_i4), .Y(is_full_house_i0_i1_i4), .A(cmp0_1), .B(cmp0_4), .C(cmp2_3));
	is_three_of_a_kind_or_fh is_three_of_a_kind_or_fh_003(.Z(is_three_of_a_kind_i0_i2_i3), .Y(is_full_house_i0_i2_i3), .A(cmp0_2), .B(cmp0_3), .C(cmp1_4));
	is_three_of_a_kind_or_fh is_three_of_a_kind_or_fh_004(.Z(is_three_of_a_kind_i0_i2_i4), .Y(is_full_house_i0_i2_i4), .A(cmp0_2), .B(cmp0_4), .C(cmp1_3));
	is_three_of_a_kind_or_fh is_three_of_a_kind_or_fh_005(.Z(is_three_of_a_kind_i0_i3_i4), .Y(is_full_house_i0_i3_i4), .A(cmp0_3), .B(cmp0_4), .C(cmp1_2));
	is_three_of_a_kind_or_fh is_three_of_a_kind_or_fh_006(.Z(is_three_of_a_kind_i1_i2_i3), .Y(is_full_house_i1_i2_i3), .A(cmp1_2), .B(cmp1_3), .C(cmp0_4));
	is_three_of_a_kind_or_fh is_three_of_a_kind_or_fh_007(.Z(is_three_of_a_kind_i1_i2_i4), .Y(is_full_house_i1_i2_i4), .A(cmp1_2), .B(cmp1_4), .C(cmp0_3));
	is_three_of_a_kind_or_fh is_three_of_a_kind_or_fh_008(.Z(is_three_of_a_kind_i1_i3_i4), .Y(is_full_house_i1_i3_i4), .A(cmp1_3), .B(cmp1_4), .C(cmp0_2));
	is_three_of_a_kind_or_fh is_three_of_a_kind_or_fh_009(.Z(is_three_of_a_kind_i2_i3_i4), .Y(is_full_house_i2_i3_i4), .A(cmp2_3), .B(cmp2_4), .C(cmp0_1));

	wire is_three_of_a_kind_1;
	wire is_three_of_a_kind_2;
	wire is_three_of_a_kind_3;
	OR3 or_three_of_a_kind_1(.Z(is_three_of_a_kind_1),.A(is_three_of_a_kind_i0_i1_i2),.B(is_three_of_a_kind_i0_i1_i3),.C(is_three_of_a_kind_i0_i1_i4));
	OR3 or_three_of_a_kind_2(.Z(is_three_of_a_kind_2),.A(is_three_of_a_kind_i0_i2_i3),.B(is_three_of_a_kind_i0_i2_i4),.C(is_three_of_a_kind_i0_i3_i4));
	OR4 or_three_of_a_kind_3(.Z(is_three_of_a_kind_3),.A(is_three_of_a_kind_i1_i2_i3),.B(is_three_of_a_kind_i1_i2_i4),.C(is_three_of_a_kind_i1_i3_i4),.D(is_three_of_a_kind_i2_i3_i4));
	
	wire is_three_of_a_kind_temp;
	OR3 or_three_of_a_kind_4(.Z(is_three_of_a_kind_temp),.A(is_three_of_a_kind_1),.B(is_three_of_a_kind_2),.C(is_three_of_a_kind_3));
	
	wire is_three_of_a_kind;
	AN2 an_three_of_a_kind(.Z(is_three_of_a_kind),.A(is_three_of_a_kind_temp),.B(four_of_a_kind_IV));
	//------------------------------------------------------------------------------------------------------------------------------------------------------
	


	//葫蘆
	wire is_full_house_i0_i1_i2;
	wire is_full_house_i0_i1_i3;
	wire is_full_house_i0_i1_i4;
	wire is_full_house_i0_i2_i3;
	wire is_full_house_i0_i2_i4;
	wire is_full_house_i0_i3_i4;
	wire is_full_house_i1_i2_i3;
	wire is_full_house_i1_i2_i4;
	wire is_full_house_i1_i3_i4;
	wire is_full_house_i2_i3_i4;

	wire is_full_house_1;
	wire is_full_house_2;
	wire is_full_house_3;
	OR3 or_fullHouse_1(.Z(is_full_house_1),.A(is_full_house_i0_i1_i2),.B(is_full_house_i0_i1_i3),.C(is_full_house_i0_i1_i4));
	OR3 or_fullHouse_2(.Z(is_full_house_2),.A(is_full_house_i0_i2_i3),.B(is_full_house_i0_i2_i4),.C(is_full_house_i0_i3_i4));
	OR4 or_fullHouse_3(.Z(is_full_house_3),.A(is_full_house_i1_i2_i3),.B(is_full_house_i1_i2_i4),.C(is_full_house_i1_i3_i4),.D(is_full_house_i2_i3_i4));
	
	wire is_full_house;
	OR3 or_fullHouse4(.Z(is_full_house),.A(is_full_house_1),.B(is_full_house_2),.C(is_full_house_3));
	
	wire is_full_house_IV;
	IV IV_fullHouse(.Z(is_full_house_IV),.A(is_full_house));
	//-----------------------------------------------------------------------------------------------------------------------------------------------------
//	output : is_full_house、is_full_house_IV、is_three_of_a_kind------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	
	
//--------------------------------------對子----------------------------------------------------------	
	wire a_pair_wir_i0_i1;
	wire a_pair_wir_i0_i2;
	wire a_pair_wir_i0_i3;
	wire a_pair_wir_i0_i4;
	wire a_pair_wir_i1_i2;
	wire a_pair_wir_i1_i3;
	wire a_pair_wir_i1_i4;
	wire a_pair_wir_i2_i3;
	wire a_pair_wir_i2_i4;
	wire a_pair_wir_i3_i4;
	
	OnePair OnePair_000(.Z(a_pair_wir_i0_i1), .A(cmp0_1), .B(cmp2_3), .C(cmp2_4), .D(cmp3_4));
	OnePair OnePair_001(.Z(a_pair_wir_i0_i2), .A(cmp0_2), .B(cmp1_3), .C(cmp1_4), .D(cmp3_4));
	OnePair OnePair_002(.Z(a_pair_wir_i0_i3), .A(cmp0_3), .B(cmp1_2), .C(cmp1_4), .D(cmp2_4));
	OnePair OnePair_003(.Z(a_pair_wir_i0_i4), .A(cmp0_4), .B(cmp1_2), .C(cmp1_3), .D(cmp2_3));
	OnePair OnePair_004(.Z(a_pair_wir_i1_i2), .A(cmp1_2), .B(cmp0_3), .C(cmp0_4), .D(cmp3_4));
	OnePair OnePair_005(.Z(a_pair_wir_i1_i3), .A(cmp1_3), .B(cmp0_2), .C(cmp0_4), .D(cmp2_4));
	OnePair OnePair_006(.Z(a_pair_wir_i1_i4), .A(cmp1_4), .B(cmp0_2), .C(cmp0_3), .D(cmp2_3));
	OnePair OnePair_007(.Z(a_pair_wir_i2_i3), .A(cmp2_3), .B(cmp0_1), .C(cmp0_4), .D(cmp1_4));
	OnePair OnePair_008(.Z(a_pair_wir_i2_i4), .A(cmp2_4), .B(cmp0_1), .C(cmp0_3), .D(cmp1_3));
	OnePair OnePair_009(.Z(a_pair_wir_i3_i4), .A(cmp3_4), .B(cmp0_1), .C(cmp0_2), .D(cmp1_2));
	
	wire a_pair_wir_1;
	wire a_pair_wir_2;
	wire a_pair_wir_3;
	OR3 or3_OnePair_1(.Z(a_pair_wir_1),.A(a_pair_wir_i0_i1),.B(a_pair_wir_i0_i2),.C(a_pair_wir_i0_i3));
	OR3 or3_OnePair_2(.Z(a_pair_wir_2),.A(a_pair_wir_i0_i4),.B(a_pair_wir_i1_i2),.C(a_pair_wir_i1_i3));
	OR4 or4_OnePair_1(.Z(a_pair_wir_3),.A(a_pair_wir_i1_i4),.B(a_pair_wir_i2_i3),.C(a_pair_wir_i2_i4),.D(a_pair_wir_i3_i4));
	
	wire a_pair_wir_temp;
	OR3 or3_OnePair(.Z(a_pair_wir_temp),.A(a_pair_wir_1),.B(a_pair_wir_2),.C(a_pair_wir_3));
	
	wire is_a_pair;
	AN2 an_OnePair(.Z(is_a_pair),.A(a_pair_wir_temp),.B(is_full_house_IV));
//	output : is_a_pair------------------------------------------------------------------------------------------------------------------------------------

//---------------------------兩對-------------------------------------------------------------------------------------------------	
	wire two_pair_temp;
	NR4(.Z(two_pair_temp),.A(is_a_pair),.B(is_three_of_a_kind),.C(is_full_house),.D(four_of_a_kind));
	wire is_two_pair;
	AN2(.Z(is_two_pair),.A(two_pair_temp),.B(is_same_card_wir));
//	output : is_two_pair----------------------------------------------------------------------------------------------------------------------------------

//------------------------同花------------------------------------------------------------------------------------
	wire is_flush_temp;
	flush flush_000(.Z(is_flush_temp), .A(cmp0_1_suit), .B(cmp0_2_suit), .C(cmp0_3_suit), .D(cmp0_4_suit));
	IV IV_flush(.Z(is_flush_temp_IV),.A(is_flush_temp));
	
	wire is_flush;
	AN2 an2_flush(.Z(is_flush),.A(is_flush_temp),.B(is_straight_temp_IV));
//	output : is_flush-----------------------------------------------------------------------------------------------------------------

//----------------------順子---------------------------------------------------------------------------------------
	wire is_straight_temp;
	straight straight(.Z(is_straight_temp), .A(i0[3:0]), .B(i1[3:0]), .C(i2[3:0]), .D(i3[3:0]), .E(i4[3:0]));
	
	wire is_straight_temp_IV;
	IV IV_straight(.Z(is_straight_temp_IV),.A(is_straight_temp));
	
	wire is_straight;
	AN2 AN2_straight(.Z(is_straight),.A(is_straight_temp),.B(is_flush_temp_IV));
//	output : is_straight、is_straight_IV------------------------------------------------------------------------------------------------------------------
	
//------------------------------------output------------------------------------------------------
	//[0]
	OR4 OR4_final_00(.Z(type[0]),.A(is_a_pair),.B(is_three_of_a_kind),.C(is_flush),.D(four_of_a_kind));
	//[1]
	OR4 OR4_final_01(.Z(type[1]),.A(is_two_pair),.B(is_three_of_a_kind),.C(is_full_house),.D(four_of_a_kind));
	//[2]
	OR4 OR4_final_02(.Z(type[2]),.A(is_straight),.B(is_flush),.C(is_full_house),.D(four_of_a_kind));
	//[3]
	AN2 AN2_straightFlush(.Z(type[3]),.A(is_straight_temp),.B(is_flush_temp));
//------------------------------------------------------------------------------------------------
endmodule



// -----------------------------------module-------------------------------------------------------//
module OnePair(Z, A, B, C, D); 
	input A, B, C, D;
	output Z;
	
	wire is_a_pair_0;
	IV IV_OnePair_000(.Z(is_a_pair_0), .A(A));
	NR4 NR4_OnePair_000(.Z(Z), .A(is_a_pair_0), .B(B), .C(C), .D(D)); //Pair
	
endmodule

module is_three_of_a_kind_or_fh(Z, Y, A, B, C); 
	input A, B, C;
	output Z, Y;
	
	wire is_three_of_a_kind_or_fh_0;

	IV IV_is_three_of_a_kind_or_fh_000(.Z(is_three_of_a_kind_or_fh_0), .A(C));
	
	AN3 AN3_is_three_of_a_kind_or_fh_000(.Z(Y), .A(A), .B(B), .C(C)); //FullHouse
	AN3 AN3_is_three_of_a_kind_or_fh_001(.Z(Z), .A(A), .B(B), .C(is_three_of_a_kind_or_fh_0)); //threeOfAKind
	
endmodule

module fourOfAKind(Z, A, B, C);

	input A, B, C;
	output Z;
	
	AN3 AN3_fourOfAKind_000(.Z(Z), .A(A), .B(B), .C(C));

endmodule

module is_same_of_two_card(Z, A, B);

	input [3:0] A, B;
	output Z;
	
	wire is_same_mod_wire_0;
	wire is_same_mod_wire_1;
	wire is_same_mod_wire_2;
	wire is_same_mod_wire_3;
	wire is_same_mod_wire_4;	
	wire is_same_mod_wire_5;
	wire is_same_mod_wire_6;
	wire is_same_mod_wire_7;
	
	EO EO_equal_2card_000(.Z(is_same_mod_wire_0), .A(A[0]), .B(B[0]));
	EO EO_equal_2card_001(.Z(is_same_mod_wire_1), .A(A[1]), .B(B[1]));
	EO EO_equal_2card_002(.Z(is_same_mod_wire_2), .A(A[2]), .B(B[2]));
	EO EO_equal_2card_003(.Z(is_same_mod_wire_3), .A(A[3]), .B(B[3]));
	IV IV_equal_2card_000(.Z(is_same_mod_wire_4), .A(is_same_mod_wire_0));
	IV IV_equal_2card_001(.Z(is_same_mod_wire_5), .A(is_same_mod_wire_1));
	IV IV_equal_2card_002(.Z(is_same_mod_wire_6), .A(is_same_mod_wire_2));
	IV IV_equal_2card_003(.Z(is_same_mod_wire_7), .A(is_same_mod_wire_3));
	AN4 AN4_equal_2card_000(.Z(Z),.A(is_same_mod_wire_4),.B(is_same_mod_wire_5),.C(is_same_mod_wire_6),.D(is_same_mod_wire_7));

endmodule

module same_suit(Z, A, B);

	input [1:0] A, B;
	output Z;
	
	wire wir_same_suit_0;
	wire wir_same_suit_1;
	wire wir_same_suit_2;
	wire wir_same_suit_3;
	
	EO EO_same_suit_000(.Z(wir_equal_2card_0), .A(A[0]), .B(B[0]));
	EO EO_same_suit_001(.Z(wir_equal_2card_1), .A(A[1]), .B(B[1]));

	IV IV_same_suit_000(.Z(wir_same_suit_2), .A(wir_equal_2card_0));
	IV IV_same_suit_001(.Z(wir_same_suit_3), .A(wir_equal_2card_1));

	AN2 AN2_same_suit_000(.Z(Z),.A(wir_same_suit_2),.B(wir_same_suit_3));
	
endmodule

module flush(Z, A, B, C, D);

	input [1:0] A, B, C, D;
	output Z;
	
	AN4 AN4_flush_000(.Z(Z), .A(A), .B(B), .C(C), .D(D));
	
endmodule

module straight( Z, A, B, C, D, E);

	input [3:0] A, B, C, D, E;
	output Z;
	
	wire [4:0] wir_one_order;
	IV IV_hasStraight_001(.Z(wir_one_order[0]), .A(A[0]));
	IV IV_hasStraight_002(.Z(wir_one_order[1]), .A(B[0]));
	IV IV_hasStraight_003(.Z(wir_one_order[2]), .A(C[0]));
	IV IV_hasStraight_004(.Z(wir_one_order[3]), .A(D[0]));
	IV IV_hasStraight_005(.Z(wir_one_order[4]), .A(E[0]));
	
	wire [4:0] wir_two_order;
	IV IV_hasStraight_006(.Z(wir_two_order[0]), .A(A[1]));
	IV IV_hasStraight_007(.Z(wir_two_order[1]), .A(B[1]));
	IV IV_hasStraight_008(.Z(wir_two_order[2]), .A(C[1]));
	IV IV_hasStraight_009(.Z(wir_two_order[3]), .A(D[1]));
	IV IV_hasStraight_010(.Z(wir_two_order[4]), .A(E[1]));
	
	wire [4:0] wir_three_order;
	IV IV_hasStraight_011(.Z(wir_three_order[0]), .A(A[2]));
	IV IV_hasStraight_012(.Z(wir_three_order[1]), .A(B[2]));
	IV IV_hasStraight_013(.Z(wir_three_order[2]), .A(C[2]));
	IV IV_hasStraight_014(.Z(wir_three_order[3]), .A(D[2]));
	IV IV_hasStraight_015(.Z(wir_three_order[4]), .A(E[2]));
	
	wire [4:0] wir_four_order;
	IV IV_hasStraight_016(.Z(wir_four_order[0]), .A(A[3]));
	IV IV_hasStraight_017(.Z(wir_four_order[1]), .A(B[3]));
	IV IV_hasStraight_018(.Z(wir_four_order[2]), .A(C[3]));
	IV IV_hasStraight_019(.Z(wir_four_order[3]), .A(D[3]));
	IV IV_hasStraight_020(.Z(wir_four_order[4]), .A(E[3]));

// 檢查是否有1~13任一數字
//1
	wire [4:0] wir_has1_001;
	NR4 NR4_has1_000(.Z(wir_has1_001[0]),.A(A[3]),.B(A[2]),.C(A[1]),.D(wir_one_order[0]));
	NR4 NR4_has1_001(.Z(wir_has1_001[1]),.A(B[3]),.B(B[2]),.C(B[1]),.D(wir_one_order[1]));
	NR4 NR4_has1_002(.Z(wir_has1_001[2]),.A(C[3]),.B(C[2]),.C(C[1]),.D(wir_one_order[2]));
	NR4 NR4_has1_003(.Z(wir_has1_001[3]),.A(D[3]),.B(D[2]),.C(D[1]),.D(wir_one_order[3]));
	NR4 NR4_has1_004(.Z(wir_has1_001[4]),.A(E[3]),.B(E[2]),.C(E[1]),.D(wir_one_order[4]));
	
	wire [1:0] wir_has1_002;
	OR3 OR3_has1_000(.Z(wir_has1_002[0]),.A(wir_has1_001[0]),.B(wir_has1_001[1]),.C(wir_has1_001[2]));
	OR2 OR2_has1_001(.Z(wir_has1_002[1]),.A(wir_has1_001[3]),.B(wir_has1_001[4]));
	
	wire has1;
	OR2 OR2_has1_002(.Z(has1),.A(wir_has1_002[0]),.B(wir_has1_002[1]));
//2	
	wire [4:0] wir_has2_001;
	NR4 NR4_has2_000(.Z(wir_has2_001[0]),.A(A[3]),.B(A[2]),.C(wir_two_order[0]),.D(A[0]));
	NR4 NR4_has2_001(.Z(wir_has2_001[1]),.A(B[3]),.B(B[2]),.C(wir_two_order[1]),.D(B[0]));
	NR4 NR4_has2_002(.Z(wir_has2_001[2]),.A(C[3]),.B(C[2]),.C(wir_two_order[2]),.D(C[0]));
	NR4 NR4_has2_003(.Z(wir_has2_001[3]),.A(D[3]),.B(D[2]),.C(wir_two_order[3]),.D(D[0]));
	NR4 NR4_has2_004(.Z(wir_has2_001[4]),.A(E[3]),.B(E[2]),.C(wir_two_order[4]),.D(E[0]));
	
	wire [1:0] wir_has2_002;
	OR3 OR3_has2_000(.Z(wir_has2_002[0]),.A(wir_has2_001[0]),.B(wir_has2_001[1]),.C(wir_has2_001[2]));
	OR2 OR2_has2_001(.Z(wir_has2_002[1]),.A(wir_has2_001[3]),.B(wir_has2_001[4]));
	
	wire has2;
	OR2 OR2_has2_002(.Z(has2),.A(wir_has2_002[0]),.B(wir_has2_002[1]));
//3	
	wire [4:0] wir_has3_001;
	NR4 NR4_has3_000(.Z(wir_has3_001[0]),.A(A[3]),.B(A[2]),.C(wir_two_order[0]),.D(wir_one_order[0]));
	NR4 NR4_has3_001(.Z(wir_has3_001[1]),.A(B[3]),.B(B[2]),.C(wir_two_order[1]),.D(wir_one_order[1]));
	NR4 NR4_has3_002(.Z(wir_has3_001[2]),.A(C[3]),.B(C[2]),.C(wir_two_order[2]),.D(wir_one_order[2]));
	NR4 NR4_has3_003(.Z(wir_has3_001[3]),.A(D[3]),.B(D[2]),.C(wir_two_order[3]),.D(wir_one_order[3]));
	NR4 NR4_has3_004(.Z(wir_has3_001[4]),.A(E[3]),.B(E[2]),.C(wir_two_order[4]),.D(wir_one_order[4]));
	
	wire [1:0] wir_has3_002;
	OR3 OR3_has3_000(.Z(wir_has3_002[0]),.A(wir_has3_001[0]),.B(wir_has3_001[1]),.C(wir_has3_001[2]));
	OR2 OR2_has3_001(.Z(wir_has3_002[1]),.A(wir_has3_001[3]),.B(wir_has3_001[4]));
	
	wire has3;
	OR2 OR2_has3_002(.Z(has3),.A(wir_has3_002[0]),.B(wir_has3_002[1]));
//4	
	wire [4:0] wir_has4_001;
	NR4 NR4_has4_000(.Z(wir_has4_001[0]),.A(A[3]),.B(wir_three_order[0]),.C(A[1]),.D(A[0]));
	NR4 NR4_has4_001(.Z(wir_has4_001[1]),.A(B[3]),.B(wir_three_order[1]),.C(B[1]),.D(B[0]));
	NR4 NR4_has4_002(.Z(wir_has4_001[2]),.A(C[3]),.B(wir_three_order[2]),.C(C[1]),.D(C[0]));
	NR4 NR4_has4_003(.Z(wir_has4_001[3]),.A(D[3]),.B(wir_three_order[3]),.C(D[1]),.D(D[0]));
	NR4 NR4_has4_004(.Z(wir_has4_001[4]),.A(E[3]),.B(wir_three_order[4]),.C(E[1]),.D(E[0]));
	
	wire [1:0] wir_has4_002;
	OR3 OR3_has4_000(.Z(wir_has4_002[0]),.A(wir_has4_001[0]),.B(wir_has4_001[1]),.C(wir_has4_001[2]));
	OR2 OR2_has4_001(.Z(wir_has4_002[1]),.A(wir_has4_001[3]),.B(wir_has4_001[4]));
	
	wire has4;
	OR2 OR2_has4_002(.Z(has4),.A(wir_has4_002[0]),.B(wir_has4_002[1]));
//5	
	wire [4:0] wir_has5_001;
	NR4 NR4_has5_000(.Z(wir_has5_001[0]),.A(A[3]),.B(wir_three_order[0]),.C(A[1]),.D(wir_one_order[0]));
	NR4 NR4_has5_001(.Z(wir_has5_001[1]),.A(B[3]),.B(wir_three_order[1]),.C(B[1]),.D(wir_one_order[1]));
	NR4 NR4_has5_002(.Z(wir_has5_001[2]),.A(C[3]),.B(wir_three_order[2]),.C(C[1]),.D(wir_one_order[2]));
	NR4 NR4_has5_003(.Z(wir_has5_001[3]),.A(D[3]),.B(wir_three_order[3]),.C(D[1]),.D(wir_one_order[3]));
	NR4 NR4_has5_004(.Z(wir_has5_001[4]),.A(E[3]),.B(wir_three_order[4]),.C(E[1]),.D(wir_one_order[4]));
	
	wire [1:0] wir_has5_002;
	OR3 OR3_has5_000(.Z(wir_has5_002[0]),.A(wir_has5_001[0]),.B(wir_has5_001[1]),.C(wir_has5_001[2]));
	OR2 OR2_has5_001(.Z(wir_has5_002[1]),.A(wir_has5_001[3]),.B(wir_has5_001[4]));
	
	wire has5;
	OR2 OR2_has5_002(.Z(has5),.A(wir_has5_002[0]),.B(wir_has5_002[1]));
//6	
	wire [4:0] wir_has6_001;
	NR4 NR4_has6_000(.Z(wir_has6_001[0]),.A(A[3]),.B(wir_three_order[0]),.C(wir_two_order[0]),.D(A[0]));
	NR4 NR4_has6_001(.Z(wir_has6_001[1]),.A(B[3]),.B(wir_three_order[1]),.C(wir_two_order[1]),.D(B[0]));
	NR4 NR4_has6_002(.Z(wir_has6_001[2]),.A(C[3]),.B(wir_three_order[2]),.C(wir_two_order[2]),.D(C[0]));
	NR4 NR4_has6_003(.Z(wir_has6_001[3]),.A(D[3]),.B(wir_three_order[3]),.C(wir_two_order[3]),.D(D[0]));
	NR4 NR4_has6_004(.Z(wir_has6_001[4]),.A(E[3]),.B(wir_three_order[4]),.C(wir_two_order[4]),.D(E[0]));
	
	wire [1:0] wir_has6_002;
	OR3 OR3_has6_000(.Z(wir_has6_002[0]),.A(wir_has6_001[0]),.B(wir_has6_001[1]),.C(wir_has6_001[2]));
	OR2 OR2_has6_001(.Z(wir_has6_002[1]),.A(wir_has6_001[3]),.B(wir_has6_001[4]));
	
	wire has6;
	OR2 OR2_has6_002(.Z(has6),.A(wir_has6_002[0]),.B(wir_has6_002[1]));
//7	
	wire [4:0] wir_has7_001;
	NR4 NR4_has7_000(.Z(wir_has7_001[0]),.A(A[3]),.B(wir_three_order[0]),.C(wir_two_order[0]),.D(wir_one_order[0]));
	NR4 NR4_has7_001(.Z(wir_has7_001[1]),.A(B[3]),.B(wir_three_order[1]),.C(wir_two_order[1]),.D(wir_one_order[1]));
	NR4 NR4_has7_002(.Z(wir_has7_001[2]),.A(C[3]),.B(wir_three_order[2]),.C(wir_two_order[2]),.D(wir_one_order[2]));
	NR4 NR4_has7_003(.Z(wir_has7_001[3]),.A(D[3]),.B(wir_three_order[3]),.C(wir_two_order[3]),.D(wir_one_order[3]));
	NR4 NR4_has7_004(.Z(wir_has7_001[4]),.A(E[3]),.B(wir_three_order[4]),.C(wir_two_order[4]),.D(wir_one_order[4]));
	
	wire [1:0] wir_has7_002;
	OR3 OR3_has7_000(.Z(wir_has7_002[0]),.A(wir_has7_001[0]),.B(wir_has7_001[1]),.C(wir_has7_001[2]));
	OR2 OR2_has7_001(.Z(wir_has7_002[1]),.A(wir_has7_001[3]),.B(wir_has7_001[4]));
	
	wire has7;
	OR2 OR2_has7_002(.Z(has7),.A(wir_has7_002[0]),.B(wir_has7_002[1]));
//8	
	wire [4:0] wir_has8_001;
	NR4 NR4_has8_000(.Z(wir_has8_001[0]),.A(wir_four_order[0]),.B(A[2]),.C(A[1]),.D(A[0]));
	NR4 NR4_has8_001(.Z(wir_has8_001[1]),.A(wir_four_order[1]),.B(B[2]),.C(B[1]),.D(B[0]));
	NR4 NR4_has8_002(.Z(wir_has8_001[2]),.A(wir_four_order[2]),.B(C[2]),.C(C[1]),.D(C[0]));
	NR4 NR4_has8_003(.Z(wir_has8_001[3]),.A(wir_four_order[3]),.B(D[2]),.C(D[1]),.D(D[0]));
	NR4 NR4_has8_004(.Z(wir_has8_001[4]),.A(wir_four_order[4]),.B(E[2]),.C(E[1]),.D(E[0]));
	
	wire [1:0] wir_has8_002;
	OR3 OR3_has8_000(.Z(wir_has8_002[0]),.A(wir_has8_001[0]),.B(wir_has8_001[1]),.C(wir_has8_001[2]));
	OR2 OR2_has8_001(.Z(wir_has8_002[1]),.A(wir_has8_001[3]),.B(wir_has8_001[4]));
	
	wire has8;
	OR2 OR2_has8_002(.Z(has8),.A(wir_has8_002[0]),.B(wir_has8_002[1]));
//9	
	wire [4:0] wir_has9_001;
	NR4 NR4_has9_000(.Z(wir_has9_001[0]),.A(wir_four_order[0]),.B(A[2]),.C(A[1]),.D(wir_one_order[0]));
	NR4 NR4_has9_001(.Z(wir_has9_001[1]),.A(wir_four_order[1]),.B(B[2]),.C(B[1]),.D(wir_one_order[1]));
	NR4 NR4_has9_002(.Z(wir_has9_001[2]),.A(wir_four_order[2]),.B(C[2]),.C(C[1]),.D(wir_one_order[2]));
	NR4 NR4_has9_003(.Z(wir_has9_001[3]),.A(wir_four_order[3]),.B(D[2]),.C(D[1]),.D(wir_one_order[3]));
	NR4 NR4_has9_004(.Z(wir_has9_001[4]),.A(wir_four_order[4]),.B(E[2]),.C(E[1]),.D(wir_one_order[4]));
	
	wire [1:0] wir_has9_002;
	OR3 OR3_has9_000(.Z(wir_has9_002[0]),.A(wir_has9_001[0]),.B(wir_has9_001[1]),.C(wir_has9_001[2]));
	OR2 OR2_has9_001(.Z(wir_has9_002[1]),.A(wir_has9_001[3]),.B(wir_has9_001[4]));
	
	wire has9;
	OR2 OR2_has9_002(.Z(has9),.A(wir_has9_002[0]),.B(wir_has9_002[1]));
//10
	wire [4:0] wir_has10_001;
	AN4 AN4_has10_000(.Z(wir_has10_001[0]),.A(A[3]),.B(wir_three_order[0]),.C(A[1]),.D(wir_one_order[0]));
	AN4 AN4_has10_001(.Z(wir_has10_001[1]),.A(B[3]),.B(wir_three_order[1]),.C(B[1]),.D(wir_one_order[1]));
	AN4 AN4_has10_002(.Z(wir_has10_001[2]),.A(C[3]),.B(wir_three_order[2]),.C(C[1]),.D(wir_one_order[2]));
	AN4 AN4_has10_003(.Z(wir_has10_001[3]),.A(D[3]),.B(wir_three_order[3]),.C(D[1]),.D(wir_one_order[3]));
	AN4 AN4_has10_004(.Z(wir_has10_001[4]),.A(E[3]),.B(wir_three_order[4]),.C(E[1]),.D(wir_one_order[4]));
	
	wire [1:0] wir_has10_002;
	OR3 OR3_has10_000(.Z(wir_has10_002[0]),.A(wir_has10_001[0]),.B(wir_has10_001[1]),.C(wir_has10_001[2]));
	OR2 OR2_has10_001(.Z(wir_has10_002[1]),.A(wir_has10_001[3]),.B(wir_has10_001[4]));
	
	wire has10;
	OR2 OR2_has10_002(.Z(has10),.A(wir_has10_002[0]),.B(wir_has10_002[1]));
//11
	wire [4:0] wir_has11_001;
	AN4 AN4_has11_000(.Z(wir_has11_001[0]),.A(A[3]),.B(wir_three_order[0]),.C(A[1]),.D(A[0]));
	AN4 AN4_has11_001(.Z(wir_has11_001[1]),.A(B[3]),.B(wir_three_order[1]),.C(B[1]),.D(B[0]));
	AN4 AN4_has11_002(.Z(wir_has11_001[2]),.A(C[3]),.B(wir_three_order[2]),.C(C[1]),.D(C[0]));
	AN4 AN4_has11_003(.Z(wir_has11_001[3]),.A(D[3]),.B(wir_three_order[3]),.C(D[1]),.D(D[0]));
	AN4 AN4_has11_004(.Z(wir_has11_001[4]),.A(E[3]),.B(wir_three_order[4]),.C(E[1]),.D(E[0]));
	
	wire [1:0] wir_has11_002;
	OR3 OR3_has11_000(.Z(wir_has11_002[0]),.A(wir_has11_001[0]),.B(wir_has11_001[1]),.C(wir_has11_001[2]));
	OR2 OR2_has11_001(.Z(wir_has11_002[1]),.A(wir_has11_001[3]),.B(wir_has11_001[4]));
	
	wire has11;
	OR2 OR2_has11_002(.Z(has11),.A(wir_has11_002[0]),.B(wir_has11_002[1]));
//12
	wire [4:0] wir_has12_001;
	AN4 AN4_has12_000(.Z(wir_has12_001[0]),.A(A[3]),.B(A[2]),.C(wir_two_order[0]),.D(wir_one_order[0]));
	AN4 AN4_has12_001(.Z(wir_has12_001[1]),.A(B[3]),.B(B[2]),.C(wir_two_order[1]),.D(wir_one_order[1]));
	AN4 AN4_has12_002(.Z(wir_has12_001[2]),.A(C[3]),.B(C[2]),.C(wir_two_order[2]),.D(wir_one_order[2]));
	AN4 AN4_has12_003(.Z(wir_has12_001[3]),.A(D[3]),.B(D[2]),.C(wir_two_order[3]),.D(wir_one_order[3]));
	AN4 AN4_has12_004(.Z(wir_has12_001[4]),.A(E[3]),.B(E[2]),.C(wir_two_order[4]),.D(wir_one_order[4]));
	
	wire [1:0] wir_has12_002;
	OR3 OR3_has12_000(.Z(wir_has12_002[0]),.A(wir_has12_001[0]),.B(wir_has12_001[1]),.C(wir_has12_001[2]));
	OR2 OR2_has12_001(.Z(wir_has12_002[1]),.A(wir_has12_001[3]),.B(wir_has12_001[4]));
	
	wire has12;
	OR2 OR2_has12_002(.Z(has12),.A(wir_has12_002[0]),.B(wir_has12_002[1]));
//13
	wire [4:0] wir_has13_001;
	AN4 AN4_has13_000(.Z(wir_has13_001[0]),.A(A[3]),.B(A[2]),.C(wir_two_order[0]),.D(A[0]));
	AN4 AN4_has13_001(.Z(wir_has13_001[1]),.A(B[3]),.B(B[2]),.C(wir_two_order[1]),.D(B[0]));
	AN4 AN4_has13_002(.Z(wir_has13_001[2]),.A(C[3]),.B(C[2]),.C(wir_two_order[2]),.D(C[0]));
	AN4 AN4_has13_003(.Z(wir_has13_001[3]),.A(D[3]),.B(D[2]),.C(wir_two_order[3]),.D(D[0]));
	AN4 AN4_has13_004(.Z(wir_has13_001[4]),.A(E[3]),.B(E[2]),.C(wir_two_order[4]),.D(E[0]));
	
	wire [1:0] wir_has13_002;
	OR3 OR3_has13_000(.Z(wir_has13_002[0]),.A(wir_has13_001[0]),.B(wir_has13_001[1]),.C(wir_has13_001[2]));
	OR2 OR2_has13_001(.Z(wir_has13_002[1]),.A(wir_has13_001[3]),.B(wir_has13_001[4]));
	
	wire has13;
	OR2 OR2_has13_002(.Z(has13),.A(wir_has13_002[0]),.B(wir_has13_002[1]));

// 檢查所有順子組合
// 1 2 3 4 5
	wire [1:0] wir_has12345_000;
	wire wir_has12345;
	AN3 AN3_has12345_000(.Z(wir_has12345_000[0]),.A(has1),.B(has2),.C(has3));
	AN2 AN2_has12345_001(.Z(wir_has12345_000[1]),.A(has4),.B(has5));
	AN2 AN2_has12345_002(.Z(wir_has12345),.A(wir_has12345_000[0]),.B(wir_has12345_000[1]));
// 2 3 4 5 6
	wire [1:0] wir_has23456_000;
	wire wir_has23456;
	AN3 AN3_has23456_000(.Z(wir_has23456_000[0]),.A(has2),.B(has3),.C(has4));
	AN2 AN2_has23456_001(.Z(wir_has23456_000[1]),.A(has5),.B(has6));
	AN2 AN2_has23456_002(.Z(wir_has23456),.A(wir_has23456_000[0]),.B(wir_has23456_000[1]));
// 3 4 5 6 7
	wire [1:0] wir_has34567_000;
	wire wir_has34567;
	AN3 AN3_has34567_000(.Z(wir_has34567_000[0]),.A(has3),.B(has4),.C(has5));
	AN2 AN2_has34567_001(.Z(wir_has34567_000[1]),.A(has6),.B(has7));
	AN2 AN2_has34567_002(.Z(wir_has34567),.A(wir_has34567_000[0]),.B(wir_has34567_000[1]));
// 4 5 6 7 8
	wire [1:0] wir_has45678_000;
	wire wir_has45678;
	AN3 AN3_has45678_000(.Z(wir_has45678_000[0]),.A(has4),.B(has5),.C(has6));
	AN2 AN2_has45678_001(.Z(wir_has45678_000[1]),.A(has7),.B(has8));
	AN2 AN2_has45678_002(.Z(wir_has45678),.A(wir_has45678_000[0]),.B(wir_has45678_000[1]));
// 5 6 7 8 9
	wire [1:0] wir_has56789_000;
	wire wir_has56789;
	AN3 AN3_has56789_000(.Z(wir_has56789_000[0]),.A(has5),.B(has6),.C(has7));
	AN2 AN2_has56789_001(.Z(wir_has56789_000[1]),.A(has8),.B(has9));
	AN2 AN2_has56789_002(.Z(wir_has56789),.A(wir_has56789_000[0]),.B(wir_has56789_000[1]));
// 6 7 8 9 10
	wire [1:0] wir_has678910_000;
	wire wir_has678910;
	AN3 AN3_has678910_000(.Z(wir_has678910_000[0]),.A(has6),.B(has7),.C(has8));
	AN2 AN2_has678910_001(.Z(wir_has678910_000[1]),.A(has9),.B(has10));
	AN2 AN2_has678910_002(.Z(wir_has678910),.A(wir_has678910_000[0]),.B(wir_has678910_000[1]));
// 7 8 9 10 J
	wire [1:0] wir_has78910J_000;
	wire wir_has78910J;
	AN3 AN3_has78910J_000(.Z(wir_has78910J_000[0]),.A(has7),.B(has8),.C(has9));
	AN2 AN2_has78910J_001(.Z(wir_has78910J_000[1]),.A(has10),.B(has11));
	AN2 AN2_has78910J_002(.Z(wir_has78910J),.A(wir_has78910J_000[0]),.B(wir_has78910J_000[1]));
// 8 9 10 J Q
	wire [1:0] wir_has8910JQ_000;
	wire wir_has8910JQ;
	AN3 AN3_has8910JQ_000(.Z(wir_has8910JQ_000[0]),.A(has8),.B(has9),.C(has10));
	AN2 AN2_has8910JQ_001(.Z(wir_has8910JQ_000[1]),.A(has11),.B(has12));
	AN2 AN2_has8910JQ_002(.Z(wir_has8910JQ),.A(wir_has8910JQ_000[0]),.B(wir_has8910JQ_000[1]));
// 9 10 J Q K
	wire [1:0] wir_has910JQK_000;
	wire wir_has910JQK;
	AN3 AN3_has910JQK_000(.Z(wir_has910JQK_000[0]),.A(has9),.B(has10),.C(has11));
	AN2 AN2_has910JQK_001(.Z(wir_has910JQK_000[1]),.A(has12),.B(has13));
	AN2 AN2_has910JQK_002(.Z(wir_has910JQK),.A(wir_has910JQK_000[0]),.B(wir_has910JQK_000[1]));
// 10 J Q K A
	wire [1:0] wir_has10JQK1_000;
	wire wir_has10JQK1;
	AN3 AN3_has10JQK1_000(.Z(wir_has10JQK1_000[0]),.A(has10),.B(has11),.C(has12));
	AN2 AN2_has10JQK1_001(.Z(wir_has10JQK1_000[1]),.A(has13),.B(has1));
	AN2 AN2_has10JQK1_002(.Z(wir_has10JQK1),.A(wir_has10JQK1_000[0]),.B(wir_has10JQK1_000[1]));

//check is Straight or not
	
	wire [2:0] wir_hasStraight;
	OR4 OR4_hasStraight_001(.Z(wir_hasStraight[0]),.A(wir_has12345),.B(wir_has23456),.C(wir_has34567),.D(wir_has45678));
	OR4 OR4_hasStraight_002(.Z(wir_hasStraight[1]),.A(wir_has56789),.B(wir_has678910),.C(wir_has78910J),.D(wir_has8910JQ));
	OR2 OR2_hasStraight_003(.Z(wir_hasStraight[2]),.A(wir_has910JQK),.B(wir_has10JQK1));
	OR3 OR3_hasStraight_004(.Z(Z),.A(wir_hasStraight[0]),.B(wir_hasStraight[1]),.C(wir_hasStraight[2]));
	
endmodule