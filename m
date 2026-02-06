Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E107923183F;
	Fri,  6 Feb 2026 22:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770416699; cv=none; b=GbdvbShf2F2bdkUJJ4TzhMuzWKjRnU5kfhHZV2BC6UFaBv4MYciJe2itqdYsBSFVSTGKrzRrS7FLPlJmICkGxQaBjccLy1n6vZoAbXvwAAoq5qg7eiJ9AVYk57TyOpVaqhRKMt3oYs+K8sY5d1v7ea1Udn/dV+NYc/WTLB3NIkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770416699; c=relaxed/simple;
	bh=8CafBACy+XOG2z0rDuw1PadsDjIp9FgOBrjumDUwdA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q/8Y7NoYlJ0djNCRGlKTPzZLJGpYUNQ2LGPHwwmquZmANZ1LVXpANCthJUxpMkDk6vXE6HuTu5n2nG0rrgy/zkr44ZABi7eOtBwKKrd0RqToZFPzk86Wk5y5FN0qs88HXej4GPVFuZ1eQEQrrFAtgQkZDSx1F2mBJJPmFf/K4VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UXP8JknF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UXP8JknF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54772C116C6;
	Fri,  6 Feb 2026 22:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770416698;
	bh=8CafBACy+XOG2z0rDuw1PadsDjIp9FgOBrjumDUwdA4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UXP8JknFpbJMreOym+0CDxogLXc+H035clj33DOOnoTGgOfbVzFhSNxUmr1OnDa6h
	 /6uXuN++WV6oGf2tBqpKbCkqboUNqUcU/zkLUZDXwfzjjOxsfAxstWubZegN3GjeBK
	 B46rtg+BwJVnmkbrlmrmTo/5Sj3Ljp60+qJvXtfMzy6lO2fLHFpyDt39c5uYKZxBwL
	 PnOfirlEAM2k317dms6ulR/HomE99e+FvwlHaPo7hFNk3FKdf45fWxGqosN/0aqy5n
	 aBLyNHYALfeIqZK8HikU5PzRuHrYWH6VvXvPMt2A8d9INiQtP93ayQS/4TO/x368qs
	 a61/Fz09thJ0w==
Date: Fri, 6 Feb 2026 14:24:55 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Thomas Gleixner <tglx@glx-um.de>, 
	Thorsten Leemhuis <regressions@leemhuis.info>, Alexey Makhalov <alexey.makhalov@broadcom.com>, x86@kernel.org, 
	linux-kernel@vger.kernel.org, Ajay Kaher <ajay.kaher@broadcom.com>, 
	bcm-kernel-feedback-list@broadcom.com, Peter Zijlstra <peterz@infradead.org>, 
	Justin Forbes <jforbes@fedoraproject.org>, Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: [PATCH] x86/vmware: Fix hypercall clobbers
Message-ID: <nchtwtwjqwm444au4rsojawomqslolr3hb4ao4rwsi3t7hqawe@ktggphxq2rhd>
References: <99a9c69a-fc1a-43b7-8d1e-c42d6493b41f@broadcom.com>
 <73641ce4-9387-48c6-8904-74997f9bb7ac@leemhuis.info>
 <cjacqm5kz67e3nrjfxhpe4lepr27cnbmykdixknta4r2wh7ugq@3wne235ikkb7>
 <eef847de-7ef5-4491-91f2-7437dcb573cb@leemhuis.info>
 <kv4bv3jng2iap3qwvk36pciggiho4yhavnfvsisri67jkdt6kr@szokbl6qdibl>
 <87jywq18yt.ffs@tglx>
 <uc62gsttzmh5o35uh7viy326bqwpq5gxmcxqqyqb4zp4blp7tg@v3kfsotqtaay>
 <CAHk-=wivx7pi+h+hGmvNFAJm6StQLiQ-b8DdsE5J=LMOWae8Ng@mail.gmail.com>
 <2aoadlgueumiq6hf74baskvk5eomsil7jfsxg4vf4ofaggbecl@7seilp4ou5nl>
 <CAHk-=wgeoGrqgd4n7CntnF8hCPr3qvVVgzF7evhacyqstByYmg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHk-=wgeoGrqgd4n7CntnF8hCPr3qvVVgzF7evhacyqstByYmg@mail.gmail.com>

On Fri, Feb 06, 2026 at 11:57:04AM -0800, Linus Torvalds wrote:
> On Fri, 6 Feb 2026 at 11:08, Josh Poimboeuf <jpoimboe@kernel.org> wrote:
> >
> > Anyway, how about just adding RDI/RSI to the clobbers list for those two
> > hypercalls?
> 
> Ack, that looks fine and code generation differences would be pretty minimal.
> 
> Mind sending a sign-off and I'll apply it and we can forget about this
> unless somebody wants to actually clean up that vmware horror later?

Here ya go:

---8<---

From: Josh Poimboeuf <jpoimboe@kernel.org>
Subject: [PATCH] x86/vmware: Fix vmmouse hypercall clobbers

