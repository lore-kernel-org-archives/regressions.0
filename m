Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE8D207DEE
	for <regressions@lists.linux.dev>; Thu,  6 Mar 2025 09:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741253099; cv=none; b=TZLCgA4ZqyIihsdEKA3QUkn4vvbULrgTnskqUfzvcM+CE7163L7XWGJDEMZH5IpsvDG8liMQwRe7VfS49Ts2sPiZE9j3A4z3fuOvx9vlfyqIgFgyrmEEOfw0DO7vyVhnIc1AKUDrs2qTuizCVF++XsExQyuzkMsUT0B8KOLmnGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741253099; c=relaxed/simple;
	bh=UXYZgBd7E0SPWfaEIMbgJmdYXQINO34nR25JeZs9mCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zrf627OKquhKfdL77GV2lsgv7ReN8rz8G1Y9KayL3zsxyjri51jZ9nvmNPQpXKa4kbwH4dpA4qrYsUkI8oFuM+FCGpS6+Txbnm6ULZvxdgjzopZ4MROKUKzP5IRoFzuY3MWpD93iTnhWHwu7fqYADwy5YFrj/25Gn4CZQlRJ2d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=swine.de; spf=pass smtp.mailfrom=swine.de; dkim=pass (2048-bit key) header.d=swine.de header.i=@swine.de header.b=ro0kdBV+; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=swine.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=swine.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=swine.de header.i=@swine.de header.b="ro0kdBV+"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-38f403edb4eso233300f8f.3
        for <regressions@lists.linux.dev>; Thu, 06 Mar 2025 01:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=swine.de; s=google; t=1741253095; x=1741857895; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zhV/T3X4XR0o2C1s5ecZxEo9AmlSFdOugtjb6WjjMt8=;
        b=ro0kdBV+DOi+y0oAUAOdBDsUHzKwAOmDpLntrj5Qjlk5WHVpq1X43cxXzSca6ltdsa
         6o03m4jmgsiHMNxdzjZWVhhUTeCC3yGTs7Urn9q4gvk8NGY6VGYre5+EeN464IGc93nC
         F2qGBBX0uZCwdBzN8T6Df1Jo5SYERQ97XPCGkoE1PdCaTmkAIH2u7NFwbNBeetDRTC25
         xpua74pnPJ08vVKE5LMEmUUzKzZwzciUInHNxNVEEHK66yrzf6HI5hHdWGka76dZBFis
         A0pzRtLGzljaGsEcIznQvUH4fG+GlOtG1kqprtygOwtt7bER1RWpVz2JnoTbOd6VXRVC
         mDuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741253095; x=1741857895;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zhV/T3X4XR0o2C1s5ecZxEo9AmlSFdOugtjb6WjjMt8=;
        b=ixYhqYUZZVnwK0z1f13Li+wWuQMFcHdvKB35E4VgSopwgNhv46lcwSfAR4lpvqnOPq
         AS9SGXI0iUxs15xsGkYZ8HDTaVokQNk2a3Dej+lSex5bY2DDudFlnScOj8IwnBSB0Aqb
         J+t9ufVKxADY84AVoAdJPVIDLWU1d/l9s39or5S6YUpFYj8v6pb+SsFcw1f5ubwX9iOF
         ETGGuXfTzkxACCwITd9Dm2yV5223CderUZCbfXHq/uJw/6q53vHtRN3uhM8dYWYxDOcr
         30fzLR5vzHZiGje8qE9WFJgV3F9qrN22bdsW1Ng43nauN3XrEOemEhqP1IjtL+ZVOgKp
         4bHA==
X-Forwarded-Encrypted: i=1; AJvYcCUiQ20ayJX3fkDgaEuoO4SHN2qEZxPh6TVv7Ys3u/ojqqecw/DIqioc0ib2F0goKU8ySWNkqqRQ/cLVIA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyDpfbaYZLGYkPGFloYYSoKJs7+TnDZNr15HHZ/zxPyBJMAAgzx
	mj93NXILVkFXuTmUrghlqkRC4UiHRVefM3S+AMz4SCzKU0TFGbTRxf/oeE7AztT0ibzL70UfVIV
	UlZ5gow==
X-Gm-Gg: ASbGncsJIqTM2wWM8wCh04mXc/4ckZTMr21mBle0OxnEjbjm7l3JvgL06gQJVc5mrdY
	z78z44oAXz+whVBtXH+ddSR+RXIr+zGeGaL7HdqG/UVSmFkItMFzH3emCcyw31nsxdtvQvEXYIW
	rQgUwLZtJ04ZQylRBS+8NPg0dgCH3I+GrKlsIzHtPFkvqVVjbo8qEm1jbnpwWVwvEjbP3e+s7L6
	tqj+PjJWUuOxMzNLyErDvpklkDwwqZ/F7KkNTEFw5q+fA+sJ0BDbSjVLzpw6xRp7o2JkNUTMgj5
	tcTwpAyqGNRVjlDpVrRwIWiDjmw2zObMTdTejgoU6PxLfpfX97MFa3LQmqAf8vdjyxVr
