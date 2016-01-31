%% A %%

% Tents %
tent('Dreamer', 2, 4.5, 199).
tent('Hermite', 1, 2, 159).
tent('Family', 5, 5, 349).
tent('Expedition',  8, 8.5, 699).

% Sleeping bags %
sleepingbag('Mountain', -15, 1, 1.5, 350).
sleepingbag('Cabin', 5, 2, 5, 250).
sleepingbag('Square', -3, 1, 2.5, 150).

% Sleeping pads %
sleepingpad('Rock', 2, 0.2, 100).
sleepingpad('Pfft', 3, 0.8, 10).
sleepingpad('Heaven', 10, 0.4, 80).
sleepingpad('Moon', 5, 0.4, 50).

% Backpacks %
backpack('Trapper', 20, 250).
backpack('Prospector', 25, 220).
backpack('Air', 10, 150).
backpack('Comfort', 15, 200). 

%% B %%
buyForPaul(T, S, P, B, C) :- tent(T, _, _, TentCost),
                            sleepingbag(S, Temp, _, _, SleepingbagCost),
                            Temp =< 0,
                            sleepingpad(P, Thickness, _, SleepingpadCost),
                            Thickness >= 5,
                            backpack(B, _, BackpackCost),
                            C is (TentCost + SleepingbagCost + SleepingpadCost + BackpackCost).

%% C %%

mary(MB, MP, MBW, MPW) :- sleepingbag(MB, _, _, MBW, _),
                sleepingpad(MP, _, MPW, _).
sean(SB, SP, SBW, SPW) :- sleepingbag(SB, _, _, SBW, _),
                sleepingpad(SP, _, SPW, _).
paula(PTB, PP, PTBW, PPW) :- sleepingbag(PTB, _, 2, PTBW, _),
                sleepingpad(PP, _, PPW, _).
thomas(PTB, TP, PTBW, TPW) :- sleepingbag(PTB, _, 2, PTBW, _),
                sleepingpad(TP, _, TPW, _).
tents(T1, T2, T1W, T2W) :- tent(T1, N1, T1W, _),
                tent(T2, N2, T2W, _),
                Num is N1 + N2,
                Num > 4.
backpacks(B1, B2, B1C, B2C) :- backpack(B1, B1C ,_),
                    backpack(B2, B2C, _).


tripFor4(PersonalWeight,mary(MB,MP),sean(SB,SP), paula(PTB,PP),thomas(PTB,TP), tents( T1, T2), backpacks(B1,B2)):- tripFor4(PersonalWeight,mary(MB,MP),sean(SB,SP), paula(PTB,PP),thomas(PTB,TP), tents( T1, T2), backpacks(B1,B2), _, _).
tripFor4(PersonalWeight,mary(MB,MP),sean(SB,SP), paula(PTB,PP),thomas(PTB,TP), tents( T1, T2), backpacks(B1,B2), TotalBackpack, TotalWeight):- 
                                mary(MB, MP, MBW, MPW),
                                sean(SB, SP, SBW, SPW),
                                paula(PTB, PP, PTBW, PPW),
                                thomas(PTB, TP, PTBW, TPW),
                                tents(T1, T2, T1W, T2W),
                                backpacks(B1, B2, B1C, B2C),
                                TotalWeight is ((PersonalWeight * 4) + MBW + MPW + SBW + SPW + PTBW + PPW + TPW + T1W + T2W),
                                TotalBackpack is (B1C + B2C),
                                TotalWeight =< TotalBackpack.

%% D %%

%% package()

%% E %%

guide(GB, GP, GBW, GPW) :- sleepingbag(GB, _, _, GBW, _),
                sleepingpad(GP, _, GPW, _).

backpacks(GBP, GBC) :- backpack(GBP, GBC, _).

comfort(GuideWeight, guide(GB,GP), backpacks(GBP), N, TotalWeight, GBC) :- guide(GB, GP, GBW, GPW),
                                                        tent(_, _, TW, _),
                                                        sleepingpad('Heaven',_,SW,_),
                                                        backpacks(GBP, GBC),
                                                        TotalWeight is ((N * (SW + TW)) + GuideWeight + GBW + GPW),
                                                        TotalWeight =< GBC.