Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.74.137.57
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795766604;
	b=LbXeb6R95lUR8LaNJRIU7XNa5/yUuZqgBDYGgwap3Y3cLVnrOE57DO20MPCF+VjOqbKA
	 Sck7O4bC8YPdvacO0L5/fLmJlqvshMrfBVFKW6iNeZRPknGtiXN3Fk9HCwSMMvInu/tPV
	 407DS68Cia63VlIsFMCUNf0iCcN3di5YY5HqF44cJj/MdtJ1J25ZuPvEBAtvCEtv/Fb1d
	 P/mbiwmUB8HO0M09Xt+wZRnp3k4PBEQNOLBQKQpXOJ5HTVGOovQTspEqZT3Gcy6GylAF4
	 sSk6lcxWn7OBGUVT8kAX8U/eS15mtp9xzArzk4kC42UbT0ioJXn9+MIF/YAa3D5gt8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795766604;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5dfvrdn0RY2aP5w53WCcOXQbdNsGRm3Cv9nftIE2kEk=;
	b=M40yMWSvvY41qTIiNJ7OUoRfs8QY76bFLjX9HVdsGfqb1W/dXx3CJ5Q3Zn9H1A1wmr5c
	 WPVufh8Oihpzl+X8u7TAZz77j239ywBBxQQB94lWgrFD8ZxelRdsme9ffrzkIeAmlyd/5
	 RYK/dA7iQaOXympoTMYvNR0gzBTxASIBBPbSWVJBt7+VV+mGKL4U6s3G28aY+G8BA9nGT
	 aBqXlcTT2mIYTlIOzpwqVpdNqbMoFJBjVNQO0Qa7THF/MtCAYk2qN9vJgCaCLGfNEqtwJ
	 UTcz5+Bk3ZtbSvrKO/Jjd4uolCwZ9na6Srm8mTpdpR5Fv89HYOKXqEqqsl8h5Rj5Qqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=atmark-techno.com;
	spf=pass smtp.mailfrom=atmark-techno.com;
	dkim=pass header.d=atmark-techno.com header.i=@atmark-techno.com header.a=rsa-sha256 header.s=gw2_bookworm header.b=M4HNmCfE;
	dkim=pass header.d=atmark-techno.com header.i=@atmark-techno.com header.a=rsa-sha256 header.s=google header.b=WYlE65wg;
	arc=none smtp.remote-ip=35.74.137.57