X-Google-Smtp-Source: AGHT+IG4hSO06lFQ2XN2dq40YW69rWXO08sLF5FQ+kHU+aZgaZ7703tTxGVROH5QsraROPHKyu3TDA==
X-Received: by 2002:a05:6000:2b0e:b0:390:e6d3:1167 with SMTP id ffacd0b85a97d-3911f7d3041mr3190371f8f.50.1741253095082;
        Thu, 06 Mar 2025 01:24:55 -0800 (PST)
Received: from christian-m2.local ([2a02:6b67:d118:f400:558a:d339:d765:49fa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c103f57sm1422747f8f.91.2025.03.06.01.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 01:24:54 -0800 (PST)
Date: Thu, 6 Mar 2025 09:24:53 +0000
From: Christian Simon <simon@swine.de>
To: gregkh@linuxfoundation.org
Cc: jolsa@kernel.org, regressions@lists.linux.dev, simon@swine.de, 
	stable@vger.kernel.org
Subject: [PATCH 6.1.y] uprobes: Fix race in uprobe_free_utask
Message-ID: <n2mkjosxf7bdnrjs4bb3zphj2tzfbssuqlgbq5m6zs3kxjrhki@5z3zuabq2tgg>
References: <2025030550-last-fit-9d20@gregkh>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025030550-last-fit-9d20@gregkh>

commit b583ef82b671c9a752fbe3e95bd4c1c51eab764d upstream.

Christian Simon verified the regression exists in v6.1.129 as per method
below and backported the mainline fix to the older version of
uprobe_free_utask. After that change I can no longer reproduce
the race with this method within 12 hours, while before it would
show the panic in under a minute.

Max Makarov reported kernel panic [1] in perf user callchain code.

The reason for that is the race between uprobe_free_utask and bpf
profiler code doing the perf user stack unwind and is triggered
within uprobe_free_utask function:
  - after current->utask is freed and
  - before current->utask is set to NULL

 general protection fault, probably for non-canonical address 0x9e759c37ee555c76: 0000 [#1] SMP PTI
 RIP: 0010:is_uprobe_at_func_entry+0x28/0x80
 ...
  ? die_addr+0x36/0x90
  ? exc_general_protection+0x217/0x420
  ? asm_exc_general_protection+0x26/0x30
  ? is_uprobe_at_func_entry+0x28/0x80
  perf_callchain_user+0x20a/0x360
  get_perf_callchain+0x147/0x1d0
  bpf_get_stackid+0x60/0x90
  bpf_prog_9aac297fb833e2f5_do_perf_event+0x434/0x53b
  ? __smp_call_single_queue+0xad/0x120
  bpf_overflow_handler+0x75/0x110
  ...
  asm_sysvec_apic_timer_interrupt+0x1a/0x20
 RIP: 0010:__kmem_cache_free+0x1cb/0x350
 ...
  ? uprobe_free_utask+0x62/0x80
  ? acct_collect+0x4c/0x220
  uprobe_free_utask+0x62/0x80
  mm_release+0x12/0xb0
  do_exit+0x26b/0xaa0
  __x64_sys_exit+0x1b/0x20
  do_syscall_64+0x5a/0x80

It can be easily reproduced by running following commands in
separate terminals:

  # while :; do bpftrace -e 'uprobe:/bin/ls:_start  { printf("hit\n"); }' -c ls; done
  # bpftrace -e 'profile:hz:100000 { @[ustack()] = count(); }'

Fixing this by making sure current->utask pointer is set to NULL
before we start to release the utask object.

[1] https://github.com/grafana/pyroscope/issues/3673

Fixes: cfa7f3d2c526 ("perf,x86: avoid missing caller address in stack traces captured in uprobe")
Reported-by: Max Makarov <maxpain@linux.com>
(cherry picked from commit b583ef82b671c9a752fbe3e95bd4c1c51eab764d)
Signed-off-by: Jiri Olsa <jolsa@kernel.org>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Acked-by: Oleg Nesterov <oleg@redhat.com>
Acked-by: Andrii Nakryiko <andrii@kernel.org>
Link: https://lore.kernel.org/r/20250109141440.2692173-1-jolsa@kernel.org
[Christian Simon: Rebased for 6.1.y, due to mainline change https://lore.kernel.org/all/20240929144239.GA9475@redhat.com/]
Signed-off-by: Christian Simon <simon@swine.de>
---
 kernel/events/uprobes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/events/uprobes.c b/kernel/events/uprobes.c
index 9ee25351ceca..e9f9a669f80e 100644
--- a/kernel/events/uprobes.c
+++ b/kernel/events/uprobes.c
@@ -1719,6 +1719,7 @@ void uprobe_free_utask(struct task_struct *t)
 	if (!utask)
 		return;
 
+	t->utask = NULL;
 	if (utask->active_uprobe)
 		put_uprobe(utask->active_uprobe);
 
@@ -1728,7 +1729,6 @@ void uprobe_free_utask(struct task_struct *t)
 
 	xol_free_insn_slot(t);
 	kfree(utask);
-	t->utask = NULL;
 }
 
 /*
-- 
2.47.1

