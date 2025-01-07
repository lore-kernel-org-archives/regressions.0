Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BD41F190E
	for <regressions@lists.linux.dev>; Tue,  7 Jan 2025 15:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736264149; cv=none; b=gVw3mfKJYXe+ldhl42KMEAieBI3URfpNjhXP06lP2aFc834qTkUUy6Z0pzd+ZQsrC0KEjnxj4SUlCDYtIMql8q2FMIiy8pEogFEEWh+DEF5OImFaJ/8tFLJTm9JVQRPJTKQX+kKzLPECzR2TM2eYhcR82uBVpTkV4Es0WLG4Oek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736264149; c=relaxed/simple;
	bh=8m+4KRHGoTieA8CvCwunlUTmUJfNG8C6GYQjAJmMtP8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mh6355B5lz4TCebkkLXkX/UMhzWd+QHsPKZ7Ah9QCYWHfyk5/0qkm1HTll8v6tzEr2acGG2AsmewZX9ILrj/slnegEaxo7olk2X68VqTSmqo7OCcLdaDiAEmsa/EKP4k0x88Ucw0UVLw05iw4rbnFQc7zsE6HmycJKdu2kyO34c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=IX6BbY6x; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="IX6BbY6x"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4361f664af5so177735045e9.1
        for <regressions@lists.linux.dev>; Tue, 07 Jan 2025 07:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736264144; x=1736868944; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XZbzK7gNJ8VfH7wLPW3weuF06YbkZOBy++EFlcgPDK4=;
        b=IX6BbY6xg464ugNdflg0KYedGD5PZFJrImTIeiIlcRL0ycs2VEKCKirl0fYjMLCcvi
         fAFhXSmchnsQelFMdVz1xrDwg7MMxaTAhZfS9ydlN7IgQ1RZbDQoewfmJIiyYRMRrjxM
         JX5KtETL1ybFAUOOKsKfkXjBegr28r39DZWnX8ElN6HYY98J62gNNxyMiaNwTFDirZCC
         cqE/MajP+lDVsIIG/q3g5EjOtLydwHb+VMeTSHk45AV5gH8X5RdK/vmsQWhbDN74jaNn
         Z3iXSUlfrn69EN/m1S2a+eQqHpPNqr+r1NJyFD+NJm/toNjdvSe7fwI0ai9DRwXfK3UL
         ioIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736264144; x=1736868944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XZbzK7gNJ8VfH7wLPW3weuF06YbkZOBy++EFlcgPDK4=;
        b=LmHKUjM343Se5Ga+m6CWWJxBR/czlEygXpezsXhR2MLyY3q2LBg5CxHWpE/tGNKCMr
         5k1k2Z4fJJTXG3H/1iz31gLukyfykChoYv6TQiCi9FHR8ffbUD9/lbY/D8aLwLrxW9a2
         QUBfbIR7l8S+4DyY+tak/nSa/e4hUwOmaZ0ZU2vXgcAPYoC8LSku0CaKMEDLkFyS6v74
         aafwWUbH7BNEy3SUSoQaczU2FQxCxaEU3K6BieshlA9yNR96RUBgtkKUYu2EHr15Xr2Q
         CcHCW9Lg2Ig8tZgDYqsrXL+dTDxhqy44xEcSRFwSAw9SNRgKTJvi6RgfQB49Gxb3s4FG
         vyNw==
X-Forwarded-Encrypted: i=1; AJvYcCV57PnyrQVDcCjJSvfBlKOLLxdBmuqBEFywHJhnWbq/iT7wnjZslkMbQxz4DB4QpfhnUviBALHQdHrK5w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/lg3dYdzSUjEwxNJS2YK8DK8JjvgdrAS+SxoxJqPVF4R8O4/i
	sseCVqUJUSU0EYb31pX33QlSFrybBUO/jAQW+7FzGZdYjbYm6HwTEkkXkhkFxTo=
