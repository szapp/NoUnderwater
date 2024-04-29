/*
 * Initialization function called by Ninja after "Init_Global" (G2) / "Init_<Levelname>" (G1)
 */
func void Ninja_NoUnderwater_Init() {
    MEM_InitAll();

    const int zCAICamera__CheckUnderWaterFX_G1C = 4932160; //0x4B4240
    const int zCAICamera__CheckUnderWaterFX_G1A = 4993120; //0x4C3060
    const int zCAICamera__CheckUnderWaterFX_G2C = 4959600; //0x4BAD70
    const int zCAICamera__CheckUnderWaterFX_G2A = 4969184; //0x4BD2E0

    var int addr; addr = MEMINT_SwitchExe(zCAICamera__CheckUnderWaterFX_G1C,
                                          zCAICamera__CheckUnderWaterFX_G1A,
                                          zCAICamera__CheckUnderWaterFX_G2C,
                                          zCAICamera__CheckUnderWaterFX_G2A);

    if (MEM_ReadByte(addr) != ASMINT_OP_retn) {
        // Just immediately jump out of the setter function
        MemoryProtectionOverride(addr, 1);
        MEM_WriteByte(addr, ASMINT_OP_retn);
    };
};
