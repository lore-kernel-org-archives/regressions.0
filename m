Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C0D2D7DF1
	for <regressions@lists.linux.dev>; Thu, 23 Jul 2026 08:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784794597; cv=pass; b=KIpNqAEzugTR2qfFzgSY/vSxvpAdyQIFlTE5peOWTIDBCo6pjsfDeVeIsAv8as1JoP7S3U+44ixfg6Gfv+8SRPaNRIYo8iEqz90MMQfVu+JqFCnbgOhvqO2aHLcg37bqoMCAe+Cy/A9KQPKgSDNIyvrW2FEsie0u1wX9KdcISnU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784794597; c=relaxed/simple;
	bh=VT4MWQfU9hCucpc7cWdAlF6H9kZnwG+Gwdmmhdc0Ick=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=aKWjJxY/UktdTs99mEgqmeXCVO+T3pCE/PbjOMEzFy1Gh+VL1vAMgtjMKCOam+8Ds/8VgOmB/awhLOhdINAVHR0VYGCApnl6A69MSpLYW0e1oV3TC+7KFityB7SDMtnBEZYeZ7jJOxtlBvY5UtKOITto2ajr88oENv+5D530NYA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YUzwg9Km; arc=pass smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YUzwg9Km"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cb5a6aa8760so235540a12.1
        for <regressions@lists.linux.dev>; Thu, 23 Jul 2026 01:16:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784794595; cv=none;
        d=google.com; s=arc-20260327;
        b=cT8J0njKYOTES3+j/FOYxlw/SKQQWCl3xho9Z6gVXbkV1AOcA60xCUtKSO1rNLsSQt
         XsC3LPCpPtWIWHo4I1Wv6prY/Tw487PdkXk6NM04mRbd0EO+ajDUtyqOSuWxBEIo/roJ
         CfNJfWSDEXkh/6rPjKeTxAf04xO3ZA6fk/poPtHb45amXorSFcz4wX/2m77YPGAORj5y
         xAeORNLQcMcEAhPSi+9aZC6nEZSszgv14Org72Nza6SBsmV9yRakcUqfLelSm8E46HPe
         RLDHP/vy4plgVmYoz9I5NjJ5cN/4btmvDYXZperabQzHm9hijc+VYFCcnYAvB2Lz8yDa
         fRmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Wo+Vi5K3kSEn+1EpaozgmT/8tPtVROlmrkhTXMeQFAc=;
        fh=wBq+zwFNl/RImW0qYPDLDvB3sCEzugBcqAaag1b13Bw=;
        b=Bfz5lzXZGkuLdEGi5CjJMmpLoKX0Wv/Pbfd8kX/JWFPV12Cgf1Xf6XNZoWoy04Pz1v
         h+rGTuH0689Jf6CjbWVS5spCIqKEz7IZlNGFJYws6u/FlxfuUnSXy+wPjT91UzsasK8G
         TanLyT63Ga1mXmf7K69K9C4fl9xq8dkXQ3fFNqkT3mbLl6XH2ADYZ2uDBqNgpvpI87aO
         PY0f+LCZr8c+ZgApBkvABMILFaZlwKc1VYeeEZIGytHfqchFjkWTS0w1pmhe6PbPDDRV
         cU4h7YzsE5CDr9PdHsX9Dwxrsd8jKONLBcvUAptUQjethMXYon+Uy+mIzf2Hfbo1UYUX
         5tJw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784794595; x=1785399395; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wo+Vi5K3kSEn+1EpaozgmT/8tPtVROlmrkhTXMeQFAc=;
        b=YUzwg9KmicVJSjd06d7m2vcqTsdcyT+YK4AC9aTQQc3LL1emf57vk8crhDNmK1WvXt
         WO7CDZeikVyjsJfK/liY9UbPPhQ/MEN9WG00Q7mXyw0T/kgBN00KsiVbZ8hiB2noAVtH
         y9TF67a6/mmqDWbAeS0N2cAY9wlo5ORTx1m46cL8rZVGLI7sq1QBDsTh0kcklVv2WAwi
         K0MOnZPvNxHmXRSb8TXVqFWPmz6Dmq+XK38pTRzsYQUIrxvGy6NmdDdBs1g7bv7eGheM
         wEFqBsUL2Wdi31WdZh6O+LV8B3A191ZeeXEeFrVPESnDowD7EGDKRj1byjgoh4jlnuRU
         kHnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784794595; x=1785399395;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Wo+Vi5K3kSEn+1EpaozgmT/8tPtVROlmrkhTXMeQFAc=;
        b=FAIaUQHViAH2NV8bkdCSQvG4kJnhxF/RdwyW7Svh3RligtLO+o2Uo1RlecKNJ2oxkg
         NJAYUY25n2qOUCuKoWyDwKOrUce6Q7bqX269oaPxCziwSgeoBIYEF79qRYh+R125T5iB
         apOOwZZxpiTrA6oAscXAYpYpiK29F+QvoudikjYAFB0bCVc96xUyOBSSb+RD7OaAIUK8
         NRjNraN7Bnspy7re1uazs8UWJaWP1/xUQp1lMlAgve42l0Db/UrP+j5XcX1bZ9NcgCGb
         x+oKMh/XYYL5XlItpb7Ip5fWgc6U6ttYWepCmK6KClEnajyezrkJ8/MVEatjtY9GzUg1
         L0Kw==
