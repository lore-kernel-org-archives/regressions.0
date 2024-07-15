Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4476172BA6
	for <regressions@lists.linux.dev>; Mon, 15 Jul 2024 13:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721049138; cv=none; b=aTb8aYZ1uAFJy4jNMhLR73vQb7lai9YJS0H7fuDjb0ijPZMsqVg4eDaeH4935+Gn/dadd7UMNZIvLdOeV6Zs2REicVlyfkjqaaEcH1Fu38NB3CUSQSyASFEPPN86gS0Edr8RQ/8ALKHHOInbwrEL2XkYObJlstuz7Ag6psm8A6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721049138; c=relaxed/simple;
	bh=DxCtDST7Kll6RB+ToEPMUXao9UpvOLUgiQ6K5V/35uA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SQXPm4/KSX8ZzN0CPMclIaLQC4R6hhzM0juPLbXCOyuT5HXkPH/dVd5V0BZSPw9rKIQ+B6qne5+W/lymarlZ2KX+eyd7c9AvdeThYAGh4eGqJJIDTmR1tVJkF5gLZif+k2j3HBZcgVqdWrv9g5CIkpko9tMIwTlUJl4d/ghj3gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu; spf=pass smtp.mailfrom=heusel.eu; dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b=HgWfhuoL; arc=none smtp.client-ip=212.227.17.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heusel.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b="HgWfhuoL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heusel.eu;
	s=s1-ionos; t=1721049082; x=1721653882; i=christian@heusel.eu;
	bh=b/Brg+I3TA9RfU+zoCuLuMWunYT9wvOiMMCDPFyI3is=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=HgWfhuoL5Crm0kbU9ouu8imLTEmCkmcJRUyIWqNJOFm5YuK75revg+JOxYOGcTxN
	 piGJfOA+btrovsEOdXPaPQlu2xd1zjz8Zbdk386/Hr+JmsTfOYKSLJs/AOyt/mulS
	 Emy9uM+kKcHsj1UBeavyw9CjYARLWRtyVXdnzDxwdG7W9nvP0xVRR6yVfSyFsAwrj
	 FbIqxTQwV9uZKXRPhdNBUaIBe0RX5vLSLv5rbmxOR5FqZJGLX0p+OihpLxx/Ya7il
	 WaoJBhjXYfYMQ159aV2uHdhe9B7XgSGrMetfN9+0eZP7eYUpA/1PilJ3cGO9vig+k
	 Pl+3bl5ctaEnqLilrQ==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from localhost ([93.196.157.157]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MDPuq-1sbcg00xwk-00A9tM; Mon, 15 Jul 2024 15:11:22 +0200
Date: Mon, 15 Jul 2024 15:11:19 +0200
From: Christian Heusel <christian@heusel.eu>
To: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, 
	regressions@lists.linux.dev
Cc: x86@kernel.org, rob@durendal.co.uk
Subject: [REGRESSION][BISECTED] Early boot hangs since f0551af02130
Message-ID: <361b2ba5-7fc3-4e9a-af63-adfd4bc20304@heusel.eu>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="akv24tzfyfw4xc22"
Content-Disposition: inline
X-Provags-ID: V03:K1:nT7Io4VLg/zmWLO1Y9s7ZiyYbTW0MK+LCgIbqYL+YFduPMGhi/A
 uCw3T1alK3PYBkWrvqHNJvXOnc6Ldna9Dv4kh6EAnxPzsRoI0LHJrXLGS+/jkxe+rPY3+tB
 upd6pZ1Ms0nBWURllBctGkz9FUtCKOEaPvmuLS6ThanF7dMhdV7gclJ2jnn/316r7dmWyKf
 EJiHCErg6AFlMRC4UX1TA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:WTlRjYXBsoY=;rtx/qqNOZH7ulV0CkGlayiMU6MW
 H78R4Hgu5OWmCpb/1Pzb9v28NKVUMRpPwp5Fq5IjIwzHBS05fw1mJaTHMGfR4+y6+21IMj8V0
 Mr0eFFsmQMw+MgR9sFhETji+T/n8HzkeqsmMKA0TN6jzQsKi3TdTPfI6eBPqhP0bRRe/2a8Kc
 DGc4eU/LpHYC++XsFMK7IgSVQXRttcd94kvtgsLRwCAhbopn1CMIy0XdpwXg+/sHV+JbbYVlj
 kSnzbvB3utU5OXqWb9T0ro4gp0o5Jv+wcxTXXGx3eqUL/FnyYeuIq1onH8SJDB23xTlMxWVYi
 OX/mq1n1YfTz0jUo3oGlallArrYFmkI3Gbp2nqG5H1WeKOIzZAPpE1u2rOApbUvub3F5vBUd+
 RGQNZi+6f2hKp6DpBZufSv0BZneORc47OgIeqarH19segTOt+ibfszwleSeXsARa5HDG353hr
 xCBXDoJVyp+9GeJO4xlVh4tzU7IsmwYqW7w84PskGdJzlSFeuoXJAeOyqqMrpN7k/V0jQPmbR
 xE5iV3f8XMmEOvLmtI1biyAAXIwP4p5FogB8EpQgq+QVmWtWy4qRAu8Bm1ULGDc1rzmFSCvsj
 68Gbq9NGO6VfIvqm3mQlYIj13+csZPYs/SunlfuxvQSF23cahX7FLuypARxjYpyxV/izpcNQh
 rXrj4khvdM0mDVtE7+QXjk7zjH8M6uMyVhMvK+Usr4tcnIX4tOub4Jdfnp5OVbottMvGumiDs
 PVJ+gfmVB1bdCD5zNRy5pysodhZiXCepw==


--akv24tzfyfw4xc22
Content-Type: multipart/mixed; boundary="jzq55ihohz2akf2e"
Content-Disposition: inline


--jzq55ihohz2akf2e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Thomas, hello Borislav,

Rob reports a regression on his AMD Ryzen 3 1300X CPU that causes him
early boot failures when he does not specify "iommu=3Doff" on the command
line.=20

We have bisected the issue together [in the Arch Linux bugtracker][0]
and landed on the following commit as the culprit of the failure:

    f0551af02130 ("x86/topology: Ignore non-present APIC IDs in a present p=
ackage")

We have also tried the latest mainline kernel (at the time) 6.10rc6 to
no avail, while 6.10rc7 with f0551af02130 reverted worked.

Rob is in CC and available for further debugging, but since we already
had an encounter on another bug report I tried to gather some
information which was relevant back then, which you can find attached to
this email:

- output of "cpuid"
- dmesg of a working boot
- output of "cat /sys/kernel/debug/x86/topo/cpus/*"

Reported-by: Rob Newcater <rob@durendal.co.uk>
Reported-by: Christian Heusel <christian@heusel.eu>

Cheers,
Chris


[0]: https://gitlab.archlinux.org/archlinux/packaging/packages/linux/-/issu=
es/64

---

#regzbot link: https://gitlab.archlinux.org/archlinux/packaging/packages/li=
nux/-/issues/56
#regzbot introduced: f0551af02130=20
#regzbot title: x86/topology: Early boot failure unless "iommu=3Doff" is set

--jzq55ihohz2akf2e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="cpuid.txt"

CPU 0:
   vendor_id = "AuthenticAMD"
   version information (1/eax):
      processor type  = primary processor (0)
      family          = 0xf (15)
      model           = 0x1 (1)
      stepping id     = 0x1 (1)
      extended family = 0x8 (8)
      extended model  = 0x0 (0)
      (family synth)  = 0x17 (23)
      (model synth)   = 0x1 (1)
   miscellaneous (1/ebx):
      process local APIC physical ID = 0x0 (0)
      maximum IDs for CPUs in pkg    = 0x4 (4)
      CLFLUSH line size              = 0x8 (8)
      brand index                    = 0x0 (0)
   brand id = 0x00 (0): unknown
   feature information (1/edx):
      x87 FPU on chip                        = true
      VME: virtual-8086 mode enhancement     = true
      DE: debugging extensions               = true
      PSE: page size extensions              = true
      TSC: time stamp counter                = true
      RDMSR and WRMSR support                = true
      PAE: physical address extensions       = true
      MCE: machine check exception           = true
      CMPXCHG8B inst.                        = true
      APIC on chip                           = true
      SYSENTER and SYSEXIT                   = true
      MTRR: memory type range registers      = true
      PTE global bit                         = true
      MCA: machine check architecture        = true
      CMOV: conditional move/compare instr   = true
      PAT: page attribute table              = true
      PSE-36: page size extension            = true
      PSN: processor serial number           = false
      CLFLUSH instruction                    = true
      DS: debug store                        = false
      ACPI: thermal monitor and clock ctrl   = false
      MMX Technology                         = true
      FXSAVE/FXRSTOR                         = true
      SSE extensions                         = true
      SSE2 extensions                        = true
      SS: self snoop                         = false
      hyper-threading / multi-core supported = true
      TM: therm. monitor                     = false
      IA64                                   = false
      PBE: pending break event               = false
   feature information (1/ecx):
      PNI/SSE3: Prescott New Instructions     = true
      PCLMULDQ instruction                    = true
      DTES64: 64-bit debug store              = false
      MONITOR/MWAIT                           = true
      CPL-qualified debug store               = false
      VMX: virtual machine extensions         = false
      SMX: safer mode extensions              = false
      Enhanced Intel SpeedStep Technology     = false
      TM2: thermal monitor 2                  = false
      SSSE3 extensions                        = true
      context ID: adaptive or shared L1 data  = false
      SDBG: IA32_DEBUG_INTERFACE              = false
      FMA instruction                         = true
      CMPXCHG16B instruction                  = true
      xTPR disable                            = false
      PDCM: perfmon and debug                 = false
      PCID: process context identifiers       = false
      DCA: direct cache access                = false
      SSE4.1 extensions                       = true
      SSE4.2 extensions                       = true
      x2APIC: extended xAPIC support          = false
      MOVBE instruction                       = true
      POPCNT instruction                      = true
      time stamp counter deadline             = false
      AES instruction                         = true
      XSAVE/XSTOR states                      = true
      OS-enabled XSAVE/XSTOR                  = true
      AVX: advanced vector extensions         = true
      F16C half-precision convert instruction = true
      RDRAND instruction                      = true
      hypervisor guest status                 = false
   cache and TLB information (2):
   processor serial number = 0080-0F11-0000-0000-0000-0000
   deterministic cache parameters (4):
      --- cache 0 ---
      cache type                         = no more caches (0)
   MONITOR/MWAIT (5):
      smallest monitor-line size (bytes)       = 0x40 (64)
      largest monitor-line size (bytes)        = 0x40 (64)
      enum of Monitor-MWAIT exts supported     = true
      supports intrs as break-event for MWAIT  = true
      monitorless MWAIT supported              = false
      number of C0 sub C-states using MWAIT    = 0x0 (0)
      number of C1 sub C-states using MWAIT    = 0x0 (0)
      number of C2 sub C-states using MWAIT    = 0x0 (0)
      number of C3 sub C-states using MWAIT    = 0x0 (0)
      number of C4 sub C-states using MWAIT    = 0x0 (0)
      number of C5 sub C-states using MWAIT    = 0x0 (0)
      number of C6 sub C-states using MWAIT    = 0x0 (0)
      number of C7 sub C-states using MWAIT    = 0x0 (0)
   Thermal and Power Management Features (6):
      digital thermometer                     = false
      Intel Turbo Boost Technology            = false
      ARAT always running APIC timer          = true
      PLN power limit notification            = false
      ECMD extended clock modulation duty     = false
      PTM package thermal management          = false
      HWP base registers                      = false
      HWP notification                        = false
      HWP activity window                     = false
      HWP energy performance preference       = false
      HWP package level request               = false
      HDC base registers                      = false
      Intel Turbo Boost Max Technology 3.0    = false
      HWP capabilities                        = false
      HWP PECI override                       = false
      flexible HWP                            = false
      IA32_HWP_REQUEST MSR fast access mode   = false
      HW_FEEDBACK MSRs supported              = false
      ignoring idle logical processor HWP req = false
      Thread Director                         = false
      IA32_HW_FEEDBACK_THREAD_CONFIG bit 25   = false
      digital thermometer thresholds          = 0x0 (0)
      hardware coordination feedback          = true
      ACNT2 available                         = false
      performance-energy bias capability      = false
      number of enh hardware feedback classes = 0x0 (0)
      performance capability reporting        = false
      energy efficiency capability reporting  = false
      size of feedback struct (4KB pages)     = 0x1 (1)
      index of CPU's row in feedback struct   = 0x0 (0)
   extended feature flags (7):
      FSGSBASE instructions                    = true
      IA32_TSC_ADJUST MSR supported            = false
      SGX: Software Guard Extensions supported = false
      BMI1 instructions                        = true
      HLE hardware lock elision                = false
      AVX2: advanced vector extensions 2       = true
      FDP_EXCPTN_ONLY                          = false
      SMEP supervisor mode exec protection     = true
      BMI2 instructions                        = true
      enhanced REP MOVSB/STOSB                 = false
      INVPCID instruction                      = false
      RTM: restricted transactional memory     = false
      RDT-CMT/PQoS cache monitoring            = false
      deprecated FPU CS/DS                     = false
      MPX: intel memory protection extensions  = false
      RDT-CAT/PQE cache allocation             = false
      AVX512F: AVX-512 foundation instructions = false
      AVX512DQ: double & quadword instructions = false
      RDSEED instruction                       = true
      ADX instructions                         = true
      SMAP: supervisor mode access prevention  = true
      AVX512IFMA: integer fused multiply add   = false
      PCOMMIT instruction                      = false
      CLFLUSHOPT instruction                   = true
      CLWB instruction                         = false
      Intel processor trace                    = false
      AVX512PF: prefetch instructions          = false
      AVX512ER: exponent & reciprocal instrs   = false
      AVX512CD: conflict detection instrs      = false
      SHA instructions                         = true
      AVX512BW: byte & word instructions       = false
      AVX512VL: vector length                  = false
      PREFETCHWT1                              = false
      AVX512VBMI: vector byte manipulation     = false
      UMIP: user-mode instruction prevention   = false
      PKU protection keys for user-mode        = false
      OSPKE CR4.PKE and RDPKRU/WRPKRU          = false
      WAITPKG instructions                     = false
      AVX512_VBMI2: byte VPCOMPRESS, VPEXPAND  = false
      CET_SS: CET shadow stack                 = false
      GFNI: Galois Field New Instructions      = false
      VAES instructions                        = false
      VPCLMULQDQ instruction                   = false
      AVX512_VNNI: neural network instructions = false
      AVX512_BITALG: bit count/shiffle         = false
      TME: Total Memory Encryption             = false
      AVX512: VPOPCNTDQ instruction            = false
      LA57: 57-bit addrs & 5-level paging      = false
      BNDLDX/BNDSTX MAWAU value in 64-bit mode = 0x0 (0)
      RDPID: read processor ID supported       = false
      KL: key locker                           = false
      bus lock detection                       = false
      CLDEMOTE supports cache line demote      = false
      MOVDIRI instruction                      = false
      MOVDIR64B instruction                    = false
      ENQCMD instruction                       = false
      SGX_LC: SGX launch config supported      = false
      PKS: supervisor protection keys          = false
      SGX-KEYS: SGX attestation services       = false
      AVX512_4VNNIW: neural network instrs     = false
      AVX512_4FMAPS: multiply acc single prec  = false
      fast short REP MOV                       = false
      UINTR: user interrupts                   = false
      AVX512_VP2INTERSECT: intersect mask regs = false
      IA32_MCU_OPT_CTRL SRBDS mitigation MSR   = false
      VERW MD_CLEAR microcode support          = false
      RTM transaction always aborts            = false
      IA32_TSX_FORCE_ABORT MSR                 = false
      SERIALIZE instruction                    = false
      hybrid part                              = false
      TSXLDTRK: TSX suspend load addr tracking = false
      PCONFIG instruction                      = false
      LBR: architectural last branch records   = false
      CET_IBT: CET indirect branch tracking    = false
      AMX-BF16: tile bfloat16 support          = false
      AVX512_FP16: fp16 support                = false
      AMX-TILE: tile architecture support      = false
      AMX-INT8: tile 8-bit integer support     = false
      IBRS/IBPB: indirect branch restrictions  = false
      STIBP: 1 thr indirect branch predictor   = false
      L1D_FLUSH: IA32_FLUSH_CMD MSR            = false
      IA32_ARCH_CAPABILITIES MSR               = false
      IA32_CORE_CAPABILITIES MSR               = false
      SSBD: speculative store bypass disable   = false
   Direct Cache Access Parameters (9):
      PLATFORM_DCA_CAP MSR bits = 0
   Architecture Performance Monitoring Features (0xa):
      version ID                               = 0x0 (0)
      number of counters per logical processor = 0x0 (0)
      bit width of counter                     = 0x0 (0)
      length of EBX bit vector                 = 0x0 (0)
      core cycle event                         = not available
      instruction retired event                = not available
      reference cycles event                   = not available
      last-level cache ref event               = not available
      last-level cache miss event              = not available
      branch inst retired event                = not available
      branch mispred retired event             = not available
      topdown slots event                      = not available
      topdown backend bound                    = not available
      topdown bad speculation                  = not available
      topdown frontend bound                   = not available
      topdown retiring                         = not available
      LBR inserts                              = not available
      fixed counter  0 supported               = false
      fixed counter  1 supported               = false
      fixed counter  2 supported               = false
      fixed counter  3 supported               = false
      fixed counter  4 supported               = false
      fixed counter  5 supported               = false
      fixed counter  6 supported               = false
      fixed counter  7 supported               = false
      fixed counter  8 supported               = false
      fixed counter  9 supported               = false
      fixed counter 10 supported               = false
      fixed counter 11 supported               = false
      fixed counter 12 supported               = false
      fixed counter 13 supported               = false
      fixed counter 14 supported               = false
      fixed counter 15 supported               = false
      fixed counter 16 supported               = false
      fixed counter 17 supported               = false
      fixed counter 18 supported               = false
      fixed counter 19 supported               = false
      fixed counter 20 supported               = false
      fixed counter 21 supported               = false
      fixed counter 22 supported               = false
      fixed counter 23 supported               = false
      fixed counter 24 supported               = false
      fixed counter 25 supported               = false
      fixed counter 26 supported               = false
      fixed counter 27 supported               = false
      fixed counter 28 supported               = false
      fixed counter 29 supported               = false
      fixed counter 30 supported               = false
      fixed counter 31 supported               = false
      number of contiguous fixed counters      = 0x0 (0)
      bit width of fixed counters              = 0x0 (0)
      anythread deprecation                    = false
   x2APIC features / processor topology (0xb):
      extended APIC ID                      = 0
      --- level 0 ---
      level number                          = 0x0 (0)
      level type                            = invalid (0)
      bit width of level & previous levels  = 0x0 (0)
      number of logical processors at level = 0x0 (0)
   XSAVE features (0xd/0):
      XCR0 valid bit field mask               = 0x0000000000000007
         x87 state                            = true
         SSE state                            = true
         AVX state                            = true
         MPX BNDREGS                          = false
         MPX BNDCSR                           = false
         AVX-512 opmask                       = false
         AVX-512 ZMM_Hi256                    = false
         AVX-512 Hi16_ZMM                     = false
         PKRU state                           = false
         XTILECFG state                       = false
         XTILEDATA state                      = false
      bytes required by fields in XCR0        = 0x00000340 (832)
      bytes required by XSAVE/XRSTOR area     = 0x00000340 (832)
      XSAVEOPT instruction                    = true
      XSAVEC instruction                      = true
      XGETBV instruction                      = true
      XSAVES/XRSTORS instructions             = true
      XFD: extended feature disable supported = false
      SAVE area size in bytes                 = 0x00000340 (832)
      IA32_XSS valid bit field mask           = 0x0000000000000000
         PT state                             = false
         PASID state                          = false
         CET_U user state                     = false
         CET_S supervisor state               = false
         HDC state                            = false
         UINTR state                          = false
         LBR state                            = false
         HWP state                            = false
   AVX/YMM features (0xd/2):
      AVX/YMM save state byte size             = 0x00000100 (256)
      AVX/YMM save state byte offset           = 0x00000240 (576)
      supported in IA32_XSS or XCR0            = XCR0 (user state)
      64-byte alignment in compacted XSAVE     = false
      XFD faulting supported                   = false
   extended processor signature (0x80000001/eax):
      family/generation = 0xf (15)
      model           = 0x1 (1)
      stepping id     = 0x1 (1)
      extended family = 0x8 (8)
      extended model  = 0x0 (0)
      (family synth)  = 0x17 (23)
      (model synth)   = 0x1 (1)
   extended feature flags (0x80000001/edx):
      x87 FPU on chip                       = true
      virtual-8086 mode enhancement         = true
      debugging extensions                  = true
      page size extensions                  = true
      time stamp counter                    = true
      RDMSR and WRMSR support               = true
      physical address extensions           = true
      machine check exception               = true
      CMPXCHG8B inst.                       = true
      APIC on chip                          = true
      SYSCALL and SYSRET instructions       = true
      memory type range registers           = true
      global paging extension               = true
      machine check architecture            = true
      conditional move/compare instruction  = true
      page attribute table                  = true
      page size extension                   = true
      multiprocessing capable               = false
      no-execute page protection            = true
      AMD multimedia instruction extensions = true
      MMX Technology                        = true
      FXSAVE/FXRSTOR                        = true
      SSE extensions                        = true
      1-GB large page support               = true
      RDTSCP                                = true
      long mode (AA-64)                     = true
      3DNow! instruction extensions         = false
      3DNow! instructions                   = false
   extended brand id (0x80000001/ebx):
      raw     = 0x20000000 (536870912)
      BrandId = 0x0 (0)
      PkgType = AM4 (2)
   AMD feature flags (0x80000001/ecx):
      LAHF/SAHF supported in 64-bit mode     = true
      CMP Legacy                             = true
      SVM: secure virtual machine            = true
      extended APIC space                    = true
      AltMovCr8                              = true
      LZCNT advanced bit manipulation        = true
      SSE4A support                          = true
      misaligned SSE mode                    = true
      3DNow! PREFETCH/PREFETCHW instructions = true
      OS visible workaround                  = true
      instruction based sampling             = false
      XOP support                            = false
      SKINIT/STGI support                    = true
      watchdog timer support                 = true
      lightweight profiling support          = false
      4-operand FMA instruction              = false
      TCE: translation cache extension       = true
      NodeId MSR C001100C                    = false
      TBM support                            = false
      topology extensions                    = true
      core performance counter extensions    = true
      NB/DF performance counter extensions   = true
      data breakpoint extension              = true
      performance time-stamp counter support = false
      LLC performance counter extensions     = true
      MWAITX/MONITORX supported              = true
      Address mask extension support         = false
   brand = "AMD Ryzen 3 1300X Quad-Core Processor          "
   L1 TLB/cache information: 2M/4M pages & L1 TLB (0x80000005/eax):
      instruction # entries     = 0x40 (64)
      instruction associativity = 0xff (255)
      data # entries            = 0x40 (64)
      data associativity        = 0xff (255)
   L1 TLB/cache information: 4K pages & L1 TLB (0x80000005/ebx):
      instruction # entries     = 0x40 (64)
      instruction associativity = 0xff (255)
      data # entries            = 0x40 (64)
      data associativity        = 0xff (255)
   L1 data cache information (0x80000005/ecx):
      line size (bytes) = 0x40 (64)
      lines per tag     = 0x1 (1)
      associativity     = 0x8 (8)
      size (KB)         = 0x20 (32)
   L1 instruction cache information (0x80000005/edx):
      line size (bytes) = 0x40 (64)
      lines per tag     = 0x1 (1)
      associativity     = 0x4 (4)
      size (KB)         = 0x40 (64)
   L2 TLB/cache information: 2M/4M pages & L2 TLB (0x80000006/eax):
      instruction # entries     = 0x400 (1024)
      instruction associativity = 8 to 15-way (6)
      data # entries            = 0x600 (1536)
      data associativity        = 2-way (2)
   L2 TLB/cache information: 4K pages & L2 TLB (0x80000006/ebx):
      instruction # entries     = 0x400 (1024)
      instruction associativity = 8 to 15-way (6)
      data # entries            = 0x600 (1536)
      data associativity        = 8 to 15-way (6)
   L2 unified cache information (0x80000006/ecx):
      line size (bytes) = 0x40 (64)
      lines per tag     = 0x1 (1)
      associativity     = 8 to 15-way (6)
      size (KB)         = 0x200 (512)
   L3 cache information (0x80000006/edx):
      line size (bytes)     = 0x40 (64)
      lines per tag         = 0x1 (1)
      associativity         = 16 to 31-way (8)
      size (in 512KB units) = 0x10 (16)
   RAS Capability (0x80000007/ebx):
      MCA overflow recovery support = true
      SUCCOR support                = true
      HWA: hardware assert support  = false
      scalable MCA support          = true
   Advanced Power Management Features (0x80000007/ecx):
      CmpUnitPwrSampleTimeRatio = 0x0 (0)
   Advanced Power Management Features (0x80000007/edx):
      TS: temperature sensing diode           = true
      FID: frequency ID control               = false
      VID: voltage ID control                 = false
      TTP: thermal trip                       = true
      TM: thermal monitor                     = true
      STC: software thermal control           = false
      100 MHz multiplier control              = false
      hardware P-State control                = true
      TscInvariant                            = true
      CPB: core performance boost             = false
      read-only effective frequency interface = true
      processor feedback interface            = false
      APM power reporting                     = false
      connected standby                       = true
      RAPL: running average power limit       = true
   Physical Address and Linear Address Size (0x80000008/eax):
      maximum physical address bits         = 0x30 (48)
      maximum linear (virtual) address bits = 0x30 (48)
      maximum guest physical address bits   = 0x0 (0)
   Extended Feature Extensions ID (0x80000008/ebx):
      CLZERO instruction                       = true
      instructions retired count support       = true
      always save/restore error pointers       = true
      INVLPGB instruction                      = false
      RDPRU instruction                        = false
      memory bandwidth enforcement             = false
      MCOMMIT instruction                      = false
      WBNOINVD instruction                     = false
      IBPB: indirect branch prediction barrier = true
      interruptible WBINVD, WBNOINVD           = false
      IBRS: indirect branch restr speculation  = false
      STIBP: 1 thr indirect branch predictor   = false
      CPU prefers: IBRS always on              = false
      CPU prefers: STIBP always on             = false
      IBRS preferred over software solution    = false
      IBRS provides same mode protection       = false
      EFER[LMSLE] not supported                = false
      INVLPGB supports TLB flush guest nested  = false
      ppin processor id number supported       = false
      SSBD: speculative store bypass disable   = false
      virtualized SSBD                         = false
      SSBD fixed in hardware                   = false
      CPPC: collaborative processor perf ctrl  = false
      PSFD: predictive store forward disable   = false
      not vulnerable to branch type confusion  = false
      IBPB_RET: ret addr predictor cleared     = false
      branch sampling feature support          = false
      (vuln to branch type confusion synth)    = true
   Size Identifiers (0x80000008/ecx):
      number of threads                   = 0x4 (4)
      ApicIdCoreIdSize                    = 0x4 (4)
      performance time-stamp counter size = 40 bits (0)
   Feature Extended Size (0x80000008/edx):
      max page count for INVLPGB instruction = 0x0 (0)
      RDPRU instruction max input support    = 0x0 (0)
   SVM Secure Virtual Machine (0x8000000a/eax):
      SvmRev: SVM revision = 0x1 (1)
   SVM Secure Virtual Machine (0x8000000a/edx):
      nested paging                           = true
      LBR virtualization                      = true
      SVM lock                                = true
      NRIP save                               = true
      MSR based TSC rate control              = true
      VMCB clean bits support                 = true
      flush by ASID                           = true
      decode assists                          = true
      PMC virtualization                      = false
      SSSE3/SSE5 opcode set disable           = false
      pause intercept filter                  = true
      pause filter threshold                  = true
      AVIC: AMD virtual interrupt controller  = true
      virtualized VMLOAD/VMSAVE               = true
      virtualized global interrupt flag (GIF) = true
      GMET: guest mode execute trap           = false
      X2AVIC: virtualized X2APIC              = false
      supervisor shadow stack                 = false
      guest Spec_ctl support                  = false
      ROGPT: read-only guest page table       = false
      host MCE override                       = false
      INVLPGB/TLBSYNC hyperv interc enable    = false
      VNMI: NMI virtualization                = false
      IBS virtualization                      = false
      extended LVT AVIC access changes        = false
      guest VMCB addr check                   = false
      bus lock threshold                      = false
      idlt HLT intercept                      = false
   NASID: number of address space identifiers = 0x8000 (32768):
   L1 TLB information: 1G pages (0x80000019/eax):
      instruction # entries     = 0x40 (64)
      instruction associativity = full (15)
      data # entries            = 0x40 (64)
      data associativity        = full (15)
   L2 TLB information: 1G pages (0x80000019/ebx):
      instruction # entries     = 0x0 (0)
      instruction associativity = L2 off (0)
      data # entries            = 0x0 (0)
      data associativity        = L2 off (0)
   Performance Optimization Identifiers (0x8000001a/eax):
      128-bit SSE executed full-width = true
      MOVU* better than MOVL*/MOVH*   = true
      256-bit SSE executed full-width = false
   Instruction Based Sampling Identifiers (0x8000001b/eax):
      IBS feature flags valid                  = true
      IBS fetch sampling                       = true
      IBS execution sampling                   = true
      read write of op counter                 = true
      op counting mode                         = true
      branch target address reporting          = true
      IbsOpCurCnt and IbsOpMaxCnt extend 7     = true
      invalid RIP indication support           = true
      fused branch micro-op indication support = true
      IBS fetch control extended MSR support   = true
      IBS op data 4 MSR support                = false
      IBS L3 miss filtering support            = false
   Lightweight Profiling Capabilities: Availability (0x8000001c/eax):
      lightweight profiling                  = false
      LWPVAL instruction                     = false
      instruction retired event              = false
      branch retired event                   = false
      DC miss event                          = false
      core clocks not halted event           = false
      core reference clocks not halted event = false
      continuous mode sampling               = false
      tsc in event record                    = false
      interrupt on threshold overflow        = false
   Lightweight Profiling Capabilities: Supported (0x8000001c/edx):
      lightweight profiling                  = false
      LWPVAL instruction                     = false
      instruction retired event              = false
      branch retired event                   = false
      DC miss event                          = false
      core clocks not halted event           = false
      core reference clocks not halted event = false
      continuous mode sampling               = false
      tsc in event record                    = false
      interrupt on threshold overflow        = false
   Lightweight Profiling Capabilities (0x8000001c/ebx):
      LWPCB byte size             = 0x0 (0)
      event record byte size      = 0x0 (0)
      maximum EventId             = 0x0 (0)
      EventInterval1 field offset = 0x0 (0)
   Lightweight Profiling Capabilities (0x8000001c/ecx):
      latency counter bit size          = 0x0 (0)
      data cache miss address valid     = false
      amount cache latency is rounded   = 0x0 (0)
      LWP implementation version        = 0x0 (0)
      event ring buffer size in records = 0x0 (0)
      branch prediction filtering       = false
      IP filtering                      = false
      cache level filtering             = false
      cache latency filteing            = false
   Cache Properties (0x8000001d):
      --- cache 0 ---
      type                            = data (1)
      level                           = 0x1 (1)
      self-initializing               = true
      fully associative               = false
      extra cores sharing this cache  = 0x0 (0)
      line size in bytes              = 0x40 (64)
      physical line partitions        = 0x1 (1)
      number of ways                  = 0x8 (8)
      number of sets                  = 64
      write-back invalidate           = false
      cache inclusive of lower levels = false
      (synth size)                    = 32768 (32 KB)
      --- cache 1 ---
      type                            = instruction (2)
      level                           = 0x1 (1)
      self-initializing               = true
      fully associative               = false
      extra cores sharing this cache  = 0x0 (0)
      line size in bytes              = 0x40 (64)
      physical line partitions        = 0x1 (1)
      number of ways                  = 0x4 (4)
      number of sets                  = 256
      write-back invalidate           = false
      cache inclusive of lower levels = false
      (synth size)                    = 65536 (64 KB)
      --- cache 2 ---
      type                            = unified (3)
      level                           = 0x2 (2)
      self-initializing               = true
      fully associative               = false
      extra cores sharing this cache  = 0x0 (0)
      line size in bytes              = 0x40 (64)
      physical line partitions        = 0x1 (1)
      number of ways                  = 0x8 (8)
      number of sets                  = 1024
      write-back invalidate           = false
      cache inclusive of lower levels = true
      (synth size)                    = 524288 (512 KB)
      --- cache 3 ---
      type                            = unified (3)
      level                           = 0x3 (3)
      self-initializing               = true
      fully associative               = false
      extra cores sharing this cache  = 0x1 (1)
      line size in bytes              = 0x40 (64)
      physical line partitions        = 0x1 (1)
      number of ways                  = 0x10 (16)
      number of sets                  = 4096
      write-back invalidate           = true
      cache inclusive of lower levels = false
      (synth size)                    = 4194304 (4 MB)
   extended APIC ID = 0
   Core Identifiers (0x8000001e/ebx):
      core ID          = 0x0 (0)
      threads per core = 0x1 (1)
   Node Identifiers (0x8000001e/ecx):
      node ID             = 0x0 (0)
      nodes per processor = 0x1 (1)
   AMD Secure Encryption (0x8000001f):
      SME: secure memory encryption support    = true
      SEV: secure encrypted virtualize support = true
      VM page flush MSR support                = true
      SEV-ES: SEV encrypted state support      = false
      SEV-SNP: SEV secure nested paging        = false
      VMPL: VM permission levels               = false
      RMPQUERY instruction support             = false
      VMPL supervisor shadow stack support     = false
      Secure TSC supported                     = false
      virtual TSC_AUX supported                = false
      hardware cache coher across enc domains  = false
      SEV guest exec only from 64-bit host     = false
      restricted injection                     = false
      alternate injection                      = false
      full debug state swap for SEV-ES/SEV-SNP = false
      disallowing IBS use by host              = false
      VTE: SEV virtual transparent encryption  = false
      VMGEXIT parameter support                = false
      virtual TOM MSR support                  = false
      IBS virtual support for SEV-ES/SEV-SNP   = false
      PMC virtual support for SEV-ES/SEV-SNP   = false
      RMPREAD instruction                      = false
      VMSA register protection support         = false
      SMT protection support                   = false
      secure AVIC support                      = false
      allowed SEV features support             = false
      SVSM communication page MSR support      = false
      VIRT_RMPUPDATE & VIRT_PSMASH MSR support = false
      write to hypervisor in-used allowed      = false
      IBPB on entry support                    = false
      encryption bit position in PTE           = 0x2f (47)
      physical address space width reduction   = 0x5 (5)
      number of VM permission levels           = 0x0 (0)
      number of SEV-enabled guests supported   = 0xf (15)
      minimum SEV guest ASID                   = 0x0 (0)
   (instruction supported synth):
      CMPXCHG8B                = true
      conditional move/compare = true
      PREFETCH/PREFETCHW       = true
   (multi-processing synth) = multi-core (c=4)
   (multi-processing method) = AMD leaf 1/0x8000008
   (APIC widths synth): CORE_width=2 SMT_width=0
   (APIC synth): PKG_ID=0 CORE_ID=0 SMT_ID=0
   (uarch synth) = AMD Zen, 14nm
   (synth) = AMD Ryzen 1000 (Summit Ridge ZP-B1) [Zen], 14nm
CPU 1:
   vendor_id = "AuthenticAMD"
   version information (1/eax):
      processor type  = primary processor (0)
      family          = 0xf (15)
      model           = 0x1 (1)
      stepping id     = 0x1 (1)
      extended family = 0x8 (8)
      extended model  = 0x0 (0)
      (family synth)  = 0x17 (23)
      (model synth)   = 0x1 (1)
   miscellaneous (1/ebx):
      process local APIC physical ID = 0x1 (1)
      maximum IDs for CPUs in pkg    = 0x4 (4)
      CLFLUSH line size              = 0x8 (8)
      brand index                    = 0x0 (0)
   brand id = 0x00 (0): unknown
   feature information (1/edx):
      x87 FPU on chip                        = true
      VME: virtual-8086 mode enhancement     = true
      DE: debugging extensions               = true
      PSE: page size extensions              = true
      TSC: time stamp counter                = true
      RDMSR and WRMSR support                = true
      PAE: physical address extensions       = true
      MCE: machine check exception           = true
      CMPXCHG8B inst.                        = true
      APIC on chip                           = true
      SYSENTER and SYSEXIT                   = true
      MTRR: memory type range registers      = true
      PTE global bit                         = true
      MCA: machine check architecture        = true
      CMOV: conditional move/compare instr   = true
      PAT: page attribute table              = true
      PSE-36: page size extension            = true
      PSN: processor serial number           = false
      CLFLUSH instruction                    = true
      DS: debug store                        = false
      ACPI: thermal monitor and clock ctrl   = false
      MMX Technology                         = true
      FXSAVE/FXRSTOR                         = true
      SSE extensions                         = true
      SSE2 extensions                        = true
      SS: self snoop                         = false
      hyper-threading / multi-core supported = true
      TM: therm. monitor                     = false
      IA64                                   = false
      PBE: pending break event               = false
   feature information (1/ecx):
      PNI/SSE3: Prescott New Instructions     = true
      PCLMULDQ instruction                    = true
      DTES64: 64-bit debug store              = false
      MONITOR/MWAIT                           = true
      CPL-qualified debug store               = false
      VMX: virtual machine extensions         = false
      SMX: safer mode extensions              = false
      Enhanced Intel SpeedStep Technology     = false
      TM2: thermal monitor 2                  = false
      SSSE3 extensions                        = true
      context ID: adaptive or shared L1 data  = false
      SDBG: IA32_DEBUG_INTERFACE              = false
      FMA instruction                         = true
      CMPXCHG16B instruction                  = true
      xTPR disable                            = false
      PDCM: perfmon and debug                 = false
      PCID: process context identifiers       = false
      DCA: direct cache access                = false
      SSE4.1 extensions                       = true
      SSE4.2 extensions                       = true
      x2APIC: extended xAPIC support          = false
      MOVBE instruction                       = true
      POPCNT instruction                      = true
      time stamp counter deadline             = false
      AES instruction                         = true
      XSAVE/XSTOR states                      = true
      OS-enabled XSAVE/XSTOR                  = true
      AVX: advanced vector extensions         = true
      F16C half-precision convert instruction = true
      RDRAND instruction                      = true
      hypervisor guest status                 = false
   cache and TLB information (2):
   processor serial number = 0080-0F11-0000-0000-0000-0000
   deterministic cache parameters (4):
      --- cache 0 ---
      cache type                         = no more caches (0)
   MONITOR/MWAIT (5):
      smallest monitor-line size (bytes)       = 0x40 (64)
      largest monitor-line size (bytes)        = 0x40 (64)
      enum of Monitor-MWAIT exts supported     = true
      supports intrs as break-event for MWAIT  = true
      monitorless MWAIT supported              = false
      number of C0 sub C-states using MWAIT    = 0x0 (0)
      number of C1 sub C-states using MWAIT    = 0x0 (0)
      number of C2 sub C-states using MWAIT    = 0x0 (0)
      number of C3 sub C-states using MWAIT    = 0x0 (0)
      number of C4 sub C-states using MWAIT    = 0x0 (0)
      number of C5 sub C-states using MWAIT    = 0x0 (0)
      number of C6 sub C-states using MWAIT    = 0x0 (0)
      number of C7 sub C-states using MWAIT    = 0x0 (0)
   Thermal and Power Management Features (6):
      digital thermometer                     = false
      Intel Turbo Boost Technology            = false
      ARAT always running APIC timer          = true
      PLN power limit notification            = false
      ECMD extended clock modulation duty     = false
      PTM package thermal management          = false
      HWP base registers                      = false
      HWP notification                        = false
      HWP activity window                     = false
      HWP energy performance preference       = false
      HWP package level request               = false
      HDC base registers                      = false
      Intel Turbo Boost Max Technology 3.0    = false
      HWP capabilities                        = false
      HWP PECI override                       = false
      flexible HWP                            = false
      IA32_HWP_REQUEST MSR fast access mode   = false
      HW_FEEDBACK MSRs supported              = false
      ignoring idle logical processor HWP req = false
      Thread Director                         = false
      IA32_HW_FEEDBACK_THREAD_CONFIG bit 25   = false
      digital thermometer thresholds          = 0x0 (0)
      hardware coordination feedback          = true
      ACNT2 available                         = false
      performance-energy bias capability      = false
      number of enh hardware feedback classes = 0x0 (0)
      performance capability reporting        = false
      energy efficiency capability reporting  = false
      size of feedback struct (4KB pages)     = 0x1 (1)
      index of CPU's row in feedback struct   = 0x0 (0)
   extended feature flags (7):
      FSGSBASE instructions                    = true
      IA32_TSC_ADJUST MSR supported            = false
      SGX: Software Guard Extensions supported = false
      BMI1 instructions                        = true
      HLE hardware lock elision                = false
      AVX2: advanced vector extensions 2       = true
      FDP_EXCPTN_ONLY                          = false
      SMEP supervisor mode exec protection     = true
      BMI2 instructions                        = true
      enhanced REP MOVSB/STOSB                 = false
      INVPCID instruction                      = false
      RTM: restricted transactional memory     = false
      RDT-CMT/PQoS cache monitoring            = false
      deprecated FPU CS/DS                     = false
      MPX: intel memory protection extensions  = false
      RDT-CAT/PQE cache allocation             = false
      AVX512F: AVX-512 foundation instructions = false
      AVX512DQ: double & quadword instructions = false
      RDSEED instruction                       = true
      ADX instructions                         = true
      SMAP: supervisor mode access prevention  = true
      AVX512IFMA: integer fused multiply add   = false
      PCOMMIT instruction                      = false
      CLFLUSHOPT instruction                   = true
      CLWB instruction                         = false
      Intel processor trace                    = false
      AVX512PF: prefetch instructions          = false
      AVX512ER: exponent & reciprocal instrs   = false
      AVX512CD: conflict detection instrs      = false
      SHA instructions                         = true
      AVX512BW: byte & word instructions       = false
      AVX512VL: vector length                  = false
      PREFETCHWT1                              = false
      AVX512VBMI: vector byte manipulation     = false
      UMIP: user-mode instruction prevention   = false
      PKU protection keys for user-mode        = false
      OSPKE CR4.PKE and RDPKRU/WRPKRU          = false
      WAITPKG instructions                     = false
      AVX512_VBMI2: byte VPCOMPRESS, VPEXPAND  = false
      CET_SS: CET shadow stack                 = false
      GFNI: Galois Field New Instructions      = false
      VAES instructions                        = false
      VPCLMULQDQ instruction                   = false
      AVX512_VNNI: neural network instructions = false
      AVX512_BITALG: bit count/shiffle         = false
      TME: Total Memory Encryption             = false
      AVX512: VPOPCNTDQ instruction            = false
      LA57: 57-bit addrs & 5-level paging      = false
      BNDLDX/BNDSTX MAWAU value in 64-bit mode = 0x0 (0)
      RDPID: read processor ID supported       = false
      KL: key locker                           = false
      bus lock detection                       = false
      CLDEMOTE supports cache line demote      = false
      MOVDIRI instruction                      = false
      MOVDIR64B instruction                    = false
      ENQCMD instruction                       = false
      SGX_LC: SGX launch config supported      = false
      PKS: supervisor protection keys          = false
      SGX-KEYS: SGX attestation services       = false
      AVX512_4VNNIW: neural network instrs     = false
      AVX512_4FMAPS: multiply acc single prec  = false
      fast short REP MOV                       = false
      UINTR: user interrupts                   = false
      AVX512_VP2INTERSECT: intersect mask regs = false
      IA32_MCU_OPT_CTRL SRBDS mitigation MSR   = false
      VERW MD_CLEAR microcode support          = false
      RTM transaction always aborts            = false
      IA32_TSX_FORCE_ABORT MSR                 = false
      SERIALIZE instruction                    = false
      hybrid part                              = false
      TSXLDTRK: TSX suspend load addr tracking = false
      PCONFIG instruction                      = false
      LBR: architectural last branch records   = false
      CET_IBT: CET indirect branch tracking    = false
      AMX-BF16: tile bfloat16 support          = false
      AVX512_FP16: fp16 support                = false
      AMX-TILE: tile architecture support      = false
      AMX-INT8: tile 8-bit integer support     = false
      IBRS/IBPB: indirect branch restrictions  = false
      STIBP: 1 thr indirect branch predictor   = false
      L1D_FLUSH: IA32_FLUSH_CMD MSR            = false
      IA32_ARCH_CAPABILITIES MSR               = false
      IA32_CORE_CAPABILITIES MSR               = false
      SSBD: speculative store bypass disable   = false
   Direct Cache Access Parameters (9):
      PLATFORM_DCA_CAP MSR bits = 0
   Architecture Performance Monitoring Features (0xa):
      version ID                               = 0x0 (0)
      number of counters per logical processor = 0x0 (0)
      bit width of counter                     = 0x0 (0)
      length of EBX bit vector                 = 0x0 (0)
      core cycle event                         = not available
      instruction retired event                = not available
      reference cycles event                   = not available
      last-level cache ref event               = not available
      last-level cache miss event              = not available
      branch inst retired event                = not available
      branch mispred retired event             = not available
      topdown slots event                      = not available
      topdown backend bound                    = not available
      topdown bad speculation                  = not available
      topdown frontend bound                   = not available
      topdown retiring                         = not available
      LBR inserts                              = not available
      fixed counter  0 supported               = false
      fixed counter  1 supported               = false
      fixed counter  2 supported               = false
      fixed counter  3 supported               = false
      fixed counter  4 supported               = false
      fixed counter  5 supported               = false
      fixed counter  6 supported               = false
      fixed counter  7 supported               = false
      fixed counter  8 supported               = false
      fixed counter  9 supported               = false
      fixed counter 10 supported               = false
      fixed counter 11 supported               = false
      fixed counter 12 supported               = false
      fixed counter 13 supported               = false
      fixed counter 14 supported               = false
      fixed counter 15 supported               = false
      fixed counter 16 supported               = false
      fixed counter 17 supported               = false
      fixed counter 18 supported               = false
      fixed counter 19 supported               = false
      fixed counter 20 supported               = false
      fixed counter 21 supported               = false
      fixed counter 22 supported               = false
      fixed counter 23 supported               = false
      fixed counter 24 supported               = false
      fixed counter 25 supported               = false
      fixed counter 26 supported               = false
      fixed counter 27 supported               = false
      fixed counter 28 supported               = false
      fixed counter 29 supported               = false
      fixed counter 30 supported               = false
      fixed counter 31 supported               = false
      number of contiguous fixed counters      = 0x0 (0)
      bit width of fixed counters              = 0x0 (0)
      anythread deprecation                    = false
   x2APIC features / processor topology (0xb):
      extended APIC ID                      = 0
      --- level 0 ---
      level number                          = 0x0 (0)
      level type                            = invalid (0)
      bit width of level & previous levels  = 0x0 (0)
      number of logical processors at level = 0x0 (0)
   XSAVE features (0xd/0):
      XCR0 valid bit field mask               = 0x0000000000000007
         x87 state                            = true
         SSE state                            = true
         AVX state                            = true
         MPX BNDREGS                          = false
         MPX BNDCSR                           = false
         AVX-512 opmask                       = false
         AVX-512 ZMM_Hi256                    = false
         AVX-512 Hi16_ZMM                     = false
         PKRU state                           = false
         XTILECFG state                       = false
         XTILEDATA state                      = false
      bytes required by fields in XCR0        = 0x00000340 (832)
      bytes required by XSAVE/XRSTOR area     = 0x00000340 (832)
      XSAVEOPT instruction                    = true
      XSAVEC instruction                      = true
      XGETBV instruction                      = true
      XSAVES/XRSTORS instructions             = true
      XFD: extended feature disable supported = false
      SAVE area size in bytes                 = 0x00000340 (832)
      IA32_XSS valid bit field mask           = 0x0000000000000000
         PT state                             = false
         PASID state                          = false
         CET_U user state                     = false
         CET_S supervisor state               = false
         HDC state                            = false
         UINTR state                          = false
         LBR state                            = false
         HWP state                            = false
   AVX/YMM features (0xd/2):
      AVX/YMM save state byte size             = 0x00000100 (256)
      AVX/YMM save state byte offset           = 0x00000240 (576)
      supported in IA32_XSS or XCR0            = XCR0 (user state)
      64-byte alignment in compacted XSAVE     = false
      XFD faulting supported                   = false
   extended processor signature (0x80000001/eax):
      family/generation = 0xf (15)
      model           = 0x1 (1)
      stepping id     = 0x1 (1)
      extended family = 0x8 (8)
      extended model  = 0x0 (0)
      (family synth)  = 0x17 (23)
      (model synth)   = 0x1 (1)
   extended feature flags (0x80000001/edx):
      x87 FPU on chip                       = true
      virtual-8086 mode enhancement         = true
      debugging extensions                  = true
      page size extensions                  = true
      time stamp counter                    = true
      RDMSR and WRMSR support               = true
      physical address extensions           = true
      machine check exception               = true
      CMPXCHG8B inst.                       = true
      APIC on chip                          = true
      SYSCALL and SYSRET instructions       = true
      memory type range registers           = true
      global paging extension               = true
      machine check architecture            = true
      conditional move/compare instruction  = true
      page attribute table                  = true
      page size extension                   = true
      multiprocessing capable               = false
      no-execute page protection            = true
      AMD multimedia instruction extensions = true
      MMX Technology                        = true
      FXSAVE/FXRSTOR                        = true
      SSE extensions                        = true
      1-GB large page support               = true
      RDTSCP                                = true
      long mode (AA-64)                     = true
      3DNow! instruction extensions         = false
      3DNow! instructions                   = false
   extended brand id (0x80000001/ebx):
      raw     = 0x20000000 (536870912)
      BrandId = 0x0 (0)
      PkgType = AM4 (2)
   AMD feature flags (0x80000001/ecx):
      LAHF/SAHF supported in 64-bit mode     = true
      CMP Legacy                             = true
      SVM: secure virtual machine            = true
      extended APIC space                    = true
      AltMovCr8                              = true
      LZCNT advanced bit manipulation        = true
      SSE4A support                          = true
      misaligned SSE mode                    = true
      3DNow! PREFETCH/PREFETCHW instructions = true
      OS visible workaround                  = true
      instruction based sampling             = false
      XOP support                            = false
      SKINIT/STGI support                    = true
      watchdog timer support                 = true
      lightweight profiling support          = false
      4-operand FMA instruction              = false
      TCE: translation cache extension       = true
      NodeId MSR C001100C                    = false
      TBM support                            = false
      topology extensions                    = true
      core performance counter extensions    = true
      NB/DF performance counter extensions   = true
      data breakpoint extension              = true
      performance time-stamp counter support = false
      LLC performance counter extensions     = true
      MWAITX/MONITORX supported              = true
      Address mask extension support         = false
   brand = "AMD Ryzen 3 1300X Quad-Core Processor          "
   L1 TLB/cache information: 2M/4M pages & L1 TLB (0x80000005/eax):
      instruction # entries     = 0x40 (64)
      instruction associativity = 0xff (255)
      data # entries            = 0x40 (64)
      data associativity        = 0xff (255)
   L1 TLB/cache information: 4K pages & L1 TLB (0x80000005/ebx):
      instruction # entries     = 0x40 (64)
      instruction associativity = 0xff (255)
      data # entries            = 0x40 (64)
      data associativity        = 0xff (255)
   L1 data cache information (0x80000005/ecx):
      line size (bytes) = 0x40 (64)
      lines per tag     = 0x1 (1)
      associativity     = 0x8 (8)
      size (KB)         = 0x20 (32)
   L1 instruction cache information (0x80000005/edx):
      line size (bytes) = 0x40 (64)
      lines per tag     = 0x1 (1)
      associativity     = 0x4 (4)
      size (KB)         = 0x40 (64)
   L2 TLB/cache information: 2M/4M pages & L2 TLB (0x80000006/eax):
      instruction # entries     = 0x400 (1024)
      instruction associativity = 8 to 15-way (6)
      data # entries            = 0x600 (1536)
      data associativity        = 2-way (2)
   L2 TLB/cache information: 4K pages & L2 TLB (0x80000006/ebx):
      instruction # entries     = 0x400 (1024)
      instruction associativity = 8 to 15-way (6)
      data # entries            = 0x600 (1536)
      data associativity        = 8 to 15-way (6)
   L2 unified cache information (0x80000006/ecx):
      line size (bytes) = 0x40 (64)
      lines per tag     = 0x1 (1)
      associativity     = 8 to 15-way (6)
      size (KB)         = 0x200 (512)
   L3 cache information (0x80000006/edx):
      line size (bytes)     = 0x40 (64)
      lines per tag         = 0x1 (1)
      associativity         = 16 to 31-way (8)
      size (in 512KB units) = 0x10 (16)
   RAS Capability (0x80000007/ebx):
      MCA overflow recovery support = true
      SUCCOR support                = true
      HWA: hardware assert support  = false
      scalable MCA support          = true
   Advanced Power Management Features (0x80000007/ecx):
      CmpUnitPwrSampleTimeRatio = 0x0 (0)
   Advanced Power Management Features (0x80000007/edx):
      TS: temperature sensing diode           = true
      FID: frequency ID control               = false
      VID: voltage ID control                 = false
      TTP: thermal trip                       = true
      TM: thermal monitor                     = true
      STC: software thermal control           = false
      100 MHz multiplier control              = false
      hardware P-State control                = true
      TscInvariant                            = true
      CPB: core performance boost             = false
      read-only effective frequency interface = true
      processor feedback interface            = false
      APM power reporting                     = false
      connected standby                       = true
      RAPL: running average power limit       = true
   Physical Address and Linear Address Size (0x80000008/eax):
      maximum physical address bits         = 0x30 (48)
      maximum linear (virtual) address bits = 0x30 (48)
      maximum guest physical address bits   = 0x0 (0)
   Extended Feature Extensions ID (0x80000008/ebx):
      CLZERO instruction                       = true
      instructions retired count support       = true
      always save/restore error pointers       = true
      INVLPGB instruction                      = false
      RDPRU instruction                        = false
      memory bandwidth enforcement             = false
      MCOMMIT instruction                      = false
      WBNOINVD instruction                     = false
      IBPB: indirect branch prediction barrier = true
      interruptible WBINVD, WBNOINVD           = false
      IBRS: indirect branch restr speculation  = false
      STIBP: 1 thr indirect branch predictor   = false
      CPU prefers: IBRS always on              = false
      CPU prefers: STIBP always on             = false
      IBRS preferred over software solution    = false
      IBRS provides same mode protection       = false
      EFER[LMSLE] not supported                = false
      INVLPGB supports TLB flush guest nested  = false
      ppin processor id number supported       = false
      SSBD: speculative store bypass disable   = false
      virtualized SSBD                         = false
      SSBD fixed in hardware                   = false
      CPPC: collaborative processor perf ctrl  = false
      PSFD: predictive store forward disable   = false
      not vulnerable to branch type confusion  = false
      IBPB_RET: ret addr predictor cleared     = false
      branch sampling feature support          = false
      (vuln to branch type confusion synth)    = true
   Size Identifiers (0x80000008/ecx):
      number of threads                   = 0x4 (4)
      ApicIdCoreIdSize                    = 0x4 (4)
      performance time-stamp counter size = 40 bits (0)
   Feature Extended Size (0x80000008/edx):
      max page count for INVLPGB instruction = 0x0 (0)
      RDPRU instruction max input support    = 0x0 (0)
   SVM Secure Virtual Machine (0x8000000a/eax):
      SvmRev: SVM revision = 0x1 (1)
   SVM Secure Virtual Machine (0x8000000a/edx):
      nested paging                           = true
      LBR virtualization                      = true
      SVM lock                                = true
      NRIP save                               = true
      MSR based TSC rate control              = true
      VMCB clean bits support                 = true
      flush by ASID                           = true
      decode assists                          = true
      PMC virtualization                      = false
      SSSE3/SSE5 opcode set disable           = false
      pause intercept filter                  = true
      pause filter threshold                  = true
      AVIC: AMD virtual interrupt controller  = true
      virtualized VMLOAD/VMSAVE               = true
      virtualized global interrupt flag (GIF) = true
      GMET: guest mode execute trap           = false
      X2AVIC: virtualized X2APIC              = false
      supervisor shadow stack                 = false
      guest Spec_ctl support                  = false
      ROGPT: read-only guest page table       = false
      host MCE override                       = false
      INVLPGB/TLBSYNC hyperv interc enable    = false
      VNMI: NMI virtualization                = false
      IBS virtualization                      = false
      extended LVT AVIC access changes        = false
      guest VMCB addr check                   = false
      bus lock threshold                      = false
      idlt HLT intercept                      = false
   NASID: number of address space identifiers = 0x8000 (32768):
   L1 TLB information: 1G pages (0x80000019/eax):
      instruction # entries     = 0x40 (64)
      instruction associativity = full (15)
      data # entries            = 0x40 (64)
      data associativity        = full (15)
   L2 TLB information: 1G pages (0x80000019/ebx):
      instruction # entries     = 0x0 (0)
      instruction associativity = L2 off (0)
      data # entries            = 0x0 (0)
      data associativity        = L2 off (0)
   Performance Optimization Identifiers (0x8000001a/eax):
      128-bit SSE executed full-width = true
      MOVU* better than MOVL*/MOVH*   = true
      256-bit SSE executed full-width = false
   Instruction Based Sampling Identifiers (0x8000001b/eax):
      IBS feature flags valid                  = true
      IBS fetch sampling                       = true
      IBS execution sampling                   = true
      read write of op counter                 = true
      op counting mode                         = true
      branch target address reporting          = true
      IbsOpCurCnt and IbsOpMaxCnt extend 7     = true
      invalid RIP indication support           = true
      fused branch micro-op indication support = true
      IBS fetch control extended MSR support   = true
      IBS op data 4 MSR support                = false
      IBS L3 miss filtering support            = false
   Lightweight Profiling Capabilities: Availability (0x8000001c/eax):
      lightweight profiling                  = false
      LWPVAL instruction                     = false
      instruction retired event              = false
      branch retired event                   = false
      DC miss event                          = false
      core clocks not halted event           = false
      core reference clocks not halted event = false
      continuous mode sampling               = false
      tsc in event record                    = false
      interrupt on threshold overflow        = false
   Lightweight Profiling Capabilities: Supported (0x8000001c/edx):
      lightweight profiling                  = false
      LWPVAL instruction                     = false
      instruction retired event              = false
      branch retired event                   = false
      DC miss event                          = false
      core clocks not halted event           = false
      core reference clocks not halted event = false
      continuous mode sampling               = false
      tsc in event record                    = false
      interrupt on threshold overflow        = false
   Lightweight Profiling Capabilities (0x8000001c/ebx):
      LWPCB byte size             = 0x0 (0)
      event record byte size      = 0x0 (0)
      maximum EventId             = 0x0 (0)
      EventInterval1 field offset = 0x0 (0)
   Lightweight Profiling Capabilities (0x8000001c/ecx):
      latency counter bit size          = 0x0 (0)
      data cache miss address valid     = false
      amount cache latency is rounded   = 0x0 (0)
      LWP implementation version        = 0x0 (0)
      event ring buffer size in records = 0x0 (0)
      branch prediction filtering       = false
      IP filtering                      = false
      cache level filtering             = false
      cache latency filteing            = false
   Cache Properties (0x8000001d):
      --- cache 0 ---
      type                            = data (1)
      level                           = 0x1 (1)
      self-initializing               = true
      fully associative               = false
      extra cores sharing this cache  = 0x0 (0)
      line size in bytes              = 0x40 (64)
      physical line partitions        = 0x1 (1)
      number of ways                  = 0x8 (8)
      number of sets                  = 64
      write-back invalidate           = false
      cache inclusive of lower levels = false
      (synth size)                    = 32768 (32 KB)
      --- cache 1 ---
      type                            = instruction (2)
      level                           = 0x1 (1)
      self-initializing               = true
      fully associative               = false
      extra cores sharing this cache  = 0x0 (0)
      line size in bytes              = 0x40 (64)
      physical line partitions        = 0x1 (1)
      number of ways                  = 0x4 (4)
      number of sets                  = 256
      write-back invalidate           = false
      cache inclusive of lower levels = false
      (synth size)                    = 65536 (64 KB)
      --- cache 2 ---
      type                            = unified (3)
      level                           = 0x2 (2)
      self-initializing               = true
      fully associative               = false
      extra cores sharing this cache  = 0x0 (0)
      line size in bytes              = 0x40 (64)
      physical line partitions        = 0x1 (1)
      number of ways                  = 0x8 (8)
      number of sets                  = 1024
      write-back invalidate           = false
      cache inclusive of lower levels = true
      (synth size)                    = 524288 (512 KB)
      --- cache 3 ---
      type                            = unified (3)
      level                           = 0x3 (3)
      self-initializing               = true
      fully associative               = false
      extra cores sharing this cache  = 0x1 (1)
      line size in bytes              = 0x40 (64)
      physical line partitions        = 0x1 (1)
      number of ways                  = 0x10 (16)
      number of sets                  = 4096
      write-back invalidate           = true
      cache inclusive of lower levels = false
      (synth size)                    = 4194304 (4 MB)
   extended APIC ID = 1
   Core Identifiers (0x8000001e/ebx):
      core ID          = 0x1 (1)
      threads per core = 0x1 (1)
   Node Identifiers (0x8000001e/ecx):
      node ID             = 0x0 (0)
      nodes per processor = 0x1 (1)
   AMD Secure Encryption (0x8000001f):
      SME: secure memory encryption support    = true
      SEV: secure encrypted virtualize support = true
      VM page flush MSR support                = true
      SEV-ES: SEV encrypted state support      = false
      SEV-SNP: SEV secure nested paging        = false
      VMPL: VM permission levels               = false
      RMPQUERY instruction support             = false
      VMPL supervisor shadow stack support     = false
      Secure TSC supported                     = false
      virtual TSC_AUX supported                = false
      hardware cache coher across enc domains  = false
      SEV guest exec only from 64-bit host     = false
      restricted injection                     = false
      alternate injection                      = false
      full debug state swap for SEV-ES/SEV-SNP = false
      disallowing IBS use by host              = false
      VTE: SEV virtual transparent encryption  = false
      VMGEXIT parameter support                = false
      virtual TOM MSR support                  = false
      IBS virtual support for SEV-ES/SEV-SNP   = false
      PMC virtual support for SEV-ES/SEV-SNP   = false
      RMPREAD instruction                      = false
      VMSA register protection support         = false
      SMT protection support                   = false
      secure AVIC support                      = false
      allowed SEV features support             = false
      SVSM communication page MSR support      = false
      VIRT_RMPUPDATE & VIRT_PSMASH MSR support = false
      write to hypervisor in-used allowed      = false
      IBPB on entry support                    = false
      encryption bit position in PTE           = 0x2f (47)
      physical address space width reduction   = 0x5 (5)
      number of VM permission levels           = 0x0 (0)
      number of SEV-enabled guests supported   = 0xf (15)
      minimum SEV guest ASID                   = 0x0 (0)
   (instruction supported synth):
      CMPXCHG8B                = true
      conditional move/compare = true
      PREFETCH/PREFETCHW       = true
   (multi-processing synth) = multi-core (c=4)
   (multi-processing method) = AMD leaf 1/0x8000008
   (APIC widths synth): CORE_width=2 SMT_width=0
   (APIC synth): PKG_ID=0 CORE_ID=1 SMT_ID=0
   (uarch synth) = AMD Zen, 14nm
   (synth) = AMD Ryzen 1000 (Summit Ridge ZP-B1) [Zen], 14nm
CPU 2:
   vendor_id = "AuthenticAMD"
   version information (1/eax):
      processor type  = primary processor (0)
      family          = 0xf (15)
      model           = 0x1 (1)
      stepping id     = 0x1 (1)
      extended family = 0x8 (8)
      extended model  = 0x0 (0)
      (family synth)  = 0x17 (23)
      (model synth)   = 0x1 (1)
   miscellaneous (1/ebx):
      process local APIC physical ID = 0x8 (8)
      maximum IDs for CPUs in pkg    = 0x4 (4)
      CLFLUSH line size              = 0x8 (8)
      brand index                    = 0x0 (0)
   brand id = 0x00 (0): unknown
   feature information (1/edx):
      x87 FPU on chip                        = true
      VME: virtual-8086 mode enhancement     = true
      DE: debugging extensions               = true
      PSE: page size extensions              = true
      TSC: time stamp counter                = true
      RDMSR and WRMSR support                = true
      PAE: physical address extensions       = true
      MCE: machine check exception           = true
      CMPXCHG8B inst.                        = true
      APIC on chip                           = true
      SYSENTER and SYSEXIT                   = true
      MTRR: memory type range registers      = true
      PTE global bit                         = true
      MCA: machine check architecture        = true
      CMOV: conditional move/compare instr   = true
      PAT: page attribute table              = true
      PSE-36: page size extension            = true
      PSN: processor serial number           = false
      CLFLUSH instruction                    = true
      DS: debug store                        = false
      ACPI: thermal monitor and clock ctrl   = false
      MMX Technology                         = true
      FXSAVE/FXRSTOR                         = true
      SSE extensions                         = true
      SSE2 extensions                        = true
      SS: self snoop                         = false
      hyper-threading / multi-core supported = true
      TM: therm. monitor                     = false
      IA64                                   = false
      PBE: pending break event               = false
   feature information (1/ecx):
      PNI/SSE3: Prescott New Instructions     = true
      PCLMULDQ instruction                    = true
      DTES64: 64-bit debug store              = false
      MONITOR/MWAIT                           = true
      CPL-qualified debug store               = false
      VMX: virtual machine extensions         = false
      SMX: safer mode extensions              = false
      Enhanced Intel SpeedStep Technology     = false
      TM2: thermal monitor 2                  = false
      SSSE3 extensions                        = true
      context ID: adaptive or shared L1 data  = false
      SDBG: IA32_DEBUG_INTERFACE              = false
      FMA instruction                         = true
      CMPXCHG16B instruction                  = true
      xTPR disable                            = false
      PDCM: perfmon and debug                 = false
      PCID: process context identifiers       = false
      DCA: direct cache access                = false
      SSE4.1 extensions                       = true
      SSE4.2 extensions                       = true
      x2APIC: extended xAPIC support          = false
      MOVBE instruction                       = true
      POPCNT instruction                      = true
      time stamp counter deadline             = false
      AES instruction                         = true
      XSAVE/XSTOR states                      = true
      OS-enabled XSAVE/XSTOR                  = true
      AVX: advanced vector extensions         = true
      F16C half-precision convert instruction = true
      RDRAND instruction                      = true
      hypervisor guest status                 = false
   cache and TLB information (2):
   processor serial number = 0080-0F11-0000-0000-0000-0000
   deterministic cache parameters (4):
      --- cache 0 ---
      cache type                         = no more caches (0)
   MONITOR/MWAIT (5):
      smallest monitor-line size (bytes)       = 0x40 (64)
      largest monitor-line size (bytes)        = 0x40 (64)
      enum of Monitor-MWAIT exts supported     = true
      supports intrs as break-event for MWAIT  = true
      monitorless MWAIT supported              = false
      number of C0 sub C-states using MWAIT    = 0x0 (0)
      number of C1 sub C-states using MWAIT    = 0x0 (0)
      number of C2 sub C-states using MWAIT    = 0x0 (0)
      number of C3 sub C-states using MWAIT    = 0x0 (0)
      number of C4 sub C-states using MWAIT    = 0x0 (0)
      number of C5 sub C-states using MWAIT    = 0x0 (0)
      number of C6 sub C-states using MWAIT    = 0x0 (0)
      number of C7 sub C-states using MWAIT    = 0x0 (0)
   Thermal and Power Management Features (6):
      digital thermometer                     = false
      Intel Turbo Boost Technology            = false
      ARAT always running APIC timer          = true
      PLN power limit notification            = false
      ECMD extended clock modulation duty     = false
      PTM package thermal management          = false
      HWP base registers                      = false
      HWP notification                        = false
      HWP activity window                     = false
      HWP energy performance preference       = false
      HWP package level request               = false
      HDC base registers                      = false
      Intel Turbo Boost Max Technology 3.0    = false
      HWP capabilities                        = false
      HWP PECI override                       = false
      flexible HWP                            = false
      IA32_HWP_REQUEST MSR fast access mode   = false
      HW_FEEDBACK MSRs supported              = false
      ignoring idle logical processor HWP req = false
      Thread Director                         = false
      IA32_HW_FEEDBACK_THREAD_CONFIG bit 25   = false
      digital thermometer thresholds          = 0x0 (0)
      hardware coordination feedback          = true
      ACNT2 available                         = false
      performance-energy bias capability      = false
      number of enh hardware feedback classes = 0x0 (0)
      performance capability reporting        = false
      energy efficiency capability reporting  = false
      size of feedback struct (4KB pages)     = 0x1 (1)
      index of CPU's row in feedback struct   = 0x0 (0)
   extended feature flags (7):
      FSGSBASE instructions                    = true
      IA32_TSC_ADJUST MSR supported            = false
      SGX: Software Guard Extensions supported = false
      BMI1 instructions                        = true
      HLE hardware lock elision                = false
      AVX2: advanced vector extensions 2       = true
      FDP_EXCPTN_ONLY                          = false
      SMEP supervisor mode exec protection     = true
      BMI2 instructions                        = true
      enhanced REP MOVSB/STOSB                 = false
      INVPCID instruction                      = false
      RTM: restricted transactional memory     = false
      RDT-CMT/PQoS cache monitoring            = false
      deprecated FPU CS/DS                     = false
      MPX: intel memory protection extensions  = false
      RDT-CAT/PQE cache allocation             = false
      AVX512F: AVX-512 foundation instructions = false
      AVX512DQ: double & quadword instructions = false
      RDSEED instruction                       = true
      ADX instructions                         = true
      SMAP: supervisor mode access prevention  = true
      AVX512IFMA: integer fused multiply add   = false
      PCOMMIT instruction                      = false
      CLFLUSHOPT instruction                   = true
      CLWB instruction                         = false
      Intel processor trace                    = false
      AVX512PF: prefetch instructions          = false
      AVX512ER: exponent & reciprocal instrs   = false
      AVX512CD: conflict detection instrs      = false
      SHA instructions                         = true
      AVX512BW: byte & word instructions       = false
      AVX512VL: vector length                  = false
      PREFETCHWT1                              = false
      AVX512VBMI: vector byte manipulation     = false
      UMIP: user-mode instruction prevention   = false
      PKU protection keys for user-mode        = false
      OSPKE CR4.PKE and RDPKRU/WRPKRU          = false
      WAITPKG instructions                     = false
      AVX512_VBMI2: byte VPCOMPRESS, VPEXPAND  = false
      CET_SS: CET shadow stack                 = false
      GFNI: Galois Field New Instructions      = false
      VAES instructions                        = false
      VPCLMULQDQ instruction                   = false
      AVX512_VNNI: neural network instructions = false
      AVX512_BITALG: bit count/shiffle         = false
      TME: Total Memory Encryption             = false
      AVX512: VPOPCNTDQ instruction            = false
      LA57: 57-bit addrs & 5-level paging      = false
      BNDLDX/BNDSTX MAWAU value in 64-bit mode = 0x0 (0)
      RDPID: read processor ID supported       = false
      KL: key locker                           = false
      bus lock detection                       = false
      CLDEMOTE supports cache line demote      = false
      MOVDIRI instruction                      = false
      MOVDIR64B instruction                    = false
      ENQCMD instruction                       = false
      SGX_LC: SGX launch config supported      = false
      PKS: supervisor protection keys          = false
      SGX-KEYS: SGX attestation services       = false
      AVX512_4VNNIW: neural network instrs     = false
      AVX512_4FMAPS: multiply acc single prec  = false
      fast short REP MOV                       = false
      UINTR: user interrupts                   = false
      AVX512_VP2INTERSECT: intersect mask regs = false
      IA32_MCU_OPT_CTRL SRBDS mitigation MSR   = false
      VERW MD_CLEAR microcode support          = false
      RTM transaction always aborts            = false
      IA32_TSX_FORCE_ABORT MSR                 = false
      SERIALIZE instruction                    = false
      hybrid part                              = false
      TSXLDTRK: TSX suspend load addr tracking = false
      PCONFIG instruction                      = false
      LBR: architectural last branch records   = false
      CET_IBT: CET indirect branch tracking    = false
      AMX-BF16: tile bfloat16 support          = false
      AVX512_FP16: fp16 support                = false
      AMX-TILE: tile architecture support      = false
      AMX-INT8: tile 8-bit integer support     = false
      IBRS/IBPB: indirect branch restrictions  = false
      STIBP: 1 thr indirect branch predictor   = false
      L1D_FLUSH: IA32_FLUSH_CMD MSR            = false
      IA32_ARCH_CAPABILITIES MSR               = false
      IA32_CORE_CAPABILITIES MSR               = false
      SSBD: speculative store bypass disable   = false
   Direct Cache Access Parameters (9):
      PLATFORM_DCA_CAP MSR bits = 0
   Architecture Performance Monitoring Features (0xa):
      version ID                               = 0x0 (0)
      number of counters per logical processor = 0x0 (0)
      bit width of counter                     = 0x0 (0)
      length of EBX bit vector                 = 0x0 (0)
      core cycle event                         = not available
      instruction retired event                = not available
      reference cycles event                   = not available
      last-level cache ref event               = not available
      last-level cache miss event              = not available
      branch inst retired event                = not available
      branch mispred retired event             = not available
      topdown slots event                      = not available
      topdown backend bound                    = not available
      topdown bad speculation                  = not available
      topdown frontend bound                   = not available
      topdown retiring                         = not available
      LBR inserts                              = not available
      fixed counter  0 supported               = false
      fixed counter  1 supported               = false
      fixed counter  2 supported               = false
      fixed counter  3 supported               = false
      fixed counter  4 supported               = false
      fixed counter  5 supported               = false
      fixed counter  6 supported               = false
      fixed counter  7 supported               = false
      fixed counter  8 supported               = false
      fixed counter  9 supported               = false
      fixed counter 10 supported               = false
      fixed counter 11 supported               = false
      fixed counter 12 supported               = false
      fixed counter 13 supported               = false
      fixed counter 14 supported               = false
      fixed counter 15 supported               = false
      fixed counter 16 supported               = false
      fixed counter 17 supported               = false
      fixed counter 18 supported               = false
      fixed counter 19 supported               = false
      fixed counter 20 supported               = false
      fixed counter 21 supported               = false
      fixed counter 22 supported               = false
      fixed counter 23 supported               = false
      fixed counter 24 supported               = false
      fixed counter 25 supported               = false
      fixed counter 26 supported               = false
      fixed counter 27 supported               = false
      fixed counter 28 supported               = false
      fixed counter 29 supported               = false
      fixed counter 30 supported               = false
      fixed counter 31 supported               = false
      number of contiguous fixed counters      = 0x0 (0)
      bit width of fixed counters              = 0x0 (0)
      anythread deprecation                    = false
   x2APIC features / processor topology (0xb):
      extended APIC ID                      = 0
      --- level 0 ---
      level number                          = 0x0 (0)
      level type                            = invalid (0)
      bit width of level & previous levels  = 0x0 (0)
      number of logical processors at level = 0x0 (0)
   XSAVE features (0xd/0):
      XCR0 valid bit field mask               = 0x0000000000000007
         x87 state                            = true
         SSE state                            = true
         AVX state                            = true
         MPX BNDREGS                          = false
         MPX BNDCSR                           = false
         AVX-512 opmask                       = false
         AVX-512 ZMM_Hi256                    = false
         AVX-512 Hi16_ZMM                     = false
         PKRU state                           = false
         XTILECFG state                       = false
         XTILEDATA state                      = false
      bytes required by fields in XCR0        = 0x00000340 (832)
      bytes required by XSAVE/XRSTOR area     = 0x00000340 (832)
      XSAVEOPT instruction                    = true
      XSAVEC instruction                      = true
      XGETBV instruction                      = true
      XSAVES/XRSTORS instructions             = true
      XFD: extended feature disable supported = false
      SAVE area size in bytes                 = 0x00000340 (832)
      IA32_XSS valid bit field mask           = 0x0000000000000000
         PT state                             = false
         PASID state                          = false
         CET_U user state                     = false
         CET_S supervisor state               = false
         HDC state                            = false
         UINTR state                          = false
         LBR state                            = false
         HWP state                            = false
   AVX/YMM features (0xd/2):
      AVX/YMM save state byte size             = 0x00000100 (256)
      AVX/YMM save state byte offset           = 0x00000240 (576)
      supported in IA32_XSS or XCR0            = XCR0 (user state)
      64-byte alignment in compacted XSAVE     = false
      XFD faulting supported                   = false
   extended processor signature (0x80000001/eax):
      family/generation = 0xf (15)
      model           = 0x1 (1)
      stepping id     = 0x1 (1)
      extended family = 0x8 (8)
      extended model  = 0x0 (0)
      (family synth)  = 0x17 (23)
      (model synth)   = 0x1 (1)
   extended feature flags (0x80000001/edx):
      x87 FPU on chip                       = true
      virtual-8086 mode enhancement         = true
      debugging extensions                  = true
      page size extensions                  = true
      time stamp counter                    = true
      RDMSR and WRMSR support               = true
      physical address extensions           = true
      machine check exception               = true
      CMPXCHG8B inst.                       = true
      APIC on chip                          = true
      SYSCALL and SYSRET instructions       = true
      memory type range registers           = true
      global paging extension               = true
      machine check architecture            = true
      conditional move/compare instruction  = true
      page attribute table                  = true
      page size extension                   = true
      multiprocessing capable               = false
      no-execute page protection            = true
      AMD multimedia instruction extensions = true
      MMX Technology                        = true
      FXSAVE/FXRSTOR                        = true
      SSE extensions                        = true
      1-GB large page support               = true
      RDTSCP                                = true
      long mode (AA-64)                     = true
      3DNow! instruction extensions         = false
      3DNow! instructions                   = false
   extended brand id (0x80000001/ebx):
      raw     = 0x20000000 (536870912)
      BrandId = 0x0 (0)
      PkgType = AM4 (2)
   AMD feature flags (0x80000001/ecx):
      LAHF/SAHF supported in 64-bit mode     = true
      CMP Legacy                             = true
      SVM: secure virtual machine            = true
      extended APIC space                    = true
      AltMovCr8                              = true
      LZCNT advanced bit manipulation        = true
      SSE4A support                          = true
      misaligned SSE mode                    = true
      3DNow! PREFETCH/PREFETCHW instructions = true
      OS visible workaround                  = true
      instruction based sampling             = false
      XOP support                            = false
      SKINIT/STGI support                    = true
      watchdog timer support                 = true
      lightweight profiling support          = false
      4-operand FMA instruction              = false
      TCE: translation cache extension       = true
      NodeId MSR C001100C                    = false
      TBM support                            = false
      topology extensions                    = true
      core performance counter extensions    = true
      NB/DF performance counter extensions   = true
      data breakpoint extension              = true
      performance time-stamp counter support = false
      LLC performance counter extensions     = true
      MWAITX/MONITORX supported              = true
      Address mask extension support         = false
   brand = "AMD Ryzen 3 1300X Quad-Core Processor          "
   L1 TLB/cache information: 2M/4M pages & L1 TLB (0x80000005/eax):
      instruction # entries     = 0x40 (64)
      instruction associativity = 0xff (255)
      data # entries            = 0x40 (64)
      data associativity        = 0xff (255)
   L1 TLB/cache information: 4K pages & L1 TLB (0x80000005/ebx):
      instruction # entries     = 0x40 (64)
      instruction associativity = 0xff (255)
      data # entries            = 0x40 (64)
      data associativity        = 0xff (255)
   L1 data cache information (0x80000005/ecx):
      line size (bytes) = 0x40 (64)
      lines per tag     = 0x1 (1)
      associativity     = 0x8 (8)
      size (KB)         = 0x20 (32)
   L1 instruction cache information (0x80000005/edx):
      line size (bytes) = 0x40 (64)
      lines per tag     = 0x1 (1)
      associativity     = 0x4 (4)
      size (KB)         = 0x40 (64)
   L2 TLB/cache information: 2M/4M pages & L2 TLB (0x80000006/eax):
      instruction # entries     = 0x400 (1024)
      instruction associativity = 8 to 15-way (6)
      data # entries            = 0x600 (1536)
      data associativity        = 2-way (2)
   L2 TLB/cache information: 4K pages & L2 TLB (0x80000006/ebx):
      instruction # entries     = 0x400 (1024)
      instruction associativity = 8 to 15-way (6)
      data # entries            = 0x600 (1536)
      data associativity        = 8 to 15-way (6)
   L2 unified cache information (0x80000006/ecx):
      line size (bytes) = 0x40 (64)
      lines per tag     = 0x1 (1)
      associativity     = 8 to 15-way (6)
      size (KB)         = 0x200 (512)
   L3 cache information (0x80000006/edx):
      line size (bytes)     = 0x40 (64)
      lines per tag         = 0x1 (1)
      associativity         = 16 to 31-way (8)
      size (in 512KB units) = 0x10 (16)
   RAS Capability (0x80000007/ebx):
      MCA overflow recovery support = true
      SUCCOR support                = true
      HWA: hardware assert support  = false
      scalable MCA support          = true
   Advanced Power Management Features (0x80000007/ecx):
      CmpUnitPwrSampleTimeRatio = 0x0 (0)
   Advanced Power Management Features (0x80000007/edx):
      TS: temperature sensing diode           = true
      FID: frequency ID control               = false
      VID: voltage ID control                 = false
      TTP: thermal trip                       = true
      TM: thermal monitor                     = true
      STC: software thermal control           = false
      100 MHz multiplier control              = false
      hardware P-State control                = true
      TscInvariant                            = true
      CPB: core performance boost             = false
      read-only effective frequency interface = true
      processor feedback interface            = false
      APM power reporting                     = false
      connected standby                       = true
      RAPL: running average power limit       = true
   Physical Address and Linear Address Size (0x80000008/eax):
      maximum physical address bits         = 0x30 (48)
      maximum linear (virtual) address bits = 0x30 (48)
      maximum guest physical address bits   = 0x0 (0)
   Extended Feature Extensions ID (0x80000008/ebx):
      CLZERO instruction                       = true
      instructions retired count support       = true
      always save/restore error pointers       = true
      INVLPGB instruction                      = false
      RDPRU instruction                        = false
      memory bandwidth enforcement             = false
      MCOMMIT instruction                      = false
      WBNOINVD instruction                     = false
      IBPB: indirect branch prediction barrier = true
      interruptible WBINVD, WBNOINVD           = false
      IBRS: indirect branch restr speculation  = false
      STIBP: 1 thr indirect branch predictor   = false
      CPU prefers: IBRS always on              = false
      CPU prefers: STIBP always on             = false
      IBRS preferred over software solution    = false
      IBRS provides same mode protection       = false
      EFER[LMSLE] not supported                = false
      INVLPGB supports TLB flush guest nested  = false
      ppin processor id number supported       = false
      SSBD: speculative store bypass disable   = false
      virtualized SSBD                         = false
      SSBD fixed in hardware                   = false
      CPPC: collaborative processor perf ctrl  = false
      PSFD: predictive store forward disable   = false
      not vulnerable to branch type confusion  = false
      IBPB_RET: ret addr predictor cleared     = false
      branch sampling feature support          = false
      (vuln to branch type confusion synth)    = true
   Size Identifiers (0x80000008/ecx):
      number of threads                   = 0x4 (4)
      ApicIdCoreIdSize                    = 0x4 (4)
      performance time-stamp counter size = 40 bits (0)
   Feature Extended Size (0x80000008/edx):
      max page count for INVLPGB instruction = 0x0 (0)
      RDPRU instruction max input support    = 0x0 (0)
   SVM Secure Virtual Machine (0x8000000a/eax):
      SvmRev: SVM revision = 0x1 (1)
   SVM Secure Virtual Machine (0x8000000a/edx):
      nested paging                           = true
      LBR virtualization                      = true
      SVM lock                                = true
      NRIP save                               = true
      MSR based TSC rate control              = true
      VMCB clean bits support                 = true
      flush by ASID                           = true
      decode assists                          = true
      PMC virtualization                      = false
      SSSE3/SSE5 opcode set disable           = false
      pause intercept filter                  = true
      pause filter threshold                  = true
      AVIC: AMD virtual interrupt controller  = true
      virtualized VMLOAD/VMSAVE               = true
      virtualized global interrupt flag (GIF) = true
      GMET: guest mode execute trap           = false
      X2AVIC: virtualized X2APIC              = false
      supervisor shadow stack                 = false
      guest Spec_ctl support                  = false
      ROGPT: read-only guest page table       = false
      host MCE override                       = false
      INVLPGB/TLBSYNC hyperv interc enable    = false
      VNMI: NMI virtualization                = false
      IBS virtualization                      = false
      extended LVT AVIC access changes        = false
      guest VMCB addr check                   = false
      bus lock threshold                      = false
      idlt HLT intercept                      = false
   NASID: number of address space identifiers = 0x8000 (32768):
   L1 TLB information: 1G pages (0x80000019/eax):
      instruction # entries     = 0x40 (64)
      instruction associativity = full (15)
      data # entries            = 0x40 (64)
      data associativity        = full (15)
   L2 TLB information: 1G pages (0x80000019/ebx):
      instruction # entries     = 0x0 (0)
      instruction associativity = L2 off (0)
      data # entries            = 0x0 (0)
      data associativity        = L2 off (0)
   Performance Optimization Identifiers (0x8000001a/eax):
      128-bit SSE executed full-width = true
      MOVU* better than MOVL*/MOVH*   = true
      256-bit SSE executed full-width = false
   Instruction Based Sampling Identifiers (0x8000001b/eax):
      IBS feature flags valid                  = true
      IBS fetch sampling                       = true
      IBS execution sampling                   = true
      read write of op counter                 = true
      op counting mode                         = true
      branch target address reporting          = true
      IbsOpCurCnt and IbsOpMaxCnt extend 7     = true
      invalid RIP indication support           = true
      fused branch micro-op indication support = true
      IBS fetch control extended MSR support   = true
      IBS op data 4 MSR support                = false
      IBS L3 miss filtering support            = false
   Lightweight Profiling Capabilities: Availability (0x8000001c/eax):
      lightweight profiling                  = false
      LWPVAL instruction                     = false
      instruction retired event              = false
      branch retired event                   = false
      DC miss event                          = false
      core clocks not halted event           = false
      core reference clocks not halted event = false
      continuous mode sampling               = false
      tsc in event record                    = false
      interrupt on threshold overflow        = false
   Lightweight Profiling Capabilities: Supported (0x8000001c/edx):
      lightweight profiling                  = false
      LWPVAL instruction                     = false
      instruction retired event              = false
      branch retired event                   = false
      DC miss event                          = false
      core clocks not halted event           = false
      core reference clocks not halted event = false
      continuous mode sampling               = false
      tsc in event record                    = false
      interrupt on threshold overflow        = false
   Lightweight Profiling Capabilities (0x8000001c/ebx):
      LWPCB byte size             = 0x0 (0)
      event record byte size      = 0x0 (0)
      maximum EventId             = 0x0 (0)
      EventInterval1 field offset = 0x0 (0)
   Lightweight Profiling Capabilities (0x8000001c/ecx):
      latency counter bit size          = 0x0 (0)
      data cache miss address valid     = false
      amount cache latency is rounded   = 0x0 (0)
      LWP implementation version        = 0x0 (0)
      event ring buffer size in records = 0x0 (0)
      branch prediction filtering       = false
      IP filtering                      = false
      cache level filtering             = false
      cache latency filteing            = false
   Cache Properties (0x8000001d):
      --- cache 0 ---
      type                            = data (1)
      level                           = 0x1 (1)
      self-initializing               = true
      fully associative               = false
      extra cores sharing this cache  = 0x0 (0)
      line size in bytes              = 0x40 (64)
      physical line partitions        = 0x1 (1)
      number of ways                  = 0x8 (8)
      number of sets                  = 64
      write-back invalidate           = false
      cache inclusive of lower levels = false
      (synth size)                    = 32768 (32 KB)
      --- cache 1 ---
      type                            = instruction (2)
      level                           = 0x1 (1)
      self-initializing               = true
      fully associative               = false
      extra cores sharing this cache  = 0x0 (0)
      line size in bytes              = 0x40 (64)
      physical line partitions        = 0x1 (1)
      number of ways                  = 0x4 (4)
      number of sets                  = 256
      write-back invalidate           = false
      cache inclusive of lower levels = false
      (synth size)                    = 65536 (64 KB)
      --- cache 2 ---
      type                            = unified (3)
      level                           = 0x2 (2)
      self-initializing               = true
      fully associative               = false
      extra cores sharing this cache  = 0x0 (0)
      line size in bytes              = 0x40 (64)
      physical line partitions        = 0x1 (1)
      number of ways                  = 0x8 (8)
      number of sets                  = 1024
      write-back invalidate           = false
      cache inclusive of lower levels = true
      (synth size)                    = 524288 (512 KB)
      --- cache 3 ---
      type                            = unified (3)
      level                           = 0x3 (3)
      self-initializing               = true
      fully associative               = false
      extra cores sharing this cache  = 0x1 (1)
      line size in bytes              = 0x40 (64)
      physical line partitions        = 0x1 (1)
      number of ways                  = 0x10 (16)
      number of sets                  = 4096
      write-back invalidate           = true
      cache inclusive of lower levels = false
      (synth size)                    = 4194304 (4 MB)
   extended APIC ID = 8
   Core Identifiers (0x8000001e/ebx):
      core ID          = 0x8 (8)
      threads per core = 0x1 (1)
   Node Identifiers (0x8000001e/ecx):
      node ID             = 0x0 (0)
      nodes per processor = 0x1 (1)
   AMD Secure Encryption (0x8000001f):
      SME: secure memory encryption support    = true
      SEV: secure encrypted virtualize support = true
      VM page flush MSR support                = true
      SEV-ES: SEV encrypted state support      = false
      SEV-SNP: SEV secure nested paging        = false
      VMPL: VM permission levels               = false
      RMPQUERY instruction support             = false
      VMPL supervisor shadow stack support     = false
      Secure TSC supported                     = false
      virtual TSC_AUX supported                = false
      hardware cache coher across enc domains  = false
      SEV guest exec only from 64-bit host     = false
      restricted injection                     = false
      alternate injection                      = false
      full debug state swap for SEV-ES/SEV-SNP = false
      disallowing IBS use by host              = false
      VTE: SEV virtual transparent encryption  = false
      VMGEXIT parameter support                = false
      virtual TOM MSR support                  = false
      IBS virtual support for SEV-ES/SEV-SNP   = false
      PMC virtual support for SEV-ES/SEV-SNP   = false
      RMPREAD instruction                      = false
      VMSA register protection support         = false
      SMT protection support                   = false
      secure AVIC support                      = false
      allowed SEV features support             = false
      SVSM communication page MSR support      = false
      VIRT_RMPUPDATE & VIRT_PSMASH MSR support = false
      write to hypervisor in-used allowed      = false
      IBPB on entry support                    = false
      encryption bit position in PTE           = 0x2f (47)
      physical address space width reduction   = 0x5 (5)
      number of VM permission levels           = 0x0 (0)
      number of SEV-enabled guests supported   = 0xf (15)
      minimum SEV guest ASID                   = 0x0 (0)
   (instruction supported synth):
      CMPXCHG8B                = true
      conditional move/compare = true
      PREFETCH/PREFETCHW       = true
   (multi-processing synth) = multi-core (c=4)
   (multi-processing method) = AMD leaf 1/0x8000008
   (APIC widths synth): CORE_width=2 SMT_width=0
   (APIC synth): PKG_ID=2 CORE_ID=0 SMT_ID=0
   (uarch synth) = AMD Zen, 14nm
   (synth) = AMD Ryzen 1000 (Summit Ridge ZP-B1) [Zen], 14nm
CPU 3:
   vendor_id = "AuthenticAMD"
   version information (1/eax):
      processor type  = primary processor (0)
      family          = 0xf (15)
      model           = 0x1 (1)
      stepping id     = 0x1 (1)
      extended family = 0x8 (8)
      extended model  = 0x0 (0)
      (family synth)  = 0x17 (23)
      (model synth)   = 0x1 (1)
   miscellaneous (1/ebx):
      process local APIC physical ID = 0x9 (9)
      maximum IDs for CPUs in pkg    = 0x4 (4)
      CLFLUSH line size              = 0x8 (8)
      brand index                    = 0x0 (0)
   brand id = 0x00 (0): unknown
   feature information (1/edx):
      x87 FPU on chip                        = true
      VME: virtual-8086 mode enhancement     = true
      DE: debugging extensions               = true
      PSE: page size extensions              = true
      TSC: time stamp counter                = true
      RDMSR and WRMSR support                = true
      PAE: physical address extensions       = true
      MCE: machine check exception           = true
      CMPXCHG8B inst.                        = true
      APIC on chip                           = true
      SYSENTER and SYSEXIT                   = true
      MTRR: memory type range registers      = true
      PTE global bit                         = true
      MCA: machine check architecture        = true
      CMOV: conditional move/compare instr   = true
      PAT: page attribute table              = true
      PSE-36: page size extension            = true
      PSN: processor serial number           = false
      CLFLUSH instruction                    = true
      DS: debug store                        = false
      ACPI: thermal monitor and clock ctrl   = false
      MMX Technology                         = true
      FXSAVE/FXRSTOR                         = true
      SSE extensions                         = true
      SSE2 extensions                        = true
      SS: self snoop                         = false
      hyper-threading / multi-core supported = true
      TM: therm. monitor                     = false
      IA64                                   = false
      PBE: pending break event               = false
   feature information (1/ecx):
      PNI/SSE3: Prescott New Instructions     = true
      PCLMULDQ instruction                    = true
      DTES64: 64-bit debug store              = false
      MONITOR/MWAIT                           = true
      CPL-qualified debug store               = false
      VMX: virtual machine extensions         = false
      SMX: safer mode extensions              = false
      Enhanced Intel SpeedStep Technology     = false
      TM2: thermal monitor 2                  = false
      SSSE3 extensions                        = true
      context ID: adaptive or shared L1 data  = false
      SDBG: IA32_DEBUG_INTERFACE              = false
      FMA instruction                         = true
      CMPXCHG16B instruction                  = true
      xTPR disable                            = false
      PDCM: perfmon and debug                 = false
      PCID: process context identifiers       = false
      DCA: direct cache access                = false
      SSE4.1 extensions                       = true
      SSE4.2 extensions                       = true
      x2APIC: extended xAPIC support          = false
      MOVBE instruction                       = true
      POPCNT instruction                      = true
      time stamp counter deadline             = false
      AES instruction                         = true
      XSAVE/XSTOR states                      = true
      OS-enabled XSAVE/XSTOR                  = true
      AVX: advanced vector extensions         = true
      F16C half-precision convert instruction = true
      RDRAND instruction                      = true
      hypervisor guest status                 = false
   cache and TLB information (2):
   processor serial number = 0080-0F11-0000-0000-0000-0000
   deterministic cache parameters (4):
      --- cache 0 ---
      cache type                         = no more caches (0)
   MONITOR/MWAIT (5):
      smallest monitor-line size (bytes)       = 0x40 (64)
      largest monitor-line size (bytes)        = 0x40 (64)
      enum of Monitor-MWAIT exts supported     = true
      supports intrs as break-event for MWAIT  = true
      monitorless MWAIT supported              = false
      number of C0 sub C-states using MWAIT    = 0x0 (0)
      number of C1 sub C-states using MWAIT    = 0x0 (0)
      number of C2 sub C-states using MWAIT    = 0x0 (0)
      number of C3 sub C-states using MWAIT    = 0x0 (0)
      number of C4 sub C-states using MWAIT    = 0x0 (0)
      number of C5 sub C-states using MWAIT    = 0x0 (0)
      number of C6 sub C-states using MWAIT    = 0x0 (0)
      number of C7 sub C-states using MWAIT    = 0x0 (0)
   Thermal and Power Management Features (6):
      digital thermometer                     = false
      Intel Turbo Boost Technology            = false
      ARAT always running APIC timer          = true
      PLN power limit notification            = false
      ECMD extended clock modulation duty     = false
      PTM package thermal management          = false
      HWP base registers                      = false
      HWP notification                        = false
      HWP activity window                     = false
      HWP energy performance preference       = false
      HWP package level request               = false
      HDC base registers                      = false
      Intel Turbo Boost Max Technology 3.0    = false
      HWP capabilities                        = false
      HWP PECI override                       = false
      flexible HWP                            = false
      IA32_HWP_REQUEST MSR fast access mode   = false
      HW_FEEDBACK MSRs supported              = false
      ignoring idle logical processor HWP req = false
      Thread Director                         = false
      IA32_HW_FEEDBACK_THREAD_CONFIG bit 25   = false
      digital thermometer thresholds          = 0x0 (0)
      hardware coordination feedback          = true
      ACNT2 available                         = false
      performance-energy bias capability      = false
      number of enh hardware feedback classes = 0x0 (0)
      performance capability reporting        = false
      energy efficiency capability reporting  = false
      size of feedback struct (4KB pages)     = 0x1 (1)
      index of CPU's row in feedback struct   = 0x0 (0)
   extended feature flags (7):
      FSGSBASE instructions                    = true
      IA32_TSC_ADJUST MSR supported            = false
      SGX: Software Guard Extensions supported = false
      BMI1 instructions                        = true
      HLE hardware lock elision                = false
      AVX2: advanced vector extensions 2       = true
      FDP_EXCPTN_ONLY                          = false
      SMEP supervisor mode exec protection     = true
      BMI2 instructions                        = true
      enhanced REP MOVSB/STOSB                 = false
      INVPCID instruction                      = false
      RTM: restricted transactional memory     = false
      RDT-CMT/PQoS cache monitoring            = false
      deprecated FPU CS/DS                     = false
      MPX: intel memory protection extensions  = false
      RDT-CAT/PQE cache allocation             = false
      AVX512F: AVX-512 foundation instructions = false
      AVX512DQ: double & quadword instructions = false
      RDSEED instruction                       = true
      ADX instructions                         = true
      SMAP: supervisor mode access prevention  = true
      AVX512IFMA: integer fused multiply add   = false
      PCOMMIT instruction                      = false
      CLFLUSHOPT instruction                   = true
      CLWB instruction                         = false
      Intel processor trace                    = false
      AVX512PF: prefetch instructions          = false
      AVX512ER: exponent & reciprocal instrs   = false
      AVX512CD: conflict detection instrs      = false
      SHA instructions                         = true
      AVX512BW: byte & word instructions       = false
      AVX512VL: vector length                  = false
      PREFETCHWT1                              = false
      AVX512VBMI: vector byte manipulation     = false
      UMIP: user-mode instruction prevention   = false
      PKU protection keys for user-mode        = false
      OSPKE CR4.PKE and RDPKRU/WRPKRU          = false
      WAITPKG instructions                     = false
      AVX512_VBMI2: byte VPCOMPRESS, VPEXPAND  = false
      CET_SS: CET shadow stack                 = false
      GFNI: Galois Field New Instructions      = false
      VAES instructions                        = false
      VPCLMULQDQ instruction                   = false
      AVX512_VNNI: neural network instructions = false
      AVX512_BITALG: bit count/shiffle         = false
      TME: Total Memory Encryption             = false
      AVX512: VPOPCNTDQ instruction            = false
      LA57: 57-bit addrs & 5-level paging      = false
      BNDLDX/BNDSTX MAWAU value in 64-bit mode = 0x0 (0)
      RDPID: read processor ID supported       = false
      KL: key locker                           = false
      bus lock detection                       = false
      CLDEMOTE supports cache line demote      = false
      MOVDIRI instruction                      = false
      MOVDIR64B instruction                    = false
      ENQCMD instruction                       = false
      SGX_LC: SGX launch config supported      = false
      PKS: supervisor protection keys          = false
      SGX-KEYS: SGX attestation services       = false
      AVX512_4VNNIW: neural network instrs     = false
      AVX512_4FMAPS: multiply acc single prec  = false
      fast short REP MOV                       = false
      UINTR: user interrupts                   = false
      AVX512_VP2INTERSECT: intersect mask regs = false
      IA32_MCU_OPT_CTRL SRBDS mitigation MSR   = false
      VERW MD_CLEAR microcode support          = false
      RTM transaction always aborts            = false
      IA32_TSX_FORCE_ABORT MSR                 = false
      SERIALIZE instruction                    = false
      hybrid part                              = false
      TSXLDTRK: TSX suspend load addr tracking = false
      PCONFIG instruction                      = false
      LBR: architectural last branch records   = false
      CET_IBT: CET indirect branch tracking    = false
      AMX-BF16: tile bfloat16 support          = false
      AVX512_FP16: fp16 support                = false
      AMX-TILE: tile architecture support      = false
      AMX-INT8: tile 8-bit integer support     = false
      IBRS/IBPB: indirect branch restrictions  = false
      STIBP: 1 thr indirect branch predictor   = false
      L1D_FLUSH: IA32_FLUSH_CMD MSR            = false
      IA32_ARCH_CAPABILITIES MSR               = false
      IA32_CORE_CAPABILITIES MSR               = false
      SSBD: speculative store bypass disable   = false
   Direct Cache Access Parameters (9):
      PLATFORM_DCA_CAP MSR bits = 0
   Architecture Performance Monitoring Features (0xa):
      version ID                               = 0x0 (0)
      number of counters per logical processor = 0x0 (0)
      bit width of counter                     = 0x0 (0)
      length of EBX bit vector                 = 0x0 (0)
      core cycle event                         = not available
      instruction retired event                = not available
      reference cycles event                   = not available
      last-level cache ref event               = not available
      last-level cache miss event              = not available
      branch inst retired event                = not available
      branch mispred retired event             = not available
      topdown slots event                      = not available
      topdown backend bound                    = not available
      topdown bad speculation                  = not available
      topdown frontend bound                   = not available
      topdown retiring                         = not available
      LBR inserts                              = not available
      fixed counter  0 supported               = false
      fixed counter  1 supported               = false
      fixed counter  2 supported               = false
      fixed counter  3 supported               = false
      fixed counter  4 supported               = false
      fixed counter  5 supported               = false
      fixed counter  6 supported               = false
      fixed counter  7 supported               = false
      fixed counter  8 supported               = false
      fixed counter  9 supported               = false
      fixed counter 10 supported               = false
      fixed counter 11 supported               = false
      fixed counter 12 supported               = false
      fixed counter 13 supported               = false
      fixed counter 14 supported               = false
      fixed counter 15 supported               = false
      fixed counter 16 supported               = false
      fixed counter 17 supported               = false
      fixed counter 18 supported               = false
      fixed counter 19 supported               = false
      fixed counter 20 supported               = false
      fixed counter 21 supported               = false
      fixed counter 22 supported               = false
      fixed counter 23 supported               = false
      fixed counter 24 supported               = false
      fixed counter 25 supported               = false
      fixed counter 26 supported               = false
      fixed counter 27 supported               = false
      fixed counter 28 supported               = false
      fixed counter 29 supported               = false
      fixed counter 30 supported               = false
      fixed counter 31 supported               = false
      number of contiguous fixed counters      = 0x0 (0)
      bit width of fixed counters              = 0x0 (0)
      anythread deprecation                    = false
   x2APIC features / processor topology (0xb):
      extended APIC ID                      = 0
      --- level 0 ---
      level number                          = 0x0 (0)
      level type                            = invalid (0)
      bit width of level & previous levels  = 0x0 (0)
      number of logical processors at level = 0x0 (0)
   XSAVE features (0xd/0):
      XCR0 valid bit field mask               = 0x0000000000000007
         x87 state                            = true
         SSE state                            = true
         AVX state                            = true
         MPX BNDREGS                          = false
         MPX BNDCSR                           = false
         AVX-512 opmask                       = false
         AVX-512 ZMM_Hi256                    = false
         AVX-512 Hi16_ZMM                     = false
         PKRU state                           = false
         XTILECFG state                       = false
         XTILEDATA state                      = false
      bytes required by fields in XCR0        = 0x00000340 (832)
      bytes required by XSAVE/XRSTOR area     = 0x00000340 (832)
      XSAVEOPT instruction                    = true
      XSAVEC instruction                      = true
      XGETBV instruction                      = true
      XSAVES/XRSTORS instructions             = true
      XFD: extended feature disable supported = false
      SAVE area size in bytes                 = 0x00000340 (832)
      IA32_XSS valid bit field mask           = 0x0000000000000000
         PT state                             = false
         PASID state                          = false
         CET_U user state                     = false
         CET_S supervisor state               = false
         HDC state                            = false
         UINTR state                          = false
         LBR state                            = false
         HWP state                            = false
   AVX/YMM features (0xd/2):
      AVX/YMM save state byte size             = 0x00000100 (256)
      AVX/YMM save state byte offset           = 0x00000240 (576)
      supported in IA32_XSS or XCR0            = XCR0 (user state)
      64-byte alignment in compacted XSAVE     = false
      XFD faulting supported                   = false
   extended processor signature (0x80000001/eax):
      family/generation = 0xf (15)
      model           = 0x1 (1)
      stepping id     = 0x1 (1)
      extended family = 0x8 (8)
      extended model  = 0x0 (0)
      (family synth)  = 0x17 (23)
      (model synth)   = 0x1 (1)
   extended feature flags (0x80000001/edx):
      x87 FPU on chip                       = true
      virtual-8086 mode enhancement         = true
      debugging extensions                  = true
      page size extensions                  = true
      time stamp counter                    = true
      RDMSR and WRMSR support               = true
      physical address extensions           = true
      machine check exception               = true
      CMPXCHG8B inst.                       = true
      APIC on chip                          = true
      SYSCALL and SYSRET instructions       = true
      memory type range registers           = true
      global paging extension               = true
      machine check architecture            = true
      conditional move/compare instruction  = true
      page attribute table                  = true
      page size extension                   = true
      multiprocessing capable               = false
      no-execute page protection            = true
      AMD multimedia instruction extensions = true
      MMX Technology                        = true
      FXSAVE/FXRSTOR                        = true
      SSE extensions                        = true
      1-GB large page support               = true
      RDTSCP                                = true
      long mode (AA-64)                     = true
      3DNow! instruction extensions         = false
      3DNow! instructions                   = false
   extended brand id (0x80000001/ebx):
      raw     = 0x20000000 (536870912)
      BrandId = 0x0 (0)
      PkgType = AM4 (2)
   AMD feature flags (0x80000001/ecx):
      LAHF/SAHF supported in 64-bit mode     = true
      CMP Legacy                             = true
      SVM: secure virtual machine            = true
      extended APIC space                    = true
      AltMovCr8                              = true
      LZCNT advanced bit manipulation        = true
      SSE4A support                          = true
      misaligned SSE mode                    = true
      3DNow! PREFETCH/PREFETCHW instructions = true
      OS visible workaround                  = true
      instruction based sampling             = false
      XOP support                            = false
      SKINIT/STGI support                    = true
      watchdog timer support                 = true
      lightweight profiling support          = false
      4-operand FMA instruction              = false
      TCE: translation cache extension       = true
      NodeId MSR C001100C                    = false
      TBM support                            = false
      topology extensions                    = true
      core performance counter extensions    = true
      NB/DF performance counter extensions   = true
      data breakpoint extension              = true
      performance time-stamp counter support = false
      LLC performance counter extensions     = true
      MWAITX/MONITORX supported              = true
      Address mask extension support         = false
   brand = "AMD Ryzen 3 1300X Quad-Core Processor          "
   L1 TLB/cache information: 2M/4M pages & L1 TLB (0x80000005/eax):
      instruction # entries     = 0x40 (64)
      instruction associativity = 0xff (255)
      data # entries            = 0x40 (64)
      data associativity        = 0xff (255)
   L1 TLB/cache information: 4K pages & L1 TLB (0x80000005/ebx):
      instruction # entries     = 0x40 (64)
      instruction associativity = 0xff (255)
      data # entries            = 0x40 (64)
      data associativity        = 0xff (255)
   L1 data cache information (0x80000005/ecx):
      line size (bytes) = 0x40 (64)
      lines per tag     = 0x1 (1)
      associativity     = 0x8 (8)
      size (KB)         = 0x20 (32)
   L1 instruction cache information (0x80000005/edx):
      line size (bytes) = 0x40 (64)
      lines per tag     = 0x1 (1)
      associativity     = 0x4 (4)
      size (KB)         = 0x40 (64)
   L2 TLB/cache information: 2M/4M pages & L2 TLB (0x80000006/eax):
      instruction # entries     = 0x400 (1024)
      instruction associativity = 8 to 15-way (6)
      data # entries            = 0x600 (1536)
      data associativity        = 2-way (2)
   L2 TLB/cache information: 4K pages & L2 TLB (0x80000006/ebx):
      instruction # entries     = 0x400 (1024)
      instruction associativity = 8 to 15-way (6)
      data # entries            = 0x600 (1536)
      data associativity        = 8 to 15-way (6)
   L2 unified cache information (0x80000006/ecx):
      line size (bytes) = 0x40 (64)
      lines per tag     = 0x1 (1)
      associativity     = 8 to 15-way (6)
      size (KB)         = 0x200 (512)
   L3 cache information (0x80000006/edx):
      line size (bytes)     = 0x40 (64)
      lines per tag         = 0x1 (1)
      associativity         = 16 to 31-way (8)
      size (in 512KB units) = 0x10 (16)
   RAS Capability (0x80000007/ebx):
      MCA overflow recovery support = true
      SUCCOR support                = true
      HWA: hardware assert support  = false
      scalable MCA support          = true
   Advanced Power Management Features (0x80000007/ecx):
      CmpUnitPwrSampleTimeRatio = 0x0 (0)
   Advanced Power Management Features (0x80000007/edx):
      TS: temperature sensing diode           = true
      FID: frequency ID control               = false
      VID: voltage ID control                 = false
      TTP: thermal trip                       = true
      TM: thermal monitor                     = true
      STC: software thermal control           = false
      100 MHz multiplier control              = false
      hardware P-State control                = true
      TscInvariant                            = true
      CPB: core performance boost             = false
      read-only effective frequency interface = true
      processor feedback interface            = false
      APM power reporting                     = false
      connected standby                       = true
      RAPL: running average power limit       = true
   Physical Address and Linear Address Size (0x80000008/eax):
      maximum physical address bits         = 0x30 (48)
      maximum linear (virtual) address bits = 0x30 (48)
      maximum guest physical address bits   = 0x0 (0)
   Extended Feature Extensions ID (0x80000008/ebx):
      CLZERO instruction                       = true
      instructions retired count support       = true
      always save/restore error pointers       = true
      INVLPGB instruction                      = false
      RDPRU instruction                        = false
      memory bandwidth enforcement             = false
      MCOMMIT instruction                      = false
      WBNOINVD instruction                     = false
      IBPB: indirect branch prediction barrier = true
      interruptible WBINVD, WBNOINVD           = false
      IBRS: indirect branch restr speculation  = false
      STIBP: 1 thr indirect branch predictor   = false
      CPU prefers: IBRS always on              = false
      CPU prefers: STIBP always on             = false
      IBRS preferred over software solution    = false
      IBRS provides same mode protection       = false
      EFER[LMSLE] not supported                = false
      INVLPGB supports TLB flush guest nested  = false
      ppin processor id number supported       = false
      SSBD: speculative store bypass disable   = false
      virtualized SSBD                         = false
      SSBD fixed in hardware                   = false
      CPPC: collaborative processor perf ctrl  = false
      PSFD: predictive store forward disable   = false
      not vulnerable to branch type confusion  = false
      IBPB_RET: ret addr predictor cleared     = false
      branch sampling feature support          = false
      (vuln to branch type confusion synth)    = true
   Size Identifiers (0x80000008/ecx):
      number of threads                   = 0x4 (4)
      ApicIdCoreIdSize                    = 0x4 (4)
      performance time-stamp counter size = 40 bits (0)
   Feature Extended Size (0x80000008/edx):
      max page count for INVLPGB instruction = 0x0 (0)
      RDPRU instruction max input support    = 0x0 (0)
   SVM Secure Virtual Machine (0x8000000a/eax):
      SvmRev: SVM revision = 0x1 (1)
   SVM Secure Virtual Machine (0x8000000a/edx):
      nested paging                           = true
      LBR virtualization                      = true
      SVM lock                                = true
      NRIP save                               = true
      MSR based TSC rate control              = true
      VMCB clean bits support                 = true
      flush by ASID                           = true
      decode assists                          = true
      PMC virtualization                      = false
      SSSE3/SSE5 opcode set disable           = false
      pause intercept filter                  = true
      pause filter threshold                  = true
      AVIC: AMD virtual interrupt controller  = true
      virtualized VMLOAD/VMSAVE               = true
      virtualized global interrupt flag (GIF) = true
      GMET: guest mode execute trap           = false
      X2AVIC: virtualized X2APIC              = false
      supervisor shadow stack                 = false
      guest Spec_ctl support                  = false
      ROGPT: read-only guest page table       = false
      host MCE override                       = false
      INVLPGB/TLBSYNC hyperv interc enable    = false
      VNMI: NMI virtualization                = false
      IBS virtualization                      = false
      extended LVT AVIC access changes        = false
      guest VMCB addr check                   = false
      bus lock threshold                      = false
      idlt HLT intercept                      = false
   NASID: number of address space identifiers = 0x8000 (32768):
   L1 TLB information: 1G pages (0x80000019/eax):
      instruction # entries     = 0x40 (64)
      instruction associativity = full (15)
      data # entries            = 0x40 (64)
      data associativity        = full (15)
   L2 TLB information: 1G pages (0x80000019/ebx):
      instruction # entries     = 0x0 (0)
      instruction associativity = L2 off (0)
      data # entries            = 0x0 (0)
      data associativity        = L2 off (0)
   Performance Optimization Identifiers (0x8000001a/eax):
      128-bit SSE executed full-width = true
      MOVU* better than MOVL*/MOVH*   = true
      256-bit SSE executed full-width = false
   Instruction Based Sampling Identifiers (0x8000001b/eax):
      IBS feature flags valid                  = true
      IBS fetch sampling                       = true
      IBS execution sampling                   = true
      read write of op counter                 = true
      op counting mode                         = true
      branch target address reporting          = true
      IbsOpCurCnt and IbsOpMaxCnt extend 7     = true
      invalid RIP indication support           = true
      fused branch micro-op indication support = true
      IBS fetch control extended MSR support   = true
      IBS op data 4 MSR support                = false
      IBS L3 miss filtering support            = false
   Lightweight Profiling Capabilities: Availability (0x8000001c/eax):
      lightweight profiling                  = false
      LWPVAL instruction                     = false
      instruction retired event              = false
      branch retired event                   = false
      DC miss event                          = false
      core clocks not halted event           = false
      core reference clocks not halted event = false
      continuous mode sampling               = false
      tsc in event record                    = false
      interrupt on threshold overflow        = false
   Lightweight Profiling Capabilities: Supported (0x8000001c/edx):
      lightweight profiling                  = false
      LWPVAL instruction                     = false
      instruction retired event              = false
      branch retired event                   = false
      DC miss event                          = false
      core clocks not halted event           = false
      core reference clocks not halted event = false
      continuous mode sampling               = false
      tsc in event record                    = false
      interrupt on threshold overflow        = false
   Lightweight Profiling Capabilities (0x8000001c/ebx):
      LWPCB byte size             = 0x0 (0)
      event record byte size      = 0x0 (0)
      maximum EventId             = 0x0 (0)
      EventInterval1 field offset = 0x0 (0)
   Lightweight Profiling Capabilities (0x8000001c/ecx):
      latency counter bit size          = 0x0 (0)
      data cache miss address valid     = false
      amount cache latency is rounded   = 0x0 (0)
      LWP implementation version        = 0x0 (0)
      event ring buffer size in records = 0x0 (0)
      branch prediction filtering       = false
      IP filtering                      = false
      cache level filtering             = false
      cache latency filteing            = false
   Cache Properties (0x8000001d):
      --- cache 0 ---
      type                            = data (1)
      level                           = 0x1 (1)
      self-initializing               = true
      fully associative               = false
      extra cores sharing this cache  = 0x0 (0)
      line size in bytes              = 0x40 (64)
      physical line partitions        = 0x1 (1)
      number of ways                  = 0x8 (8)
      number of sets                  = 64
      write-back invalidate           = false
      cache inclusive of lower levels = false
      (synth size)                    = 32768 (32 KB)
      --- cache 1 ---
      type                            = instruction (2)
      level                           = 0x1 (1)
      self-initializing               = true
      fully associative               = false
      extra cores sharing this cache  = 0x0 (0)
      line size in bytes              = 0x40 (64)
      physical line partitions        = 0x1 (1)
      number of ways                  = 0x4 (4)
      number of sets                  = 256
      write-back invalidate           = false
      cache inclusive of lower levels = false
      (synth size)                    = 65536 (64 KB)
      --- cache 2 ---
      type                            = unified (3)
      level                           = 0x2 (2)
      self-initializing               = true
      fully associative               = false
      extra cores sharing this cache  = 0x0 (0)
      line size in bytes              = 0x40 (64)
      physical line partitions        = 0x1 (1)
      number of ways                  = 0x8 (8)
      number of sets                  = 1024
      write-back invalidate           = false
      cache inclusive of lower levels = true
      (synth size)                    = 524288 (512 KB)
      --- cache 3 ---
      type                            = unified (3)
      level                           = 0x3 (3)
      self-initializing               = true
      fully associative               = false
      extra cores sharing this cache  = 0x1 (1)
      line size in bytes              = 0x40 (64)
      physical line partitions        = 0x1 (1)
      number of ways                  = 0x10 (16)
      number of sets                  = 4096
      write-back invalidate           = true
      cache inclusive of lower levels = false
      (synth size)                    = 4194304 (4 MB)
   extended APIC ID = 9
   Core Identifiers (0x8000001e/ebx):
      core ID          = 0x9 (9)
      threads per core = 0x1 (1)
   Node Identifiers (0x8000001e/ecx):
      node ID             = 0x0 (0)
      nodes per processor = 0x1 (1)
   AMD Secure Encryption (0x8000001f):
      SME: secure memory encryption support    = true
      SEV: secure encrypted virtualize support = true
      VM page flush MSR support                = true
      SEV-ES: SEV encrypted state support      = false
      SEV-SNP: SEV secure nested paging        = false
      VMPL: VM permission levels               = false
      RMPQUERY instruction support             = false
      VMPL supervisor shadow stack support     = false
      Secure TSC supported                     = false
      virtual TSC_AUX supported                = false
      hardware cache coher across enc domains  = false
      SEV guest exec only from 64-bit host     = false
      restricted injection                     = false
      alternate injection                      = false
      full debug state swap for SEV-ES/SEV-SNP = false
      disallowing IBS use by host              = false
      VTE: SEV virtual transparent encryption  = false
      VMGEXIT parameter support                = false
      virtual TOM MSR support                  = false
      IBS virtual support for SEV-ES/SEV-SNP   = false
      PMC virtual support for SEV-ES/SEV-SNP   = false
      RMPREAD instruction                      = false
      VMSA register protection support         = false
      SMT protection support                   = false
      secure AVIC support                      = false
      allowed SEV features support             = false
      SVSM communication page MSR support      = false
      VIRT_RMPUPDATE & VIRT_PSMASH MSR support = false
      write to hypervisor in-used allowed      = false
      IBPB on entry support                    = false
      encryption bit position in PTE           = 0x2f (47)
      physical address space width reduction   = 0x5 (5)
      number of VM permission levels           = 0x0 (0)
      number of SEV-enabled guests supported   = 0xf (15)
      minimum SEV guest ASID                   = 0x0 (0)
   (instruction supported synth):
      CMPXCHG8B                = true
      conditional move/compare = true
      PREFETCH/PREFETCHW       = true
   (multi-processing synth) = multi-core (c=4)
   (multi-processing method) = AMD leaf 1/0x8000008
   (APIC widths synth): CORE_width=2 SMT_width=0
   (APIC synth): PKG_ID=2 CORE_ID=1 SMT_ID=0
   (uarch synth) = AMD Zen, 14nm
   (synth) = AMD Ryzen 1000 (Summit Ridge ZP-B1) [Zen], 14nm

--jzq55ihohz2akf2e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="dmesg.txt"
Content-Transfer-Encoding: quoted-printable

[    0.000000] Linux version 6.9.9-arch1-1 (linux@archlinux) (gcc (GCC) 14.=
1.1 20240522, GNU ld (GNU Binutils) 2.42.0) #1 SMP PREEMPT_DYNAMIC Fri, 12 =
Jul 2024 00:06:53 +0000
[    0.000000] Command line: BOOT_IMAGE=3D/boot/vmlinuz-linux root=3DUUID=
=3De317bc8b-4ecb-4d50-8a10-16c83daf75b3 rw nvidia-drm.modeset=3D1 iommu=3Do=
ff
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009ffff] usable
[    0.000000] BIOS-e820: [mem 0x00000000000a0000-0x00000000000fffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x0000000009cfffff] usable
[    0.000000] BIOS-e820: [mem 0x0000000009d00000-0x0000000009ffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x000000000a000000-0x000000000a1fffff] usable
[    0.000000] BIOS-e820: [mem 0x000000000a200000-0x000000000a209fff] ACPI =
NVS
[    0.000000] BIOS-e820: [mem 0x000000000a20a000-0x000000000affffff] usable
[    0.000000] BIOS-e820: [mem 0x000000000b000000-0x000000000b01ffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x000000000b020000-0x00000000dbb65fff] usable
[    0.000000] BIOS-e820: [mem 0x00000000dbb66000-0x00000000dbc62fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000dbc63000-0x00000000dbcdffff] ACPI =
data
[    0.000000] BIOS-e820: [mem 0x00000000dbce0000-0x00000000dc1effff] ACPI =
NVS
[    0.000000] BIOS-e820: [mem 0x00000000dc1f0000-0x00000000dcee7fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000dcee8000-0x00000000deffffff] usable
[    0.000000] BIOS-e820: [mem 0x00000000df000000-0x00000000dfffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000f8000000-0x00000000fbffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fd100000-0x00000000fdffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fea00000-0x00000000fea0ffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000feb80000-0x00000000fec01fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fec10000-0x00000000fec10fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fec30000-0x00000000fec30fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fed00000-0x00000000fed00fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fed40000-0x00000000fed44fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fed80000-0x00000000fed8ffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fedc2000-0x00000000fedcffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fedd4000-0x00000000fedd5fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fee00000-0x00000000feefffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000ff000000-0x00000000ffffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000021f37ffff] usable
[    0.000000] The simpledrm driver will not be probed
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] APIC: Static calls initialized
[    0.000000] e820: update [mem 0xcebca018-0xcebd8057] usable =3D=3D> usab=
le
[    0.000000] e820: update [mem 0xceb99018-0xcebc9257] usable =3D=3D> usab=
le
[    0.000000] e820: update [mem 0xceb68018-0xceb98257] usable =3D=3D> usab=
le
[    0.000000] e820: update [mem 0xceb48018-0xceb67457] usable =3D=3D> usab=
le
[    0.000000] extended physical RAM map:
[    0.000000] reserve setup_data: [mem 0x0000000000000000-0x000000000009ff=
ff] usable
[    0.000000] reserve setup_data: [mem 0x00000000000a0000-0x00000000000fff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000000100000-0x0000000009cfff=
ff] usable
[    0.000000] reserve setup_data: [mem 0x0000000009d00000-0x0000000009ffff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x000000000a000000-0x000000000a1fff=
ff] usable
[    0.000000] reserve setup_data: [mem 0x000000000a200000-0x000000000a209f=
ff] ACPI NVS
[    0.000000] reserve setup_data: [mem 0x000000000a20a000-0x000000000affff=
ff] usable
[    0.000000] reserve setup_data: [mem 0x000000000b000000-0x000000000b01ff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x000000000b020000-0x00000000ceb480=
17] usable
[    0.000000] reserve setup_data: [mem 0x00000000ceb48018-0x00000000ceb674=
57] usable
[    0.000000] reserve setup_data: [mem 0x00000000ceb67458-0x00000000ceb680=
17] usable
[    0.000000] reserve setup_data: [mem 0x00000000ceb68018-0x00000000ceb982=
57] usable
[    0.000000] reserve setup_data: [mem 0x00000000ceb98258-0x00000000ceb990=
17] usable
[    0.000000] reserve setup_data: [mem 0x00000000ceb99018-0x00000000cebc92=
57] usable
[    0.000000] reserve setup_data: [mem 0x00000000cebc9258-0x00000000cebca0=
17] usable
[    0.000000] reserve setup_data: [mem 0x00000000cebca018-0x00000000cebd80=
57] usable
[    0.000000] reserve setup_data: [mem 0x00000000cebd8058-0x00000000dbb65f=
ff] usable
[    0.000000] reserve setup_data: [mem 0x00000000dbb66000-0x00000000dbc62f=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000dbc63000-0x00000000dbcdff=
ff] ACPI data
[    0.000000] reserve setup_data: [mem 0x00000000dbce0000-0x00000000dc1eff=
ff] ACPI NVS
[    0.000000] reserve setup_data: [mem 0x00000000dc1f0000-0x00000000dcee7f=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000dcee8000-0x00000000deffff=
ff] usable
[    0.000000] reserve setup_data: [mem 0x00000000df000000-0x00000000dfffff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000f8000000-0x00000000fbffff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fd100000-0x00000000fdffff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fea00000-0x00000000fea0ff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000feb80000-0x00000000fec01f=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fec10000-0x00000000fec10f=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fec30000-0x00000000fec30f=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fed00000-0x00000000fed00f=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fed40000-0x00000000fed44f=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fed80000-0x00000000fed8ff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fedc2000-0x00000000fedcff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fedd4000-0x00000000fedd5f=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fee00000-0x00000000feefff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000ff000000-0x00000000ffffff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000100000000-0x000000021f37ff=
ff] usable
[    0.000000] efi: EFI v2.7 by American Megatrends
[    0.000000] efi: ACPI 2.0=3D0xdc16f000 ACPI=3D0xdc16f000 SMBIOS=3D0xdcd1=
a000 SMBIOS 3.0=3D0xdcd19000 ESRT=3D0xda43ca18 MEMATTR=3D0xd77e3018 INITRD=
=3D0xd2e47e98 RNG=3D0xdbcdf018=20
[    0.000000] random: crng init done
[    0.000000] efi: Remove mem35: MMIO range=3D[0xf8000000-0xfbffffff] (64M=
B) from e820 map
[    0.000000] e820: remove [mem 0xf8000000-0xfbffffff] reserved
[    0.000000] efi: Remove mem36: MMIO range=3D[0xfd100000-0xfdffffff] (15M=
B) from e820 map
[    0.000000] e820: remove [mem 0xfd100000-0xfdffffff] reserved
[    0.000000] efi: Not removing mem37: MMIO range=3D[0xfea00000-0xfea0ffff=
] (64KB) from e820 map
[    0.000000] efi: Remove mem38: MMIO range=3D[0xfeb80000-0xfec01fff] (0MB=
) from e820 map
[    0.000000] e820: remove [mem 0xfeb80000-0xfec01fff] reserved
[    0.000000] efi: Not removing mem39: MMIO range=3D[0xfec10000-0xfec10fff=
] (4KB) from e820 map
[    0.000000] efi: Not removing mem40: MMIO range=3D[0xfec30000-0xfec30fff=
] (4KB) from e820 map
[    0.000000] efi: Not removing mem41: MMIO range=3D[0xfed00000-0xfed00fff=
] (4KB) from e820 map
[    0.000000] efi: Not removing mem42: MMIO range=3D[0xfed40000-0xfed44fff=
] (20KB) from e820 map
[    0.000000] efi: Not removing mem43: MMIO range=3D[0xfed80000-0xfed8ffff=
] (64KB) from e820 map
[    0.000000] efi: Not removing mem44: MMIO range=3D[0xfedc2000-0xfedcffff=
] (56KB) from e820 map
[    0.000000] efi: Not removing mem45: MMIO range=3D[0xfedd4000-0xfedd5fff=
] (8KB) from e820 map
[    0.000000] efi: Remove mem46: MMIO range=3D[0xfee00000-0xfeefffff] (1MB=
) from e820 map
[    0.000000] e820: remove [mem 0xfee00000-0xfeefffff] reserved
[    0.000000] efi: Remove mem47: MMIO range=3D[0xff000000-0xffffffff] (16M=
B) from e820 map
[    0.000000] e820: remove [mem 0xff000000-0xffffffff] reserved
[    0.000000] SMBIOS 3.1.1 present.
[    0.000000] DMI: Gigabyte Technology Co., Ltd. AB350M-D3V/AB350M-D3V-CF,=
 BIOS F23 08/08/2018
