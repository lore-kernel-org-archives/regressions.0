Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793604790;
	b=sfSz8l0iB35Bp/ETtT1XuyFzU4ezHs7Xy8/DU7Eg5bLivBMb9iy+lmT/Sw9QzGORBdZA
	 XU5Yhu19bFYSQkYo2Nsn0Br8RBH3uuIl1pbpMYf6RMX8mDVsOkTZiMmLrJ8K+IaAuIw70
	 Lau7U/JEBeXvRt7fOkPGuuO29+lPbUqCysD63frNKknkNDKD4+FnsHmHl3RrB7Wf0pEqu
	 AcYMRNQZJIoQbZHksJ3Ki7frr8hYHj/Emcs+34b1hiKTO55NgZCh3ZmzH5bdE3f4G3rLy
	 mjl43JBRMpUsawZcwEg7pXsQXUx+/DY5LVUUnUtXypDTYjl0SaTyxVV4/eKAAFL/NCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793604790;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uhlq7lRBnMZgN/FlVC6dxixNTQE9Qh0fbitp0y0qEhA=;
	b=QWwd2rFDVxLCauQKCei9+gTkgAubArDlLNfGQFsjsI3iShxvfyKkq9YQOp99B1Ebk0Nl
	 i88LUXEe9uhEo5lxNm0eLl+TMe4QeS37fCpdhlg3qadRDqovXQLPn5YGPeYLzeewTIQVQ
	 U7eA9QJEhyodeN+aGqlcH2fAfJ3gsbk38l8s3Tcv2fOxYmoagxuQjexHKhcJHsocsPNSB
	 +LtruqfXDwomdHx+kBlGARtc4yBJ0vvxNJrRYx6nHSsVPu4YWPplS1HfmANFwMOF/ivcT
	 RAmfyxIFyoNDcT7PWLEXWSDfcewJadABT9V5gDZe6EPKsHMUrO1b/kcV1qvRTwRI3lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DBxHRawa;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EDA606A338
	for <regressions@lists.linux.dev>; Mon,  2 Nov 2026 07:33:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70EDA606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DBxHRawa
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8a0880a46e7so1257766b3a.1
        for <regressions@lists.linux.dev>; Sun, 01 Nov 2026 23:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793604789; x=1794209589; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uhlq7lRBnMZgN/FlVC6dxixNTQE9Qh0fbitp0y0qEhA=;
        b=DBxHRawa6TYdvavSg3FcztrsikcMiHn/ZHdNcnepYIZjNJzCQcwvU3Q5LCEjEDfr3R
         RugAWttzSHSJjXaqsLXGuS7VewVjTxlGkxeziAC+s1UT4maJemxsF9TKEjSIbSWgM1Nf
         ex5s1edOZFJXyuEJgggft8LGWA78edusIkrekPfpmAi+/ismD9tiM4/RxZXAaWTlFDs7
         iGlOqoiLAMZOznJWswJxrc8fwPFJHm76pgVeUou90MQ5hewZKEaviCcVqsnyzCE1Hs29
         apCXjs9iBSepQxUTg0HHFFWe2gdp1F09LXgXCoPlks36oJK0xApXiXUgNEEcRib2yf8D
         D2lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793604789; x=1794209589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uhlq7lRBnMZgN/FlVC6dxixNTQE9Qh0fbitp0y0qEhA=;
        b=kgYISyyNNFg+5kYz7magUjTlncCcENbfi91iKncGS/4YjuCbYGclyB3ZQU4ndUyacM
         mGYcnJHetWHx1Z/5hUa8bTDXwr24IoR8Di2KK+oWPPv+kgIhDEUP4dU/v6fbf4Xm0PGA
         HMCTj6Leo+sING2cVBZ+TCP2NwT9ycdOGFY+VHasDNGIw6m3k9IUnFHVRwGD1p2Ypz0O
         dpGUJ3Ts0p1Gb/Ef9gen5A77MKm9v5IVWqXvzfXGch7wTc5gtX2zfs7/BYc5VJ/VRKU6
         zZSdhQXwpT19+IVugl6JoPGEnSUJamu+NlC6Lth6dLGbnZwKC3IgwC+JkrPDwl8StaE1
         ESJQ==