Received: from gw2.atmark-techno.com (gw2.atmark-techno.com [35.74.137.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20A6606A32C
	for <regressions@lists.linux.dev>; Fri, 27 Nov 2026 08:03:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F20A6606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=atmark-techno.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atmark-techno.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atmark-techno.com header.i=@atmark-techno.com header.a=rsa-sha256 header.s=gw2_bookworm header.b=M4HNmCfE;
	dkim=pass (2048-bit key) header.d=atmark-techno.com header.i=@atmark-techno.com header.a=rsa-sha256 header.s=google header.b=WYlE65wg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=atmark-techno.com;
	s=gw2_bookworm; t=1795766596;
	bh=p+mk4ic3OMpBAWhPeu6G3f55QUaPcT1Skw0U+95V12o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M4HNmCfErzaua2rsF6Xk5pSfQ1qdF4EMzwCAS4ErOIYTFNU67rSJSHCTng9c74qcT
	 jJhfQ5hFoYn846t8h0ZCrfvI2+VVEb4ceVQu2e7BH4ays5+R8Yw2VdLWLaLSBw0QEc
	 hl70OIPeNWzzL4TA8KemflFxEN9an9PM+JuzRX4FIlbEPUKkie1SmOtYU2rrYOi1Qe
	 O0NCft7GuVBK2avAPOqyj0AFzu1xUWBgXK1vc307xmf6axwBuhyGZpiYTAl1jsXdO8
	 IVgTqUYYaqubY/LaMydDnTiMe1hPXJVpqwQLIP2kH5K7yVGAtllWb9IJx5hJ29TVMz
	 pyTkpfQhru3aA==
Received: from gw2.atmark-techno.com (localhost [127.0.0.1])
	by gw2.atmark-techno.com (Postfix) with ESMTP id 09FCA250
	for <regressions@lists.linux.dev>; Fri, 27 Nov 2026 17:03:16 +0900 (JST)
Authentication-Results: gw2.atmark-techno.com;
	dkim=pass (2048-bit key; unprotected) header.d=atmark-techno.com header.i=@atmark-techno.com header.a=rsa-sha256 header.s=google header.b=WYlE65wg;
	dkim-atps=neutral
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by gw2.atmark-techno.com (Postfix) with ESMTPS id C6C8525E
	for <regressions@lists.linux.dev>; Fri, 27 Nov 2026 17:03:14 +0900 (JST)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b56c696405so11914463c88.1
        for <regressions@lists.linux.dev>; Fri, 27 Nov 2026 00:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atmark-techno.com; s=google; t=1795766593; x=1796371393; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5dfvrdn0RY2aP5w53WCcOXQbdNsGRm3Cv9nftIE2kEk=;
        b=WYlE65wgGUKp4Itd5Ywef0fbmc0FhySqsOzikRUCmukBLyiAxHUf4R/vrl4C+9A6QD
         nmd7mv0Gvnt9Jcy03CtuB8Ivn0U8Qb6aINw7Qwfz2O286oK5zydjVlCXLpYAYmK1h41m
         D9XJuHm++LY/NCl4ixTkK3DK4sUnCAql/pf1c6/bN4g+PBz7cxRtxqfRYHRd+0UAg8jQ
         57fvo9KXA4xn4aiyI0llM7eBf1N+yqIL9JfIwYzaLTtN5bMkSYpmGQiicJvz31oemGMR
         ThaC9UXUNsrLzPGUiR78RR0pD9vioSQLVZmWL/dpeFAZinC0v8PIXEhwvI/rV7m2urHx
         bONg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795766593; x=1796371393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5dfvrdn0RY2aP5w53WCcOXQbdNsGRm3Cv9nftIE2kEk=;
        b=ZUnJ9xyAc7RxVMZ0ES3YhN0FmgKTh7h+BoB28hndQFp0+t9Ka0C5EGrDH1aGboQiKb
         bLb7SqfYBvcaK/8CaZggu4RBs5QPE5TNzNWRpxV1X3UXzI1JVLNmAzdo3J6O4UwQ7BF+
         Fvl4bXaC+G/BrW3Ij3Km7rTHCt+RXIf9+0N5xszn/dnb8f1MEwLfOWxDKt82x6K9jqwf
         1nmWtMuXCk8UstJ7h8qgmUFpoQkgHFgQM9Q47avFOcBcDMXQQYq8xdfqjU/lbGExJxWQ
         eVf4nHT0Ro1dXvMRcXUVStLatJRxclYF/hVAe1bUFkx8ETSGKLnyA8v4UYrLTMMZ2QdQ
         eVmA==
X-Forwarded-Encrypted: i=1; AL+hErHvLFMWjn9Zy49DiE+1F+jPZY45ftctjW2UwJMHAAwNCsxNbEeeehbDd1vUynXFXfgywUfjLN7mqQbWBw==@lists.linux.dev
X-Gm-Message-State: APuU4Z+AWImNTBk4vKH30GUOy6e9cfcIXz2cZqqPeGGouzWDubRzL+xg
	KHY9pJ4Kh6vzfMFRjcVwUHC+dzdeOXVhJatapSqmmwXpV+i8C62iML7Z2EzSDQGg9AuDwBFWVoN
	RbLM6oVX0ch9wEUZkkr9NIG3IDI3sMiUKA/vlKbNuXP7P8FsnAcgaZhH6/099o+5o7w==
X-Gm-Gg: AZFdTZdwRQBPcQoTiLVoQJjRUhEelzvP9ZpEUEKvcN3G0sWMVItYOHXLIuPfYIkYBOV
	dyNUjvL+mLEMUm6gs7vnG/G/NRCgz/ruIjKe01qd8yRxw2NyMD0ixywlENHyP9ElNFwq/C3kVQ4
	GtQn5ejcYh+UIwU5JQqqsDYpFwVDGEv0If3R7qnBY6aig9kmgqF8zuRXCFs+DqDKQ9iZ7WOSRX3
	+5GRASHEuWzy2oL8wDacDxqXfdcELykCRnumpXr5xCA7xFtDNtpa+528VCgWkssEP89gUjWqnfm
	Mryr30h9VB8NmKg3jUClS491RqkqmeuZa1Pg14ZYw0VtLd37QT7uLblAIjYMHqXhqiYXjjwdiOL
	rUAP0+tK6y0Dgcndtlh+L7/MbOd1kqf0/ABHeNmExyIIHHqROHXbxIdI8dfDWugAi3k6QqI+iwW
	y6Np6gXC2HsFkHa+A/ND3I
X-Received: by 2002:a05:7022:1587:b0:1b2:6d5b:36bc with SMTP id a92af1059eb24-1b5568efd35mr26934112c88.23.1795766593257;
        Fri, 27 Nov 2026 00:03:13 -0800 (PST)
X-Received: by 2002:a05:7022:1587:b0:1b2:6d5b:36bc with SMTP id a92af1059eb24-1b5568efd35mr26934061c88.23.1795766592487;
        Fri, 27 Nov 2026 00:03:12 -0800 (PST)
Received: from localhost (sodcd-04p2-40.ppp11.odn.ad.jp. [203.139.65.40])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1b5567ff27bsm62545061c88.6.2026.11.27.00.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 00:03:12 -0800 (PST)
From: Dominique Martinet <dominique.martinet@atmark-techno.com>
To: stable@vger.kernel.org
Cc: luiz.von.dentz@intel.com,
	eadavis@qq.com,
	sashal@kernel.org,
	marcel@holtmann.org,
	linux-bluetooth@vger.kernel.org,
	syzbot+10bd8fe6741eedd2be2e@syzkaller.appspotmail.com,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Dominique Martinet <dominique.martinet@atmark-techno.com>,
	Salvatore Bonaccorso <carnil@debian.org>,
	regressions@lists.linux.dev
Subject: [PATCH 6.1] Bluetooth: L2CAP: Fix corrupted list in hci_chan_del
Date: Fri, 27 Nov 2026 17:03:07 +0900
Message-ID: <20261127080307.3214776-1-dominique.martinet@atmark-techno.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <179567271700.947722.15185762256491350563@eldamar.lan>
References: <179567271700.947722.15185762256491350563@eldamar.lan>
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

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

This fixes the following trace by reworking the locking of l2cap_conn
so instead of only locking when changing the chan_l list this promotes
chan_lock to a general lock of l2cap_conn so whenever it is being held
it would prevents the likes of l2cap_conn_del to run:

list_del corruption, ffff888021297e00->prev is LIST_POISON2 (dead000000000122)
------------[ cut here ]------------
kernel BUG at lib/list_debug.c:61!
Oops: invalid opcode: 0000 [#1] PREEMPT SMP KASAN PTI
CPU: 1 UID: 0 PID: 5896 Comm: syz-executor213 Not tainted 6.14.0-rc1-next-20250204-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 12/27/2024
RIP: 0010:__list_del_entry_valid_or_report+0x12c/0x190 lib/list_debug.c:59
Code: 8c 4c 89 fe 48 89 da e8 32 8c 37 fc 90 0f 0b 48 89 df e8 27 9f 14 fd 48 c7 c7 a0 c0 60 8c 4c 89 fe 48 89 da e8 15 8c 37 fc 90 <0f> 0b 4c 89 e7 e8 0a 9f 14 fd 42 80 3c 2b 00 74 08 4c 89 e7 e8 cb
RSP: 0018:ffffc90003f6f998 EFLAGS: 00010246
RAX: 000000000000004e RBX: dead000000000122 RCX: 01454d423f7fbf00
RDX: 0000000000000000 RSI: 0000000080000000 RDI: 0000000000000000
RBP: dffffc0000000000 R08: ffffffff819f077c R09: 1ffff920007eded0
R10: dffffc0000000000 R11: fffff520007eded1 R12: dead000000000122
R13: dffffc0000000000 R14: ffff8880352248d8 R15: ffff888021297e00
FS:  00007f7ace6686c0(0000) GS:ffff8880b8700000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f7aceeeb1d0 CR3: 000000003527c000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 __list_del_entry_valid include/linux/list.h:124 [inline]
 __list_del_entry include/linux/list.h:215 [inline]
 list_del_rcu include/linux/rculist.h:168 [inline]
 hci_chan_del+0x70/0x1b0 net/bluetooth/hci_conn.c:2858
 l2cap_conn_free net/bluetooth/l2cap_core.c:1816 [inline]
 kref_put include/linux/kref.h:65 [inline]
 l2cap_conn_put+0x70/0xe0 net/bluetooth/l2cap_core.c:1830
 l2cap_sock_shutdown+0xa8a/0x1020 net/bluetooth/l2cap_sock.c:1377
 l2cap_sock_release+0x79/0x1d0 net/bluetooth/l2cap_sock.c:1416
 __sock_release net/socket.c:642 [inline]
 sock_close+0xbc/0x240 net/socket.c:1393
 __fput+0x3e9/0x9f0 fs/file_table.c:448
 task_work_run+0x24f/0x310 kernel/task_work.c:227
 ptrace_notify+0x2d2/0x380 kernel/signal.c:2522
 ptrace_report_syscall include/linux/ptrace.h:415 [inline]
 ptrace_report_syscall_exit include/linux/ptrace.h:477 [inline]
 syscall_exit_work+0xc7/0x1d0 kernel/entry/common.c:173
 syscall_exit_to_user_mode_prepare kernel/entry/common.c:200 [inline]
 __syscall_exit_to_user_mode_work kernel/entry/common.c:205 [inline]
 syscall_exit_to_user_mode+0x24a/0x340 kernel/entry/common.c:218
 do_syscall_64+0x100/0x230 arch/x86/entry/common.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f7aceeaf449
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 41 19 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f7ace668218 EFLAGS: 00000246 ORIG_RAX: 000000000000002a
RAX: fffffffffffffffc RBX: 00007f7acef39328 RCX: 00007f7aceeaf449
RDX: 000000000000000e RSI: 0000000020000100 RDI: 0000000000000004
RBP: 00007f7acef39320 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000003
R13: 0000000000000004 R14: 00007f7ace668670 R15: 000000000000000b
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:__list_del_entry_valid_or_report+0x12c/0x190 lib/list_debug.c:59
Code: 8c 4c 89 fe 48 89 da e8 32 8c 37 fc 90 0f 0b 48 89 df e8 27 9f 14 fd 48 c7 c7 a0 c0 60 8c 4c 89 fe 48 89 da e8 15 8c 37 fc 90 <0f> 0b 4c 89 e7 e8 0a 9f 14 fd 42 80 3c 2b 00 74 08 4c 89 e7 e8 cb
RSP: 0018:ffffc90003f6f998 EFLAGS: 00010246
RAX: 000000000000004e RBX: dead000000000122 RCX: 01454d423f7fbf00
RDX: 0000000000000000 RSI: 0000000080000000 RDI: 0000000000000000
RBP: dffffc0000000000 R08: ffffffff819f077c R09: 1ffff920007eded0
R10: dffffc0000000000 R11: fffff520007eded1 R12: dead000000000122
R13: dffffc0000000000 R14: ffff8880352248d8 R15: ffff888021297e00
FS:  00007f7ace6686c0(0000) GS:ffff8880b8600000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f7acef05b08 CR3: 000000003527c000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400

Reported-by: syzbot+10bd8fe6741eedd2be2e@syzkaller.appspotmail.com
Tested-by: syzbot+10bd8fe6741eedd2be2e@syzkaller.appspotmail.com
Fixes: b4f82f9ed43a ("Bluetooth: L2CAP: Fix slab-use-after-free Read in l2cap_send_cmd")
Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
(cherry picked from commit ab4eedb790cae44313759b50fe47da285e2519d5)
[Dominique: fix conflicts in l2cap_core.c due to various other backports
that had been done earlier...]
Signed-off-by: Dominique Martinet <dominique.martinet@atmark-techno.com>
---
Cc: Salvatore Bonaccorso <carnil@debian.org>
Cc: regressions@lists.linux.dev

Hi Salvatore,

I think that should work; I can't test this (but build seems to pass at
least).

There were a bunch of conflicts (I only had noticed the first one in my
earlier mail), mostly due to other security backports that had been done
in another order, but I guess that's life.
I picked what made sense in the 3-way diff and what looked closest to
upstream when multiple orders were possible (e.g. added cancel work vs
lock calls), I'm pretty confident I didn't mess it up checking the
range-diff, but if someone who knows more about bluetooth could have a
look it wouldn't hurt.

Good luck(?)


 include/net/bluetooth/l2cap.h |   3 +-
 net/bluetooth/l2cap_core.c    | 135 ++++++++++++----------------------
 net/bluetooth/l2cap_sock.c    |  15 ++--
 3 files changed, 56 insertions(+), 97 deletions(-)

diff --git a/include/net/bluetooth/l2cap.h b/include/net/bluetooth/l2cap.h
index b317c89935e9..ba94ea2f9476 100644
--- a/include/net/bluetooth/l2cap.h
+++ b/include/net/bluetooth/l2cap.h
@@ -666,7 +666,7 @@ struct l2cap_conn {
 	struct l2cap_chan	*smp;
 
 	struct list_head	chan_l;
-	struct mutex		chan_lock;
+	struct mutex		lock;
 	struct kref		ref;
 	struct list_head	users;
 };
@@ -979,6 +979,7 @@ void l2cap_logical_cfm(struct l2cap_chan *chan, struct hci_chan *hchan,
 void __l2cap_physical_cfm(struct l2cap_chan *chan, int result);
 
 struct l2cap_conn *l2cap_conn_get(struct l2cap_conn *conn);
+struct l2cap_conn *l2cap_conn_hold_unless_zero(struct l2cap_conn *conn);
 void l2cap_conn_put(struct l2cap_conn *conn);
 struct l2cap_conn *l2cap_conn_hold_unless_zero(struct l2cap_conn *conn);
 
diff --git a/net/bluetooth/l2cap_core.c b/net/bluetooth/l2cap_core.c
index d7bb1193132f..07ffdb8e710b 100644
--- a/net/bluetooth/l2cap_core.c
+++ b/net/bluetooth/l2cap_core.c
@@ -119,7 +119,6 @@ static struct l2cap_chan *l2cap_get_chan_by_scid(struct l2cap_conn *conn,
 {
 	struct l2cap_chan *c;
 
-	mutex_lock(&conn->chan_lock);
 	c = __l2cap_get_chan_by_scid(conn, cid);
 	if (c) {
 		/* Only lock if chan reference is not 0 */
@@ -127,7 +126,6 @@ static struct l2cap_chan *l2cap_get_chan_by_scid(struct l2cap_conn *conn,
 		if (c)
 			l2cap_chan_lock(c);
 	}
-	mutex_unlock(&conn->chan_lock);
 
 	return c;
 }
@@ -140,7 +138,6 @@ static struct l2cap_chan *l2cap_get_chan_by_dcid(struct l2cap_conn *conn,
 {
 	struct l2cap_chan *c;
 
-	mutex_lock(&conn->chan_lock);
 	c = __l2cap_get_chan_by_dcid(conn, cid);
 	if (c) {
 		/* Only lock if chan reference is not 0 */
@@ -148,7 +145,6 @@ static struct l2cap_chan *l2cap_get_chan_by_dcid(struct l2cap_conn *conn,
 		if (c)
 			l2cap_chan_lock(c);
 	}
-	mutex_unlock(&conn->chan_lock);
 
 	return c;
 }
@@ -446,7 +442,7 @@ static void l2cap_chan_timeout(struct work_struct *work)
 		return;
 	}
 
-	mutex_lock(&conn->chan_lock);
+	mutex_lock(&conn->lock);
 	/* __set_chan_timer() calls l2cap_chan_hold(chan) while scheduling
 	 * this work. No need to call l2cap_chan_hold(chan) here again.
 	 */
@@ -469,8 +465,7 @@ static void l2cap_chan_timeout(struct work_struct *work)
 
 unlock:
 	l2cap_chan_unlock(chan);
-
-	mutex_unlock(&conn->chan_lock);
+	mutex_unlock(&conn->lock);
 	l2cap_chan_put(chan);
 }
 
@@ -710,9 +705,9 @@ void __l2cap_chan_add(struct l2cap_conn *conn, struct l2cap_chan *chan)
 
 void l2cap_chan_add(struct l2cap_conn *conn, struct l2cap_chan *chan)
 {
-	mutex_lock(&conn->chan_lock);
+	mutex_lock(&conn->lock);
 	__l2cap_chan_add(conn, chan);
-	mutex_unlock(&conn->chan_lock);
+	mutex_unlock(&conn->lock);
 }
 
 void l2cap_chan_del(struct l2cap_chan *chan, int err)
@@ -796,9 +791,9 @@ void l2cap_chan_list(struct l2cap_conn *conn, l2cap_chan_func_t func,
 	if (!conn)
 		return;
 
-	mutex_lock(&conn->chan_lock);
+	mutex_lock(&conn->lock);
 	__l2cap_chan_list(conn, func, data);
-	mutex_unlock(&conn->chan_lock);
+	mutex_unlock(&conn->lock);
 }
 
 EXPORT_SYMBOL_GPL(l2cap_chan_list);
@@ -810,7 +805,7 @@ static void l2cap_conn_update_id_addr(struct work_struct *work)
 	struct hci_conn *hcon = conn->hcon;
 	struct l2cap_chan *chan;
 
-	mutex_lock(&conn->chan_lock);
+	mutex_lock(&conn->lock);
 
 	list_for_each_entry(chan, &conn->chan_l, list) {
 		l2cap_chan_lock(chan);
@@ -819,7 +814,7 @@ static void l2cap_conn_update_id_addr(struct work_struct *work)
 		l2cap_chan_unlock(chan);
 	}
 
-	mutex_unlock(&conn->chan_lock);
+	mutex_unlock(&conn->lock);
 }
 
 static void l2cap_chan_le_connect_reject(struct l2cap_chan *chan)
@@ -1591,8 +1586,6 @@ static void l2cap_conn_start(struct l2cap_conn *conn)
 
 	BT_DBG("conn %p", conn);
 
-	mutex_lock(&conn->chan_lock);
-
 	list_for_each_entry_safe(chan, tmp, &conn->chan_l, list) {
 		l2cap_chan_lock(chan);
 
@@ -1661,8 +1654,6 @@ static void l2cap_conn_start(struct l2cap_conn *conn)
 
 		l2cap_chan_unlock(chan);
 	}
-
-	mutex_unlock(&conn->chan_lock);
 }
 
 static void l2cap_le_conn_ready(struct l2cap_conn *conn)
@@ -1708,7 +1699,7 @@ static void l2cap_conn_ready(struct l2cap_conn *conn)
 	if (hcon->type == ACL_LINK)
 		l2cap_request_info(conn);
 
-	mutex_lock(&conn->chan_lock);
+	mutex_lock(&conn->lock);
 
 	list_for_each_entry(chan, &conn->chan_l, list) {
 
@@ -1726,7 +1717,7 @@ static void l2cap_conn_ready(struct l2cap_conn *conn)
 		l2cap_chan_unlock(chan);
 	}
 
-	mutex_unlock(&conn->chan_lock);
+	mutex_unlock(&conn->lock);
 
 	if (hcon->type == LE_LINK)
 		l2cap_le_conn_ready(conn);
@@ -1741,14 +1732,10 @@ static void l2cap_conn_unreliable(struct l2cap_conn *conn, int err)
 
 	BT_DBG("conn %p", conn);
 
-	mutex_lock(&conn->chan_lock);
-
 	list_for_each_entry(chan, &conn->chan_l, list) {
 		if (test_bit(FLAG_FORCE_RELIABLE, &chan->flags))
 			l2cap_chan_set_err(chan, err);
 	}
-
-	mutex_unlock(&conn->chan_lock);
 }
 
 static void l2cap_info_timeout(struct work_struct *work)
@@ -1759,7 +1746,9 @@ static void l2cap_info_timeout(struct work_struct *work)
 	conn->info_state |= L2CAP_INFO_FEAT_MASK_REQ_DONE;
 	conn->info_ident = 0;
 
+	mutex_lock(&conn->lock);
 	l2cap_conn_start(conn);
+	mutex_unlock(&conn->lock);
 }
 
 /*
@@ -1856,6 +1845,8 @@ static void l2cap_conn_del(struct hci_conn *hcon, int err)
 
 	cancel_work_sync(&conn->pending_rx_work);
 
+	mutex_lock(&conn->lock);
+
 	kfree_skb(conn->rx_skb);
 
 	skb_queue_purge(&conn->pending_rx);
@@ -1866,8 +1857,6 @@ static void l2cap_conn_del(struct hci_conn *hcon, int err)
 	/* Force the connection to be immediately dropped */
 	hcon->disc_timeout = 0;
 
-	mutex_lock(&conn->chan_lock);
-
 	/* Kill channels */
 	list_for_each_entry_safe(chan, l, &conn->chan_l, list) {
 		l2cap_chan_hold(chan);
@@ -1881,9 +1870,11 @@ static void l2cap_conn_del(struct hci_conn *hcon, int err)
 		l2cap_chan_put(chan);
 	}
 
-	mutex_unlock(&conn->chan_lock);
+	hci_chan_del(conn->hchan);
+	conn->hchan = NULL;
 
 	hcon->l2cap_data = NULL;
+	mutex_unlock(&conn->lock);
 	l2cap_conn_put(conn);
 }
 