Fedora QA reported the following panic:

  BUG: unable to handle page fault for address: 0000000040003e54
  #PF: supervisor write access in kernel mode
  #PF: error_code(0x0002) - not-present page
  PGD 1082ec067 P4D 0
  Oops: Oops: 0002 [#1] SMP NOPTI
  CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 6.19.0-0.rc4.260108gf0b9d8eb98df.34.fc43.x86_64 #1 PREEMPT(lazy)
  Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS edk2-20251119-3.fc43 11/19/2025
  RIP: 0010:vmware_hypercall4.constprop.0+0x52/0x90
  Code: 48 83 c4 20 5b e9 69 f0 fc fe 8b 05 a0 c1 b2 01 85 c0 74 23 b8 68 58 4d 56 b9 27 00 00 00 31 d2 bb 04 00 00 00 66 ba 58 56 ed <89> 1f 89 0e 41 89 10 5b e9 3c f0 fc fe 6a 00 49 89 f9 45 31 c0 31
  RSP: 0018:ff5eeb3240003e40 EFLAGS: 00010046
  RAX: 0000000000000000 RBX: 000000000000ffca RCX: 000000000000ffac
  RDX: 0000000000000000 RSI: 0000000040003e58 RDI: 0000000040003e54
  RBP: ff1e05f3c1204800 R08: ff5eeb3240003e5c R09: 000000009d899c41
  R10: 000000000000003d R11: ff5eeb3240003ff8 R12: 0000000000000000
  R13: 00000000000000ff R14: ff1e05f3c02f9e00 R15: 000000000000000c
  FS:  0000000000000000(0000) GS:ff1e05f489e40000(0000) knlGS:0000000000000000
  CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
  CR2: 0000000040003e54 CR3: 000000010841d002 CR4: 0000000000771ef0
  PKRU: 55555554
  Call Trace:
   <IRQ>
   vmmouse_report_events+0x13e/0x1b0
   psmouse_handle_byte+0x15/0x60
   ps2_interrupt+0x8a/0xd0
   ...

It was triggered by dereferencing a bad pointer (in RDI) immediately
after a VMware hypercall:

  ffffffff82135070 <vmware_hypercall4.constprop.0>:
  ...
  ffffffff821350ac:       b8 68 58 4d 56          mov    $0x564d5868,%eax
  ffffffff821350b1:       b9 27 00 00 00          mov    $0x27,%ecx
  ffffffff821350b6:       31 d2                   xor    %edx,%edx
  ffffffff821350b8:       bb 04 00 00 00          mov    $0x4,%ebx
  ffffffff821350bd:       66 ba 58 56             mov    $0x5658,%dx
  ffffffff821350c1:       ed                      in     (%dx),%eax	<-- hypercall
  ffffffff821350c2:       89 1f                   mov    %ebx,(%rdi)	<-- crash

The full disassembly shows that RDI should contain the value of a valid
kernel stack address (0xff5eeb3240003e54).  Instead it contains
0x40003e54, suggesting the hypervisor cleared the upper 32 bits.

This issue was bisected to commit aca282ab7e75 ("x86/asm: Annotate
special section entries"), which added annotations to the ALTERNATIVE()
macro.  Despite the use of asm_inline, that commit caused the compiler
to un-inline and const-propagate vmware_hypercall4().

That made RDI live across the hypercall, making the hypervisor's
register clobbering visible and exposing this latent bug.  Technically
the bug is in QEMU, but we still need to support old "broken" versions.

This is also exacerbated by CONFIG_DEBUG_SECTION_MISMATCH which sets
-fno-inline-functions-called-once, causing once-called functions to be
not inlined, and in this case const-propagated as well.

In theory this same issue exists for all the hypercalls in the vmmouse
driver; in practice it has only been seen with vmware_hypercall3() and
vmware_hypercall4().  For now, just mark RDI/RSI as clobbered for those
two calls.  This should have a minimal effect on code generation overall
as it should be rare for the compiler to want to make RDI/RSI live
across hypercalls.

Fixes: 34bf25e820ae ("x86/vmware: Introduce VMware hypercall API")
Fixes: aca282ab7e75 ("x86/asm: Annotate special section entries")
Reported-by: Justin Forbes <jforbes@fedoraproject.org>
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/x86/include/asm/vmware.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/vmware.h b/arch/x86/include/asm/vmware.h
index c9cf43d5ef23..4220dae14a2d 100644
--- a/arch/x86/include/asm/vmware.h
+++ b/arch/x86/include/asm/vmware.h
@@ -140,7 +140,7 @@ unsigned long vmware_hypercall3(unsigned long cmd, unsigned long in1,
 		  "b" (in1),
 		  "c" (cmd),
 		  "d" (0)
-		: "cc", "memory");
+		: "di", "si", "cc", "memory");
 	return out0;
 }
 
@@ -165,7 +165,7 @@ unsigned long vmware_hypercall4(unsigned long cmd, unsigned long in1,
 		  "b" (in1),
 		  "c" (cmd),
 		  "d" (0)
-		: "cc", "memory");
+		: "di", "si", "cc", "memory");
 	return out0;
 }
 
-- 
2.52.0