X-Forwarded-Encrypted: i=1; AKwUvBw3ucywTpSyrC/H1PI5iXBu6KIQRAaDxgc4r97QvtglkUCRSfKzOcOA+sYXfG59PSMquFEyqH3MBQ2aSw==@lists.linux.dev
X-Gm-Message-State: APuU4Z+DweFMdk30vehd7U/ASh/zQIQjU6CzP1pnR2y+panuro9fzHTX
	IQjWp+Xm4K9LjDXOPAYkfIXbR8X+P9gQlgeVqSyC/bMQKYfX4XNMUP46
X-Gm-Gg: AYBFou3D3j64HkJjazyVPxT7ezYgGAb/udsWMqIjwyczybpdUhG3DySIGiPcteCgLV9
	k2LQ6y4zR1owiZRGQR5vJ/d34LS+oxQki41caI07SAnrAV0Ab7Inoh4Un4bcHyC2TZ4VxNt/MyN
	kuOhh7lfZ8prWTNYi+jQGqeQgHOyDWGa/LeInLwL/A18Sq+Xl+01chZ3IK7gMwVVP2+FwxmmUIR
	EdRgjnXvIin2hLpgDBCXM8pNWvqCTHUwGR1kSKtInzoj5Dok7IXeVfmi4KLLsh9z91rmV9g7XHw
	Eq2pQ9Vz0Q0viV7iGRxBe4wJ58lbkjgQxrLU0LMh106T5rB6EHdNF/+Ok/UR0Sey+71pTKsCexD
	okspUm08LK/H80kbCruD/PJH91RsOwNok9ReLKMZh0KXOHdXvYJcMfyh84BBNJOP2yluF+s5bbI
	kXrC5BldNu1YXEj95Grq8pcUZggGGTF0q2zOBTC/NRVyvcFdw83S+iSwvN/vVh8SYgDZ3MWlU6m
	j5I2CTmPZARM7G7hynDiGSQdF/Td+Dz2ivScvFIpPfqqJxX8u4lPxOhEi2mAHX2c1uahVsClCor
	TE/+OyWoXG6PfNxFh6r6RXCWbRHDB3QCtTgf36V8+/w=
X-Received: by 2002:a05:6a00:340a:b0:89f:d449:7526 with SMTP id d2e1a72fcca58-8a8321b41acmr7898596b3a.21.1793604788690;
        Sun, 01 Nov 2026 23:33:08 -0800 (PST)
Received: from iZj6c0kydq3fvfrtx5kta5Z ([47.86.51.122])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aada6c2c28sm1563174b3a.43.2026.11.01.23.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 23:33:08 -0800 (PST)
From: Challvy Tee <challvy.tee@gmail.com>
To: x86@kernel.org,
	linux-coco@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	regressions@lists.linux.dev,
	stable@vger.kernel.org,
	kas@kernel.org,
	dave.hansen@linux.intel.com,
	rick.p.edgecombe@intel.com,
	vishal.l.verma@intel.com,
	kai.huang@intel.com,
	seanjc@google.com
