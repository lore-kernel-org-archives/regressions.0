Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E8C2F49
	for <regressions@lists.linux.dev>; Wed, 27 Apr 2022 17:21:57 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id g9so1946526pgc.10
        for <regressions@lists.linux.dev>; Wed, 27 Apr 2022 10:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FHxo+FxygLFdesh0y+cuWXYH4w/Nvp0opnXX9bAW478=;
        b=FZVwPlonHyWXZhkfy3m+C53CKBr9ei5gXCoa/ZIsHd7H/IWlTbRrfP6AVWC+OM+5Be
         74nOgjXscouE2Y9eWBH6AHlUHbEIxIyoPanQafetZeVEXPLgZm2S2WqOcr8OlDCpvHZa
         B1Rt1LfrDENGLWAmL09aAi9NPkib8oFAMqzmveHLmGA9MDcM8Kl7+KDMA/yPZp8i657O
         IkJvlZ1VrM8bvxJzztWC23lvngAKnT1U6unS9hyzQyFb1x7Wpa60ueSc0KK7pF2X2GjI
         Uv9PsDlcI6p7XmxtU4hapoezJzfGFL/b55+zIgS93kGBgq1riPObLDRKD8OHE4dmNiEQ
         hMng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=FHxo+FxygLFdesh0y+cuWXYH4w/Nvp0opnXX9bAW478=;
        b=Wg/y3kSxpsnPP2ELbvktyRKcY+bedLnPETbP9puSVU3ZuqTXPvItWEURBdrvhpLyz7
         cql+yCq5fzAQm9u9Yz9xDymWEDB5Uq4ZZCzD9ruExRGCwddWPnnFxv03HkDetvY399Mx
         FDXo+UO8pJ7lbJQArM+uOZUeCdUBmFCK+wJrUMv/rIqBI356tPAprl1JLhmbeZxI1ITb
         6DaBFJsVkGi/qo9DuWxFLlyQH1fmzeinX4sJHi0UDkdI13IxHGj7w2Pruw7jiqWcEv+f
         mKAMBtxTvn+eceEqsaGz/C3mzoZ2H7CKVlb4HgDVSxSk37OWDdDR8AAds/g85WvIyd6s
         WPvA==
X-Gm-Message-State: AOAM531ALdR3N8chNNrAPpUpCSTU1J1nPZHEWAr/krxqsZS4BgV0ea++
	N9wgNNnqazv5pHw3z8JL3hg=
X-Google-Smtp-Source: ABdhPJw0XgO/iv4czHtN4DzPOoKpbM/1PXEvF40oShBOL7c7jH5dyBiSFxkZZSKVFZrysUD/Uh+pZA==
X-Received: by 2002:a05:6a00:140a:b0:4e0:54d5:d01 with SMTP id l10-20020a056a00140a00b004e054d50d01mr30860409pfu.20.1651080116471;
        Wed, 27 Apr 2022 10:21:56 -0700 (PDT)
Received: from bbox-1.mtv.corp.google.com ([2620:15c:211:201:546a:2875:2a75:1b94])
        by smtp.gmail.com with ESMTPSA id iy19-20020a17090b16d300b001cd4989fee6sm7620379pjb.50.2022.04.27.10.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 10:21:55 -0700 (PDT)
Sender: Minchan Kim <minchan.kim@gmail.com>
From: Minchan Kim <minchan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Tejun Heo <tj@kernel.org>,
	Jirka Hladky <jhladky@redhat.com>,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	regressions@lists.linux.dev,
	Justin Forbes <jforbes@fedoraproject.org>,
	Minchan Kim <minchan@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH] kernfs: fix NULL dereferencing in kernfs_remove
Date: Wed, 27 Apr 2022 10:21:51 -0700
Message-Id: <20220427172152.3505364-1-minchan@kernel.org>
X-Mailer: git-send-email 2.36.0.rc2.479.g8af0fa9b8e-goog
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kernfs_remove supported NULL kernfs_node param to bail out but revent
per-fs lock change introduced regression that dereferencing the
param without NULL check so kernel goes crash.

This patch checks the NULL kernfs_node in kernfs_remove and if so,
just return.

Quote from bug report by Jirka