X-Forwarded-Encrypted: i=1; AHgh+Rr5J6c29Rlw5h+LJOUuNP66ULFEItGjeBGuQSn3C8ynfPtwFSAi/Ohq4/KM1EhYRZ9jNoeJJLC+w7ZVeQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YywPli3BhaE7quVE6V8ibA0j0uDRLqvjc8+/cLvS5Dd3B7plXa7
	o2Wvvp62mIBfZccCcnM1bNgNnKfXeubZT6Hg51RQDO4HnvhyzcR0iHq2jjVkxc8R+cnNtlyLqOB
	jmqTJf2UaqbRlT8KpPhlkfmLjVguYSQ8=
X-Gm-Gg: AR+sD11ZiN+bp7X+/o5vnuswUI52/xB96YxZEE2HioEDtsJTAcwRjjamYBgALtGhseJ
	KGdjfTfdoP3H3kgYK+dbmNibUxrwicHJHQ2/TYDphMzIgFTMljoH7YFfIcPiZKEdIP/UtMZGTKk
	uv+R8o55YbAvSmzLemyVWfLyRxmT/eyTA5RKjSY+Mvs2N/K5cpTMrofMYrjnMMDr17lSfWxRMZF
	Ue8rNkS/xSWf9+CrmCZ0B4YeGIxGqOX92KSgEFXIvD0VVGgM3/SFk+VsILBz8sE
X-Received: by 2002:a05:6a21:608a:b0:3bf:9b61:f7ae with SMTP id
 adf61e73a8af0-3c44afcf8a6mr2128914637.14.1784794595473; Thu, 23 Jul 2026
 01:16:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Min-gyu Kim <gimm78064@gmail.com>
Date: Thu, 23 Jul 2026 17:16:23 +0900
X-Gm-Features: AUfX_myL9bF7X6cpM8-4rFrG6l6JryBzW6Ow15hH2749EXFeM9RDeP9w91553Hg
Message-ID: <CAGKGUv=sOuqQtA1Ub-5JXfA4FPosJFYKAQE4B79cK+P1erxqtg@mail.gmail.com>
Subject: [RESEND][REGRESSION][SECURITY] bpf, s390: verifier/JIT mismatch
 allows unprivileged kernel memory access
To: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>
Cc: bpf@vger.kernel.org, linux-s390@vger.kernel.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev, 
	security@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

I am reporting a potential security regression involving eBPF verifier state
pruning and the s390x JIT. I reproduced arbitrary kernel read and write access
and local privilege escalation as an unprivileged user.

AI assistance was used during discovery and analysis. In accordance with the
kernel security-bug reporting guidance, I am not requesting an embargo. The
reproducer and exploit are not attached or published; I can provide them
privately to maintainers on request.

Summary and affected versions

A verifier regression can cause the verifier and the s390x JIT to disagree
about the upper 32 bits of scalar registers. A crafted socket-filter program
can consequently form an unchecked 64-bit offset from an ARRAY map-value
pointer and access attacker-selected kernel addresses.

