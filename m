Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4252E11C7
	for <regressions@lists.linux.dev>; Fri, 19 Dec 2025 14:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766154995; cv=none; b=L71fBTQg+gPGEwDvxTOV1Py5k0sXq9Sn3BX6UHn2HyDVGpEs7YYvLTQMiHic836uk4AdqeqqlSRYMAFrR9fS+WpvMhHOomGtheoCwpkKIG+h7oEfDQMRwbhdM2Xzt/fdaWSVgD5xy4nSiqfnBqTiGxm5jiiPJZUPE51ny8db6U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766154995; c=relaxed/simple;
	bh=HSFPB/bwkL8yxZYc5klNfsL7dvjnOX38Gvv8GtWH4y8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=uO2GM8ZYVGfiEEh1rI20RxLOWfsfB+Z0PVKg0wQiVevsgC0JLHENXQYlBxWUeLXVhLAW0gQhrfgYkOKQYFkOG3cgmJKqgxc6vjtA5BymxSF26M9AAdPMkR+t1EN/rCFbZFdMhCcY38MRFSFaL+p94RBQxmD7TpogysF2nJKMQ4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=REtFunrw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="REtFunrw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766154992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=HSFPB/bwkL8yxZYc5klNfsL7dvjnOX38Gvv8GtWH4y8=;
	b=REtFunrwBfMpCNjUzlTFJblKohJgO6SgqxHvx525+W5iMOAK9rCfT/ZKjpUpp3IZtM0cm8
	oL3uoBGph4u0mdlK43d33s4ssVvt9e7hfHpBtuUztdS9j8XEHaiwtGCxDg2f5Ec3RbhVSU
	D6kaYwbcZ+xLzngWV0dPeIyITYNIopg=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-JLtbD6dNOnWrftyq7zf3ug-1; Fri, 19 Dec 2025 09:36:31 -0500
X-MC-Unique: JLtbD6dNOnWrftyq7zf3ug-1
X-Mimecast-MFC-AGG-ID: JLtbD6dNOnWrftyq7zf3ug_1766154990
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34c48a76e75so3713497a91.1
        for <regressions@lists.linux.dev>; Fri, 19 Dec 2025 06:36:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766154990; x=1766759790;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HSFPB/bwkL8yxZYc5klNfsL7dvjnOX38Gvv8GtWH4y8=;
        b=srCwAsFSftzPUer4iFPcGitfPtx71i+1WaZ7hjMzpI/TUO4kIKj9c5BbcM6eKgWDRj
         q5tH9ZILkGfmOQyQAjIJUbPoIpZ5kDXiqgvQvW3g22dFkXvj6GjK9WKnVZJ1ezoO5iC8
         s1K48szLxWFIq4zbQz8g0gzlVJu8ruzgVeWZ6whyS4aWtDupUbMR93KRvTvVLLewuXje
         9GvDsR3NchMQnIvgICa4gvqjIiMMsLlfw1UcZgD+Dx5M6ySKojUKbQYunkdtdrWkbYK+
         5+Q2Kfec9OX0gKw6eZ8L3mzUA28M4Jobrry3HMVsKQAq2EINZj0Ng4utcDcwW0QQ4m0P
         jg7w==
X-Gm-Message-State: AOJu0Ywc0czrPjNptRfVu1zlyiu+yVbsnKp2Nz3jLrQEvFcu7i+2Ntx4
	BHKO/UZtoGTkYf8o9NZrhDZE47ppIPdyfhSReVIlT11GQz+dlDS3bN+9kAP7OtFGDIr52fvPCkM
	Yi1uyG4dcXIbPQEM3fk+i14qZDYJo8FKUWiyL/Xrl6Ui3kaXUEiBU65ZFM9LZxgZw/f6Tu7YsuI
	XOkuSfIjRzaGyuvzGf3Wfdzh0aAeds5KWtAN5iYJGt7JP5wQ7Dwg==
X-Gm-Gg: AY/fxX44kieGNToJhTS+dyalH8H4Gf4/enGVw2J9lvUrIc47Tc0AYgwYll3UTiJMrKY
	ViR512g5frRDaqd92vXJgfcU2k8dxOs/h+h2gpGA3VCCJKx7D7slKq5uHPodLIb0WuSrbpfc1Jh
	dTc1+ZXzYZpw4qAWceECIEnlidRlYyr9EpJ6vMgAQSFmffBMOy5BgLTKMVZ4XnPzInB3HAo2GJd
	sNEULA=
X-Received: by 2002:a17:90a:e7c9:b0:34a:b8e0:dd64 with SMTP id 98e67ed59e1d1-34e92113546mr2602522a91.1.1766154989668;
        Fri, 19 Dec 2025 06:36:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH6XTI+e9miphOZJZOd+oGctJdHIYB919X0q9PI20jDC/DqiFfT4PXKX2g1KDxLKh2+5CLUbQqa1wiKc1MyUkg=
X-Received: by 2002:a17:90a:e7c9:b0:34a:b8e0:dd64 with SMTP id
 98e67ed59e1d1-34e92113546mr2602507a91.1.1766154989236; Fri, 19 Dec 2025
 06:36:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Jason Montleon <jmontleo@redhat.com>
