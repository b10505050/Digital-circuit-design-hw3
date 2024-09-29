Please click or download the file name : report.pdf to read the project


課程 : 積體電路設計(Integrated circuits)


開設校系 : 台大電機


授課教授 : 闕志達 教授


修習年度 : 112-1 


為積體電路設計課程之作業三,
內容為在限制僅能使用基本邏輯閘的情況下進行撲克牌的辨識

作業具體要求 : 


Specifications
In this homework, you are asked to design a gate-level combinational circuit that finds the type of the given hands of five given playing cards. The inputs of this circuit are five 6-bit digital values, denoted as i0, i1, i2, i3, i4. The 2 MSBs in the 6-bits indicate their suits. 0, 1, 2, and 3 refer to spades, hearts, diamonds, and clubs, respectively. While the remaining 4 bits are their ranks. Ace, Jack, Queen, and King are represented by 1, 11, 12, and 13, respectively. The output of the circuit, denoted as type, is a 4-bit unsigned number. 


There are some important things that you should notice:
 Your design should be based on the standard cells in the lib.v. All logic operations in your design MUST consist of the standard cells instead of using the operands such as “+”, ”-”, “&”, “|”, “>”, and “<”. Note that the score of HW3 will be 0 if you use any of them.


 Design your homework in the given “poker.v” file. You are NOT ALLOWED to change the filename and the header of the top module (i.e., the module name and the I/O ports).


 If your design contains more than one module, don’t create a new file for them. Just put those modules in “poker.v.”


 The output waveform will be dumped to file “poker.fsdb.” You can use nWave to examine it.


 For each set of input data, the test bench will allow your circuit to calculate the sorter outputs within 20ns. Once exceeding 20ns or detecting the correct answer from your circuit, the test bench will soon provide the new data set to your design until all 10000 data sets have been simulated.