[    0.000000] tsc: Fast TSC calibration using PIT
[    0.000000] tsc: Detected 3493.137 MHz processor
[    0.000574] e820: update [mem 0x00000000-0x00000fff] usable =3D=3D> rese=
rved
[    0.000577] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.000590] last_pfn =3D 0x21f380 max_arch_pfn =3D 0x400000000
[    0.000597] MTRR map: 5 entries (3 fixed + 2 variable; max 20), built fr=
om 9 variable MTRRs
[    0.000599] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT=
 =20
[    0.000824] e820: update [mem 0xe0000000-0xffffffff] usable =3D=3D> rese=
rved
[    0.000832] last_pfn =3D 0xdf000 max_arch_pfn =3D 0x400000000
[    0.004881] esrt: Reserving ESRT space from 0x00000000da43ca18 to 0x0000=
0000da43ca50.
[    0.004887] e820: update [mem 0xda43c000-0xda43cfff] usable =3D=3D> rese=
rved
[    0.004905] Using GB pages for direct mapping
[    0.005872] Secure boot disabled
[    0.005873] RAMDISK: [mem 0xcebd9000-0xcf49bfff]
[    0.005892] ACPI: Early table checksum verification disabled
[    0.005895] ACPI: RSDP 0x00000000DC16F000 000024 (v02 ALASKA)
[    0.005898] ACPI: XSDT 0x00000000DC16F098 0000AC (v01 ALASKA A M I    01=
072009 AMI  00010013)
[    0.005904] ACPI: FACP 0x00000000DC1761E8 000114 (v06 ALASKA A M I    01=
072009 AMI  00010013)
[    0.005908] ACPI BIOS Warning (bug): Optional FADT field Pm2ControlBlock=
 has valid Length but zero Address: 0x0000000000000000/0x1 (20230628/tbfadt=
-615)
[    0.005912] ACPI: DSDT 0x00000000DC16F1D8 00700F (v02 ALASKA A M I    01=
072009 INTL 20120913)
[    0.005915] ACPI: FACS 0x00000000DC1D8E00 000040
[    0.005918] ACPI: APIC 0x00000000DC176300 0000DE (v03 ALASKA A M I    01=
072009 AMI  00010013)
[    0.005921] ACPI: FPDT 0x00000000DC1763E0 000044 (v01 ALASKA A M I    01=
072009 AMI  00010013)
[    0.005924] ACPI: FIDT 0x00000000DC176428 00009C (v01 ALASKA A M I    01=
072009 AMI  00010013)
[    0.005926] ACPI: SSDT 0x00000000DC1764C8 008C98 (v02 ALASKA A M I    00=
000002 MSFT 04000000)
[    0.005929] ACPI: CRAT 0x00000000DC17F160 000850 (v01 ALASKA A M I    00=
000001 AMD  00000001)
[    0.005932] ACPI: CDIT 0x00000000DC17F9B0 000029 (v01 ALASKA A M I    00=
000001 AMD  00000001)
[    0.005935] ACPI: SSDT 0x00000000DC17F9E0 002DBA (v01 ALASKA A M I    00=
000001 INTL 20120913)
[    0.005938] ACPI: MCFG 0x00000000DC1827A0 00003C (v01 ALASKA A M I    01=
072009 MSFT 00010013)
[    0.005940] ACPI: HPET 0x00000000DC1827E0 000038 (v01 ALASKA A M I    01=
072009 AMI  00000005)
[    0.005943] ACPI: SSDT 0x00000000DC182818 000024 (v01 ALASKA A M I    00=
001000 INTL 20120913)
[    0.005946] ACPI: UEFI 0x00000000DC182840 000048 (v01 ALASKA A M I    00=
000000      00000000)
[    0.005949] ACPI: BGRT 0x00000000DC182888 000038 (v01 ALASKA A M I    01=
072009 AMI  00010013)
[    0.005951] ACPI: IVRS 0x00000000DC1828C0 0000D0 (v02 ALASKA A M I    00=
000001 AMD  00000000)
[    0.005954] ACPI: SSDT 0x00000000DC182990 001A41 (v01 ALASKA A M I    00=
000001 INTL 20120913)
[    0.005957] ACPI: SSDT 0x00000000DC1843D8 0000F8 (v01 ALASKA A M I    00=
001000 INTL 20120913)
[    0.005960] ACPI: WSMT 0x00000000DC1844D0 000028 (v01 ALASKA A M I    01=
072009 AMI  00010013)
[    0.005962] ACPI: Reserving FACP table memory at [mem 0xdc1761e8-0xdc176=
2fb]
[    0.005963] ACPI: Reserving DSDT table memory at [mem 0xdc16f1d8-0xdc176=
1e6]
[    0.005964] ACPI: Reserving FACS table memory at [mem 0xdc1d8e00-0xdc1d8=
e3f]
[    0.005965] ACPI: Reserving APIC table memory at [mem 0xdc176300-0xdc176=
3dd]
[    0.005966] ACPI: Reserving FPDT table memory at [mem 0xdc1763e0-0xdc176=
423]
[    0.005967] ACPI: Reserving FIDT table memory at [mem 0xdc176428-0xdc176=
4c3]
[    0.005968] ACPI: Reserving SSDT table memory at [mem 0xdc1764c8-0xdc17f=
15f]
[    0.005969] ACPI: Reserving CRAT table memory at [mem 0xdc17f160-0xdc17f=
9af]
[    0.005970] ACPI: Reserving CDIT table memory at [mem 0xdc17f9b0-0xdc17f=
9d8]
[    0.005971] ACPI: Reserving SSDT table memory at [mem 0xdc17f9e0-0xdc182=
799]
[    0.005972] ACPI: Reserving MCFG table memory at [mem 0xdc1827a0-0xdc182=
7db]
[    0.005973] ACPI: Reserving HPET table memory at [mem 0xdc1827e0-0xdc182=
817]
[    0.005974] ACPI: Reserving SSDT table memory at [mem 0xdc182818-0xdc182=
83b]
[    0.005974] ACPI: Reserving UEFI table memory at [mem 0xdc182840-0xdc182=
887]
[    0.005975] ACPI: Reserving BGRT table memory at [mem 0xdc182888-0xdc182=
8bf]
[    0.005976] ACPI: Reserving IVRS table memory at [mem 0xdc1828c0-0xdc182=
98f]
[    0.005977] ACPI: Reserving SSDT table memory at [mem 0xdc182990-0xdc184=
3d0]
[    0.005978] ACPI: Reserving SSDT table memory at [mem 0xdc1843d8-0xdc184=
4cf]
[    0.005979] ACPI: Reserving WSMT table memory at [mem 0xdc1844d0-0xdc184=
4f7]
[    0.006062] No NUMA configuration found
[    0.006063] Faking a node at [mem 0x0000000000000000-0x000000021f37ffff]
[    0.006065] NODE_DATA(0) allocated [mem 0x21f37b000-0x21f37ffff]
[    0.006091] Zone ranges:
[    0.006092]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.006093]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    0.006095]   Normal   [mem 0x0000000100000000-0x000000021f37ffff]
[    0.006096]   Device   empty
[    0.006097] Movable zone start for each node
[    0.006098] Early memory node ranges
[    0.006098]   node   0: [mem 0x0000000000001000-0x000000000009ffff]
[    0.006100]   node   0: [mem 0x0000000000100000-0x0000000009cfffff]
[    0.006101]   node   0: [mem 0x000000000a000000-0x000000000a1fffff]
[    0.006102]   node   0: [mem 0x000000000a20a000-0x000000000affffff]
[    0.006103]   node   0: [mem 0x000000000b020000-0x00000000dbb65fff]
[    0.006104]   node   0: [mem 0x00000000dcee8000-0x00000000deffffff]
[    0.006105]   node   0: [mem 0x0000000100000000-0x000000021f37ffff]
[    0.006106] Initmem setup node 0 [mem 0x0000000000001000-0x000000021f37f=
fff]
[    0.006111] On node 0, zone DMA: 1 pages in unavailable ranges
[    0.006136] On node 0, zone DMA: 96 pages in unavailable ranges
[    0.006347] On node 0, zone DMA32: 768 pages in unavailable ranges
[    0.006369] On node 0, zone DMA32: 10 pages in unavailable ranges
[    0.013898] On node 0, zone DMA32: 32 pages in unavailable ranges
[    0.014040] On node 0, zone DMA32: 4994 pages in unavailable ranges
[    0.024692] On node 0, zone Normal: 4096 pages in unavailable ranges
[    0.024735] On node 0, zone Normal: 3200 pages in unavailable ranges
[    0.025170] ACPI: PM-Timer IO Port: 0x808
[    0.025177] CPU topo: Ignoring hot-pluggable APIC ID 0 in present packag=
e.
[    0.025181] ACPI: LAPIC_NMI (acpi_id[0xff] high edge lint[0x1])
[    0.025198] IOAPIC[0]: apic_id 5, version 33, address 0xfec00000, GSI 0-=
23
[    0.025203] IOAPIC[1]: apic_id 6, version 33, address 0xfec01000, GSI 24=
-55
[    0.025205] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.025207] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)
[    0.025211] ACPI: Using ACPI (MADT) for SMP configuration information
[    0.025212] ACPI: HPET id: 0x10228201 base: 0xfed00000
[    0.025222] e820: update [mem 0xd8135000-0xd8179fff] usable =3D=3D> rese=
rved
[    0.025244] CPU topo: Max. logical packages:   1
[    0.025245] CPU topo: Max. logical dies:       1
[    0.025246] CPU topo: Max. dies per package:   1
[    0.025250] CPU topo: Max. threads per core:   1
[    0.025251] CPU topo: Num. cores per package:     4
[    0.025252] CPU topo: Num. threads per package:   4
[    0.025252] CPU topo: Allowing 4 present CPUs plus 0 hotplug CPUs
[    0.025253] CPU topo: Rejected CPUs 12
[    0.025277] PM: hibernation: Registered nosave memory: [mem 0x00000000-0=
x00000fff]
[    0.025279] PM: hibernation: Registered nosave memory: [mem 0x000a0000-0=
x000fffff]
[    0.025281] PM: hibernation: Registered nosave memory: [mem 0x09d00000-0=
x09ffffff]
[    0.025282] PM: hibernation: Registered nosave memory: [mem 0x0a200000-0=
x0a209fff]
[    0.025284] PM: hibernation: Registered nosave memory: [mem 0x0b000000-0=
x0b01ffff]
[    0.025286] PM: hibernation: Registered nosave memory: [mem 0xceb48000-0=
xceb48fff]
[    0.025288] PM: hibernation: Registered nosave memory: [mem 0xceb67000-0=
xceb67fff]
[    0.025288] PM: hibernation: Registered nosave memory: [mem 0xceb68000-0=
xceb68fff]
[    0.025290] PM: hibernation: Registered nosave memory: [mem 0xceb98000-0=
xceb98fff]
[    0.025291] PM: hibernation: Registered nosave memory: [mem 0xceb99000-0=
xceb99fff]
[    0.025293] PM: hibernation: Registered nosave memory: [mem 0xcebc9000-0=
xcebc9fff]
[    0.025293] PM: hibernation: Registered nosave memory: [mem 0xcebca000-0=
xcebcafff]
[    0.025295] PM: hibernation: Registered nosave memory: [mem 0xcebd8000-0=
xcebd8fff]
[    0.025297] PM: hibernation: Registered nosave memory: [mem 0xd8135000-0=
xd8179fff]
[    0.025299] PM: hibernation: Registered nosave memory: [mem 0xda43c000-0=
xda43cfff]
[    0.025301] PM: hibernation: Registered nosave memory: [mem 0xdbb66000-0=
xdbc62fff]
[    0.025301] PM: hibernation: Registered nosave memory: [mem 0xdbc63000-0=
xdbcdffff]
[    0.025302] PM: hibernation: Registered nosave memory: [mem 0xdbce0000-0=
xdc1effff]
[    0.025303] PM: hibernation: Registered nosave memory: [mem 0xdc1f0000-0=
xdcee7fff]
[    0.025305] PM: hibernation: Registered nosave memory: [mem 0xdf000000-0=
xdfffffff]
[    0.025306] PM: hibernation: Registered nosave memory: [mem 0xe0000000-0=
xfe9fffff]
[    0.025306] PM: hibernation: Registered nosave memory: [mem 0xfea00000-0=
xfea0ffff]
[    0.025307] PM: hibernation: Registered nosave memory: [mem 0xfea10000-0=
xfec0ffff]
[    0.025308] PM: hibernation: Registered nosave memory: [mem 0xfec10000-0=
xfec10fff]
[    0.025309] PM: hibernation: Registered nosave memory: [mem 0xfec11000-0=
xfec2ffff]
[    0.025310] PM: hibernation: Registered nosave memory: [mem 0xfec30000-0=
xfec30fff]
[    0.025310] PM: hibernation: Registered nosave memory: [mem 0xfec31000-0=
xfecfffff]
[    0.025311] PM: hibernation: Registered nosave memory: [mem 0xfed00000-0=
xfed00fff]
[    0.025312] PM: hibernation: Registered nosave memory: [mem 0xfed01000-0=
xfed3ffff]
[    0.025313] PM: hibernation: Registered nosave memory: [mem 0xfed40000-0=
xfed44fff]
[    0.025313] PM: hibernation: Registered nosave memory: [mem 0xfed45000-0=
xfed7ffff]
[    0.025314] PM: hibernation: Registered nosave memory: [mem 0xfed80000-0=
xfed8ffff]
[    0.025315] PM: hibernation: Registered nosave memory: [mem 0xfed90000-0=
xfedc1fff]
[    0.025316] PM: hibernation: Registered nosave memory: [mem 0xfedc2000-0=
xfedcffff]
[    0.025317] PM: hibernation: Registered nosave memory: [mem 0xfedd0000-0=
xfedd3fff]
[    0.025317] PM: hibernation: Registered nosave memory: [mem 0xfedd4000-0=
xfedd5fff]
[    0.025318] PM: hibernation: Registered nosave memory: [mem 0xfedd6000-0=
xffffffff]
[    0.025320] [mem 0xe0000000-0xfe9fffff] available for PCI devices
[    0.025321] Booting paravirtualized kernel on bare hardware
[    0.025324] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0=
xffffffff, max_idle_ns: 6370452778343963 ns
[    0.030564] setup_percpu: NR_CPUS:320 nr_cpumask_bits:4 nr_cpu_ids:4 nr_=
node_ids:1
[    0.030917] percpu: Embedded 66 pages/cpu s233472 r8192 d28672 u524288
[    0.030924] pcpu-alloc: s233472 r8192 d28672 u524288 alloc=3D1*2097152
[    0.030926] pcpu-alloc: [0] 0 1 2 3=20
[    0.030947] Kernel command line: BOOT_IMAGE=3D/boot/vmlinuz-linux root=
=3DUUID=3De317bc8b-4ecb-4d50-8a10-16c83daf75b3 rw nvidia-drm.modeset=3D1 io=
mmu=3Doff
[    0.031012] Unknown kernel command line parameters "BOOT_IMAGE=3D/boot/v=
mlinuz-linux", will be passed to user space.
[    0.031980] Dentry cache hash table entries: 1048576 (order: 11, 8388608=
 bytes, linear)