Subject: [PATCH v4] x86/virt/tdx: Skip TDH.SYS.DISABLE if the TDX module is not initialized
Date: Mon,  2 Nov 2026 15:32:44 +0800
Message-ID: <20261102073244.919864-1-challvy.tee@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <07cfa95a-e766-411b-8765-33352a04c0be@intel.com>
References: <07cfa95a-e766-411b-8765-33352a04c0be@intel.com>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 5b25f249be32 ("x86/tdx: Disable the TDX module during kexec and
kdump") made native_machine_crash_shutdown() call tdx_sys_disable(),
whose only gate is compile time (CONFIG_INTEL_TDX_HOST).  A kernel that
never initialized the TDX module therefore still issues
TDH.SYS.DISABLE.

In VMX non-root operation on a SEAM-capable host, SEAMCALL causes a VM
exit instead of a native #UD.  KVM injects #UD only since
commit 9d7dfb95da2c ("KVM: VMX: Inject #UD if guest tries to execute
SEAMCALL or TDCALL"), first released in v6.18.  On an older host the
VMM gets KVM_EXIT_INTERNAL_ERROR and the vCPU never resumes, so
machine_kexec() is never reached and no vmcore is written.  Kdump is
thus broken only in guests on SEAM-capable hosts whose hypervisor does
not handle the exit; plain kexec is unaffected because tdx_shutdown()
only runs as a syscore op, registered after init_tdx_module() succeeds.

Gate the SEAMCALL on X86_FEATURE_TDX_HOST_PLATFORM before issuing it,
the way paddr_is_tdx_private() already guards its own SEAMCALL in this
file.  Without that feature the module is never initialized, so there
is nothing to disable; on a TDX host the gate is a no-op.

It also decouples kdump from the host KVM version -- a guest cannot
require its host to inject the #UD.

Fixes: 5b25f249be32 ("x86/tdx: Disable the TDX module during kexec and kdump")
Suggested-by: Kiryl Shutsemau <kas@kernel.org>
Cc: stable@vger.kernel.org
Signed-off-by: Challvy Tee <challvy.tee@gmail.com>
---
v3 -> v4:
 - Gate on X86_FEATURE_TDX_HOST_PLATFORM instead of
   tdx_module_state.initialized, guarding the SEAMCALL itself the way
   paddr_is_tdx_private() already does, as suggested in review.
 - Drop the v3 rationale about covering the syscore and future callers.
 - Retested with this predicate: kdump produces a vmcore on the
   Alibaba ECS Emerald Rapids guest (6.12.0-278.el10 base).
   v3: https://lore.kernel.org/all/20261030154851.907726-1-challvy.tee@gmail.com/

Hypervisor -- KVM on all five (CPUID leaf 0x40000000), across three
clouds: Alibaba Cloud ECS, AWS EC2 and Tencent Cloud CVM.

Host log -- yes, from the Alibaba ECS host of the Emerald Rapids guest:

  KVM internal error. Suberror: 4
  extra data[0]: 4c
  extra data[1]: 2f
  RAX=0000000000000045 RDI=0000000000000045 RIP=ffffffff855422fe
  R12=8000020300000000 R13=8000000300000000 R14=8000020200000000
  Code=... 4c 8b 5e 28 <66> 0f 01 cf 72 05 ...
  check runstate transition: 'running' -> 'internal-error'

Suberror 4 is KVM_INTERNAL_ERROR_UNEXPECTED_EXIT_REASON; the two data
words are the exit reason (0x4c = EXIT_REASON_SEAMCALL) and
last_vmentry_cpu, i.e. kvm_prepare_unexpected_reason_exit().

RAX and RDI hold 0x45 = TDH_SYS_DISABLE and RIP is at the '66 0f 01 cf'
SEAMCALL opcode in __seamcall.  RAX still holds the input leaf rather
than a status code: the SEAMCALL never returned.

Reproduced with 'echo c > /proc/sysrq-trigger'.  All five have
CONFIG_INTEL_TDX_HOST=y, kexec_crash_loaded=1, a kernel changelog
naming both backported commits, and "TDX not supported by the host
platform" in dmesg:

  Microarch          x86_vfm  Cloud          Kernel             echo c
  Sapphire Rapids    0x68F    AWS EC2        6.12.0-278.el10    no vmcore
  Granite Rapids     0x6AD    AWS EC2        6.12.0-278.el10    no vmcore
  Emerald Rapids     0x6CF    Alibaba ECS    6.12.0-278.el10    no vmcore
  Granite Rapids     0x6AD    Alibaba ECS    6.12.0-278.el10    no vmcore
  Granite Rapids     0x6AD    Tencent CVM    6.12.0-278.el10    no vmcore

That dmesg line is printed by tdx_enable() when
X86_FEATURE_TDX_HOST_PLATFORM is clear, so the feature this patch tests
is absent on all five.

Controls, each producing a vmcore: the same platform on a kernel
without 5b25f249be32 (tdx_sys_disable absent from kallsyms), platforms
without SEAM support (Skylake, Cascade Lake, Ice Lake, AMD), and plain
kexec.

With the gate applied kdump produces a vmcore on the Alibaba ECS
Emerald Rapids guest, retested with this predicate.  The Granite
Rapids guest was verified with the v3 predicate and not re-run; the
AWS and Tencent guests are reproduction evidence only.  No TDX host was
available, so the no-op case is reasoned from the code, not measured.

 arch/x86/virt/vmx/tdx/tdx.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
index 96ced0494b68..9b01131f7b7b 100644
--- a/arch/x86/virt/vmx/tdx/tdx.c
+++ b/arch/x86/virt/vmx/tdx/tdx.c
@@ -2321,6 +2321,9 @@ void tdx_sys_disable(void)
 	struct tdx_module_args args = {};
 	u64 ret;
 
+	if (!boot_cpu_has(X86_FEATURE_TDX_HOST_PLATFORM))
+		return;
+
 	/*
 	 * Don't loop forever.
 	 *
-- 
2.52.0

