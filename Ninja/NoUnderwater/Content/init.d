/*
 * Initialization function called by Ninja after "Init_Global" (G2) / "Init_<Levelname>" (G1)
 */
func void Ninja_NoUnderwater_Init() {
    MEM_InitAll();

    const int zCAICamera__CheckUnderWaterFX[4] = { /*G1*/4932160, /*G1A*/4993120, /*G2*/4959600, /*G2A*/4969184 };
    var int addr; addr = zCAICamera__CheckUnderWaterFX[NoUnderwater_EXE];

    if (MEM_ReadByte(addr) != ASMINT_OP_retn) {
        // Just immediately jump out of the setter function
        MemoryProtectionOverride(addr, 1);
        MEM_WriteByte(addr, ASMINT_OP_retn);
    };
};