@@ -1891,7 +1882,6 @@ static void l2cap_conn_free(struct kref *ref)
 {
 	struct l2cap_conn *conn = container_of(ref, struct l2cap_conn, ref);
 
-	hci_chan_del(conn->hchan);
 	hci_conn_put(conn->hcon);
 	kfree(conn);
 }
@@ -3005,8 +2995,6 @@ static void l2cap_raw_recv(struct l2cap_conn *conn, struct sk_buff *skb)
 
 	BT_DBG("conn %p", conn);
 
-	mutex_lock(&conn->chan_lock);
-
 	list_for_each_entry(chan, &conn->chan_l, list) {
 		if (chan->chan_type != L2CAP_CHAN_RAW)
 			continue;
@@ -3021,8 +3009,6 @@ static void l2cap_raw_recv(struct l2cap_conn *conn, struct sk_buff *skb)
 		if (chan->ops->recv(chan, nskb))
 			kfree_skb(nskb);
 	}
-
-	mutex_unlock(&conn->chan_lock);
 }
 
 /* ---- L2CAP signalling commands ---- */
@@ -4148,7 +4134,6 @@ static void l2cap_connect(struct l2cap_conn *conn, struct l2cap_cmd_hdr *cmd,
 		goto response;
 	}
 
-	mutex_lock(&conn->chan_lock);
 	l2cap_chan_lock(pchan);
 
 	/* Check if the ACL is secure enough (if not SDP) */