[    0.032655] Inode-cache hash table entries: 524288 (order: 10, 4194304 b=
ytes, linear)
[    0.032698] Fallback order for Node 0: 0=20
[    0.032703] Built 1 zonelists, mobility grouping on.  Total pages: 20512=
32
[    0.032705] Policy zone: Normal
[    0.033011] mem auto-init: stack:all(zero), heap alloc:on, heap free:off
[    0.051366] Memory: 8075740K/8335820K available (18432K kernel code, 216=
5K rwdata, 13260K rodata, 3420K init, 3600K bss, 259820K reserved, 0K cma-r=
eserved)
[    0.051567] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D4, N=
odes=3D1
[    0.051603] ftrace: allocating 50028 entries in 196 pages
[    0.059238] ftrace: allocated 196 pages with 3 groups
[    0.059319] Dynamic Preempt: full
[    0.059356] rcu: Preemptible hierarchical RCU implementation.
[    0.059356] rcu: 	RCU restricting CPUs from NR_CPUS=3D320 to nr_cpu_ids=
=3D4.
[    0.059357] rcu: 	RCU priority boosting: priority 1 delay 500 ms.
[    0.059358] 	Trampoline variant of Tasks RCU enabled.
[    0.059359] 	Rude variant of Tasks RCU enabled.
[    0.059359] 	Tracing variant of Tasks RCU enabled.
[    0.059360] rcu: RCU calculated value of scheduler-enlistment delay is 3=
0 jiffies.
[    0.059361] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=
=3D4
[    0.059367] RCU Tasks: Setting shift to 2 and lim to 1 rcu_task_cb_adjus=
t=3D1.
[    0.059368] RCU Tasks Rude: Setting shift to 2 and lim to 1 rcu_task_cb_=
adjust=3D1.
[    0.059369] RCU Tasks Trace: Setting shift to 2 and lim to 1 rcu_task_cb=
_adjust=3D1.
[    0.063201] NR_IRQS: 20736, nr_irqs: 1000, preallocated irqs: 16
[    0.063395] rcu: srcu_init: Setting srcu_struct sizes based on contentio=
n.
[    0.063530] kfence: initialized - using 2097152 bytes for 255 objects at=
 0x(____ptrval____)-0x(____ptrval____)
