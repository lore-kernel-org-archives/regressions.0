Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E164A07
	for <regressions@lists.linux.dev>; Sat, 24 Aug 2024 13:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724505706; cv=none; b=hjhCGNtWDRKZWeeAqTWPzRY2/v5Z/x7diGiVK1kKegkEI+l4jiAzGarqeaPTQoYQ6yB8IcuuAZJyDuho2H1dX0Bo/4ze7AzlDdvU86rEMowzAuGsXF4tlGKFYo3BY1EjjGqk/ccfaUXnaKsPECgz5s9J2zp84yzCQ20rk7wXe0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724505706; c=relaxed/simple;
	bh=sdRdm9d8MQQ39Tf5ZXxIQbxQXAemGRDcfcykNDf2fHI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=D9/sYb4pUT+snozQmIdizjc9rDbra0iT0dzrVPU2+LU0ch63zSwx+ndsxgGF2ng4kdjY5Vefa0a3jKa8+7xe4fWZ1afhrS4cfQwpbXnCuynn80dF21hu7c7MyUSIIN0d4YWaRutF0IAE3n3P5cJxyru7HJLl75OvXqHAofQ0H+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U5vbOdoV; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U5vbOdoV"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a8677ae5a35so312424466b.0
        for <regressions@lists.linux.dev>; Sat, 24 Aug 2024 06:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724505703; x=1725110503; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8uroRrSSDLiDFz9DyVuvDhwCER+M6bgXCohKMH1WfZo=;
        b=U5vbOdoVz2rzceoh+ktVxvkxqgu9YE0v5DtD9os3QFTwTgoWOhTPHoDvf06FHWN9hz
         Ai7PiO1xP2O4BmhGbZL2EKu2veR1R3kX+sET3QIDUMCwkVBeewekC+2hN5YhQdnzHY0x
         AyIBcPOZTtxGcwlv8Xj5/EEcYI73EhWigs1Um6L6lc5eQQHOB2OzqnSj7DrS2BU588j8
         UOpCvB9Ll4x5aTpEU190HnFkIkXwrm6IyUMD+U1S9QXN+VNoLfq7PAxsqElzvfS1N91x
         Vs0uctcfiB5zgsD0+C0KEcv5n9lpeJWBcKjWiojfbLpPftm2pfM7LYW9emCo/2oo0FXi
         gRQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724505703; x=1725110503;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8uroRrSSDLiDFz9DyVuvDhwCER+M6bgXCohKMH1WfZo=;
        b=lB2+oFYVs87R9QPdqkt1L6U3ybxJ8ZUNW2cCL7PP7VmDvRmMC47H4p4Ps98fQ9vOFx
         uYQG8nTqhFZob0LlJoySRXpNwCy4aSCK/Y8QY06YzOutNeEMqzfRu03yY6YBZ51Q3QxA
         vZg//2+7sXWQCjqShcX6odtbQ4eBLymXl/KqnfQF2WQ07+2WEQcbcFwxjpLTYMhZeysz
         bc1fKkWpzjDjFA0BGLurMSFPdCc1GCtsqX9OHM+W2ja8e9xQjvd9ogEEMTevpHBC0y95
         6W0Z7XR/PpTYYjDmjWjAk9YNU6uiJDAowCZXu6EdVv17rMPK5jS3vySb2TXSFKXvcbhN
         dO5A==
X-Gm-Message-State: AOJu0YxzbNinyk9zKryryWZCg9biXEAZ4BvanvWU8f5uv4xAplg0wi7X
	SXSqPs3fhUr4j6oD5e3slnoJVGkYvjAQG/96W/8q1WQUaKGWrjMqcK/BsulBAnWToGwttNveQQl
	XM6BoUu8x16/L7s9DwVXH2bICD5yKydz71Q==
