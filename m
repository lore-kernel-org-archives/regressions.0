Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C821E487
	for <regressions@lists.linux.dev>; Thu,  6 Mar 2025 13:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741268310; cv=none; b=McP+S1BIhpQB6PqDU95zv7pPtO3M5JrMFpn6lLgaZMfRQey1dZFlQs2bd00FPR0qA35TlA2Bx6zSBawVgtm7wjqlwscN8btGT7/QsPkXtdZ5P5aQzhZ9ylx6DXzBo+Z8QUAqn03MIouj7TOPWZlHBWAnfaRfBVy6IT/RALW5JeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741268310; c=relaxed/simple;
	bh=AkyjFd0Wa3rnyt69pk1A/DpTh1F/3OUgZVLHKgJatbg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q+RNH499W+VQtw2/pt1rc0agnXbN/1cg09/LzoIX9awgBV9HES0PcMtfW06gZjDQD4Va+pDaTMn5Y2vuqs+vemt2OCnpIJVfZE0UZAK6wgKiNMc9KOZ1yNq1CBF9lxKeFkPk5vzNFH9+MIeWwPzh0R/c9ovKdSfcOnyYZ7xWVB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=swine.de; spf=pass smtp.mailfrom=swine.de; dkim=pass (2048-bit key) header.d=swine.de header.i=@swine.de header.b=lezBO79N; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=swine.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=swine.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=swine.de header.i=@swine.de header.b="lezBO79N"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39130ee05b0so71297f8f.3
        for <regressions@lists.linux.dev>; Thu, 06 Mar 2025 05:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=swine.de; s=google; t=1741268307; x=1741873107; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QkwkoKX7190ti5RXhzP8t6ZA5NeYywDJtwchoyuQTmI=;
        b=lezBO79NFJqOucI2mYGkjAvyrJltzJYmI1ks+fXVvKkQDc9OV8m1CEntyOQwhR63FU
         0wTOPw6xNDAJ8jfdTSmKpdMQWzlG9FdiVsGXQVl+b+KO3uqsGwebBx4VjSkOONYdkyRs
         ePSLoVed7ODhRoSOFSxcVY6KXRq2oWyQ5MuEASHlLyGNTDbESiK7+5H83DenygJD6Yab
         UTj+n1OupIe1wktgHE48I01ujxq+eyMkBgYyvKOx31hrD0EIQaJl86Qqvn/4pao3z+dr
         5UP/SD5DoGKyZCqr4XtYrVEn1IXFKB5tNlpA1nPBanxujtUOtp6DRt+soMXOEGn2kML/
         O/wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741268307; x=1741873107;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QkwkoKX7190ti5RXhzP8t6ZA5NeYywDJtwchoyuQTmI=;
        b=xLXZJRfm+00vebZPTAbtcVeBURrdemxdDOmhxgwo5M2qkxDDLObHC8QwH48EYNljdi
         DvpA33pss8hpXSu6WZ2US+PosYrI/HoeW4AKXkISGNskqR3ER6XBlyH6lCEi3SDj4jZw
         HrFMO+eJ56BzzhQ+K0BSDcCUxV9h4F5EE/1e9iGa4lahs7tZQi0SVLlncQD5daUGUXmB
         4Q3Wfgo52xl32qMTO68JOQbNaTvBLx/Linc0z4guH9gSCfoOUzzh5E5yDwb0+EEvBMpo
         VSBA9Lfz1YjWyZ1kN/gY61JiqabhyZdgf/3GdiqJVq9TCLnKMw/e4P8/PpKApfuneap3
         C5ug==
X-Forwarded-Encrypted: i=1; AJvYcCXmgzlFz3Kk/Tnyagi7j4GtgwESZe845p5X2UROTPQ0q1L/i+S/yXWf+4xiwsHlMaDhWkqP8zF2NGnKPQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzjrpc37OyM7q305/tIYOzZUPYxMx9SqTxFWtQDP9exnKvRwTBb
	kEP7EcQd9cAZeW8dJKh7IDVfiydn7Oo0XbWlYka6wWPsqxpbudY+ggNslnWKT8t2/m3l1mGFmHl
	gKZDiXQ==
X-Gm-Gg: ASbGncvaVpGwWQfuWAmDXQVHzVbcWadV3G4cgHA15o5aYMV9JelAqCIMLS03hGXZ6j0
	DgJnt4TIq2gBXblbRHVkrxRuFvasdJrdzzyAtxNVQRBs/z9VFeZrdGHehrWh2SjAq1tCpK8NYiD
	TT0Cm8xUkYPR/PbLduVUKYoMrDG+gCUgHU80SNPPsxX98HzlEcHKO6fArbBNzdwRotW5MbxEJaZ
	KQu06mauTNwIIXRY4clra6pFQk4V2deYfRb0aRVW6ri/YEzl3msdy5Gj2+OYmjK88AqlVz1oMEl
	ZJJNqjZXuLC8IlwCUtKTb2mwZ+aBrildlGi0JAkAIQaCNE9mEjX+5QT/CzsovEJWlxow
X-Google-Smtp-Source: AGHT+IHRDT+UAaQw7oFEmzS+GWI1qFFPciKHABU9S0C7Q6REV7AakAMtPtN2rr+7AySWXlX37u+nUQ==
X-Received: by 2002:a05:6000:154d:b0:390:fe4b:70b9 with SMTP id ffacd0b85a97d-3911f72fc6cmr6896614f8f.21.1741268306938;
        Thu, 06 Mar 2025 05:38:26 -0800 (PST)
Received: from christian-m2.local ([2a02:6b67:d118:f400:558a:d339:d765:49fa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfb7ae4sm2038715f8f.5.2025.03.06.05.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 05:38:26 -0800 (PST)
Date: Thu, 6 Mar 2025 13:38:25 +0000
From: Christian Simon <simon@swine.de>
To: gregkh@linuxfoundation.org
Cc: jolsa@kernel.org, regressions@lists.linux.dev, simon@swine.de, 
	stable@vger.kernel.org
Subject: [PATCH 6.12.y] uprobes: Fix race in uprobe_free_utask
Message-ID: <u27rnbdpxnayssubw557qxf2rrf6p22cmwkg43skziesvpj7bq@ig5nmblcelrr>
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

Christian Simon verified the regression exists in v6.12.17 as per method
below and backported the mainline fix to the older version of
uprobe_free_utask. After that change I can no longer reproduce
the race with this method within 1h, while before it would show the
panic under a minute.

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
[Christian Simon: Rebased for 6.12.y, due to mainline change https://lore.kernel.org/all/20240929144239.GA9475@redhat.com/]
Signed-off-by: Christian Simon <simon@swine.de>
---
 kernel/events/uprobes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/events/uprobes.c b/kernel/events/uprobes.c
index 4b52cb2ae6d6..fcb777ba17df 100644
--- a/kernel/events/uprobes.c
+++ b/kernel/events/uprobes.c
@@ -1770,6 +1770,7 @@ void uprobe_free_utask(struct task_struct *t)
 	if (!utask)
 		return;
 
+	t->utask = NULL;
 	if (utask->active_uprobe)
 		put_uprobe(utask->active_uprobe);
 
@@ -1779,7 +1780,6 @@ void uprobe_free_utask(struct task_struct *t)
 
 	xol_free_insn_slot(t);
 	kfree(utask);
-	t->utask = NULL;
 }
 
 /*
-- 
2.47.1