[    0.063558] Console: colour dummy device 80x25
[    0.063561] printk: legacy console [tty0] enabled
[    0.063602] ACPI: Core revision 20230628
[    0.063720] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, =
max_idle_ns: 133484873504 ns
[    0.063747] APIC: Switch to symmetric I/O mode setup
[    0.064586] ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 apic2=3D-1 pin2=3D=
-1
[    0.080414] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles:=
 0x3259fe1cf6e, max_idle_ns: 440795365631 ns
[    0.080419] Calibrating delay loop (skipped), value calculated using tim=
er frequency.. 6989.36 BogoMIPS (lpj=3D11643790)
[    0.080430] AMD Zen1 DIV0 bug detected. Disable SMT for full protection.
[    0.080432] SVM disabled (by BIOS) in MSR_VM_CR
[    0.080460] LVT offset 1 assigned for vector 0xf9
[    0.080525] LVT offset 2 assigned for vector 0xf4
[    0.080541] Last level iTLB entries: 4KB 1024, 2MB 1024, 4MB 512
[    0.080542] Last level dTLB entries: 4KB 1536, 2MB 1536, 4MB 768, 1GB 0
[    0.080546] Spectre V1 : Mitigation: usercopy/swapgs barriers and __user=
 pointer sanitization
[    0.080548] Spectre V2 : Mitigation: Retpolines
[    0.080548] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB=
 on context switch
