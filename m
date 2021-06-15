Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08AF172
	for <regressions@lists.linux.dev>; Tue, 15 Jun 2021 11:11:37 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id g8so21921941ejx.1
        for <regressions@lists.linux.dev>; Tue, 15 Jun 2021 04:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=k1SSaOFL103AMAONbChdnTYHUZQvV/y1/SVM/t/fuc4=;
        b=mWBbAmB0J77L2TOkDbqBoNLfNRJy6g+fNM+blXTiF0xY4cgZW1J2rTKLqw26JVKJ8J
         ao6Jil/T5PKryfPJqzklFDqBlOLLCEq3leUVetnhfhjLuP1RZyPk3WSsGrWWFdVkWslK
         2CUiW5IJR72m2ENpUEuc37B7YWR+6oHeqkst7DUjzMxbl3aHyQ0rZuYBrH4M+bnXe0lC
         R28WUqvZ+zWkTFAyKolJsOJd9epVY2852y1AmN7PXypYQSnuIqlqgUhP51r6F+FK1zjn
         UYt/eFKh1aBbt0EKO1dyaJVEV1EsXiIjvyx01AAN3+uY3ZdfZL7qDa45YU/XJDb1s26g
         gxnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=k1SSaOFL103AMAONbChdnTYHUZQvV/y1/SVM/t/fuc4=;
        b=n8XSBCHXaYyaG5zWj//hWq7FHi19rfiAJEz/0YoQ1kHeIa3ki7/aR156h8aMxBJI+q
         Z+4VZgAofzNnUk6DR0ismmKfH7bjOGOhILCXc2QfDPS0EUwN78iFGujnq0UWWw4+UL4O
         t+o3pvinCZvx5aPH0b2F6ENWK5VT6d6R7PXSLMh7JeIRccmxPru0hcypvESD/U0M6Zzg
         uKgL5Zy13W6K1OJ3ta9g8jelaAbRVboHUE9IMcv7xfn2dMIhuUXyXv85SZOW1ZQX6Olk
         Mglb/hfsqGV5iCih8oNI9IW7HqLBDpvkX93V7cnfxsT+jiYMqetJMIGmwAiTxChjPqCT
         M+/Q==
X-Gm-Message-State: AOAM532+v8UewJ/TDaVW/lKOpQe6uxc3OU9QENtiaNwqIoIITbtKTAzr
	Hic5lEHBUG353OtJpqVCpkeOTZ3oyG24gFi0zQpn5g==
X-Google-Smtp-Source: ABdhPJzACpUJFPW4Jg/dbptIEAjHCRIid2wjLyxhMrJQ+DpOlTjF33IgJ9FqqaxZOlKgGWumnKTXH/qJTbO8ftH9cec=
X-Received: by 2002:a17:906:9d05:: with SMTP id fn5mr19815485ejc.133.1623755496317;
 Tue, 15 Jun 2021 04:11:36 -0700 (PDT)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 15 Jun 2021 16:41:25 +0530
Message-ID: <CA+G9fYvvm2tW5QAe9hzPgs7sV8udsoufxs0Qu6N0ZjV0Z686vw@mail.gmail.com>
Subject: [next] [arm64] kernel BUG at arch/arm64/mm/physaddr.c
To: Linux-Next Mailing List <linux-next@vger.kernel.org>, linux-mm <linux-mm@kvack.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, Will Deacon <will@kernel.org>, 
	lkft-triage@lists.linaro.org, regressions@lists.linux.dev
Cc: Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mike Rapoport <rppt@linux.ibm.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"

Following kernel crash reported while boot linux next 20210615 tag on qemu_arm64
with allmodconfig build.

[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd034]
[    0.000000] Linux version 5.13.0-rc6-next-20210615
(tuxmake@ac7978cddede) (aarch64-linux-gnu-gcc (Debian 11.1.0-1)
11.1.0, GNU ld (GNU Binutils for Debian) 2.36.50.20210601) #1 SMP
PREEMPT Tue Jun 15 10:20:51 UTC 2021
[    0.000000] Machine model: linux,dummy-virt
[    0.000000] earlycon: pl11 at MMIO 0x0000000009000000 (options '')
[    0.000000] printk: bootconsole [pl11] enabled
[    0.000000] efi: UEFI not found.
[    0.000000] NUMA: No NUMA configuration found
[    0.000000] NUMA: Faking a node at [mem
0x0000000040000000-0x00000000bfffffff]
[    0.000000] NUMA: NODE_DATA [mem 0xbfc00d40-0xbfc03fff]
[    0.000000] ------------[ cut here ]------------
[    0.000000] kernel BUG at arch/arm64/mm/physaddr.c:27!
[    0.000000] Internal error: Oops - BUG: 0 [#1] PREEMPT SMP
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 PID: 0 Comm: swapper Tainted: G                T
5.13.0-rc6-next-20210615 #1 c150a8161d8ff395c5ae7ee0c3c8f22c3689fae4
[    0.000000] Hardware name: linux,dummy-virt (DT)
[    0.000000] pstate: 404000c5 (nZcv daIF +PAN -UAO -TCO BTYPE=--)
[    0.000000] pc : __phys_addr_symbol+0x44/0xc0
[    0.000000] lr : __phys_addr_symbol+0x44/0xc0
[    0.000000] sp : ffff800014287b00
[    0.000000] x29: ffff800014287b00 x28: fc49a9b89db36f0a x27: ffffffffffffffff
[    0.000000] x26: 0000000000000280 x25: 0000000000000010 x24: ffff8000145a8000
[    0.000000] x23: 0000000008000000 x22: 0000000000000010 x21: 0000000000000000
[    0.000000] x20: ffff800010000000 x19: ffff00007fc00d40 x18: 0000000000000000
[    0.000000] x17: 00000000003ee000 x16: 00000000bfc12000 x15: 0000001000000000
[    0.000000] x14: 000000000000de8c x13: 0000001000000000 x12: 00000000f1f1f1f1
[    0.000000] x11: dfff800000000000 x10: ffff700002850eea x9 : 0000000000000000
[    0.000000] x8 : ffff00007fbe0d40 x7 : 0000000000000000 x6 : 000000000000003f
[    0.000000] x5 : 0000000000000040 x4 : 0000000000000005 x3 : ffff8000142bb0c0
[    0.000000] x2 : 0000000000000000 x1 : 0000000000000000 x0 : 0000000000000000
[    0.000000] Call trace:
[    0.000000]  __phys_addr_symbol+0x44/0xc0
[    0.000000]  sparse_init_nid+0x98/0x6d0
[    0.000000]  sparse_init+0x460/0x4d4
[    0.000000]  bootmem_init+0x110/0x340
[    0.000000]  setup_arch+0x1b8/0x2e0
[    0.000000]  start_kernel+0x110/0x870
[    0.000000]  __primary_switched+0xa8/0xb0
[    0.000000] Code: 940ccf23 eb13029f 54000069 940cce60 (d4210000)
[    0.000000] random: get_random_bytes called from
oops_exit+0x54/0xc0 with crng_init=0
[    0.000000] ---[ end trace 0000000000000000 ]---
[    0.000000] Kernel panic - not syncing: Oops - BUG: Fatal exception
[    0.000000] ---[ end Kernel panic - not syncing: Oops - BUG: Fatal
exception ]---

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>

--
Linaro LKFT
https://lkft.linaro.org