X-Google-Smtp-Source: AGHT+IHY55ervbIqr5XmulWQPPl9Ik/qOvFdN7ED4K+V4OsNVnV0bpVEO7TmwYMmwc7Kf+tOn48xWez7ReLK6o7VxMw=
X-Received: by 2002:a17:907:7291:b0:a7a:81b6:ea55 with SMTP id
 a640c23a62f3a-a86a54cebc6mr405331766b.56.1724505702684; Sat, 24 Aug 2024
 06:21:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Roberto CORRADO <flygatto@gmail.com>
Date: Sat, 24 Aug 2024 15:21:23 +0200
Message-ID: <CADCU23UeaLqFDd_z9B1rBESP6wsfEa0ByVehYWKVPE7r93OUNQ@mail.gmail.com>
Subject: WARNING: CPU: 1 PID: 1 at arch/x86/mm/pti.c kernel 6.10.6 x86
To: stable@vger.kernel.org
Cc: regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

[    4.546432] ------------[ cut here ]------------
[    4.546498] WARNING: CPU: 1 PID: 1 at arch/x86/mm/pti.c:256
pti_clone_pgtable+0x1ad/0x310
[    4.546593] Modules linked in:
[    4.546660] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 6.10.6 #1
[    4.546730] Hardware name: null
[    4.546818] EIP: pti_clone_pgtable+0x1ad/0x310
[    4.546886] Code: 00 89 f8 e8 25 fd ff ff 89 45 d4 85 c0 74 1d 8b
08 31 d2 89 55 f0 8b 75 f0 89 c8 25 80 00 00 00 89 45 ec 8b 45 ec 09
f0 74 13 <0f> 0b 0f 0b e9 64 ff ff ff 2e 8d b4 26 00 00 00 00 66 90 89
c8 31
[    4.547003] EAX: 00000080 EBX: 00000000 ECX: 092001e3 EDX: 00000000
[    4.547073] ESI: 00000000 EDI: c92e76a8 EBP: c11e1f7c ESP: c11e1f4c
[    4.547142] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010202
[    4.547214] CR0: 80050033 CR2: c9314e44 CR3: 09cd4000 CR4: 000006f0
[    4.547284] Call Trace:
[    4.547365]  ? show_regs.part.0+0x1c/0x24
[    4.547435]  ? show_regs.cold+0x7/0xc
[    4.547501]  ? __warn.cold+0x42/0xe5
[    4.547567]  ? pti_clone_pgtable+0x1ad/0x310
[    4.547634]  ? report_bug+0xd7/0x180
[    4.547703]  ? exc_overflow+0x40/0x40
[    4.547770]  ? handle_bug+0x35/0x70
[    4.547835]  ? exc_invalid_op+0x18/0x60
[    4.547902]  ? handle_exception+0x133/0x133
[    4.547971]  ? __SCT__tp_func_ma_write+0x8/0x8
[    4.548038]  ? exc_overflow+0x40/0x40
[    4.548104]  ? pti_clone_pgtable+0x1ad/0x310
[    4.548171]  ? exc_overflow+0x40/0x40
[    4.548236]  ? pti_clone_pgtable+0x1ad/0x310
[    4.548304]  ? __SCT__tp_func_ma_write+0x8/0x8
[    4.548392]  ? rest_init+0xb8/0xb8
[    4.548459]  pti_finalize+0x30/0x80
[    4.548525]  kernel_init+0x66/0x120
[    4.548590]  ret_from_fork+0x38/0x60
[    4.548657]  ? rest_init+0xb8/0xb8
[    4.548723]  ret_from_fork_asm+0x12/0x1c
[    4.548789]  entry_INT80_32+0xf0/0xf0
[    4.548857] ---[ end trace 0000000000000000 ]---

[    4.548925] ------------[ cut here ]------------
[    4.548989] WARNING: CPU: 1 PID: 1 at arch/x86/mm/pti.c:394
pti_clone_pgtable+0x1af/0x310
[    4.549077] Modules linked in:
[    4.549141] CPU: 1 PID: 1 Comm: swapper/0 Tainted: G        W
   6.10.6 #1