@@ -4254,7 +4239,6 @@ static void l2cap_connect(struct l2cap_conn *conn, struct l2cap_cmd_hdr *cmd,
 	}
 
 	l2cap_chan_unlock(pchan);
-	mutex_unlock(&conn->chan_lock);
 	l2cap_chan_put(pchan);
 }
 
@@ -4293,27 +4277,19 @@ static int l2cap_connect_create_rsp(struct l2cap_conn *conn,
 	BT_DBG("dcid 0x%4.4x scid 0x%4.4x result 0x%2.2x status 0x%2.2x",
 	       dcid, scid, result, status);
 
-	mutex_lock(&conn->chan_lock);
-
 	if (scid) {
 		chan = __l2cap_get_chan_by_scid(conn, scid);
-		if (!chan) {
-			err = -EBADSLT;
-			goto unlock;
-		}
+		if (!chan)
+			return -EBADSLT;
 	} else {
 		chan = __l2cap_get_connect_chan_by_ident(conn, cmd->ident);
-		if (!chan) {
-			err = -EBADSLT;
-			goto unlock;
-		}
+		if (!chan)
+			return -EBADSLT;
 	}
 
 	chan = l2cap_chan_hold_unless_zero(chan);
-	if (!chan) {
-		err = -EBADSLT;
-		goto unlock;
-	}
+	if (!chan)
+		return -EBADSLT;
 
 	err = 0;
 
@@ -4359,9 +4335,6 @@ static int l2cap_connect_create_rsp(struct l2cap_conn *conn,
 	l2cap_chan_unlock(chan);
 	l2cap_chan_put(chan);
 
-unlock:
-	mutex_unlock(&conn->chan_lock);
-
 	return err;
 }
 
@@ -4664,11 +4637,7 @@ static inline int l2cap_disconnect_req(struct l2cap_conn *conn,
 
 	chan->ops->set_shutdown(chan);
 
-	l2cap_chan_unlock(chan);
-	mutex_lock(&conn->chan_lock);
-	l2cap_chan_lock(chan);
 	l2cap_chan_del(chan, ECONNRESET);
-	mutex_unlock(&conn->chan_lock);
 
 	chan->ops->close(chan);
 
@@ -4705,11 +4674,7 @@ static inline int l2cap_disconnect_rsp(struct l2cap_conn *conn,
 		return 0;
 	}
 
-	l2cap_chan_unlock(chan);
-	mutex_lock(&conn->chan_lock);
-	l2cap_chan_lock(chan);
 	l2cap_chan_del(chan, 0);
-	mutex_unlock(&conn->chan_lock);
 
 	chan->ops->close(chan);
 
@@ -4909,13 +4874,9 @@ static int l2cap_le_connect_rsp(struct l2cap_conn *conn,
 	BT_DBG("dcid 0x%4.4x mtu %u mps %u credits %u result 0x%2.2x",
 	       dcid, mtu, mps, credits, result);
 
-	mutex_lock(&conn->chan_lock);
-
 	chan = __l2cap_get_chan_by_ident(conn, cmd->ident);
-	if (!chan) {
-		err = -EBADSLT;
-		goto unlock;
-	}
+	if (!chan)
+		return -EBADSLT;
 
 	chan = l2cap_chan_hold_unless_zero(chan);
 	if (!chan)
@@ -4968,9 +4929,6 @@ static int l2cap_le_connect_rsp(struct l2cap_conn *conn,
 	l2cap_chan_unlock(chan);
 	l2cap_chan_put(chan);
 
-unlock:
-	mutex_unlock(&conn->chan_lock);
-
 	return err;
 }
 
@@ -5112,7 +5070,6 @@ static int l2cap_le_connect_req(struct l2cap_conn *conn,
 		goto response;
 	}
 
-	mutex_lock(&conn->chan_lock);
 	l2cap_chan_lock(pchan);
 
 	if (!smp_sufficient_security(conn->hcon, pchan->sec_level,
@@ -5185,7 +5142,6 @@ static int l2cap_le_connect_req(struct l2cap_conn *conn,
 
 response_unlock:
 	l2cap_chan_unlock(pchan);
-	mutex_unlock(&conn->chan_lock);
 	l2cap_chan_put(pchan);
 
 	if (result == L2CAP_CR_PEND)
@@ -5330,7 +5286,6 @@ static inline int l2cap_ecred_conn_req(struct l2cap_conn *conn,
 		goto response;
 	}
 
-	mutex_lock(&conn->chan_lock);
 	l2cap_chan_lock(pchan);
 
 	if (!smp_sufficient_security(conn->hcon, pchan->sec_level,
@@ -5412,7 +5367,6 @@ static inline int l2cap_ecred_conn_req(struct l2cap_conn *conn,
 
 unlock:
 	l2cap_chan_unlock(pchan);
-	mutex_unlock(&conn->chan_lock);
 	l2cap_chan_put(pchan);
 
 response:
@@ -5449,8 +5403,6 @@ static inline int l2cap_ecred_conn_rsp(struct l2cap_conn *conn,
 	BT_DBG("mtu %u mps %u credits %u result 0x%4.4x", mtu, mps, credits,
 	       result);
 
-	mutex_lock(&conn->chan_lock);
-
 	cmd_len -= sizeof(*rsp);
 
 	list_for_each_entry_safe(chan, tmp, &conn->chan_l, list) {
@@ -5558,8 +5510,6 @@ static inline int l2cap_ecred_conn_rsp(struct l2cap_conn *conn,
 		l2cap_chan_put(chan);
 	}
 
-	mutex_unlock(&conn->chan_lock);
-
 	return err;
 }
 
@@ -5711,8 +5661,6 @@ static inline int l2cap_le_command_rej(struct l2cap_conn *conn,
 	if (cmd_len < sizeof(*rej))
 		return -EPROTO;
 
-	mutex_lock(&conn->chan_lock);
-
 	chan = __l2cap_get_chan_by_ident(conn, cmd->ident);
 	if (!chan)
 		goto done;
@@ -5727,7 +5675,6 @@ static inline int l2cap_le_command_rej(struct l2cap_conn *conn,
 	l2cap_chan_put(chan);
 
 done:
-	mutex_unlock(&conn->chan_lock);
 	return 0;
 }
 
@@ -7267,8 +7214,12 @@ static void process_pending_rx(struct work_struct *work)
 
 	BT_DBG("");
 
+	mutex_lock(&conn->lock);
+
 	while ((skb = skb_dequeue(&conn->pending_rx)))
 		l2cap_recv_frame(conn, skb);
+
+	mutex_unlock(&conn->lock);
 }
 
 static struct l2cap_conn *l2cap_conn_add(struct hci_conn *hcon)
@@ -7306,7 +7257,7 @@ static struct l2cap_conn *l2cap_conn_add(struct hci_conn *hcon)
 	     hci_dev_test_flag(hcon->hdev, HCI_FORCE_BREDR_SMP)))
 		conn->local_fixed_chan |= L2CAP_FC_SMP_BREDR;
 
-	mutex_init(&conn->chan_lock);
+	mutex_init(&conn->lock);
 
 	INIT_LIST_HEAD(&conn->chan_l);
 	INIT_LIST_HEAD(&conn->users);
@@ -7500,7 +7451,7 @@ int l2cap_chan_connect(struct l2cap_chan *chan, __le16 psm, u16 cid,
 		}
 	}
 
-	mutex_lock(&conn->chan_lock);
+	mutex_lock(&conn->lock);
 	l2cap_chan_lock(chan);
 
 	if ((cid && __l2cap_get_chan_by_dcid(conn, cid)) || chan->conn ||
@@ -7542,7 +7493,7 @@ int l2cap_chan_connect(struct l2cap_chan *chan, __le16 psm, u16 cid,
 
 chan_unlock:
 	l2cap_chan_unlock(chan);
-	mutex_unlock(&conn->chan_lock);
+	mutex_unlock(&conn->lock);
 done:
 	hci_dev_unlock(hdev);
 	hci_dev_put(hdev);
@@ -7756,7 +7707,7 @@ static void l2cap_security_cfm(struct hci_conn *hcon, u8 status, u8 encrypt)
 
 	BT_DBG("conn %p status 0x%2.2x encrypt %u", conn, status, encrypt);
 
-	mutex_lock(&conn->chan_lock);
+	mutex_lock(&conn->lock);
 
 	list_for_each_entry(chan, &conn->chan_l, list) {
 		l2cap_chan_lock(chan);
@@ -7830,7 +7781,7 @@ static void l2cap_security_cfm(struct hci_conn *hcon, u8 status, u8 encrypt)
 		l2cap_chan_unlock(chan);
 	}
 
-	mutex_unlock(&conn->chan_lock);
+	mutex_unlock(&conn->lock);
 }
 
 /* Append fragment into frame respecting the maximum len of rx_skb */
@@ -7899,6 +7850,9 @@ static void l2cap_recv_reset(struct l2cap_conn *conn)
 
 struct l2cap_conn *l2cap_conn_hold_unless_zero(struct l2cap_conn *c)
 {
+	if (!c)
+		return NULL;
+
 	BT_DBG("conn %p orig refcnt %u", c, kref_read(&c->ref));
 
 	if (!kref_get_unless_zero(&c->ref))
@@ -7925,11 +7879,15 @@ void l2cap_recv_acldata(struct hci_conn *hcon, struct sk_buff *skb, u16 flags)
 
 	hci_dev_unlock(hcon->hdev);
 
-	if (!conn)
-		goto drop;
+	if (!conn) {
+		kfree_skb(skb);
+		return;
+	}
 
 	BT_DBG("conn %p len %u flags 0x%x", conn, skb->len, flags);
 
+	mutex_lock(&conn->lock);
+
 	switch (flags) {
 	case ACL_START:
 	case ACL_START_NO_FLUSH:
@@ -7954,7 +7912,7 @@ void l2cap_recv_acldata(struct hci_conn *hcon, struct sk_buff *skb, u16 flags)
 		if (len == skb->len) {
 			/* Complete frame received */
 			l2cap_recv_frame(conn, skb);
-			return;
+			goto unlock;
 		}
 
 		BT_DBG("Start: total len %d, frag len %u", len, skb->len);
@@ -8016,10 +7974,11 @@ void l2cap_recv_acldata(struct hci_conn *hcon, struct sk_buff *skb, u16 flags)
 		break;
 	}
 
-	l2cap_conn_put(conn);
-
 drop:
 	kfree_skb(skb);
+unlock:
+	mutex_unlock(&conn->lock);
+	l2cap_conn_put(conn);
 }
 
 static struct hci_cb l2cap_cb = {
diff --git a/net/bluetooth/l2cap_sock.c b/net/bluetooth/l2cap_sock.c
index 46d73d46e297..e4312e7d17c2 100644
--- a/net/bluetooth/l2cap_sock.c
+++ b/net/bluetooth/l2cap_sock.c
@@ -1395,9 +1395,10 @@ static int l2cap_sock_shutdown(struct socket *sock, int how)
 	/* prevent sk structure from being freed whilst unlocked */
 	sock_hold(sk);
 
-	chan = l2cap_pi(sk)->chan;
 	/* prevent chan structure from being freed whilst unlocked */
-	l2cap_chan_hold(chan);
+	chan = l2cap_chan_hold_unless_zero(l2cap_pi(sk)->chan);
+	if (!chan)
+		goto shutdown_already;
 
 	BT_DBG("chan %p state %s", chan, state_to_string(chan->state));
 
@@ -1427,22 +1428,20 @@ static int l2cap_sock_shutdown(struct socket *sock, int how)
 	release_sock(sk);
 
 	l2cap_chan_lock(chan);
-	conn = chan->conn;
-	if (conn)
-		/* prevent conn structure from being freed */
-		l2cap_conn_get(conn);
+	/* prevent conn structure from being freed */
+	conn = l2cap_conn_hold_unless_zero(chan->conn);
 	l2cap_chan_unlock(chan);
 
 	if (conn)
 		/* mutex lock must be taken before l2cap_chan_lock() */
-		mutex_lock(&conn->chan_lock);
+		mutex_lock(&conn->lock);
 
 	l2cap_chan_lock(chan);
 	l2cap_chan_close(chan, 0);
 	l2cap_chan_unlock(chan);
 
 	if (conn) {
-		mutex_unlock(&conn->chan_lock);
+		mutex_unlock(&conn->lock);
 		l2cap_conn_put(conn);
 	}
 
-- 
2.55.0.dirty