X-Gm-Gg: ASbGnculWEvYvd1u4DRxsECBrIJYorVlyRfttRSmOu4r2DM3kMGpquYlkxI2YCsLqYj
	II+DpRZFjgbqo13nMYyrzcVnku8TFJvYAKX7m4pJzbBNihGCQLC+ofhscYsUlreAao6mtA0+ZnT
	xPPk7h5KdDDCLxyourTIExbU4GKU02h5TNoeopiPTsEpf2U6QQdsnx6oGLtWzpEUcFt84yGHdm1
	vMtbArfTCoBx7Ciyt3X/xzskPh4nrHy+3dj6Uv3Ay8hMgxI9siYGu2+qSWB
X-Google-Smtp-Source: AGHT+IHT+uGKdYWP32nNdYuxCzKEUEtl7jwYI4PJVc6e7CGReWgq+hVxrrrOXvulnKWZaYLl+U73CA==
X-Received: by 2002:a05:600c:4f84:b0:434:f7ea:fb44 with SMTP id 5b1f17b1804b1-43668644255mr533777585e9.14.1736264144046;
        Tue, 07 Jan 2025 07:35:44 -0800 (PST)
Received: from dhcp161.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c833149sm50170082f8f.39.2025.01.07.07.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 07:35:43 -0800 (PST)
From: Petr Pavlu <petr.pavlu@suse.com>
To: petr.pavlu@suse.com,
	rppt@kernel.org,
	akpm@linux-foundation.org
Cc: mmaslanka@google.com,
	mcgrof@kernel.org,
	regressions@lists.linux.dev,
	linux-modules@vger.kernel.org,
	linux-mm@kvack.org,
	live-patching@vger.kernel.org,
	joe.lawrence@redhat.com,
	jpoimboe@kernel.org,
	pmladek@suse.com
Subject: [PATCH] module: Fix writing of livepatch relocations in ROX text
Date: Tue,  7 Jan 2025 16:34:57 +0100
Message-ID: <20250107153507.14733-1-petr.pavlu@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <0530eee7-f329-4786-bea3-c9c66d5f0bed@suse.com>
References: <0530eee7-f329-4786-bea3-c9c66d5f0bed@suse.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A livepatch module can contain a special relocation section
.klp.rela.<objname>.<secname> to apply its relocations at the appropriate
time and to additionally access local and unexported symbols. When
<objname> points to another module, such relocations are processed
separately from the regular module relocation process. For instance, only
when the target <objname> actually becomes loaded.

With CONFIG_STRICT_MODULE_RWX, when the livepatch core decides to apply
these relocations, their processing results in the following bug:

