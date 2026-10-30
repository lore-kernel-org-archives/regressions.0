Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793375342;
	b=wgB9t3WHr2Km2QVgTbqCyJoIBqqkhkpM/iee/08BO+wj5Ap6lBmxZf66o6jEV4SndgTM
	 8yTbaskduuyA5czJVKJeah8VOPL/Hidr5KkNC4izNzWCkVYLSgTdHErYgX5kQ8MqVqTcK
	 EopnMPQ46IHhdKfmwRm8R23DJjIJj2QP6LMrSYoFXfXsL8NfO4ua/F9FkVpe8jR43+QzE
	 jh43N0qzssR0htrhy3InWAP0LkgOxHL1W64NbHXKsi4LGh308d5XiDVjS4Z3yU+JfX96L
	 MeH0Cgsq8CqyxsvzLA1Q4FYpNEoF2AyXC9k72VBKoKCmzLrv4QNdkZNJGEO0IH/uKoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793375342;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=d0SM8LOepW7XUMwU+ZDps/Wc1zMBVt4O8GKS2q6Z4u8=;
	b=nGOQ6GVu3xAW8O+IJOUuUfxgY9NI/gBdG032K3NsLcvz5GjYHXW5Y10eldm5Hc8WJAqb
	 JpXLFSuxgI07MXuWAHOMWxZ3Xx3IyqbQeMXCp2b1E9EV9CFj0+gdni0xRhhJfLnsE68a+
	 La3HXE7Sljdo64kkdlaBuD0URmoVQInLCVbDqzsO1eGljGFmMBGjGdPts4kGv0tdIH1VB
	 p8A/mGpk+xp2BQ3k2B8U1Mxk6Yk/q69s+A3YUCvlwIHhLWTaNvhPC9UJ2qivJafCszHq+
	 XoGGCt4KmsW402oTrO1Wuzxyb5CdzEwWUkNClLF/lcXwKIymtglWtRUgaKfPfdrOhsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=injfLSpH;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF391606A31A
	for <regressions@lists.linux.dev>; Fri, 30 Oct 2026 15:49:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF391606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=injfLSpH
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ea7987517aso6701985ad.0
        for <regressions@lists.linux.dev>; Fri, 30 Oct 2026 08:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793375341; x=1793980141; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d0SM8LOepW7XUMwU+ZDps/Wc1zMBVt4O8GKS2q6Z4u8=;
        b=injfLSpHBv3MZ6dRlVOEAHIfNI/VXZ7gLnjNwyHRQva9O/m8G+qs9goJlE0/WwwC9z
         bECublmeILUgikfurBxSn4MFEjDCnCDOe7fAG99pqXDwd1r+kj8ssGJCZAqlHGFWHIBt
         58Fg6ywEVuCt8QnPtM5mjR+tLnER3n6y9cWUSzVv52yOBkdR1nI/j56GcPr/yev2k4ss
         hUM+bETD0ktBlzB7Om4AE5HwOjS2U6nCA9IP9gbw3ZSvmb6YVGF9sMyvmPy75GOdmMWW
         XowVe+0BAVBVHeb7uzroGwRGOAmQc0BywXrhSwc/VuhUxPua4ud8hEnKQxxqHhKDT6TC
         o3cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793375341; x=1793980141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d0SM8LOepW7XUMwU+ZDps/Wc1zMBVt4O8GKS2q6Z4u8=;
        b=LQrURCuWJXvL2ZBYF+lkM5HDl6au2Q890pMsUYt9Aco40+R01nbo8bvwp3iKswEA8R
         adzgGNtMgdeJwo2iuKySO4cw1Q0gFNtTrKxLafvr+9+ZgpoHO451NmBq6B5QrKA0/giU
         0yOThjydvFG5fkatEAllRxGe4I1lxGiXA52WIo+zqrehfgWkCqjEyY3O+66IQvoZyrbb
         ek0c2qVwZ7rEWC8PXuupzZ2NaliDd9v1QOVtDUtHk2dG+zbWf2AAIrfCqqBXkBs4wFQn
         lPowW9aVcwurRtrNIyet2QVRUH8XDvj0RF8lVI6JSoj2l4QnXo5f9mS3HCN/tpiP8u+n
         hcww==
X-Forwarded-Encrypted: i=1; AKwUvBywKehac/hXLkNr4bQ7pehvKtYDzSsuspIyf2I+UJjnFdp7+UNBUKASeUM7r5nQjmnbrtUwcygVxadpAA==@lists.linux.dev
X-Gm-Message-State: AFq9FYINUgJO68s8GPBi9LfCreiEgbby3lSyaBwvbtpbbISuF45hMhuU
	5bNFoT6qhldzOz07F44+eUw0d9lCpUWgM33QnV7s1eZoRHRXpb0b62wy