```
The bug is triggered by running NAS Parallel benchmark suite on
SuperMicro servers with 2x Xeon(R) Gold 6126 CPU. Here is the error
log:

[  247.035564] BUG: kernel NULL pointer dereference, address: 0000000000000008
[  247.036009] #PF: supervisor read access in kernel mode
[  247.036009] #PF: error_code(0x0000) - not-present page
[  247.036009] PGD 0 P4D 0
[  247.036009] Oops: 0000 [#1] PREEMPT SMP PTI
[  247.058060] CPU: 1 PID: 6546 Comm: umount Not tainted
5.16.0393c3714081a53795bbff0e985d24146def6f57f+ #16
[  247.058060] Hardware name: Supermicro Super Server/X11DDW-L, BIOS
2.0b 03/07/2018
[  247.058060] RIP: 0010:kernfs_remove+0x8/0x50
[  247.058060] Code: 4c 89 e0 5b 5d 41 5c 41 5d 41 5e c3 49 c7 c4 f4
ff ff ff eb b2 66 66 2e 0f 1f 84 00 00 00 00 00 66 90 0f 1f 44 00 00
41 54 55 <48> 8b 47 08 48 89 fd 48 85 c0 48 0f 44 c7 4c 8b 60 50 49 83
c4 60
[  247.058060] RSP: 0018:ffffbbfa48a27e48 EFLAGS: 00010246
[  247.058060] RAX: 0000000000000001 RBX: ffffffff89e31f98 RCX: 0000000080200018
[  247.058060] RDX: 0000000080200019 RSI: fffff6760786c900 RDI: 0000000000000000
[  247.058060] RBP: ffffffff89e31f98 R08: ffff926b61b24d00 R09: 0000000080200018
[  247.122048] R10: ffff926b61b24d00 R11: ffff926a8040c000 R12: ffff927bd09a2000
[  247.122048] R13: ffffffff89e31fa0 R14: dead000000000122 R15: dead000000000100
[  247.122048] FS:  00007f01be0a8c40(0000) GS:ffff926fa8e40000(0000)
knlGS:0000000000000000
[  247.122048] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  247.122048] CR2: 0000000000000008 CR3: 00000001145c6003 CR4: 00000000007706e0
[  247.122048] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[  247.122048] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[  247.122048] PKRU: 55555554
[  247.122048] Call Trace:
[  247.122048]  <TASK>
[  247.122048]  rdt_kill_sb+0x29d/0x350
[  247.122048]  deactivate_locked_super+0x36/0xa0
[  247.122048]  cleanup_mnt+0x131/0x190
[  247.122048]  task_work_run+0x5c/0x90
[  247.122048]  exit_to_user_mode_prepare+0x229/0x230
[  247.122048]  syscall_exit_to_user_mode+0x18/0x40
[  247.122048]  do_syscall_64+0x48/0x90
[  247.122048]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[  247.122048] RIP: 0033:0x7f01be2d735b
```

Cc: stable@vger.kernel.org
Link: https://bugzilla.kernel.org/show_bug.cgi?id=215696
Link: https://lore.kernel.org/lkml/CAE4VaGDZr_4wzRn2___eDYRtmdPaGGJdzu_LCSkJYuY9BEO3cw@mail.gmail.com/
Fixes: 393c3714081a (kernfs: switch global kernfs_rwsem lock to per-fs lock)
Reported-by: Jirka Hladky <jhladky@redhat.com>
Tested-by: Jirka Hladky <jhladky@redhat.com>
Signed-off-by: Minchan Kim <minchan@kernel.org>
---
 fs/kernfs/dir.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/fs/kernfs/dir.c b/fs/kernfs/dir.c
index 61a8edc4ba8b..e205fde7163a 100644
--- a/fs/kernfs/dir.c
+++ b/fs/kernfs/dir.c
@@ -1406,7 +1406,12 @@ static void __kernfs_remove(struct kernfs_node *kn)
  */
 void kernfs_remove(struct kernfs_node *kn)
 {
-	struct kernfs_root *root = kernfs_root(kn);
+	struct kernfs_root *root;
+
+	if (!kn)
+		return;
+
+	root = kernfs_root(kn);
 
 	down_write(&root->kernfs_rwsem);
 	__kernfs_remove(kn);
-- 
2.36.0.rc2.479.g8af0fa9b8e-goog