[    0.080549] Spectre V2 : Spectre v2 / SpectreRSB : Filling RSB on VMEXIT
[    0.080550] Spectre V2 : Enabling Speculation Barrier for firmware calls
[    0.080550] RETBleed: Mitigation: untrained return thunk
[    0.080552] Spectre V2 : mitigation: Enabling conditional Indirect Branc=
h Prediction Barrier
[    0.080553] Speculative Store Bypass: Mitigation: Speculative Store Bypa=
ss disabled via prctl
[    0.080558] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point=
 registers'
[    0.080559] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.080560] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.080561] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.080562] x86/fpu: Enabled xstate features 0x7, context size is 832 by=
tes, using 'compacted' format.
[    0.097434] Freeing SMP alternatives memory: 40K
[    0.097438] pid_max: default: 32768 minimum: 301
[    0.099055] LSM: initializing lsm=3Dcapability,landlock,lockdown,yama,bpf
[    0.099076] landlock: Up and running.
[    0.099077] Yama: becoming mindful.
[    0.099083] LSM support for eBPF active
[    0.099111] Mount-cache hash table entries: 16384 (order: 5, 131072 byte=
s, linear)
[    0.099123] Mountpoint-cache hash table entries: 16384 (order: 5, 131072=
 bytes, linear)