[    4.549226] Hardware name: null
[    4.549312] EIP: pti_clone_pgtable+0x1af/0x310
[    4.549397] Code: f8 e8 25 fd ff ff 89 45 d4 85 c0 74 1d 8b 08 31
d2 89 55 f0 8b 75 f0 89 c8 25 80 00 00 00 89 45 ec 8b 45 ec 09 f0 74
13 0f 0b <0f> 0b e9 64 ff ff ff 2e 8d b4 26 00 00 00 00 66 90 89 c8 31
d2 89
[    4.549514] EAX: 00000080 EBX: 00000000 ECX: 092001e3 EDX: 00000000
[    4.549584] ESI: 00000000 EDI: c92e76a8 EBP: c11e1f7c ESP: c11e1f4c
[    4.549653] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010202
[    4.549724] CR0: 80050033 CR2: c9314e44 CR3: 09cd4000 CR4: 000006f0
[    4.549794] Call Trace:
[    4.549855]  ? show_regs.part.0+0x1c/0x24
[    4.549923]  ? show_regs.cold+0x7/0xc
[    4.549989]  ? __warn.cold+0x42/0xe5
[    4.550054]  ? pti_clone_pgtable+0x1af/0x310
[    4.550121]  ? report_bug+0xd7/0x180
[    4.550188]  ? exc_overflow+0x40/0x40
[    4.550254]  ? handle_bug+0x35/0x70
[    4.550319]  ? exc_invalid_op+0x18/0x60
[    4.550404]  ? handle_exception+0x133/0x133
[    4.550472]  ? __SCT__tp_func_ma_write+0x8/0x8
[    4.550540]  ? exc_overflow+0x40/0x40
[    4.550605]  ? pti_clone_pgtable+0x1af/0x310
[    4.550672]  ? exc_overflow+0x40/0x40
[    4.550737]  ? pti_clone_pgtable+0x1af/0x310
[    4.550805]  ? __SCT__tp_func_ma_write+0x8/0x8
[    4.550873]  ? rest_init+0xb8/0xb8
[    4.550938]  pti_finalize+0x30/0x80
[    4.551004]  kernel_init+0x66/0x120
[    4.551069]  ret_from_fork+0x38/0x60
[    4.551135]  ? rest_init+0xb8/0xb8
[    4.551201]  ret_from_fork_asm+0x12/0x1c
[    4.551267]  entry_INT80_32+0xf0/0xf0
[    4.551344] ---[ end trace 0000000000000000 ]---

[    4.551428] ------------[ cut here ]------------
[    4.551493] WARNING: CPU: 1 PID: 1 at arch/x86/mm/pti.c:256
pti_clone_pgtable+0x1ad/0x310
[    4.551581] Modules linked in:
[    4.551645] CPU: 1 PID: 1 Comm: swapper/0 Tainted: G        W
   6.10.6 #1
[    4.551729] Hardware name: null
[    4.551816] EIP: pti_clone_pgtable+0x1ad/0x310
[    4.551882] Code: 00 89 f8 e8 25 fd ff ff 89 45 d4 85 c0 74 1d 8b
08 31 d2 89 55 f0 8b 75 f0 89 c8 25 80 00 00 00 89 45 ec 8b 45 ec 09
f0 74 13 <0f> 0b 0f 0b e9 64 ff ff ff 2e 8d b4 26 00 00 00 00 66 90 89
c8 31
[    4.551998] EAX: 00000080 EBX: 00000000 ECX: 092001e3 EDX: 00000000
[    4.552068] ESI: 00000000 EDI: c9200000 EBP: c11e1f7c ESP: c11e1f4c
[    4.552138] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010202
[    4.552209] CR0: 80050033 CR2: c9314e44 CR3: 09cd4000 CR4: 000006f0
[    4.552278] Call Trace:
[    4.552351]  ? show_regs.part.0+0x1c/0x24
[    4.552422]  ? show_regs.cold+0x7/0xc
[    4.552488]  ? __warn.cold+0x42/0xe5
[    4.552554]  ? pti_clone_pgtable+0x1ad/0x310
[    4.552620]  ? report_bug+0xd7/0x180
[    4.552688]  ? exc_overflow+0x40/0x40
[    4.552753]  ? handle_bug+0x35/0x70
[    4.552818]  ? exc_invalid_op+0x18/0x60
[    4.552884]  ? handle_exception+0x133/0x133
[    4.552952]  ? unregister_dcbevent_notifier+0x10/0x20
[    4.553022]  ? exc_overflow+0x40/0x40
[    4.553087]  ? pti_clone_pgtable+0x1ad/0x310
[    4.553155]  ? exc_overflow+0x40/0x40
[    4.553220]  ? pti_clone_pgtable+0x1ad/0x310
[    4.553287]  ? 0xc8100000
[    4.553368]  ? 0xc8100000
[    4.553432]  ? rest_init+0xb8/0xb8
[    4.553498]  pti_finalize+0x5e/0x80
[    4.553564]  kernel_init+0x66/0x120
[    4.553629]  ret_from_fork+0x38/0x60
[    4.553695]  ? rest_init+0xb8/0xb8
[    4.553761]  ret_from_fork_asm+0x12/0x1c
[    4.553827]  entry_INT80_32+0xf0/0xf0
[    4.553895] ---[ end trace 0000000000000000 ]---