[   25.827238] BUG: unable to handle page fault for address: 00000000000012ba
[   25.827819] #PF: supervisor read access in kernel mode
[   25.828153] #PF: error_code(0x0000) - not-present page
[   25.828588] PGD 0 P4D 0
[   25.829063] Oops: Oops: 0000 [#1] PREEMPT SMP NOPTI
[   25.829742] CPU: 2 UID: 0 PID: 452 Comm: insmod Tainted: G O  K    6.13.0-rc4-00078-g059dd502b263 #7820
[   25.830417] Tainted: [O]=OOT_MODULE, [K]=LIVEPATCH
[   25.830768] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.0-20220807_005459-localhost 04/01/2014
[   25.831651] RIP: 0010:memcmp+0x24/0x60
[   25.832190] Code: [...]
[   25.833378] RSP: 0018:ffffa40b403a3ae8 EFLAGS: 00000246
[   25.833637] RAX: 0000000000000000 RBX: ffff93bc81d8e700 RCX: ffffffffc0202000
[   25.834072] RDX: 0000000000000000 RSI: 0000000000000004 RDI: 00000000000012ba
[   25.834548] RBP: ffffa40b403a3b68 R08: ffffa40b403a3b30 R09: 0000004a00000002
[   25.835088] R10: ffffffffffffd222 R11: f000000000000000 R12: 0000000000000000
[   25.835666] R13: ffffffffc02032ba R14: ffffffffc007d1e0 R15: 0000000000000004
[   25.836139] FS:  00007fecef8c3080(0000) GS:ffff93bc8f900000(0000) knlGS:0000000000000000
[   25.836519] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   25.836977] CR2: 00000000000012ba CR3: 0000000002f24000 CR4: 00000000000006f0
[   25.837442] Call Trace:
[   25.838297]  <TASK>
[   25.841083]  __write_relocate_add.constprop.0+0xc7/0x2b0
[   25.841701]  apply_relocate_add+0x75/0xa0
[   25.841973]  klp_write_section_relocs+0x10e/0x140
[   25.842304]  klp_write_object_relocs+0x70/0xa0
[   25.842682]  klp_init_object_loaded+0x21/0xf0
[   25.842972]  klp_enable_patch+0x43d/0x900
[   25.843572]  do_one_initcall+0x4c/0x220
[   25.844186]  do_init_module+0x6a/0x260
[   25.844423]  init_module_from_file+0x9c/0xe0
[   25.844702]  idempotent_init_module+0x172/0x270
[   25.845008]  __x64_sys_finit_module+0x69/0xc0
[   25.845253]  do_syscall_64+0x9e/0x1a0
[   25.845498]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   25.846056] RIP: 0033:0x7fecef9eb25d
[   25.846444] Code: [...]
[   25.847563] RSP: 002b:00007ffd0c5d6de8 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
[   25.848082] RAX: ffffffffffffffda RBX: 000055b03f05e470 RCX: 00007fecef9eb25d
[   25.848456] RDX: 0000000000000000 RSI: 000055b001e74e52 RDI: 0000000000000003
[   25.848969] RBP: 00007ffd0c5d6ea0 R08: 0000000000000040 R09: 0000000000004100
[   25.849411] R10: 00007fecefac7b20 R11: 0000000000000246 R12: 000055b001e74e52
[   25.849905] R13: 0000000000000000 R14: 000055b03f05e440 R15: 0000000000000000
[   25.850336]  </TASK>
[   25.850553] Modules linked in: deku(OK+) uinput
[   25.851408] CR2: 00000000000012ba
[   25.852085] ---[ end trace 0000000000000000 ]---

The problem is that the .klp.rela.<objname>.<secname> relocations are
processed after the module was already formed and mod->rw_copy was reset.
However, the code in __write_relocate_add() calls module_writable_address()
which translates the target address 'loc' still to
'loc + (mem->rw_copy - mem->base)', with mem->rw_copy now being 0.

Fix the problem by returning directly 'loc' in module_writable_address()
when the module is already formed. Function __write_relocate_add() knows to
use text_poke() in such a case.

Fixes: 0c133b1e78cd ("module: prepare to handle ROX allocations for text")
Reported-by: Marek Maslanka <mmaslanka@google.com>
Closes: https://lore.kernel.org/linux-modules/CAGcaFA2hdThQV6mjD_1_U+GNHThv84+MQvMWLgEuX+LVbAyDxg@mail.gmail.com/
Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
---
 include/linux/module.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/module.h b/include/linux/module.h
index 94acbacdcdf1..b3a643435357 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -773,7 +773,8 @@ void *__module_writable_address(struct module *mod, void *loc);
 
 static inline void *module_writable_address(struct module *mod, void *loc)
 {
-	if (!IS_ENABLED(CONFIG_ARCH_HAS_EXECMEM_ROX) || !mod)
+	if (!IS_ENABLED(CONFIG_ARCH_HAS_EXECMEM_ROX) || !mod ||
+	    mod->state != MODULE_STATE_UNFORMED)
 		return loc;
 	return __module_writable_address(mod, loc);
 }

base-commit: 9d89551994a430b50c4fffcb1e617a057fa76e20
-- 
2.43.0