X-Gm-Gg: AYBFou0chOBce6gTQxTdMipyYeD2bn1V4TqILkNF1FpM/hIBlAurYYv2efFs0uilARF
	7LYiCWrXBcOWpn3pVzxLnQdne0bTOEaCRUgjauSbgE1r2WUnhGr5Roa1SxoGwPfkB2mr9Mxf/H+
	EQ6CJeiYGsN+ZgJ0QBteL6VgWTOzVvRBEgI/EmIl5jMrmg96yDl27EO3hB/pjQXYT21PZG050Y1
	xhsvzfCroFfIaaEX/Xg3TZ6pJq/NXW0sLSSUIhKlSndGXDIbDsN3ryyiPHxEmX9Ir9xe7G7YEtL
	Er/x0C8ADxCPWcGa4QLyVPC7r4J4yP4x2XGO+1BfUaujrSXy0GK7qzIrBLeWSjOuORcRgNXHbzH
	b356h1CX8NjwFVWTWWPAPjTOslTPJtpaPROLVByHLjLn55+UR7Qqc3zWqq3gdRSckZPElxE60Sk
	iMm0VOfrsEA4wA56467V8AewI5yrIyALrNtVs3JrNsRGd1+cXX5XhDFjT3jYf0iFvFjwzOiLumm
	qeR6ZVEI/9uM2U0uZrEVa82ZgIgVusrJxxvpSZjjsQeAPIUG+zlpjcEf/40SKVSezIwrWxEnFyw
	BFoFZSVTUs2QMbqJ1k7E/pJ9WUQidnFaq4pibdmtyog=
X-Received: by 2002:a17:903:3c6c:b0:2e9:73db:3c78 with SMTP id d9443c01a7336-2eb3649bef0mr30087255ad.17.1793375341157;
        Fri, 30 Oct 2026 08:49:01 -0700 (PDT)
Received: from iZj6c0kydq3fvfrtx5kta5Z ([47.86.51.122])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39248621sm9426235ad.28.2026.10.30.08.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:49:00 -0700 (PDT)
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
Subject: [PATCH v3] x86/virt/tdx: Skip TDH.SYS.DISABLE if the TDX module is not initialized
Date: Fri, 30 Oct 2026 23:48:51 +0800
Message-ID: <20261030154851.907726-1-challvy.tee@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <auM3KKutfutAqgWG@thinkstation>
References: <auM3KKutfutAqgWG@thinkstation>
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

Gate the SEAMCALL on tdx_module_state.initialized, the predicate
tdx_get_sysinfo() already uses in this file: a kernel that never
initialized the module has no module to disable, and where it did the
gate is a no-op.  Doing it here rather than at the crash.c call site
also covers the syscore caller and any future one.

It also decouples kdump from the host KVM version -- a guest cannot
require its host to inject the #UD.

Fixes: 5b25f249be32 ("x86/tdx: Disable the TDX module during kexec and kdump")
Cc: stable@vger.kernel.org
Signed-off-by: Challvy Tee <challvy.tee@gmail.com>
---
v2 -> v3:
 - Rework the changelog around the VM exit mechanism from the review
   and scope the impact to guests on SEAM-capable hosts whose
   hypervisor does not handle the exit.
 - Shorten it and move the reproduction data below the fold.
 - Cc the author of the KVM commit now cited.  No code change.
   v2: https://lore.kernel.org/all/20261029094705.896693-1-challvy.tee@gmail.com/

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
  Emerald Rapids     0x6CF    Alibaba ECS    6.12.0-278.el10    no vmcore
  Granite Rapids     0x6AD    Alibaba ECS    6.12.0-278.el10    no vmcore
  Granite Rapids     0x6AD    AWS EC2        6.12.0-278.el10    no vmcore
  Granite Rapids     0x6AD    Tencent CVM    6.12.0-278.el10    no vmcore

Controls, each producing a vmcore: the same platform on a kernel
without 5b25f249be32 (tdx_sys_disable absent from kallsyms), platforms
without SEAM support (Skylake, Cascade Lake, Ice Lake, AMD), and plain
kexec.

With the gate applied kdump produces a vmcore on the two Alibaba ECS
guests; the others have not been retested.  No TDX host was available,
so the no-op case is reasoned from the code rather than measured.

 arch/x86/virt/vmx/tdx/tdx.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
index 96ced0494b68..a7eae7492c1e 100644
--- a/arch/x86/virt/vmx/tdx/tdx.c
+++ b/arch/x86/virt/vmx/tdx/tdx.c
@@ -2321,6 +2321,9 @@ void tdx_sys_disable(void)
 	struct tdx_module_args args = {};
 	u64 ret;
 
+	if (!tdx_module_state.initialized)
+		return;
+
 	/*
 	 * Don't loop forever.
 	 *
-- 
2.52.0