[    0.206501] smpboot: CPU0: AMD Ryzen 3 1300X Quad-Core Processor (family=
: 0x17, model: 0x1, stepping: 0x1)
[    0.206665] Performance Events: Fam17h+ core perfctr, AMD PMU driver.
[    0.206669] ... version:                0
[    0.206670] ... bit width:              48
[    0.206671] ... generic registers:      6
[    0.206672] ... value mask:             0000ffffffffffff
[    0.206673] ... max period:             00007fffffffffff
[    0.206673] ... fixed-purpose events:   0
[    0.206674] ... event mask:             000000000000003f
[    0.206737] signal: max sigframe size: 1776
[    0.206767] rcu: Hierarchical SRCU implementation.
[    0.206768] rcu: 	Max phase no-delay instances is 1000.
[    0.207083] MCE: In-kernel MCE decoding enabled.
[    0.207083] NMI watchdog: Enabled. Permanently consumes one hw-PMU count=
er.
[    0.207083] smp: Bringing up secondary CPUs ...
[    0.207083] smpboot: x86: Booting SMP configuration:
[    0.207083] .... node  #0, CPUs:      #1 #2 #3
[    0.212419] smp: Brought up 1 node, 4 CPUs
[    0.212419] smpboot: Total of 4 processors activated (27956.47 BogoMIPS)
[    0.213901] devtmpfs: initialized
[    0.213901] x86/mm: Memory block size: 128MB
[    0.214399] ACPI: PM: Registering ACPI NVS region [mem 0x0a200000-0x0a20=
9fff] (40960 bytes)
[    0.214399] ACPI: PM: Registering ACPI NVS region [mem 0xdbce0000-0xdc1e=
ffff] (5308416 bytes)
[    0.214399] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfffffff=
f, max_idle_ns: 6370867519511994 ns
[    0.214399] futex hash table entries: 1024 (order: 4, 65536 bytes, linea=
r)
[    0.214399] pinctrl core: initialized pinctrl subsystem
[    0.214399] PM: RTC time: 18:08:34, date: 2024-07-14
[    0.214399] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.214567] DMA: preallocated 1024 KiB GFP_KERNEL pool for atomic alloca=
tions
[    0.214686] DMA: preallocated 1024 KiB GFP_KERNEL|GFP_DMA pool for atomi=
c allocations
[    0.214810] DMA: preallocated 1024 KiB GFP_KERNEL|GFP_DMA32 pool for ato=
mic allocations
[    0.214822] audit: initializing netlink subsys (disabled)
[    0.214832] audit: type=3D2000 audit(1720980514.149:1): state=3Dinitiali=
zed audit_enabled=3D0 res=3D1
[    0.214832] thermal_sys: Registered thermal governor 'fair_share'
[    0.214832] thermal_sys: Registered thermal governor 'bang_bang'
[    0.214832] thermal_sys: Registered thermal governor 'step_wise'
[    0.214832] thermal_sys: Registered thermal governor 'user_space'
[    0.214832] thermal_sys: Registered thermal governor 'power_allocator'
[    0.214832] cpuidle: using governor ladder
[    0.214832] cpuidle: using governor menu
[    0.214832] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.214832] PCI: ECAM [mem 0xf8000000-0xfbffffff] (base 0xf8000000) for =
domain 0000 [bus 00-3f]
[    0.214832] PCI: Using configuration type 1 for base access
[    0.214832] kprobes: kprobe jump-optimization is enabled. All kprobes ar=
e optimized if possible.
[    0.217131] HugeTLB: registered 1.00 GiB page size, pre-allocated 0 pages
[    0.217131] HugeTLB: 16380 KiB vmemmap can be freed for a 1.00 GiB page
[    0.217131] HugeTLB: registered 2.00 MiB page size, pre-allocated 0 pages
[    0.217131] HugeTLB: 28 KiB vmemmap can be freed for a 2.00 MiB page
[    0.217137] Demotion targets for Node 0: null
[    0.217175] ACPI: Added _OSI(Module Device)
[    0.217176] ACPI: Added _OSI(Processor Device)
[    0.217177] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.217178] ACPI: Added _OSI(Processor Aggregator Device)
[    0.225236] ACPI: 6 ACPI AML tables successfully acquired and loaded
[    0.227524] ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignored
[    0.231071] ACPI: _OSC evaluation for CPUs failed, trying _PDC
[    0.231071] ACPI: Interpreter enabled
[    0.231071] ACPI: PM: (supports S0 S3 S4 S5)
[    0.231071] ACPI: Using IOAPIC for interrupt routing
[    0.231600] PCI: Using host bridge windows from ACPI; if necessary, use =
"pci=3Dnocrs" and report a bug
[    0.231601] PCI: Using E820 reservations for host bridge windows
[    0.231836] ACPI: Enabled 2 GPEs in block 00 to 1F
[    0.240587] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
[    0.240594] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM Cloc=
kPM Segments MSI EDR HPX-Type3]
[    0.240677] acpi PNP0A08:00: _OSC: platform does not support [SHPCHotplu=
g LTR DPC]
[    0.240828] acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug PME AER =
PCIeCapability]
[    0.240838] acpi PNP0A08:00: [Firmware Info]: ECAM [mem 0xf8000000-0xfbf=
fffff] for domain 0000 [bus 00-3f] only partially covers this bridge
[    0.241223] PCI host bridge to bus 0000:00
[    0.241225] pci_bus 0000:00: root bus resource [io  0x0000-0x03af window]
[    0.241227] pci_bus 0000:00: root bus resource [io  0x03e0-0x0cf7 window]
[    0.241228] pci_bus 0000:00: root bus resource [io  0x03b0-0x03df window]
[    0.241229] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
[    0.241231] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000dfff=
f window]
[    0.241232] pci_bus 0000:00: root bus resource [mem 0xe0000000-0xfec2fff=
f window]
[    0.241233] pci_bus 0000:00: root bus resource [mem 0xfee00000-0xfffffff=
f window]
[    0.241235] pci_bus 0000:00: root bus resource [bus 00-ff]
[    0.241249] pci 0000:00:00.0: [1022:1450] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.241330] pci 0000:00:00.2: [1022:1451] type 00 class 0x080600 convent=
ional PCI endpoint
[    0.241414] pci 0000:00:01.0: [1022:1452] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.241462] pci 0000:00:01.1: [1022:1453] type 01 class 0x060400 PCIe Ro=
ot Port
[    0.241476] pci 0000:00:01.1: PCI bridge to [bus 01]
[    0.241481] pci 0000:00:01.1:   bridge window [mem 0xf7c00000-0xf7cfffff]
[    0.241570] pci 0000:00:01.1: PME# supported from D0 D3hot D3cold
[    0.241747] pci 0000:00:01.3: [1022:1453] type 01 class 0x060400 PCIe Ro=
ot Port
[    0.241761] pci 0000:00:01.3: PCI bridge to [bus 02-0a]
[    0.241765] pci 0000:00:01.3:   bridge window [io  0xd000-0xefff]
[    0.241767] pci 0000:00:01.3:   bridge window [mem 0xf6400000-0xf77fffff]
[    0.241772] pci 0000:00:01.3:   bridge window [mem 0xf2100000-0xf21fffff=
 64bit pref]
[    0.241853] pci 0000:00:01.3: PME# supported from D0 D3hot D3cold
[    0.242058] pci 0000:00:02.0: [1022:1452] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.242124] pci 0000:00:03.0: [1022:1452] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.242173] pci 0000:00:03.1: [1022:1453] type 01 class 0x060400 PCIe Ro=
ot Port
[    0.242192] pci 0000:00:03.1: PCI bridge to [bus 0b]
[    0.242196] pci 0000:00:03.1:   bridge window [io  0xf000-0xffff]
[    0.242199] pci 0000:00:03.1:   bridge window [mem 0xf5000000-0xf60fffff]
[    0.242206] pci 0000:00:03.1:   bridge window [mem 0xe0000000-0xf1ffffff=
 64bit pref]
[    0.242470] pci 0000:00:03.1: PME# supported from D0 D3hot D3cold
[    0.242676] pci 0000:00:04.0: [1022:1452] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.242742] pci 0000:00:07.0: [1022:1452] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.242788] pci 0000:00:07.1: [1022:1454] type 01 class 0x060400 PCIe Ro=
ot Port
[    0.242801] pci 0000:00:07.1: PCI bridge to [bus 0c]
[    0.242806] pci 0000:00:07.1:   bridge window [mem 0xf7800000-0xf7afffff]
[    0.242822] pci 0000:00:07.1: enabling Extended Tags
[    0.242888] pci 0000:00:07.1: PME# supported from D0 D3hot D3cold
[    0.243064] pci 0000:00:08.0: [1022:1452] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.243113] pci 0000:00:08.1: [1022:1454] type 01 class 0x060400 PCIe Ro=
ot Port
[    0.243127] pci 0000:00:08.1: PCI bridge to [bus 0d]
[    0.243131] pci 0000:00:08.1:   bridge window [mem 0xf7b00000-0xf7bfffff]
[    0.243388] pci 0000:00:08.1: enabling Extended Tags
[    0.243457] pci 0000:00:08.1: PME# supported from D0 D3hot D3cold
[    0.243664] pci 0000:00:14.0: [1022:790b] type 00 class 0x0c0500 convent=
ional PCI endpoint
[    0.243873] pci 0000:00:14.3: [1022:790e] type 00 class 0x060100 convent=
ional PCI endpoint
[    0.244088] pci 0000:00:18.0: [1022:1460] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.244124] pci 0000:00:18.1: [1022:1461] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.244156] pci 0000:00:18.2: [1022:1462] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.244189] pci 0000:00:18.3: [1022:1463] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.244222] pci 0000:00:18.4: [1022:1464] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.244254] pci 0000:00:18.5: [1022:1465] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.244287] pci 0000:00:18.6: [1022:1466] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.244319] pci 0000:00:18.7: [1022:1467] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.244434] pci 0000:01:00.0: [144d:a804] type 00 class 0x010802 PCIe En=
dpoint
[    0.244449] pci 0000:01:00.0: BAR 0 [mem 0xf7c00000-0xf7c03fff 64bit]
[    0.244646] pci 0000:00:01.1: PCI bridge to [bus 01]
[    0.244721] pci 0000:02:00.0: [1022:43bb] type 00 class 0x0c0330 PCIe Le=
gacy Endpoint
[    0.244737] pci 0000:02:00.0: BAR 0 [mem 0xf77a0000-0xf77a7fff 64bit]
[    0.244819] pci 0000:02:00.0: PME# supported from D3hot D3cold
[    0.244959] pci 0000:02:00.1: [1022:43b7] type 00 class 0x010601 PCIe Le=
gacy Endpoint
[    0.245001] pci 0000:02:00.1: BAR 5 [mem 0xf7780000-0xf779ffff]
[    0.245008] pci 0000:02:00.1: ROM [mem 0xf7700000-0xf777ffff pref]
[    0.245049] pci 0000:02:00.1: PME# supported from D3hot D3cold
[    0.245124] pci 0000:02:00.2: [1022:43b2] type 01 class 0x060400 PCIe Sw=
itch Upstream Port
[    0.245149] pci 0000:02:00.2: PCI bridge to [bus 03-0a]
[    0.245155] pci 0000:02:00.2:   bridge window [io  0xd000-0xefff]
[    0.245157] pci 0000:02:00.2:   bridge window [mem 0xf6400000-0xf76fffff]
[    0.245166] pci 0000:02:00.2:   bridge window [mem 0xf2100000-0xf21fffff=
 64bit pref]
[    0.245216] pci 0000:02:00.2: PME# supported from D3hot D3cold
[    0.245310] pci 0000:00:01.3: PCI bridge to [bus 02-0a]
[    0.245398] pci 0000:03:00.0: [1022:43b4] type 01 class 0x060400 PCIe Sw=
itch Downstream Port
[    0.245425] pci 0000:03:00.0: PCI bridge to [bus 04]
[    0.245505] pci 0000:03:00.0: PME# supported from D3hot D3cold
[    0.245610] pci 0000:03:01.0: [1022:43b4] type 01 class 0x060400 PCIe Sw=
itch Downstream Port
[    0.245636] pci 0000:03:01.0: PCI bridge to [bus 05]
[    0.245716] pci 0000:03:01.0: PME# supported from D3hot D3cold
[    0.245824] pci 0000:03:04.0: [1022:43b4] type 01 class 0x060400 PCIe Sw=
itch Downstream Port
[    0.245850] pci 0000:03:04.0: PCI bridge to [bus 06]
[    0.245856] pci 0000:03:04.0:   bridge window [io  0xe000-0xefff]
[    0.245858] pci 0000:03:04.0:   bridge window [mem 0xf7600000-0xf76fffff]
[    0.245867] pci 0000:03:04.0:   bridge window [mem 0xf2100000-0xf21fffff=
 64bit pref]
[    0.245934] pci 0000:03:04.0: PME# supported from D3hot D3cold
[    0.246038] pci 0000:03:05.0: [1022:43b4] type 01 class 0x060400 PCIe Sw=
itch Downstream Port
[    0.246065] pci 0000:03:05.0: PCI bridge to [bus 07]
[    0.246145] pci 0000:03:05.0: PME# supported from D3hot D3cold
[    0.246249] pci 0000:03:06.0: [1022:43b4] type 01 class 0x060400 PCIe Sw=
itch Downstream Port
[    0.246276] pci 0000:03:06.0: PCI bridge to [bus 08-09]
[    0.246281] pci 0000:03:06.0:   bridge window [io  0xd000-0xdfff]
[    0.246284] pci 0000:03:06.0:   bridge window [mem 0xf6400000-0xf74fffff]
[    0.246358] pci 0000:03:06.0: PME# supported from D3hot D3cold
[    0.246466] pci 0000:03:07.0: [1022:43b4] type 01 class 0x060400 PCIe Sw=
itch Downstream Port
[    0.246493] pci 0000:03:07.0: PCI bridge to [bus 0a]
[    0.246573] pci 0000:03:07.0: PME# supported from D3hot D3cold
[    0.246685] pci 0000:02:00.2: PCI bridge to [bus 03-0a]
[    0.246725] pci 0000:03:00.0: PCI bridge to [bus 04]
[    0.246770] pci 0000:03:01.0: PCI bridge to [bus 05]
[    0.246845] pci 0000:06:00.0: [10ec:8168] type 00 class 0x020000 PCIe En=
dpoint
[    0.246871] pci 0000:06:00.0: BAR 0 [io  0xe000-0xe0ff]
[    0.246907] pci 0000:06:00.0: BAR 2 [mem 0xf7600000-0xf7600fff 64bit]
[    0.246929] pci 0000:06:00.0: BAR 4 [mem 0xf2100000-0xf2103fff 64bit pre=
f]
[    0.247078] pci 0000:06:00.0: supports D1 D2
[    0.247079] pci 0000:06:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.247287] pci 0000:03:04.0: PCI bridge to [bus 06]
[    0.247326] pci 0000:03:05.0: PCI bridge to [bus 07]
[    0.247415] pci 0000:08:00.0: [8086:10c9] type 00 class 0x020000 PCIe En=
dpoint
[    0.247451] pci 0000:08:00.0: BAR 0 [mem 0xf7420000-0xf743ffff]
[    0.247471] pci 0000:08:00.0: BAR 1 [mem 0xf7000000-0xf73fffff]
[    0.247491] pci 0000:08:00.0: BAR 2 [io  0xd020-0xd03f]
[    0.247511] pci 0000:08:00.0: BAR 3 [mem 0xf74c4000-0xf74c7fff]
[    0.247567] pci 0000:08:00.0: ROM [mem 0xf6c00000-0xf6ffffff pref]
[    0.247741] pci 0000:08:00.0: PME# supported from D0 D3hot D3cold
[    0.247818] pci 0000:08:00.0: VF BAR 0 [mem 0xf74a0000-0xf74a3fff 64bit]
[    0.247820] pci 0000:08:00.0: VF BAR 0 [mem 0xf74a0000-0xf74bffff 64bit]=
: contains BAR 0 for 8 VFs
[    0.247868] pci 0000:08:00.0: VF BAR 3 [mem 0xf7480000-0xf7483fff 64bit]
[    0.247869] pci 0000:08:00.0: VF BAR 3 [mem 0xf7480000-0xf749ffff 64bit]=
: contains BAR 3 for 8 VFs
[    0.248070] pci 0000:08:00.0: 2.000 Gb/s available PCIe bandwidth, limit=
ed by 2.5 GT/s PCIe x1 link at 0000:03:06.0 (capable of 8.000 Gb/s with 2.5=
 GT/s PCIe x4 link)
[    0.248224] pci 0000:08:00.1: [8086:10c9] type 00 class 0x020000 PCIe En=
dpoint
[    0.248260] pci 0000:08:00.1: BAR 0 [mem 0xf7400000-0xf741ffff]
[    0.248280] pci 0000:08:00.1: BAR 1 [mem 0xf6800000-0xf6bfffff]
[    0.248300] pci 0000:08:00.1: BAR 2 [io  0xd000-0xd01f]
[    0.248319] pci 0000:08:00.1: BAR 3 [mem 0xf74c0000-0xf74c3fff]
[    0.248376] pci 0000:08:00.1: ROM [mem 0xf6400000-0xf67fffff pref]
[    0.248549] pci 0000:08:00.1: PME# supported from D0 D3hot D3cold
[    0.248625] pci 0000:08:00.1: VF BAR 0 [mem 0xf7460000-0xf7463fff 64bit]
[    0.248626] pci 0000:08:00.1: VF BAR 0 [mem 0xf7460000-0xf747ffff 64bit]=
: contains BAR 0 for 8 VFs
[    0.248674] pci 0000:08:00.1: VF BAR 3 [mem 0xf7440000-0xf7443fff 64bit]
[    0.248675] pci 0000:08:00.1: VF BAR 3 [mem 0xf7440000-0xf745ffff 64bit]=
: contains BAR 3 for 8 VFs
[    0.249019] pci 0000:03:06.0: PCI bridge to [bus 08-09]
[    0.249058] pci 0000:03:07.0: PCI bridge to [bus 0a]
[    0.249448] pci 0000:0b:00.0: [10de:1d01] type 00 class 0x030000 PCIe Le=
gacy Endpoint
[    0.249465] pci 0000:0b:00.0: BAR 0 [mem 0xf5000000-0xf5ffffff]
[    0.249479] pci 0000:0b:00.0: BAR 1 [mem 0xe0000000-0xefffffff 64bit pre=
f]
[    0.249492] pci 0000:0b:00.0: BAR 3 [mem 0xf0000000-0xf1ffffff 64bit pre=
f]
[    0.249501] pci 0000:0b:00.0: BAR 5 [io  0xf000-0xf07f]
[    0.249510] pci 0000:0b:00.0: ROM [mem 0xf6000000-0xf607ffff pref]
[    0.249544] pci 0000:0b:00.0: Video device with shadowed ROM at [mem 0x0=
00c0000-0x000dffff]
[    0.249682] pci 0000:0b:00.0: 8.000 Gb/s available PCIe bandwidth, limit=
ed by 2.5 GT/s PCIe x4 link at 0000:00:03.1 (capable of 31.504 Gb/s with 8.=
0 GT/s PCIe x4 link)
[    0.249762] pci 0000:0b:00.1: [10de:0fb8] type 00 class 0x040300 PCIe En=
dpoint
[    0.249778] pci 0000:0b:00.1: BAR 0 [mem 0xf6080000-0xf6083fff]
[    0.249962] pci 0000:00:03.1: PCI bridge to [bus 0b]
[    0.250028] pci 0000:0c:00.0: [1022:145a] type 00 class 0x130000 PCIe En=
dpoint
[    0.250051] pci 0000:0c:00.0: enabling Extended Tags
[    0.250135] pci 0000:0c:00.2: [1022:1456] type 00 class 0x108000 PCIe En=
dpoint
[    0.250146] pci 0000:0c:00.2: BAR 2 [mem 0xf7900000-0xf79fffff]
[    0.250154] pci 0000:0c:00.2: BAR 5 [mem 0xf7a00000-0xf7a01fff]
[    0.250160] pci 0000:0c:00.2: enabling Extended Tags
[    0.250259] pci 0000:0c:00.3: [1022:145c] type 00 class 0x0c0330 PCIe En=
dpoint
[    0.250268] pci 0000:0c:00.3: BAR 0 [mem 0xf7800000-0xf78fffff 64bit]
[    0.250288] pci 0000:0c:00.3: enabling Extended Tags
[    0.250316] pci 0000:0c:00.3: PME# supported from D0 D3hot D3cold
[    0.250396] pci 0000:00:07.1: PCI bridge to [bus 0c]
[    0.250470] pci 0000:0d:00.0: [1022:1455] type 00 class 0x130000 PCIe En=
dpoint
[    0.250493] pci 0000:0d:00.0: enabling Extended Tags
[    0.250584] pci 0000:0d:00.2: [1022:7901] type 00 class 0x010601 PCIe En=
dpoint
[    0.250609] pci 0000:0d:00.2: BAR 5 [mem 0xf7b08000-0xf7b08fff]
[    0.250617] pci 0000:0d:00.2: enabling Extended Tags
[    0.250648] pci 0000:0d:00.2: PME# supported from D3hot D3cold
[    0.250721] pci 0000:0d:00.3: [1022:1457] type 00 class 0x040300 PCIe En=
dpoint
[    0.250728] pci 0000:0d:00.3: BAR 0 [mem 0xf7b00000-0xf7b07fff]
[    0.250746] pci 0000:0d:00.3: enabling Extended Tags
[    0.250776] pci 0000:0d:00.3: PME# supported from D0 D3hot D3cold
[    0.250853] pci 0000:00:08.1: PCI bridge to [bus 0d]
[    0.251239] ACPI: PCI: Interrupt link LNKA configured for IRQ 0
[    0.251291] ACPI: PCI: Interrupt link LNKB configured for IRQ 0
[    0.251336] ACPI: PCI: Interrupt link LNKC configured for IRQ 0
[    0.251392] ACPI: PCI: Interrupt link LNKD configured for IRQ 0
[    0.251442] ACPI: PCI: Interrupt link LNKE configured for IRQ 0
[    0.251482] ACPI: PCI: Interrupt link LNKF configured for IRQ 0
[    0.251523] ACPI: PCI: Interrupt link LNKG configured for IRQ 0
[    0.251564] ACPI: PCI: Interrupt link LNKH configured for IRQ 0
[    0.252060] iommu: Default domain type: Translated
[    0.252060] iommu: DMA domain TLB invalidation policy: lazy mode
[    0.252060] SCSI subsystem initialized
[    0.252060] libata version 3.00 loaded.
[    0.252060] ACPI: bus type USB registered
[    0.252060] usbcore: registered new interface driver usbfs
[    0.252060] usbcore: registered new interface driver hub
[    0.252060] usbcore: registered new device driver usb
[    0.252060] EDAC MC: Ver: 3.0.0
[    0.252060] efivars: Registered efivars operations
[    0.252060] NetLabel: Initializing
[    0.252060] NetLabel:  domain hash size =3D 128
[    0.252060] NetLabel:  protocols =3D UNLABELED CIPSOv4 CALIPSO
[    0.252060] NetLabel:  unlabeled traffic allowed by default
[    0.252060] mctp: management component transport protocol core
[    0.252060] NET: Registered PF_MCTP protocol family
[    0.252060] PCI: Using ACPI for IRQ routing
[    0.254734] PCI: pci_cache_line_size set to 64 bytes
[    0.254810] e820: reserve RAM buffer [mem 0x09d00000-0x0bffffff]
[    0.254812] e820: reserve RAM buffer [mem 0x0a200000-0x0bffffff]
[    0.254813] e820: reserve RAM buffer [mem 0x0b000000-0x0bffffff]
[    0.254814] e820: reserve RAM buffer [mem 0xceb48018-0xcfffffff]
[    0.254815] e820: reserve RAM buffer [mem 0xceb68018-0xcfffffff]
[    0.254816] e820: reserve RAM buffer [mem 0xceb99018-0xcfffffff]
[    0.254817] e820: reserve RAM buffer [mem 0xcebca018-0xcfffffff]
[    0.254818] e820: reserve RAM buffer [mem 0xd8135000-0xdbffffff]
[    0.254819] e820: reserve RAM buffer [mem 0xda43c000-0xdbffffff]
[    0.254820] e820: reserve RAM buffer [mem 0xdbb66000-0xdbffffff]
[    0.254821] e820: reserve RAM buffer [mem 0xdf000000-0xdfffffff]
[    0.254822] e820: reserve RAM buffer [mem 0x21f380000-0x21fffffff]
[    0.257103] pci 0000:0b:00.0: vgaarb: setting as boot VGA device
[    0.257103] pci 0000:0b:00.0: vgaarb: bridge control possible
[    0.257103] pci 0000:0b:00.0: vgaarb: VGA device added: decodes=3Dio+mem=
,owns=3Dio+mem,locks=3Dnone
[    0.257103] vgaarb: loaded
[    0.257120] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0
[    0.257124] hpet0: 3 comparators, 32-bit 14.318180 MHz counter
[    0.259197] clocksource: Switched to clocksource tsc-early
[    0.259248] VFS: Disk quotas dquot_6.6.0
[    0.259248] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 byte=
s)
[    0.259248] pnp: PnP ACPI init
[    0.259248] system 00:00: [mem 0xf8000000-0xfbffffff] has been reserved
[    0.259248] system 00:02: [io  0x0a00-0x0a2f] has been reserved
[    0.259248] system 00:02: [io  0x0a30-0x0a3f] has been reserved
[    0.259248] system 00:02: [io  0x0a40-0x0a4f] has been reserved
[    0.259248] pnp 00:03: [dma 0 disabled]
[    0.259248] system 00:04: [io  0x04d0-0x04d1] has been reserved
[    0.259248] system 00:04: [io  0x040b] has been reserved
[    0.259248] system 00:04: [io  0x04d6] has been reserved
[    0.259248] system 00:04: [io  0x0c00-0x0c01] has been reserved
[    0.259248] system 00:04: [io  0x0c14] has been reserved
[    0.259248] system 00:04: [io  0x0c50-0x0c51] has been reserved
[    0.259248] system 00:04: [io  0x0c52] has been reserved
[    0.259248] system 00:04: [io  0x0c6c] has been reserved
[    0.259248] system 00:04: [io  0x0c6f] has been reserved
[    0.259248] system 00:04: [io  0x0cd0-0x0cd1] has been reserved
[    0.259248] system 00:04: [io  0x0cd2-0x0cd3] has been reserved
[    0.259248] system 00:04: [io  0x0cd4-0x0cd5] has been reserved
[    0.259248] system 00:04: [io  0x0cd6-0x0cd7] has been reserved
[    0.259248] system 00:04: [io  0x0cd8-0x0cdf] has been reserved
[    0.259248] system 00:04: [io  0x0800-0x089f] has been reserved
[    0.259248] system 00:04: [io  0x0b00-0x0b0f] has been reserved
[    0.259248] system 00:04: [io  0x0b20-0x0b3f] has been reserved
[    0.259248] system 00:04: [io  0x0900-0x090f] has been reserved
[    0.259248] system 00:04: [io  0x0910-0x091f] has been reserved
[    0.259248] system 00:04: [mem 0xfec00000-0xfec00fff] could not be reser=
ved
[    0.259248] system 00:04: [mem 0xfec01000-0xfec01fff] could not be reser=
ved
[    0.259248] system 00:04: [mem 0xfedc0000-0xfedc0fff] has been reserved
[    0.259248] system 00:04: [mem 0xfee00000-0xfee00fff] has been reserved
[    0.259248] system 00:04: [mem 0xfed80000-0xfed8ffff] could not be reser=
ved
[    0.259248] system 00:04: [mem 0xfec10000-0xfec10fff] has been reserved
[    0.259248] system 00:04: [mem 0xff000000-0xffffffff] has been reserved
[    0.259248] pnp: PnP ACPI: found 5 devices
[    0.264105] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, m=
ax_idle_ns: 2085701024 ns
[    0.264153] NET: Registered PF_INET protocol family
[    0.264254] IP idents hash table entries: 131072 (order: 8, 1048576 byte=
s, linear)
[    0.275856] tcp_listen_portaddr_hash hash table entries: 4096 (order: 4,=
 65536 bytes, linear)