[    4.553961] ------------[ cut here ]------------
[    4.554026] WARNING: CPU: 1 PID: 1 at arch/x86/mm/pti.c:394
pti_clone_pgtable+0x1af/0x310
[    4.554114] Modules linked in:
[    4.554178] CPU: 1 PID: 1 Comm: swapper/0 Tainted: G        W
   6.10.6 #1
[    4.554262] Hardware name: null
[    4.554366] EIP: pti_clone_pgtable+0x1af/0x310
[    4.554433] Code: f8 e8 25 fd ff ff 89 45 d4 85 c0 74 1d 8b 08 31
d2 89 55 f0 8b 75 f0 89 c8 25 80 00 00 00 89 45 ec 8b 45 ec 09 f0 74
13 0f 0b <0f> 0b e9 64 ff ff ff 2e 8d b4 26 00 00 00 00 66 90 89 c8 31
d2 89
[    4.554549] EAX: 00000080 EBX: 00000000 ECX: 092001e3 EDX: 00000000
[    4.554618] ESI: 00000000 EDI: c9200000 EBP: c11e1f7c ESP: c11e1f4c
[    4.554687] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010202
[    4.554758] CR0: 80050033 CR2: c9314e44 CR3: 09cd4000 CR4: 000006f0
[    4.554828] Call Trace:
[    4.554890]  ? show_regs.part.0+0x1c/0x24
[    4.554957]  ? show_regs.cold+0x7/0xc
[    4.555024]  ? __warn.cold+0x42/0xe5
[    4.555089]  ? pti_clone_pgtable+0x1af/0x310
[    4.555156]  ? report_bug+0xd7/0x180
[    4.555223]  ? exc_overflow+0x40/0x40
[    4.555289]  ? handle_bug+0x35/0x70
[    4.555384]  ? exc_invalid_op+0x18/0x60
[    4.555456]  ? handle_exception+0x133/0x133
[    4.555523]  ? unregister_dcbevent_notifier+0x10/0x20
[    4.555592]  ? exc_overflow+0x40/0x40
[    4.555658]  ? pti_clone_pgtable+0x1af/0x310
[    4.555725]  ? exc_overflow+0x40/0x40
[    4.555790]  ? pti_clone_pgtable+0x1af/0x310
[    4.555857]  ? 0xc8100000
[    4.555921]  ? 0xc8100000
[    4.556788]  ? rest_init+0xb8/0xb8
[    4.556854]  pti_finalize+0x5e/0x80
[    4.556920]  kernel_init+0x66/0x120
[    4.556986]  ret_from_fork+0x38/0x60
[    4.557052]  ? rest_init+0xb8/0xb8
[    4.557117]  ret_from_fork_asm+0x12/0x1c
[    4.557183]  entry_INT80_32+0xf0/0xf0
[    4.557252] ---[ end trace 0000000000000000 ]---
