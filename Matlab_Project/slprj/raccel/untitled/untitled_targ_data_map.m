    function targMap = targDataMap(),

    ;%***********************
    ;% Create Parameter Map *
    ;%***********************
    
        nTotData      = 0; %add to this count as we go
        nTotSects     = 4;
        sectIdxOffset = 0;

        ;%
        ;% Define dummy sections & preallocate arrays
        ;%
        dumSection.nData = -1;
        dumSection.data  = [];

        dumData.logicalSrcIdx = -1;
        dumData.dtTransOffset = -1;

        ;%
        ;% Init/prealloc paramMap
        ;%
        paramMap.nSections           = nTotSects;
        paramMap.sectIdxOffset       = sectIdxOffset;
            paramMap.sections(nTotSects) = dumSection; %prealloc
        paramMap.nTotData            = -1;

        ;%
        ;% Auto data (rtP)
        ;%
            section.nData     = 3;
            section.data(3)  = dumData; %prealloc

                    ;% rtP.Extractlastbit_BitMask
                    section.data(1).logicalSrcIdx = 0;
                    section.data(1).dtTransOffset = 0;

                    ;% rtP.Extractlastbit_BitMask_aqrtnlaurj
                    section.data(2).logicalSrcIdx = 1;
                    section.data(2).dtTransOffset = 1;

                    ;% rtP.Extractlastbit1_BitMask
                    section.data(3).logicalSrcIdx = 2;
                    section.data(3).dtTransOffset = 2;

            nTotData = nTotData + section.nData;
            paramMap.sections(1) = section;
            clear section

            section.nData     = 2;
            section.data(2)  = dumData; %prealloc

                    ;% rtP.AWGNChannel_SNR
                    section.data(1).logicalSrcIdx = 3;
                    section.data(1).dtTransOffset = 0;

                    ;% rtP.AWGNChannel_SignalPower
                    section.data(2).logicalSrcIdx = 4;
                    section.data(2).dtTransOffset = 1;

            nTotData = nTotData + section.nData;
            paramMap.sections(2) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% rtP.CombinatorialLogic1_table
                    section.data(1).logicalSrcIdx = 5;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            paramMap.sections(3) = section;
            clear section

            section.nData     = 2;
            section.data(2)  = dumData; %prealloc

                    ;% rtP.Gain_Gain
                    section.data(1).logicalSrcIdx = 6;
                    section.data(1).dtTransOffset = 0;

                    ;% rtP.Gain_Gain_lpxwuyfxn3
                    section.data(2).logicalSrcIdx = 7;
                    section.data(2).dtTransOffset = 28;

            nTotData = nTotData + section.nData;
            paramMap.sections(4) = section;
            clear section


            ;%
            ;% Non-auto Data (parameter)
            ;%


        ;%
        ;% Add final counts to struct.
        ;%
        paramMap.nTotData = nTotData;



    ;%**************************
    ;% Create Block Output Map *
    ;%**************************
    
        nTotData      = 0; %add to this count as we go
        nTotSects     = 0;
        sectIdxOffset = 0;

        ;%
        ;% Define dummy sections & preallocate arrays
        ;%
        dumSection.nData = -1;
        dumSection.data  = [];

        dumData.logicalSrcIdx = -1;
        dumData.dtTransOffset = -1;

        ;%
        ;% Init/prealloc sigMap
        ;%
        sigMap.nSections           = nTotSects;
        sigMap.sectIdxOffset       = sectIdxOffset;
        sigMap.nTotData            = -1;

        ;%
        ;% Auto data (rtB)
        ;%

            ;%
            ;% Non-auto Data (signal)
            ;%


        ;%
        ;% Add final counts to struct.
        ;%
        sigMap.nTotData = nTotData;



    ;%*******************
    ;% Create DWork Map *
    ;%*******************
    
        nTotData      = 0; %add to this count as we go
        nTotSects     = 8;
        sectIdxOffset = 0;

        ;%
        ;% Define dummy sections & preallocate arrays
        ;%
        dumSection.nData = -1;
        dumSection.data  = [];

        dumData.logicalSrcIdx = -1;
        dumData.dtTransOffset = -1;

        ;%
        ;% Init/prealloc dworkMap
        ;%
        dworkMap.nSections           = nTotSects;
        dworkMap.sectIdxOffset       = sectIdxOffset;
            dworkMap.sections(nTotSects) = dumSection; %prealloc
        dworkMap.nTotData            = -1;

        ;%
        ;% Auto data (rtDW)
        ;%
            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% rtDW.lzwrkqqe0k
                    section.data(1).logicalSrcIdx = 0;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(1) = section;
            clear section

            section.nData     = 2;
            section.data(2)  = dumData; %prealloc

                    ;% rtDW.iae0l0pdjm
                    section.data(1).logicalSrcIdx = 1;
                    section.data(1).dtTransOffset = 0;

                    ;% rtDW.b3tagn5fsk
                    section.data(2).logicalSrcIdx = 2;
                    section.data(2).dtTransOffset = 1;

            nTotData = nTotData + section.nData;
            dworkMap.sections(2) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% rtDW.e1vrwt3qqq
                    section.data(1).logicalSrcIdx = 3;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(3) = section;
            clear section

            section.nData     = 3;
            section.data(3)  = dumData; %prealloc

                    ;% rtDW.hnt4imdtqa.AQHandles
                    section.data(1).logicalSrcIdx = 4;
                    section.data(1).dtTransOffset = 0;

                    ;% rtDW.po0pdxdgkd.AQHandles
                    section.data(2).logicalSrcIdx = 5;
                    section.data(2).dtTransOffset = 1;

                    ;% rtDW.gvslfjsjx0.AQHandles
                    section.data(3).logicalSrcIdx = 6;
                    section.data(3).dtTransOffset = 2;

            nTotData = nTotData + section.nData;
            dworkMap.sections(4) = section;
            clear section

            section.nData     = 2;
            section.data(2)  = dumData; %prealloc

                    ;% rtDW.flju23kmxl
                    section.data(1).logicalSrcIdx = 7;
                    section.data(1).dtTransOffset = 0;

                    ;% rtDW.doihgcsjev
                    section.data(2).logicalSrcIdx = 8;
                    section.data(2).dtTransOffset = 1;

            nTotData = nTotData + section.nData;
            dworkMap.sections(5) = section;
            clear section

            section.nData     = 12;
            section.data(12)  = dumData; %prealloc

                    ;% rtDW.b5rzolsg0z
                    section.data(1).logicalSrcIdx = 9;
                    section.data(1).dtTransOffset = 0;

                    ;% rtDW.fkyjiibvlk
                    section.data(2).logicalSrcIdx = 10;
                    section.data(2).dtTransOffset = 1;

                    ;% rtDW.og3obillin
                    section.data(3).logicalSrcIdx = 11;
                    section.data(3).dtTransOffset = 2;

                    ;% rtDW.j1rid3gqtn
                    section.data(4).logicalSrcIdx = 12;
                    section.data(4).dtTransOffset = 627;

                    ;% rtDW.iojd1h1ocp
                    section.data(5).logicalSrcIdx = 13;
                    section.data(5).dtTransOffset = 629;

                    ;% rtDW.bp1x0ojpwu
                    section.data(6).logicalSrcIdx = 14;
                    section.data(6).dtTransOffset = 630;

                    ;% rtDW.jbqbcmzgkd
                    section.data(7).logicalSrcIdx = 15;
                    section.data(7).dtTransOffset = 631;

                    ;% rtDW.cfynmaumdf
                    section.data(8).logicalSrcIdx = 16;
                    section.data(8).dtTransOffset = 632;

                    ;% rtDW.ejzv3oxuvz
                    section.data(9).logicalSrcIdx = 17;
                    section.data(9).dtTransOffset = 1257;

                    ;% rtDW.i1benfafve
                    section.data(10).logicalSrcIdx = 18;
                    section.data(10).dtTransOffset = 1259;

                    ;% rtDW.ligyqpmozz
                    section.data(11).logicalSrcIdx = 19;
                    section.data(11).dtTransOffset = 1260;

                    ;% rtDW.buk5wggwzm
                    section.data(12).logicalSrcIdx = 20;
                    section.data(12).dtTransOffset = 1261;

            nTotData = nTotData + section.nData;
            dworkMap.sections(6) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% rtDW.lv1etmcrao
                    section.data(1).logicalSrcIdx = 21;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(7) = section;
            clear section

            section.nData     = 15;
            section.data(15)  = dumData; %prealloc

                    ;% rtDW.hub4gy0yxk
                    section.data(1).logicalSrcIdx = 22;
                    section.data(1).dtTransOffset = 0;

                    ;% rtDW.l1v5zeml4o
                    section.data(2).logicalSrcIdx = 23;
                    section.data(2).dtTransOffset = 4;

                    ;% rtDW.hlfeowbagb
                    section.data(3).logicalSrcIdx = 24;
                    section.data(3).dtTransOffset = 5;

                    ;% rtDW.i0dsnykkk5
                    section.data(4).logicalSrcIdx = 25;
                    section.data(4).dtTransOffset = 6;

                    ;% rtDW.kpms0csrsm
                    section.data(5).logicalSrcIdx = 26;
                    section.data(5).dtTransOffset = 7;

                    ;% rtDW.c1mwhlxjkx
                    section.data(6).logicalSrcIdx = 27;
                    section.data(6).dtTransOffset = 8;

                    ;% rtDW.dc4uf2fl3i
                    section.data(7).logicalSrcIdx = 28;
                    section.data(7).dtTransOffset = 9;

                    ;% rtDW.evp3fsmjzo
                    section.data(8).logicalSrcIdx = 29;
                    section.data(8).dtTransOffset = 10;

                    ;% rtDW.cqyjscfxwz
                    section.data(9).logicalSrcIdx = 30;
                    section.data(9).dtTransOffset = 11;

                    ;% rtDW.kbrslmyprs
                    section.data(10).logicalSrcIdx = 31;
                    section.data(10).dtTransOffset = 12;

                    ;% rtDW.blkdbbwzul
                    section.data(11).logicalSrcIdx = 32;
                    section.data(11).dtTransOffset = 13;

                    ;% rtDW.cfd5iay225
                    section.data(12).logicalSrcIdx = 33;
                    section.data(12).dtTransOffset = 14;

                    ;% rtDW.kf1p55aogw
                    section.data(13).logicalSrcIdx = 34;
                    section.data(13).dtTransOffset = 15;

                    ;% rtDW.aa2yzknpgo
                    section.data(14).logicalSrcIdx = 35;
                    section.data(14).dtTransOffset = 16;

                    ;% rtDW.jqn3nxj1h5
                    section.data(15).logicalSrcIdx = 36;
                    section.data(15).dtTransOffset = 17;

            nTotData = nTotData + section.nData;
            dworkMap.sections(8) = section;
            clear section


            ;%
            ;% Non-auto Data (dwork)
            ;%


        ;%
        ;% Add final counts to struct.
        ;%
        dworkMap.nTotData = nTotData;



    ;%
    ;% Add individual maps to base struct.
    ;%

    targMap.paramMap  = paramMap;
    targMap.signalMap = sigMap;
    targMap.dworkMap  = dworkMap;

    ;%
    ;% Add checksums to base struct.
    ;%


    targMap.checksum0 = 2133462260;
    targMap.checksum1 = 3370518073;
    targMap.checksum2 = 3823393561;
    targMap.checksum3 = 1780063881;