[    0.275885] Table-perturb hash table entries: 65536 (order: 6, 262144 by=
tes, linear)
[    0.275922] TCP established hash table entries: 65536 (order: 7, 524288 =
bytes, linear)
[    0.276104] TCP bind hash table entries: 65536 (order: 9, 2097152 bytes,=
 linear)
[    0.276216] TCP: Hash tables configured (established 65536 bind 65536)
[    0.276275] MPTCP token hash table entries: 8192 (order: 5, 196608 bytes=
, linear)
[    0.276304] UDP hash table entries: 4096 (order: 5, 131072 bytes, linear)
[    0.276326] UDP-Lite hash table entries: 4096 (order: 5, 131072 bytes, l=
inear)
[    0.276369] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.276376] NET: Registered PF_XDP protocol family
[    0.276396] pci 0000:00:01.1: PCI bridge to [bus 01]
[    0.276402] pci 0000:00:01.1:   bridge window [mem 0xf7c00000-0xf7cfffff]
[    0.276409] pci 0000:03:00.0: PCI bridge to [bus 04]
[    0.276418] pci 0000:03:01.0: PCI bridge to [bus 05]
[    0.276428] pci 0000:03:04.0: PCI bridge to [bus 06]
[    0.276430] pci 0000:03:04.0:   bridge window [io  0xe000-0xefff]
[    0.276434] pci 0000:03:04.0:   bridge window [mem 0xf7600000-0xf76fffff]
[    0.276437] pci 0000:03:04.0:   bridge window [mem 0xf2100000-0xf21fffff=
 64bit pref]
[    0.276443] pci 0000:03:05.0: PCI bridge to [bus 07]
[    0.276452] pci 0000:03:06.0: PCI bridge to [bus 08-09]
[    0.276454] pci 0000:03:06.0:   bridge window [io  0xd000-0xdfff]
[    0.276458] pci 0000:03:06.0:   bridge window [mem 0xf6400000-0xf74fffff]
[    0.276465] pci 0000:03:07.0: PCI bridge to [bus 0a]
[    0.276474] pci 0000:02:00.2: PCI bridge to [bus 03-0a]
[    0.276476] pci 0000:02:00.2:   bridge window [io  0xd000-0xefff]
[    0.276479] pci 0000:02:00.2:   bridge window [mem 0xf6400000-0xf76fffff]
[    0.276482] pci 0000:02:00.2:   bridge window [mem 0xf2100000-0xf21fffff=
 64bit pref]
[    0.276487] pci 0000:00:01.3: PCI bridge to [bus 02-0a]
[    0.276488] pci 0000:00:01.3:   bridge window [io  0xd000-0xefff]
[    0.276491] pci 0000:00:01.3:   bridge window [mem 0xf6400000-0xf77fffff]
[    0.276493] pci 0000:00:01.3:   bridge window [mem 0xf2100000-0xf21fffff=
 64bit pref]
[    0.276498] pci 0000:00:03.1: PCI bridge to [bus 0b]
[    0.276499] pci 0000:00:03.1:   bridge window [io  0xf000-0xffff]
[    0.276502] pci 0000:00:03.1:   bridge window [mem 0xf5000000-0xf60fffff]
[    0.276505] pci 0000:00:03.1:   bridge window [mem 0xe0000000-0xf1ffffff=
 64bit pref]
[    0.276509] pci 0000:00:07.1: PCI bridge to [bus 0c]
[    0.276511] pci 0000:00:07.1:   bridge window [mem 0xf7800000-0xf7afffff]
[    0.276515] pci 0000:00:08.1: PCI bridge to [bus 0d]
[    0.276517] pci 0000:00:08.1:   bridge window [mem 0xf7b00000-0xf7bfffff]
[    0.276523] pci_bus 0000:00: resource 4 [io  0x0000-0x03af window]
[    0.276524] pci_bus 0000:00: resource 5 [io  0x03e0-0x0cf7 window]
[    0.276526] pci_bus 0000:00: resource 6 [io  0x03b0-0x03df window]
[    0.276527] pci_bus 0000:00: resource 7 [io  0x0d00-0xffff window]
[    0.276528] pci_bus 0000:00: resource 8 [mem 0x000a0000-0x000dffff windo=
w]
[    0.276529] pci_bus 0000:00: resource 9 [mem 0xe0000000-0xfec2ffff windo=
w]
[    0.276531] pci_bus 0000:00: resource 10 [mem 0xfee00000-0xffffffff wind=
ow]
[    0.276532] pci_bus 0000:01: resource 1 [mem 0xf7c00000-0xf7cfffff]
[    0.276534] pci_bus 0000:02: resource 0 [io  0xd000-0xefff]
[    0.276535] pci_bus 0000:02: resource 1 [mem 0xf6400000-0xf77fffff]
[    0.276536] pci_bus 0000:02: resource 2 [mem 0xf2100000-0xf21fffff 64bit=
 pref]
[    0.276537] pci_bus 0000:03: resource 0 [io  0xd000-0xefff]
[    0.276538] pci_bus 0000:03: resource 1 [mem 0xf6400000-0xf76fffff]
[    0.276539] pci_bus 0000:03: resource 2 [mem 0xf2100000-0xf21fffff 64bit=
 pref]
[    0.276541] pci_bus 0000:06: resource 0 [io  0xe000-0xefff]
[    0.276542] pci_bus 0000:06: resource 1 [mem 0xf7600000-0xf76fffff]
[    0.276543] pci_bus 0000:06: resource 2 [mem 0xf2100000-0xf21fffff 64bit=
 pref]
[    0.276544] pci_bus 0000:08: resource 0 [io  0xd000-0xdfff]
[    0.276545] pci_bus 0000:08: resource 1 [mem 0xf6400000-0xf74fffff]
[    0.276547] pci_bus 0000:0b: resource 0 [io  0xf000-0xffff]
[    0.276548] pci_bus 0000:0b: resource 1 [mem 0xf5000000-0xf60fffff]
[    0.276549] pci_bus 0000:0b: resource 2 [mem 0xe0000000-0xf1ffffff 64bit=
 pref]
[    0.276550] pci_bus 0000:0c: resource 1 [mem 0xf7800000-0xf7afffff]
[    0.276551] pci_bus 0000:0d: resource 1 [mem 0xf7b00000-0xf7bfffff]
[    0.276800] pci 0000:0b:00.1: extending delay after power-on from D3hot =
to 20 msec
[    0.276832] pci 0000:0b:00.1: D0 power state depends on 0000:0b:00.0
[    0.276993] PCI: CLS 64 bytes, default 64
[    0.277048] Trying to unpack rootfs image as initramfs...
[    0.282086] Initialise system trusted keyrings
[    0.282096] Key type blacklist registered
[    0.282131] workingset: timestamp_bits=3D41 max_order=3D21 bucket_order=
=3D0
[    0.282138] zbud: loaded
[    0.282214] fuse: init (API version 7.40)
[    0.282273] integrity: Platform Keyring initialized
[    0.282275] integrity: Machine keyring initialized
[    0.293078] Key type asymmetric registered
[    0.293080] Asymmetric key parser 'x509' registered
[    0.293105] Block layer SCSI generic (bsg) driver version 0.4 loaded (ma=
jor 246)
[    0.293145] io scheduler mq-deadline registered
[    0.293147] io scheduler kyber registered
[    0.293159] io scheduler bfq registered
[    0.294970] pcieport 0000:00:01.1: PME: Signaling with IRQ 25
[    0.295047] pcieport 0000:00:01.1: AER: enabled with IRQ 25
[    0.295543] pcieport 0000:00:01.3: PME: Signaling with IRQ 26
[    0.295594] pcieport 0000:00:01.3: AER: enabled with IRQ 26
[    0.295796] pcieport 0000:00:03.1: PME: Signaling with IRQ 27
[    0.295856] pcieport 0000:00:03.1: AER: enabled with IRQ 27
[    0.296384] pcieport 0000:00:07.1: PME: Signaling with IRQ 28
[    0.296436] pcieport 0000:00:07.1: AER: enabled with IRQ 28
[    0.296709] pcieport 0000:00:08.1: PME: Signaling with IRQ 30
[    0.296760] pcieport 0000:00:08.1: AER: enabled with IRQ 30
[    0.297600] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
[    0.297707] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0=
C0C:00/input/input0
[    0.297727] ACPI: button: Power Button [PWRB]
[    0.297751] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/inpu=
t/input1
[    0.300512] ACPI: button: Power Button [PWRF]
[    0.300947] Serial: 8250/16550 driver, 32 ports, IRQ sharing enabled
[    0.301163] 00:03: ttyS0 at I/O 0x3f8 (irq =3D 4, base_baud =3D 115200) =
is a 16550A
[    0.302995] Non-volatile memory driver v1.3
[    0.302996] Linux agpgart interface v0.103
[    0.303032] ACPI: bus type drm_connector registered
[    0.303496] ahci 0000:02:00.1: version 3.0
[    0.303608] ahci 0000:02:00.1: SSS flag set, parallel bus scan disabled
[    0.303643] ahci 0000:02:00.1: AHCI vers 0001.0301, 32 command slots, 6 =
Gbps, SATA mode
[    0.303646] ahci 0000:02:00.1: 4/8 ports implemented (port mask 0x33)
[    0.303647] ahci 0000:02:00.1: flags: 64bit ncq sntf stag pm led clo onl=
y pmp pio slum part sxs deso sadm sds apst=20
[    0.304042] scsi host0: ahci
[    0.304125] scsi host1: ahci
[    0.304213] scsi host2: ahci
[    0.304281] scsi host3: ahci
[    0.304350] scsi host4: ahci
[    0.304418] scsi host5: ahci
[    0.304514] scsi host6: ahci
[    0.304584] scsi host7: ahci
[    0.304609] ata1: SATA max UDMA/133 abar m131072@0xf7780000 port 0xf7780=
100 irq 40 lpm-pol 3
[    0.304612] ata2: SATA max UDMA/133 abar m131072@0xf7780000 port 0xf7780=
180 irq 40 lpm-pol 3
[    0.304613] ata3: DUMMY
[    0.304614] ata4: DUMMY
[    0.304615] ata5: SATA max UDMA/133 abar m131072@0xf7780000 port 0xf7780=
300 irq 40 lpm-pol 3
[    0.304617] ata6: SATA max UDMA/133 abar m131072@0xf7780000 port 0xf7780=
380 irq 40 lpm-pol 3
[    0.304618] ata7: DUMMY
[    0.304618] ata8: DUMMY
[    0.304749] ahci 0000:0d:00.2: AHCI vers 0001.0301, 32 command slots, 6 =
Gbps, SATA mode
[    0.304752] ahci 0000:0d:00.2: 2/2 ports implemented (port mask 0x3)
[    0.304754] ahci 0000:0d:00.2: flags: 64bit ncq sntf ilck pm led clo onl=
y pmp fbs pio slum part sxs=20
[    0.304933] scsi host8: ahci
[    0.305021] scsi host9: ahci
[    0.305047] ata9: SATA max UDMA/133 abar m4096@0xf7b08000 port 0xf7b0810=
0 irq 42 lpm-pol 0
[    0.305050] ata10: SATA max UDMA/133 abar m4096@0xf7b08000 port 0xf7b081=
80 irq 42 lpm-pol 0
[    0.305127] usbcore: registered new interface driver usbserial_generic
[    0.305131] usbserial: USB Serial support registered for generic
[    0.305194] rtc_cmos 00:01: RTC can wake from S4
[    0.305569] rtc_cmos 00:01: registered as rtc0
[    0.305632] rtc_cmos 00:01: setting system clock to 2024-07-14T18:08:34 =
UTC (1720980514)
[    0.305670] rtc_cmos 00:01: alarms up to one month, y3k, 114 bytes nvram=
, hpet irqs
[    0.305702] amd_pstate: the _CPC object is not present in SBIOS or ACPI =
disabled
[    0.305738] ledtrig-cpu: registered to indicate activity on CPUs
[    0.305856] Relocating firmware framebuffer to offset 0x0000000001000000=
[d] within [mem 0xf0000000-0xf1ffffff flags 0x14220c]
[    0.305879] efifb: probing for efifb
[    0.305889] efifb: framebuffer at 0xf1000000, using 3072k, total 3072k
[    0.305890] efifb: mode is 1024x768x32, linelength=3D4096, pages=3D1
[    0.305891] efifb: scrolling: redraw
[    0.305892] efifb: Truecolor: size=3D8:8:8:8, shift=3D24:16:8:0
[    0.305932] fbcon: Deferring console take-over
[    0.305933] fb0: EFI VGA frame buffer device
[    0.305954] hid: raw HID events driver (C) Jiri Kosina
[    0.306017] drop_monitor: Initializing network drop monitor service
[    0.306105] NET: Registered PF_INET6 protocol family
[    0.313856] Freeing initrd memory: 8972K
[    0.318014] Segment Routing with IPv6
[    0.318017] RPL Segment Routing with IPv6
[    0.318025] In-situ OAM (IOAM) with IPv6
[    0.318047] NET: Registered PF_PACKET protocol family
[    0.318383] microcode: Current revision: 0x08001137
[    0.318446] IPI shorthand broadcast: enabled
[    0.319872] sched_clock: Marking stable (319186347, 293470)->(324870445,=
 -5390628)
[    0.319957] Timer migration: 1 hierarchy levels; 8 children per group; 1=
 crossnode level
[    0.319995] registered taskstats version 1
[    0.320162] Loading compiled-in X.509 certificates
[    0.322842] Loaded X.509 cert 'Build time autogenerated kernel key: 2ce7=
3bf767cd6b37ac7b2e4f01ec460d66782ee8'
[    0.325587] zswap: loaded using pool zstd/zsmalloc
[    0.325871] Key type .fscrypt registered
[    0.325873] Key type fscrypt-provisioning registered
[    0.326748] PM:   Magic number: 0:34:140
[    0.326824] acpi device:11: hash matches
[    0.329581] RAS: Correctable Errors collector initialized.
[    0.340838] clk: Disabling unused clocks
[    0.340842] PM: genpd: Disabling unused power domains
[    0.619495] ata9: SATA link down (SStatus 0 SControl 300)
[    0.621129] ata1: SATA link down (SStatus 0 SControl 300)
[    0.622830] ata10: SATA link down (SStatus 0 SControl 300)
[    0.934466] ata2: SATA link down (SStatus 0 SControl 300)
[    1.249758] ata5: SATA link down (SStatus 0 SControl 300)
[    1.290301] tsc: Refined TSC clocksource calibration: 3493.437 MHz
[    1.290303] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x325=
b1901053, max_idle_ns: 440795306184 ns
[    1.290316] clocksource: Switched to clocksource tsc
[    1.563078] ata6: SATA link down (SStatus 0 SControl 300)
[    1.564387] Freeing unused decrypted memory: 2028K
[    1.564815] Freeing unused kernel image (initmem) memory: 3420K
[    1.564817] Write protecting the kernel read-only data: 32768k
[    1.565068] Freeing unused kernel image (rodata/data gap) memory: 1076K
[    1.608678] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    1.608682] rodata_test: all tests were successful
[    1.608687] Run /init as init process
[    1.608689]   with arguments:
[    1.608690]     /init
[    1.608691]   with environment:
[    1.608691]     HOME=3D/
[    1.608692]     TERM=3Dlinux
[    1.608693]     BOOT_IMAGE=3D/boot/vmlinuz-linux
[    1.642311] fbcon: Taking over console
[    1.642429] Console: switching to colour frame buffer device 128x48
[    1.741339] xhci_hcd 0000:02:00.0: xHCI Host Controller
[    1.741349] xhci_hcd 0000:02:00.0: new USB bus registered, assigned bus =
number 1
[    1.755140] nvme nvme0: pci function 0000:01:00.0
[    1.773108] nvme nvme0: 4/0/0 default/read/poll queues
[    1.795691]  nvme0n1: p1 p2 p3 p4 p5
[    1.796680] xhci_hcd 0000:02:00.0: hcc params 0x0200ef81 hci version 0x1=
10 quirks 0x0000010048000010
[    1.796896] xhci_hcd 0000:02:00.0: xHCI Host Controller
[    1.796900] xhci_hcd 0000:02:00.0: new USB bus registered, assigned bus =
number 2
[    1.796904] xhci_hcd 0000:02:00.0: Host supports USB 3.1 Enhanced SuperS=
peed
[    1.796956] usb usb1: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 6.09
[    1.796958] usb usb1: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    1.796969] usb usb1: Product: xHCI Host Controller
[    1.796971] usb usb1: Manufacturer: Linux 6.9.9-arch1-1 xhci-hcd
[    1.796972] usb usb1: SerialNumber: 0000:02:00.0
[    1.797103] hub 1-0:1.0: USB hub found
[    1.797119] hub 1-0:1.0: 10 ports detected
[    1.797428] usb usb2: We don't know the algorithms for LPM for this host=
, disabling LPM.
[    1.797446] usb usb2: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D 6.09
[    1.797448] usb usb2: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    1.797449] usb usb2: Product: xHCI Host Controller
[    1.797450] usb usb2: Manufacturer: Linux 6.9.9-arch1-1 xhci-hcd
[    1.797451] usb usb2: SerialNumber: 0000:02:00.0
[    1.797517] hub 2-0:1.0: USB hub found
[    1.797525] hub 2-0:1.0: 4 ports detected
[    1.797606] usb: port power management may be unreliable
[    1.797753] xhci_hcd 0000:0c:00.3: xHCI Host Controller
[    1.797757] xhci_hcd 0000:0c:00.3: new USB bus registered, assigned bus =
number 3
[    1.797846] xhci_hcd 0000:0c:00.3: hcc params 0x0270f665 hci version 0x1=
00 quirks 0x0000000040000010
[    1.797950] xhci_hcd 0000:0c:00.3: xHCI Host Controller
[    1.797952] xhci_hcd 0000:0c:00.3: new USB bus registered, assigned bus =
number 4
[    1.797954] xhci_hcd 0000:0c:00.3: Host supports USB 3.0 SuperSpeed
[    1.797980] usb usb3: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 6.09
[    1.797982] usb usb3: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    1.797983] usb usb3: Product: xHCI Host Controller
[    1.797984] usb usb3: Manufacturer: Linux 6.9.9-arch1-1 xhci-hcd
[    1.797985] usb usb3: SerialNumber: 0000:0c:00.3
[    1.798061] hub 3-0:1.0: USB hub found
[    1.798068] hub 3-0:1.0: 4 ports detected
[    1.798230] usb usb4: We don't know the algorithms for LPM for this host=
, disabling LPM.
[    1.798248] usb usb4: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D 6.09
[    1.798249] usb usb4: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    1.798251] usb usb4: Product: xHCI Host Controller
[    1.798252] usb usb4: Manufacturer: Linux 6.9.9-arch1-1 xhci-hcd
[    1.798253] usb usb4: SerialNumber: 0000:0c:00.3
[    1.798321] hub 4-0:1.0: USB hub found
[    1.798328] hub 4-0:1.0: 4 ports detected
[    1.902495] EXT4-fs (nvme0n1p2): mounted filesystem e317bc8b-4ecb-4d50-8=
a10-16c83daf75b3 r/w with ordered data mode. Quota mode: none.
[    1.976830] systemd[1]: systemd 256.2-1-arch running in system mode (+PA=
M +AUDIT -SELINUX -APPARMOR -IMA +SMACK +SECCOMP +GCRYPT +GNUTLS +OPENSSL +=
ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN +IPTC +KMOD +LIBCRYPTSETUP +LI=
BCRYPTSETUP_PLUGINS +LIBFDISK +PCRE2 +PWQUALITY +P11KIT +QRENCODE +TPM2 +BZ=
IP2 +LZ4 +XZ +ZLIB +ZSTD +BPF_FRAMEWORK +XKBCOMMON +UTMP -SYSVINIT +LIBARCH=
IVE)
[    1.976836] systemd[1]: Detected architecture x86-64.
[    1.977629] systemd[1]: Hostname set to <aquilonia>.
[    2.053641] usb 1-5: new high-speed USB device number 2 using xhci_hcd
[    2.207632] usb 1-5: New USB device found, idVendor=3D1a40, idProduct=3D=
0101, bcdDevice=3D 1.11
[    2.207636] usb 1-5: New USB device strings: Mfr=3D0, Product=3D1, Seria=
lNumber=3D0
[    2.207637] usb 1-5: Product: USB 2.0 Hub
[    2.212642] hub 1-5:1.0: USB hub found
[    2.215615] hub 1-5:1.0: 4 ports detected
[    2.353630] usb 1-6: new full-speed USB device number 3 using xhci_hcd
[    2.516982] systemd[1]: bpf-restrict-fs: LSM BPF program attached
[    2.578997] systemd[1]: /usr/lib/systemd/system/shorewall6.service:17: S=
tandard output type syslog is obsolete, automatically updating to journal. =
Please update your unit file, and consider removing the setting altogether.
[    2.580364] systemd[1]: /usr/lib/systemd/system/shorewall.service:16: St=
andard output type syslog is obsolete, automatically updating to journal. P=
lease update your unit file, and consider removing the setting altogether.
[    2.641105] systemd[1]: Queued start job for default target Graphical In=
terface.
[    2.684622] systemd[1]: Created slice Slice /system/dirmngr.
[    2.685004] systemd[1]: Created slice Slice /system/getty.
[    2.685326] systemd[1]: Created slice Slice /system/gpg-agent.
[    2.685662] systemd[1]: Created slice Slice /system/gpg-agent-browser.
[    2.685998] systemd[1]: Created slice Slice /system/gpg-agent-extra.
[    2.686328] systemd[1]: Created slice Slice /system/gpg-agent-ssh.
[    2.686671] systemd[1]: Created slice Slice /system/keyboxd.
[    2.687025] systemd[1]: Created slice Slice /system/modprobe.
[    2.687351] systemd[1]: Created slice Slice /system/netctl.
[    2.687684] systemd[1]: Created slice Slice /system/systemd-fsck.
[    2.687920] systemd[1]: Created slice User and Session Slice.
[    2.688034] systemd[1]: Started Dispatch Password Requests to Console Di=
rectory Watch.
[    2.688145] systemd[1]: Started Forward Password Requests to Wall Direct=
ory Watch.
[    2.688353] systemd[1]: Set up automount Arbitrary Executable File Forma=
ts File System Automount Point.
[    2.688457] systemd[1]: Expecting device /dev/disk/by-uuid/0b65f5a0-93cf=
-4a0a-8a8f-f4bf9226f42c...
[    2.688543] systemd[1]: Expecting device /dev/disk/by-uuid/239d593f-624d=
-4dea-9861-d6b13c23eb78...
[    2.688623] systemd[1]: Expecting device /dev/disk/by-uuid/9607-240E...
[    2.688687] systemd[1]: Expecting device /dev/disk/by-uuid/be771001-b8ee=
-4984-9a81-5e565c762a52...
[    2.688768] systemd[1]: Expecting device /sys/subsystem/net/devices/enp6=
s0...
[    2.688834] systemd[1]: Expecting device /sys/subsystem/net/devices/enp8=
s0f0...
[    2.688904] systemd[1]: Reached target Local Encrypted Volumes.
[    2.688968] systemd[1]: Reached target Login Prompts.
[    2.689025] systemd[1]: Reached target Local Integrity Protected Volumes.
[    2.689104] systemd[1]: Reached target Host and Network Name Lookups.
[    2.689173] systemd[1]: Reached target Remote File Systems.
[    2.689234] systemd[1]: Reached target Slice Units.
[    2.689299] systemd[1]: Reached target Local Verity Protected Volumes.
[    2.689433] systemd[1]: Listening on Device-mapper event daemon FIFOs.
[    2.689569] systemd[1]: Listening on LVM2 poll daemon socket.
[    2.692449] systemd[1]: Listening on RPCbind Server Activation Socket.
[    2.692566] systemd[1]: Reached target RPC Port Mapper.
[    2.693854] systemd[1]: Listening on Process Core Dump Socket.
[    2.694589] systemd[1]: Listening on Credential Encryption/Decryption.
[    2.694737] systemd[1]: Listening on Journal Socket (/dev/log).
[    2.694866] systemd[1]: Listening on Journal Sockets.
[    2.694948] systemd[1]: TPM PCR Measurements was skipped because of an u=
nmet condition check (ConditionSecurity=3Dmeasured-uki).
[    2.694964] systemd[1]: Make TPM PCR Policy was skipped because of an un=
met condition check (ConditionSecurity=3Dmeasured-uki).
[    2.695034] systemd[1]: Listening on udev Control Socket.
[    2.695132] systemd[1]: Listening on udev Kernel Socket.
[    2.695891] systemd[1]: Mounting Huge Pages File System...
[    2.696422] systemd[1]: Mounting POSIX Message Queue File System...
[    2.696986] systemd[1]: Mounting Kernel Debug File System...
[    2.698718] systemd[1]: Mounting Kernel Trace File System...
[    2.700471] systemd[1]: Starting Create List of Static Device Nodes...
[    2.702135] systemd[1]: Starting Monitoring of LVM2 mirrors, snapshots e=
tc. using dmeventd or progress polling...
[    2.702443] usb 1-6: New USB device found, idVendor=3D03f0, idProduct=3D=
4811, bcdDevice=3D 1.00
[    2.702447] usb 1-6: New USB device strings: Mfr=3D1, Product=3D2, Seria=
lNumber=3D3
[    2.702448] usb 1-6: Product: PSC 1600 series
[    2.702450] usb 1-6: Manufacturer: HP
[    2.702451] usb 1-6: SerialNumber: MY584F13PVL0
[    2.703311] systemd[1]: Starting Load Kernel Module configfs...
[    2.705058] systemd[1]: Starting Load Kernel Module dm_mod...
[    2.707032] systemd[1]: Starting Load Kernel Module drm...
[    2.708859] systemd[1]: Starting Load Kernel Module fuse...
[    2.713221] systemd[1]: Starting Load Kernel Module loop...
[    2.714484] systemd[1]: File System Check on Root Device was skipped bec=
ause of an unmet condition check (ConditionPathIsReadWrite=3D!/).
[    2.714532] systemd[1]: Clear Stale Hibernate Storage Info was skipped b=
ecause of an unmet condition check (ConditionPathExists=3D/sys/firmware/efi=
/efivars/HibernateLocation-8cf2644b-4b0b-428f-9387-6d876050dc67).
[    2.715836] systemd[1]: Starting Journal Service...
[    2.718132] systemd[1]: Starting Load Kernel Modules...
[    2.720023] device-mapper: uevent: version 1.0.3
[    2.720181] device-mapper: ioctl: 4.48.0-ioctl (2023-03-01) initialised:=
 dm-devel@lists.linux.dev
