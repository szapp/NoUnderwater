/*
 * Initialization function called by Ninja after "Init_Global" (G2) / "Init_<Levelname>" (G1)
 */
func void Ninja_NoUnderwater_Init() {
    MEM_InitAll();

    const int zCAICamera__CheckUnderWaterFX_G1 = 4932160; //0x4B4240
    const int zCAICamera__CheckUnderWaterFX_G2 = 4969184; //0x4BD2E0

    var int addr; addr = MEMINT_SwitchG1G2(zCAICamera__CheckUnderWaterFX_G1, zCAICamera__CheckUnderWaterFX_G2);

    if (MEM_ReadInt(addr) != ASMINT_OP_retn) {
        // Just immediately jump out of the setter function
        MemoryProtectionOverride(addr, 1);
        MEM_WriteByte(addr, ASMINT_OP_retn);
    };
};