Date: Fri, 19 Dec 2025 09:36:17 -0500
X-Gm-Features: AQt7F2pnE7QJEunHyj172HIMr_CoX0S3PPbHC3g7BOuigEeA0QrCgTUwLvZmr1E
Message-ID: <CAJD_bPKbZaEHmKzVcLPGJuR3Y3MO1AJDA0TmLZrLkCJ0PzCM1A@mail.gmail.com>
Subject: [REGRESSION] Cannot boot 6.19-rc1 on riscv64 with BPF enabled.
To: Linux regressions mailing list <regressions@lists.linux.dev>, menglong8.dong@gmail.com, ast@kernel.org
Cc: linux-riscv@lists.infradead.org, bpf@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hyiBVkn6T-EoQFe9Mgl-FGQUH2OITkg5hmXaGf6EE7Q_1766154990
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

When booting riscv64 systems with BPF enabled using 6.19-rc1 the
system produces the following panic. I tried on several boards and
they resulted in the same error.

[ 5.380583] Insufficient stack space to handle exception!
[ 5.385986] Task stack: [0xffffffc600020000..0xffffffc600024000]
[ 5.392339] Overflow stack: [0xffffffd7fef7a070..0xffffffd7fef7b070]
[ 5.398693] CPU: 2 UID: 0 PID: 1 Comm: systemd Tainted: G W
6.19.0-rc1-00001-g74d9cab5b6c1 #15 NONE
[ 5.409302] Tainted: [W]=WARN
[ 5.412271] Hardware name: starfive StarFive VisionFive 2
v1.3B/StarFive VisionFive 2 v1.3B, BIOS 2024.10-rc3 10/01/2024
[ 5.423134] epc : copy_from_kernel_nofault_allowed+0xa/0x28
[ 5.428718] ra : copy_from_kernel_nofault+0x28/0x198
[ 5.433774] epc : ffffffff8024062a ra : ffffffff80240670 sp : ffffffc60001fff0
[ 5.440997] gp : ffffffff82464ce8 tp : 0000000000000000 t0 : ffffffff80024620
[ 5.448219] t1 : ffffffff8017c052 t2 : 0000000000000000 s0 : ffffffc600020030
[ 5.455442] s1 : ffffffd6c2198260 a0 : ffffffd6c2198260 a1 : 0000000000000008
[ 5.462664] a2 : 0000000000000008 a3 : 000000000000009d a4 : 0000000000000000
[ 5.469885] a5 : 0000000000000000 a6 : 0000000000000021 a7 : 0000000000000003
[ 5.477106] s2 : ffffffc600020070 s3 : 0000000000000008 s4 : 0000000000000000
[ 5.484327] s5 : ffffffc600020080 s6 : 0000000000000000 s7 : 0000000000038000
[ 5.491549] s8 : 0000000000008002 s9 : 0000000000380000 s10: ffffffc600023cf8
[ 5.498771] s11: ffffffd6c419bf00 t3 : 0000000077ab9db9 t4 : 00000000113918e7
[ 5.505993] t5 : ffffffff9e9bcc29 t6 : ffffffc600023ad4
[ 5.511304] status: 0000000200000120 badaddr: ffffffc60001fff0 cause:
000000000000000f
[ 5.519221] Kernel panic - not syncing: Kernel stack overflow
[ 5.524967] CPU: 2 UID: 0 PID: 1 Comm: systemd Tainted: G W
6.19.0-rc1-00001-g74d9cab5b6c1 #15 NONE
[ 5.535574] Tainted: [W]=WARN
[ 5.538544] Hardware name: starfive StarFive VisionFive 2
v1.3B/StarFive VisionFive 2 v1.3B, BIOS 2024.10-rc3 10/01/2024
[ 5.549408] Call Trace:
[ 5.551859] [<ffffffff8001e438>] dump_backtrace+0x28/0x38
[ 5.557262] [<ffffffff80002462>] show_stack+0x3a/0x50
[ 5.562317] [<ffffffff80016d02>] dump_stack_lvl+0x5a/0x80
[ 5.567720] [<ffffffff80016d40>] dump_stack+0x18/0x20
[ 5.572776] [<ffffffff80002b7a>] vpanic+0xf2/0x2d0
[ 5.577570] [<ffffffff80002d96>] panic+0x3e/0x48
[ 5.582191] [<ffffffff8001e110>] handle_bad_stack+0x98/0xc0
[ 5.587765] [<ffffffff80240670>] copy_from_kernel_nofault+0x28/0x198
[ 5.594122] SMP: stopping secondary CPUs
[ 5.598070] ---[ end Kernel panic - not syncing: Kernel stack overflow ]---

A bisect identified 47c9214dcb as the problematic commit:
[47c9214dcbea9043ac20441a285c7bb5486b8b2d] bpf: fix the usage of
BPF_TRAMP_F_SKIP_FRAME

This commit reverts cleanly and when building 6.19-rc1 without it I am
able to boot successfully.

A copy of the trace, bisect log, and config used to reproduce the
problem are at:
https://gist.github.com/jmontleon/b8b861352e7b9bc9fd3a93d391926dec

#regzbot introduced: 47c9214dcb

Thank you,
Jason Montleon