[    2.720519] systemd[1]: TPM PCR Machine ID Measurement was skipped becau=
se of an unmet condition check (ConditionSecurity=3Dmeasured-uki).
[    2.721308] systemd[1]: Starting Remount Root and Kernel File Systems...
[    2.722991] systemd[1]: Early TPM SRK Setup was skipped because of an un=
met condition check (ConditionSecurity=3Dmeasured-uki).
[    2.723120] loop: module loaded
[    2.724256] systemd[1]: Starting Load udev Rules from Credentials...
[    2.727838] systemd[1]: Starting Coldplug All udev Devices...
[    2.732873] systemd[1]: Mounted Huge Pages File System.
[    2.735232] systemd[1]: Mounted POSIX Message Queue File System.
[    2.736569] systemd[1]: Mounted Kernel Debug File System.
[    2.737912] systemd[1]: Mounted Kernel Trace File System.
[    2.739369] systemd[1]: Finished Create List of Static Device Nodes.
[    2.740896] systemd[1]: modprobe@configfs.service: Deactivated successfu=
lly.
[    2.741026] systemd[1]: Finished Load Kernel Module configfs.
[    2.742466] systemd[1]: modprobe@dm_mod.service: Deactivated successfull=
y.
[    2.742590] systemd[1]: Finished Load Kernel Module dm_mod.
[    2.744003] systemd[1]: modprobe@drm.service: Deactivated successfully.
[    2.744126] systemd[1]: Finished Load Kernel Module drm.
[    2.745472] systemd[1]: modprobe@fuse.service: Deactivated successfully.
[    2.745596] systemd[1]: Finished Load Kernel Module fuse.
[    2.746887] systemd[1]: modprobe@loop.service: Deactivated successfully.
[    2.747243] systemd[1]: Finished Load Kernel Module loop.
[    2.747490] EXT4-fs (nvme0n1p2): re-mounted e317bc8b-4ecb-4d50-8a10-16c8=
3daf75b3 r/w. Quota mode: none.
[    2.748844] systemd[1]: Finished Load udev Rules from Credentials.
[    2.751264] systemd-journald[291]: Collecting audit messages is disabled.
[    2.753954] systemd[1]: Mounting FUSE Control File System...
[    2.762475] systemd[1]: Mounting Kernel Configuration File System...
[    2.763617] systemd[1]: Repartition Root Disk was skipped because no tri=
gger condition checks were met.
[    2.767230] systemd[1]: Starting Create Static Device Nodes in /dev grac=
efully...
[    2.769001] systemd[1]: Finished Remount Root and Kernel File Systems.
[    2.770229] systemd[1]: Mounted FUSE Control File System.
[    2.774194] systemd[1]: Mounted Kernel Configuration File System.
[    2.775826] systemd[1]: Rebuild Hardware Database was skipped because of=
 an unmet condition check (ConditionNeedsUpdate=3D/etc).
[    2.780307] usb 1-5.3: new full-speed USB device number 4 using xhci_hcd
[    2.780350] systemd[1]: Finished Monitoring of LVM2 mirrors, snapshots e=
tc. using dmeventd or progress polling.
[    2.793893] systemd[1]: Finished Create Static Device Nodes in /dev grac=
efully.
[    2.795254] systemd[1]: Create System Users was skipped because no trigg=
er condition checks were met.
[    2.797109] systemd[1]: Starting Create Static Device Nodes in /dev...
[    2.806994] systemd[1]: Finished Create Static Device Nodes in /dev.
[    2.808304] systemd[1]: Reached target Preparation for Local File System=
s.
[    2.810507] systemd[1]: Starting Rule-based Manager for Device Events an=
d Files...
[    2.827476] systemd[1]: Finished Coldplug All udev Devices.
[    2.846880] systemd[1]: Started Rule-based Manager for Device Events and=
 Files.
[    2.935070] systemd[1]: Found device Samsung SSD 960 EVO 250GB swap.
[    2.946376] systemd[1]: Found device Samsung SSD 960 EVO 250GB home.
[    2.955474] systemd[1]: Found device Samsung SSD 960 EVO 250GB var.
[    2.963219] systemd[1]: Found device Samsung SSD 960 EVO 250GB 1.
[    2.966051] systemd[1]: Activating swap /dev/disk/by-uuid/239d593f-624d-=
4dea-9861-d6b13c23eb78...
[    2.995524] input: PC Speaker as /devices/platform/pcspkr/input/input2
[    2.996956] systemd[1]: Starting File System Check on /dev/disk/by-uuid/=
0b65f5a0-93cf-4a0a-8a8f-f4bf9226f42c...
[    2.999508] piix4_smbus 0000:00:14.0: SMBus Host Controller at 0xb00, re=
vision 0
[    2.999515] piix4_smbus 0000:00:14.0: Using register 0x02 for SMBus port=
 selection
[    2.999602] piix4_smbus 0000:00:14.0: Auxiliary SMBus Host Controller at=
 0xb20
[    2.999756] Adding 4194300k swap on /dev/nvme0n1p3.  Priority:-2 extents=
:1 across:4194300k SS
[    3.003746] systemd[1]: Starting File System Check on /dev/disk/by-uuid/=
9607-240E...
[    3.007346] systemd[1]: Starting File System Check on /dev/disk/by-uuid/=
be771001-b8ee-4984-9a81-5e565c762a52...
[    3.009321] RAPL PMU: API unit is 2^-32 Joules, 1 fixed counters, 163840=
 ms ovfl timer
[    3.009325] RAPL PMU: hw unit of domain package 2^-16 Joules
[    3.018033] ccp 0000:0c:00.2: enabling device (0000 -> 0002)
[    3.019448] cryptd: max_cpu_qlen set to 1000
[    3.024732] ccp 0000:0c:00.2: ccp enabled
[    3.024736] ccp 0000:0c:00.2: psp: unable to access the device: you migh=
t be running a broken BIOS.
[    3.025020] sp5100_tco: SP5100/SB800 TCO WatchDog Timer Driver
[    3.025095] sp5100-tco sp5100-tco: Using 0xfeb00000 for watchdog MMIO ad=
dress
[    3.025161] sp5100-tco sp5100-tco: initialized. heartbeat=3D60 sec (nowa=
yout=3D0)
[    3.036912] systemd[1]: Activated swap /dev/disk/by-uuid/239d593f-624d-4=
dea-9861-d6b13c23eb78.
[    3.040916] systemd[1]: Finished File System Check on /dev/disk/by-uuid/=
0b65f5a0-93cf-4a0a-8a8f-f4bf9226f42c.
[    3.042491] systemd[1]: Reached target Swaps.
[    3.043549] AVX2 version of gcm_enc/dec engaged.
[    3.043927] AES CTR mode by8 optimization enabled
[    3.060721] systemd[1]: Finished File System Check on /dev/disk/by-uuid/=
9607-240E.
[    3.065543] systemd[1]: Finished File System Check on /dev/disk/by-uuid/=
be771001-b8ee-4984-9a81-5e565c762a52.
[    3.147341] systemd[1]: Starting Virtual Console Setup...
[    3.153816] systemd[1]: systemd-vconsole-setup.service: Deactivated succ=
essfully.
[    3.153974] systemd[1]: Stopped Virtual Console Setup.
[    3.156365] systemd[1]: Starting Virtual Console Setup...
[    3.168929] it87: Found IT8792E/IT8795E chip at 0xa60, revision 3
[    3.183694] snd_hda_intel 0000:0b:00.1: Disabling MSI
[    3.183705] snd_hda_intel 0000:0b:00.1: Handle vga_switcheroo audio clie=
nt
[    3.183801] snd_hda_intel 0000:0d:00.3: enabling device (0000 -> 0002)
[    3.212467] systemd[1]: Finished Virtual Console Setup.
[    3.221234] input: HDA NVidia HDMI/DP,pcm=3D3 as /devices/pci0000:00/000=
0:00:03.1/0000:0b:00.1/sound/card0/input3
[    3.221276] input: HDA NVidia HDMI/DP,pcm=3D7 as /devices/pci0000:00/000=
0:00:03.1/0000:0b:00.1/sound/card0/input4
[    3.221307] input: HDA NVidia HDMI/DP,pcm=3D8 as /devices/pci0000:00/000=
0:00:03.1/0000:0b:00.1/sound/card0/input5
[    3.221336] input: HDA NVidia HDMI/DP,pcm=3D9 as /devices/pci0000:00/000=
0:00:03.1/0000:0b:00.1/sound/card0/input6
[    3.232668] usb 1-5.3: New USB device found, idVendor=3D046d, idProduct=
=3Dc318, bcdDevice=3D55.03
[    3.232675] usb 1-5.3: New USB device strings: Mfr=3D1, Product=3D2, Ser=
ialNumber=3D0
[    3.232677] usb 1-5.3: Product: Logitech Illuminated Keyboard
[    3.232678] usb 1-5.3: Manufacturer: Logitech
[    3.236285] AMD Address Translation Library initialized
[    3.239289] intel_rapl_common: Found RAPL domain package
[    3.239294] intel_rapl_common: Found RAPL domain core
[    3.244938] snd_hda_codec_realtek hdaudioC1D0: autoconfig for ALC887-VD:=
 line_outs=3D1 (0x14/0x0/0x0/0x0/0x0) type:line
[    3.244944] snd_hda_codec_realtek hdaudioC1D0:    speaker_outs=3D0 (0x0/=
0x0/0x0/0x0/0x0)
[    3.244946] snd_hda_codec_realtek hdaudioC1D0:    hp_outs=3D1 (0x1b/0x0/=
0x0/0x0/0x0)
[    3.244948] snd_hda_codec_realtek hdaudioC1D0:    mono: mono_out=3D0x0
[    3.244949] snd_hda_codec_realtek hdaudioC1D0:    dig-out=3D0x11/0x0
[    3.244950] snd_hda_codec_realtek hdaudioC1D0:    inputs:
[    3.244952] snd_hda_codec_realtek hdaudioC1D0:      Front Mic=3D0x19
[    3.244953] snd_hda_codec_realtek hdaudioC1D0:      Rear Mic=3D0x18
[    3.244954] snd_hda_codec_realtek hdaudioC1D0:      Line=3D0x1a
[    3.250157] systemd[1]: Starting Load Kernel Module dm_mod...
[    3.254494] systemd[1]: Starting Load Kernel Module loop...
[    3.260395] systemd[1]: File System Check on Root Device was skipped bec=
ause of an unmet condition check (ConditionPathIsReadWrite=3D!/).
[    3.260518] systemd[1]: Clear Stale Hibernate Storage Info was skipped b=
ecause of an unmet condition check (ConditionPathExists=3D/sys/firmware/efi=
/efivars/HibernateLocation-8cf2644b-4b0b-428f-9387-6d876050dc67).
[    3.260722] systemd[1]: Rebuild Hardware Database was skipped because of=
 an unmet condition check (ConditionNeedsUpdate=3D/etc).
[    3.260769] systemd[1]: TPM PCR Machine ID Measurement was skipped becau=
se of an unmet condition check (ConditionSecurity=3Dmeasured-uki).
[    3.260820] systemd[1]: Create System Users was skipped because no trigg=
er condition checks were met.
[    3.260841] systemd[1]: Early TPM SRK Setup was skipped because of an un=
met condition check (ConditionSecurity=3Dmeasured-uki).
[    3.261900] input: HD-Audio Generic Front Mic as /devices/pci0000:00/000=
0:00:08.1/0000:0d:00.3/sound/card1/input7
[    3.261940] input: HD-Audio Generic Rear Mic as /devices/pci0000:00/0000=
:00:08.1/0000:0d:00.3/sound/card1/input8
[    3.261972] input: HD-Audio Generic Line as /devices/pci0000:00/0000:00:=
08.1/0000:0d:00.3/sound/card1/input9
[    3.262221] input: HD-Audio Generic Line Out as /devices/pci0000:00/0000=
:00:08.1/0000:0d:00.3/sound/card1/input10
[    3.262257] input: HD-Audio Generic Front Headphone as /devices/pci0000:=
00/0000:00:08.1/0000:0d:00.3/sound/card1/input11
[    3.276131] systemd[1]: File System Check on Root Device was skipped bec=
ause of an unmet condition check (ConditionPathIsReadWrite=3D!/).
[    3.276164] systemd[1]: Clear Stale Hibernate Storage Info was skipped b=
ecause of an unmet condition check (ConditionPathExists=3D/sys/firmware/efi=
/efivars/HibernateLocation-8cf2644b-4b0b-428f-9387-6d876050dc67).
[    3.276245] systemd[1]: Rebuild Hardware Database was skipped because of=
 an unmet condition check (ConditionNeedsUpdate=3D/etc).
[    3.276278] systemd[1]: TPM PCR Machine ID Measurement was skipped becau=
se of an unmet condition check (ConditionSecurity=3Dmeasured-uki).
[    3.276321] systemd[1]: Create System Users was skipped because no trigg=
er condition checks were met.
[    3.276339] systemd[1]: Early TPM SRK Setup was skipped because of an un=
met condition check (ConditionSecurity=3Dmeasured-uki).
[    3.280656] systemd[1]: modprobe@loop.service: Deactivated successfully.
[    3.280813] systemd[1]: Finished Load Kernel Module loop.
[    3.282574] systemd[1]: modprobe@dm_mod.service: Deactivated successfull=
y.
[    3.282712] systemd[1]: Finished Load Kernel Module dm_mod.
[    3.284780] systemd[1]: Repartition Root Disk was skipped because no tri=
gger condition checks were met.
[    3.456983] usb 1-5.4: new low-speed USB device number 5 using xhci_hcd
[    3.482539] nvidia: loading out-of-tree module taints kernel.
[    3.482548] nvidia: module license 'NVIDIA' taints kernel.
[    3.482549] Disabling lock debugging due to kernel taint
[    3.482553] nvidia: module verification failed: signature and/or require=
d key missing - tainting kernel
[    3.482554] nvidia: module license taints kernel.
[    3.736965] systemd[1]: Mounting /boot/efi...
[    3.739127] systemd[1]: Mounting /home...
[    3.778139] systemd[1]: Mounting Temporary Directory /tmp...
[    3.779663] systemd[1]: var.mount: Directory /var to mount over is not e=
mpty, mounting anyway.
[    3.781029] systemd[1]: Mounting /var...
[    3.785676] systemd[1]: Mounted Temporary Directory /tmp.
[    3.786324] EXT4-fs (nvme0n1p5): mounted filesystem be771001-b8ee-4984-9=
a81-5e565c762a52 r/w with ordered data mode. Quota mode: none.
[    3.788074] systemd[1]: Mounted /home.
[    3.788673] EXT4-fs (nvme0n1p4): mounted filesystem 0b65f5a0-93cf-4a0a-8=
a8f-f4bf9226f42c r/w with ordered data mode. Quota mode: none.
[    3.790623] systemd[1]: Mounted /var.
[    3.792822] systemd[1]: Virtual Machine and Container Storage (Compatibi=
lity) was skipped because of an unmet condition check (ConditionPathExists=
=3D/var/lib/machines.raw).
[    3.794010] systemd[1]: Starting RPC Bind...
[    3.796125] systemd[1]: Starting Load/Save OS Random Seed...
[    3.797615] systemd[1]: TPM SRK Setup was skipped because of an unmet co=
ndition check (ConditionSecurity=3Dmeasured-uki).
[    3.808070] systemd[1]: Finished Load/Save OS Random Seed.
[    3.819640] usb 1-5.4: New USB device found, idVendor=3D03f0, idProduct=
=3D0941, bcdDevice=3D 1.00
[    3.819645] usb 1-5.4: New USB device strings: Mfr=3D1, Product=3D2, Ser=
ialNumber=3D0
[    3.819647] usb 1-5.4: Product: HP X500 USB Optical Mouse
[    3.819649] usb 1-5.4: Manufacturer: PixArt
[    3.820530] systemd[1]: Started RPC Bind.
[    3.834140] systemd[1]: Started Journal Service.
[    3.860485] systemd-journald[291]: Received client request to flush runt=
ime journal.
[    3.939897] usb-storage 1-6:1.3: USB Mass Storage device detected
[    3.940378] scsi host10: usb-storage 1-6:1.3
[    3.940412] nvidia-nvlink: Nvlink Core is being initialized, major devic=
e number 239

[    3.940680] usbcore: registered new interface driver usb-storage
[    3.941924] nvidia 0000:0b:00.0: vgaarb: VGA decodes changed: olddecodes=
=3Dio+mem,decodes=3Dnone:owns=3Dio+mem
[    3.968222] usblp 1-6:1.1: usblp0: USB Bidirectional printer dev 3 if 1 =
alt 0 proto 2 vid 0x03F0 pid 0x4811
[    3.968261] usbcore: registered new interface driver usblp
[    3.968340] usbcore: registered new interface driver uas
[    3.989485] dca service started, version 1.12.1
[    4.009259] pps_core: LinuxPPS API ver. 1 registered
[    4.009264] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo =
Giometti <giometti@linux.it>
[    4.013357] PTP clock support registered
[    4.028437] igb: Intel(R) Gigabit Ethernet Network Driver
[    4.028441] igb: Copyright (c) 2007-2014 Intel Corporation.
[    4.048726] r8169 0000:06:00.0 eth0: RTL8168g/8111g, e0:d5:5e:68:14:c5, =
XID 4c0, IRQ 68
[    4.048732] r8169 0000:06:00.0 eth0: jumbo features [frames: 9194 bytes,=
 tx checksumming: ko]
[    4.057245] r8169 0000:06:00.0 enp6s0: renamed from eth0
[    4.063128] NVRM: loading NVIDIA UNIX x86_64 Kernel Module  555.58.02  T=
ue Jun 25 01:39:15 UTC 2024
[    4.090809] usbcore: registered new interface driver usbhid
[    4.090815] usbhid: USB HID core driver
[    4.101581] input: Logitech Logitech Illuminated Keyboard as /devices/pc=
i0000:00/0000:00:01.3/0000:02:00.0/usb1/1-5/1-5.3/1-5.3:1.0/0003:046D:C318.=
0001/input/input12
[    4.111092] nvidia_uvm: module uses symbols nvUvmInterfaceDisableAccessC=
ntr from proprietary module nvidia, inheriting taint.
[    4.112842] nvidia-modeset: Loading NVIDIA Kernel Mode Setting Driver fo=
r UNIX platforms  555.58.02  Tue Jun 25 01:10:21 UTC 2024
[    4.157869] hid-generic 0003:046D:C318.0001: input,hidraw0: USB HID v1.1=
1 Keyboard [Logitech Logitech Illuminated Keyboard] on usb-0000:02:00.0-5.3=
/input0
[    4.158110] input: Logitech Logitech Illuminated Keyboard Consumer Contr=
ol as /devices/pci0000:00/0000:00:01.3/0000:02:00.0/usb1/1-5/1-5.3/1-5.3:1.=
1/0003:046D:C318.0002/input/input13
[    4.213012] igb 0000:08:00.0: added PHC on eth0
[    4.213049] igb 0000:08:00.0: Intel(R) Gigabit Ethernet Network Connecti=
on
[    4.213051] igb 0000:08:00.0: eth0: (PCIe:2.5Gb/s:Width x1) 80:61:5f:0a:=
2c:fc
[    4.213135] igb 0000:08:00.0: eth0: PBA No: E43709-006
[    4.213136] igb 0000:08:00.0: Using MSI-X interrupts. 4 rx queue(s), 4 t=
x queue(s)
[    4.214440] hid-generic 0003:046D:C318.0002: input,hiddev96,hidraw1: USB=
 HID v1.11 Device [Logitech Logitech Illuminated Keyboard] on usb-0000:02:0=
0.0-5.3/input1
[    4.214553] input: PixArt HP X500 USB Optical Mouse as /devices/pci0000:=
00/0000:00:01.3/0000:02:00.0/usb1/1-5/1-5.4/1-5.4:1.0/0003:03F0:0941.0003/i=
nput/input15
[    4.214592] hid-generic 0003:03F0:0941.0003: input,hidraw2: USB HID v1.1=
1 Mouse [PixArt HP X500 USB Optical Mouse] on usb-0000:02:00.0-5.4/input0
[    4.285815] [drm] [nvidia-drm] [GPU ID 0x00000b00] Loading driver
[    4.289716] nvidia-uvm: Loaded the UVM driver, major device number 235.
[    4.301026] mousedev: PS/2 mouse device common for all mice
[    4.399671] igb 0000:08:00.1: added PHC on eth1
[    4.399709] igb 0000:08:00.1: Intel(R) Gigabit Ethernet Network Connecti=
on
[    4.399710] igb 0000:08:00.1: eth1: (PCIe:2.5Gb/s:Width x1) 80:61:5f:0a:=
2c:fd
[    4.399795] igb 0000:08:00.1: eth1: PBA No: E43709-006
[    4.399796] igb 0000:08:00.1: Using MSI-X interrupts. 4 rx queue(s), 4 t=
x queue(s)
[    4.402544] igb 0000:08:00.1 enp8s0f1: renamed from eth1
[    4.402783] igb 0000:08:00.0 enp8s0f0: renamed from eth0
[    4.945875] scsi 10:0:0:0: Direct-Access     HP       PSC 1610         1=
=2E00 PQ: 0 ANSI: 2
[    4.946848] sd 10:0:0:0: [sda] Media removed, stopped polling
[    4.947044] sd 10:0:0:0: [sda] Attached SCSI removable disk
[    5.076979] Generic FE-GE Realtek PHY r8169-0-600:00: attached PHY drive=
r (mii_bus:phy_addr=3Dr8169-0-600:00, irq=3DMAC)
[    5.267052] r8169 0000:06:00.0 enp6s0: Link is Down
[    5.356501] [drm] Initialized nvidia-drm 0.0.0 20160202 for 0000:0b:00.0=
 on minor 0
[    7.814235] igb 0000:08:00.0 enp8s0f0: igb: enp8s0f0 NIC Link is Up 1000=
 Mbps Full Duplex, Flow Control: RX/TX
[    7.940020] r8169 0000:06:00.0 enp6s0: Link is Up - 1Gbps/Full - flow co=
ntrol rx/tx
[   78.298531] tun: Universal TUN/TAP device driver, 1.6
[   92.317516] OUTPUT REJECT IN=3D OUT=3Dtun0 SRC=3Dfde6:007a:7d20:1566:000=
0:0000:0000:10f0 DST=3D2600:1901:0000:38d7:0000:0000:0000:0000 LEN=3D80 TC=
=3D0 HOPLIMIT=3D64 FLOWLBL=3D126214 PROTO=3DTCP SPT=3D44798 DPT=3D80 WINDOW=
=3D64770 RES=3D0x00 SYN URGP=3D0=20
[   92.646737] OUTPUT REJECT IN=3D OUT=3Dtun0 SRC=3Dfde6:007a:7d20:1566:000=
0:0000:0000:10f0 DST=3D2600:1901:0000:38d7:0000:0000:0000:0000 LEN=3D80 TC=
=3D0 HOPLIMIT=3D64 FLOWLBL=3D801456 PROTO=3DTCP SPT=3D44810 DPT=3D80 WINDOW=
=3D64770 RES=3D0x00 SYN URGP=3D0=20
[  152.347257] OUTPUT REJECT IN=3D OUT=3Dtun0 SRC=3Dfde6:007a:7d20:1566:000=
0:0000:0000:10f0 DST=3D2600:1901:0000:38d7:0000:0000:0000:0000 LEN=3D80 TC=
=3D0 HOPLIMIT=3D64 FLOWLBL=3D909126 PROTO=3DTCP SPT=3D36982 DPT=3D80 WINDOW=
=3D64770 RES=3D0x00 SYN URGP=3D0=20

--jzq55ihohz2akf2e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="topo_cpus.txt"

online:              1
initial_apicid:      0
apicid:              0
pkg_id:              0
die_id:              0
cu_id:               255
core_id:             0
logical_pkg_id:      0
logical_die_id:      0
llc_id:              0
l2c_id:              65535
amd_node_id:         0
amd_nodes_per_pkg:   1
num_threads:         4
num_cores:           4
max_dies_per_pkg:    1
max_threads_per_core:1
online:              1
initial_apicid:      1
apicid:              1
pkg_id:              0
die_id:              0
cu_id:               255
core_id:             1
logical_pkg_id:      0
logical_die_id:      0
llc_id:              0
l2c_id:              65535
amd_node_id:         0
amd_nodes_per_pkg:   1
num_threads:         4
num_cores:           4
max_dies_per_pkg:    1
max_threads_per_core:1
online:              1
initial_apicid:      8
apicid:              8
pkg_id:              0
die_id:              0
cu_id:               255
core_id:             8
logical_pkg_id:      0
logical_die_id:      0
llc_id:              1
l2c_id:              65535
amd_node_id:         0
amd_nodes_per_pkg:   1
num_threads:         4
num_cores:           4
max_dies_per_pkg:    1
max_threads_per_core:1
online:              1
initial_apicid:      9
apicid:              9
pkg_id:              0
die_id:              0
cu_id:               255
core_id:             9
logical_pkg_id:      0
logical_die_id:      0
llc_id:              1
l2c_id:              65535
amd_node_id:         0
amd_nodes_per_pkg:   1
num_threads:         4
num_cores:           4
max_dies_per_pkg:    1
max_threads_per_core:1

--jzq55ihohz2akf2e--

--akv24tzfyfw4xc22
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEb3ea3iR6a4oPcswTwEfU8yi1JYUFAmaVH/cACgkQwEfU8yi1
JYU0uRAAu8qWTFSmhzzHvMCv2krBcT5oK3DcVLfxsB9yaaMrsTWnWBa7vwzITAbJ
eEMgqEF8T1SIIgQvenFir3ZFjzvV+AZncLkZjdheD7RRYh9FEsdwRwrgKyEHf6s5
MF9tde3p3YOBxpE3hsRO+xnmHTvXO01AQBxnROnRvj2NdoScVT3mQMr7dN+bhLQa
ysiXKEVOnWFytNN06mWP9pkHS9DXQJotEZ5tdTASURmJ21TVp2gZuTR+flNtXzEu
12xJ7r3Q7r52qMPbKBqe0RaqLKNAnA50Rm3LaHG3FQxpmFenoJzhNVQrsKX/DZK2
XhrvjTld/OjnW+/DzJZf1gL+EdHZBIP+dA4LLAI7tjRGB2CIHHE4FFvhRtClHM8I
Q2wt33yvKH/s/RHd+N0QhnnT5Vh9q5qFh1EceIjXBkjCooRKtpIMAF5CwWISnYQS
tmV0qL/ZHYwCNECW2Klp1rUVCiqmIsFekAZgqG1Xo3K1CTQbc8FV4/76ODqdAioG
hyq06cmFLb2BjtuGtEBWPQ/bra7bXAYV/KjhG3VZkfbLi1ywV50wdEhpEnfOblR3
x6oR+YZVC2EKVtEsQodHApWO4za1LEtLCOmL64DsgdUbvzsiuccx9SDccekte0Tb
Cq5qI2rel7dWXJHEby6plwfC7ZAj2fd+f5gvjgH8uk6FGtks3f0=
=YlF7
-----END PGP SIGNATURE-----

--akv24tzfyfw4xc22--