The regression was introduced by:

  107e169799057bc6a379ddb625cbe1e51cfc7d72
  ("bpf: disable and remove registers chain based liveness")

The commit first appears in v6.18-rc1 and is not present in v6.17. The cause
was still present in the v6.18, v6.19, v7.0, and v7.1 stable branches and in
v7.2-rc4, bpf, and bpf-next when checked by source comparison on 2026-07-22.
I also confirmed the relevant logic in mainline commit
4539944e515183668109bdf4d0c3d7d228383d88 on 2026-07-23. Dynamic
reproduction was performed on v6.18.38.

Affected code:

  kernel/bpf/verifier.c
  kernel/bpf/states.c in current development trees
  arch/s390/net/bpf_jit_comp.c

Required conditions:

  Architecture:                        64-bit s390x
  Program type:                        BPF_PROG_TYPE_SOCKET_FILTER
  Map type:                            BPF_MAP_TYPE_ARRAY
  CONFIG_BPF_SYSCALL:                  enabled
  BPF JIT:                             enabled and active
  kernel.unprivileged_bpf_disabled:    0
  Required capabilities:               none
  User namespace:                      not required

Root cause

The verifier records an ALU32 definition in subreg_def. A later 64-bit read
causes mark_insn_zext() to mark that instruction for explicit zero extension.
Before 107e16979905, a cache hit in is_state_visited() propagated the 64-bit
read to the alternate path's ALU32 definition.

Commit 107e16979905 removed that propagation when register-chain liveness was
replaced with static liveness. The static live-register mask does not track
read width or path-specific subreg_def information. In current states.c,
regs_exact() compares only fields before id, while subreg_def follows id in
struct bpf_reg_state. The SCALAR_VALUE case in regsafe() also does not compare
subreg_def. States with equal tracked scalar values but different ALU32
definitions can therefore compare as equal, leaving the pruned path's ALU32
instruction without a zero-extension mark.

On s390, ALU32 ADD updates the low 32 bits while preserving the register's
high half. EMIT_ZERO() emits llgfr only when the program-wide verifier_zext
flag is clear. If another ALU32 definition is marked, verifier_zext is set and
the JIT relies on each instruction's zext_dst flag. The pruned instruction
lacks that flag and can execute with attacker-controlled high bits intact.

Reproduction and impact

I ran the test as uid 1000 with all capability sets empty:

  Linux syzkaller 6.18.38 s390x
  kernel.unprivileged_bpf_disabled = 0
  net.core.bpf_jit_enable = 1

The exploit disclosed array_map_ops through the existing map->ops pointer,
derived the KASLR slide, and obtained arbitrary kernel read and write
primitives. It used those primitives to locate and modify the calling
process's credentials. map->ops was read only and was not overwritten.

The resulting shell reported:

  uid=0(root) gid=0(root) groups=0(root),27(sudo),100(users),1000(poc)
  context=system_u:system_r:kernel_t:s0

A standalone C reproducer and exploit, verifier log, kernel configuration,
and build details are available privately on request.

Mitigation and fix direction

Setting kernel.unprivileged_bpf_disabled to a non-zero value prevents this
attack by unprivileged users. Disabling the s390 BPF JIT also prevents the
demonstrated mismatch.

I have not yet tested a patch. A conservative verifier fix may be to avoid
pruning live scalar states whose relevant subreg_def values differ, or to
preserve the read-width information needed to mark the current path's ALU32
instruction. As defense in depth, the s390 JIT could avoid relying only on
the program-wide verifier_zext flag. I can prepare a regression test and test
proposed changes in the s390x QEMU environment used for reproduction.

References

  Regression-introducing commit:
  https://github.com/torvalds/linux/commit/107e169799057bc6a379ddb625cbe1e51cfc7d72

  Public review discussion related to read width and zero extension:
  https://www.spinics.net/lists/bpf/msg139280.html

  Merged patch discussion:
  https://www.spinics.net/lists/bpf/msg152234.html

If appropriate, I would appreciate a Reported-by tag as:

  Min-gyu Kim <gimm78064@gmail.com>

Please let me know if you need additional information or would like the
private reproducer and exploit.

Thank you for your time.

Best regards,
Min-gyu Kim
