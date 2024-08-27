Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5A51C3F1D
	for <regressions@lists.linux.dev>; Tue, 27 Aug 2024 16:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724776257; cv=none; b=Ig7W2Uq7ENTU+CJMF+7zcMFBuUh50cBgD5A3y0PN3DZrQfdIzGuiVQd67ZKASn8kWZopz82dyw63FxbvkaZ/V38e/UnFXE0gxtkNVBnXblZ12h5PPmrRHObv1GNIsQ9EGup5hnytQ/GVqdoc++Rlf4dupw11/7suqHgsYX10gNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724776257; c=relaxed/simple;
	bh=1rktHUuNXA648bp+TBeO+8KnJA3UraXxzozM55cT5FY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aekFVD3IwoUeFHvB+yv5xlRmWPnDk+yjWmmS11vHNxjFTO4ReZq7ves+RqlY82UpcP5Icnq8AuvZiPmt6x4zd95FKc809e64PXY9HKNmEA2Z+gbjEApJBBE5A8gxpmsn9uclq76l4eP0FuLiZx5V6ZhEgU9XXM5tsExlTU4KufQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20230601.gappssmtp.com header.i=@fireburn-co-uk.20230601.gappssmtp.com header.b=EOYfp+mL; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20230601.gappssmtp.com header.i=@fireburn-co-uk.20230601.gappssmtp.com header.b="EOYfp+mL"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2d3c05ec278so4200695a91.0
        for <regressions@lists.linux.dev>; Tue, 27 Aug 2024 09:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20230601.gappssmtp.com; s=20230601; t=1724776254; x=1725381054; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0XVBX5DhUJFSzrGvaUeFT12x0qnQoAnDWp+JiOfVQbs=;
        b=EOYfp+mLXhzfZmJ1cK+dc6wfZxNvne3WvBzckvSgWXAvQK9SlzOWVarw5b9cz3yT/4
         Gb5jWAugPllOtgPzJ5fBWp2JzdzwmI3N4ezMWlvxcEGvR83UUHk37ntcxY+MX/CYyyVS
         6TX7SWnMEAskqJNBmUIvIiBH50GNluL5x5tf1u3hrnlouBMzUXORwPNlje8bb1cRLamG
         oG8gtqhCpd0gTZWfjyY+KiT3FT6RmIvo9UlDq1b0VO8CthxNUKKjdyU1Cv+tC4JYM1Iq
         5C7fy8B6gd/nxAtb6giszc960kUz6MLvfB+fA1sR03j1V8gGelAJ1cYyMcW4uNyZXeLj
         Gpzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724776254; x=1725381054;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0XVBX5DhUJFSzrGvaUeFT12x0qnQoAnDWp+JiOfVQbs=;
        b=jD4FlX7iLvhpfp435BmHt3T89qAEGt0oFcVmuo04I8QHnVXRZXcqHGivQfKMmzhiXP
         bO8I1pj76hnbSF6z0zR2UfpjFb0zaXNSI7wR/xuUdBaFffadsjHsDwTWUZphmWPR7SI+
         PU552TvXCa5SWW0C3EDRtMWnVKZFF9YsHzzxxoNmIrz9BZ9G3VZCIfxxIup4V9fbrVFf
         +pST7Mw7eRQbKog6g5iMVvo9FSaTuL4Dr2LQ9eZynz1cpnUAcgCxYUZvFiIe0fypxI/J
         FujZpqYtLNV/O4j0vHhF00tOZKrkwB2NpMyPEwep2SF484M1vwQ5Iy/AO060lBaca3cp
         GjVQ==
X-Gm-Message-State: AOJu0YyZb8EOkOj006wEZENhvSCQ22kwS3lUm3XpK+Lt+Uwc7vuiTVNG
	sLkBeRUZDcrD9sXkS9feDY9TC67HsGOMZAInHn7wZ0cBRoRNXbS4JRrzSflBV0/90/qlhOubHbv
	V9zGokkR9hAvsRtIEa+nhKsgJT7yaDR3m6fnl
X-Google-Smtp-Source: AGHT+IE73CmQxbUWnwLY2l3S4m9aoYopXDRVaucVweg8y0PuUy6uOfgLJmNvIyvMZ5s+YynTsXQViemK5vfAu1xOaW0=
X-Received: by 2002:a17:90a:db81:b0:2d3:caeb:a9ad with SMTP id
 98e67ed59e1d1-2d646d0e8abmr13325235a91.31.1724776253984; Tue, 27 Aug 2024
 09:30:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240718234633.12737-1-sean.wang@kernel.org> <0124ff39-7d63-49f8-bacd-3a40ce37ec4d@leemhuis.info>
 <CAHbf0-Hn=ZyYpk7bS1yLK7K3ZpfWKgt3-t=c9Nhdj3Ov3H84mQ@mail.gmail.com> <f7197c55d059cc8ddbf6c3def16dc414c5ec0b42.camel@web.de>
In-Reply-To: <f7197c55d059cc8ddbf6c3def16dc414c5ec0b42.camel@web.de>
From: Mike Lothian <mike@fireburn.co.uk>
Date: Tue, 27 Aug 2024 17:30:42 +0100
Message-ID: <CAHbf0-EBHERbxPGakY4-1jTQWqGqua3F0OYZjxcakdemJ5Soqw@mail.gmail.com>
Subject: Re: [PATCH] wifi: mt76: mt7921: fix null pointer access in mt792x_mac_link_bss_remove
To: Bert Karwatzki <spasswolf@web.de>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, sean.wang@kernel.org, nbd@nbd.name, 
	lorenzo.bianconi@redhat.com, sean.wang@mediatek.com, deren.wu@mediatek.com, 
	mingyen.hsieh@mediatek.com, linux-wireless@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi

This fix hasn't made it upstream yet, has it fallen through the cracks?

Cheers

Mike

On Thu, 1 Aug 2024 at 17:58, Bert Karwatzki <spasswolf@web.de> wrote:
>
> Am Donnerstag, dem 01.08.2024 um 13:38 +0100 schrieb Mike Lothian:
> > I also saw the following after I restarted my router on two machines -
> > they both have this fix applied already:
> >
> > Aug 01 08:59:33 quark kernel: BUG: kernel NULL pointer dereference,
> > address: 0000000000000008
> > Aug 01 08:59:33 quark kernel: #PF: supervisor read access in kernel mode
> > Aug 01 08:59:33 quark kernel: #PF: error_code(0x0000) - not-present page
> > Aug 01 08:59:33 quark kernel: PGD 0 P4D 0
> > Aug 01 08:59:33 quark kernel: Oops: Oops: 0000 [#1] PREEMPT SMP
> > Aug 01 08:59:33 quark kernel: CPU: 13 UID: 0 PID: 468 Comm:
> > NetworkManager Not tainted 6.11.0-rc1-tip+ #3200
> > 9c927d6f3c59d826d15d8e39c195392d1d16b8a8
> > Aug 01 08:59:33 quark kernel: Hardware name: Micro Computer (HK) Tech
> > Limited EliteMini Series/HPBSD, BIOS 1.02 03/28/2024
> > Aug 01 08:59:33 quark kernel: RIP: 0010:mt7921_ipv6_addr_change
> > Aug 01 08:59:33 quark kernel: Code: 41 57 41 56 41 54 53 48 83 e4 f0
> > 48 83 ec 50 48 8b 86 70 09 00 00 0f b6 8e 90 04 00 00 4c 8d ba 68 02
> > 00 00 49 89 d6 4c 89 ff <48> 8b 58 08 88 4c 24 04 66 c7 44 24 05 00 00
> > c6 44 24 07 00 66 c7
> > Aug 01 08:59:33 quark kernel: RSP: 0018:ffffc900069373b0 EFLAGS: 00010282
> > Aug 01 08:59:33 quark kernel: RAX: 0000000000000000 RBX:
> > ffff888106740920 RCX: 0000000000000000
> > Aug 01 08:59:33 quark kernel: RDX: ffff888106854800 RSI:
> > ffff88810bb35ca0 RDI: ffff888106854a68
> > Aug 01 08:59:33 quark kernel: RBP: ffffc90006937420 R08:
> > 0000000000000000 R09: ffff888104c98200
> > Aug 01 08:59:33 quark kernel: R10: ffffffff7fff0000 R11:
> > 0000000000000020 R12: 0000000000000002
> > Aug 01 08:59:33 quark kernel: R13: 0000000000000000 R14:
> > ffff888106854800 R15: ffff888106854a68
> > Aug 01 08:59:33 quark kernel: FS:  00007f4265049400(0000)
> > GS:ffff888c2df40000(0000) knlGS:0000000000000000
> > Aug 01 08:59:33 quark kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > Aug 01 08:59:33 quark kernel: CR2: 0000000000000008 CR3:
> > 0000000117250000 CR4: 0000000000350ef0
> > Aug 01 08:59:33 quark kernel: Call Trace:
> > Aug 01 08:59:33 quark kernel:  <TASK>
> > Aug 01 08:59:33 quark kernel:  ? __die_body+0x66/0xb0
> > Aug 01 08:59:33 quark kernel:  ? page_fault_oops+0x39a/0x410
> > Aug 01 08:59:33 quark kernel:  ? exc_page_fault+0x59/0xa0
> > Aug 01 08:59:33 quark kernel:  ? asm_exc_page_fault+0x22/0x30
> > Aug 01 08:59:33 quark kernel:  ? mt7921_ipv6_addr_change
> > Aug 01 08:59:33 quark kernel:  ? __try_to_del_timer_sync
> > Aug 01 08:59:33 quark kernel:  ieee80211_ifa6_changed+0x68/0x120
> > Aug 01 08:59:33 quark kernel:  atomic_notifier_call_chain+0x45/0xc0
> > Aug 01 08:59:33 quark kernel:  addrconf_ifdown+0x521/0x7d0
> > Aug 01 08:59:33 quark kernel:  addrconf_notify+0x1ed/0x4a0
> > Aug 01 08:59:33 quark kernel:  raw_notifier_call_chain+0x45/0xb0
> > Aug 01 08:59:33 quark kernel:  __dev_notify_flags+0xf4/0x200
> > Aug 01 08:59:33 quark kernel:  dev_change_flags+0x49/0x50
> > Aug 01 08:59:33 quark kernel:  do_setlink+0x49b/0x1300
> > Aug 01 08:59:33 quark kernel:  ? terminate_walk+0x6b/0x100
> > Aug 01 08:59:33 quark kernel:  ? __nla_validate_parse
> > Aug 01 08:59:33 quark kernel:  ? filename_lookup+0xc7/0x1b0
> > Aug 01 08:59:33 quark kernel:  rtnl_newlink+0xb6a/0xde0
> > Aug 01 08:59:33 quark kernel:  ? __wake_up_sync_key+0x51/0x80
> > Aug 01 08:59:33 quark kernel:  ? scm_destroy+0xc/0x30
> > Aug 01 08:59:33 quark kernel:  ? security_capable+0x38/0x50
> > Aug 01 08:59:33 quark kernel:  rtnetlink_rcv_msg+0x2dd/0x330
> > Aug 01 08:59:33 quark kernel:  ? select_task_rq_fair
> > Aug 01 08:59:33 quark kernel:  ? rtnetlink_bind+0x30/0x30
> > Aug 01 08:59:33 quark kernel:  netlink_rcv_skb+0xb5/0xf0
> > Aug 01 08:59:33 quark kernel:  netlink_unicast+0x230/0x330
> > Aug 01 08:59:33 quark kernel:  netlink_sendmsg+0x3b1/0x460
> > Aug 01 08:59:33 quark kernel:  ____sys_sendmsg
> > Aug 01 08:59:33 quark kernel:  ? chacha_block_generic+0x6a/0x130
> > Aug 01 08:59:33 quark kernel:  ___sys_sendmsg+0x282/0x2a0
> > Aug 01 08:59:33 quark kernel:  ? __fget_files+0x95/0xb0
> > Aug 01 08:59:33 quark kernel:  __se_sys_sendmsg+0xf4/0x120
> > Aug 01 08:59:33 quark kernel:  do_syscall_64+0x7e/0x130
> > Aug 01 08:59:33 quark kernel:  ? pollwake+0x52/0x60
> > Aug 01 08:59:33 quark kernel:  ? do_task_dead+0x50/0x50
> > Aug 01 08:59:33 quark kernel:  ? __wake_up_locked_key+0x48/0x70
> > Aug 01 08:59:33 quark kernel:  ? eventfd_write+0x193/0x1b0
> > Aug 01 08:59:33 quark kernel:  ? syscall_exit_to_user_mode+0x93/0xc0
> > Aug 01 08:59:33 quark kernel:  ? vfs_write+0xfa/0x3d0
> > Aug 01 08:59:33 quark kernel:  ? __fget_files+0x95/0xb0
> > Aug 01 08:59:33 quark kernel:  ? __fget_files+0x95/0xb0
> > Aug 01 08:59:33 quark kernel:  ? ksys_write+0x8f/0xb0
> > Aug 01 08:59:33 quark kernel:  ? arch_exit_to_user_mode_prepare+0x11/0x50
> > Aug 01 08:59:33 quark kernel:  ? syscall_exit_to_user_mode+0x93/0xc0
> > Aug 01 08:59:33 quark kernel:  ? do_syscall_64+0x8a/0x130
> > Aug 01 08:59:33 quark kernel:  ? syscall_exit_to_user_mode+0x93/0xc0
> > Aug 01 08:59:33 quark kernel:  ? do_syscall_64+0x8a/0x130
> > Aug 01 08:59:33 quark kernel:  ? do_syscall_64+0x8a/0x130
> > Aug 01 08:59:33 quark kernel:  ? do_syscall_64+0x8a/0x130
> > Aug 01 08:59:33 quark kernel:  ? arch_exit_to_user_mode_prepare+0x11/0x50
> > Aug 01 08:59:33 quark kernel:  entry_SYSCALL_64_after_hwframe+0x4b/0x53
> > Aug 01 08:59:33 quark kernel: RIP: 0033:0x7f4264d31fae
> > Aug 01 08:59:33 quark kernel: Code: 20 89 54 24 1c 48 89 74 24 10 89
> > 7c 24 08 e8 a9 75 f7 ff 41 89 c0 8b 54 24 1c 48 8b 74 24 10 b8 2e 00
> > 00 00 8b 7c 24 08 0f 05 <48> 3d 00 f0 ff ff 77 3a 44 89 c7 48 89 44 24
> > 08 e8 fd 75 f7 ff 48
> > Aug 01 08:59:33 quark kernel: RSP: 002b:00007ffff4b1afa0 EFLAGS:
> > 00000293 ORIG_RAX: 000000000000002e
> > Aug 01 08:59:33 quark kernel: RAX: ffffffffffffffda RBX:
> > 000055c35260c570 RCX: 00007f4264d31fae
> > Aug 01 08:59:33 quark kernel: RDX: 0000000000000000 RSI:
> > 00007ffff4b1afe0 RDI: 000000000000000d
> > Aug 01 08:59:33 quark kernel: RBP: 00007ffff4b1b050 R08:
> > 0000000000000000 R09: 0000000000000000
> > Aug 01 08:59:33 quark kernel: R10: 000000000000009d R11:
> > 0000000000000293 R12: 0000000000000004
> > Aug 01 08:59:33 quark kernel: R13: 0000000000000000 R14:
> > 0000000000000000 R15: 0000000000000000
> > Aug 01 08:59:33 quark kernel:  </TASK>
> > Aug 01 08:59:33 quark kernel: Modules linked in:
> > Aug 01 08:59:33 quark kernel: CR2: 0000000000000008
> > Aug 01 08:59:33 quark kernel: ---[ end trace 0000000000000000 ]---
> > Aug 01 08:59:33 quark kernel: RIP: 0010:mt7921_ipv6_addr_change
> > Aug 01 08:59:33 quark kernel: Code: 41 57 41 56 41 54 53 48 83 e4 f0
> > 48 83 ec 50 48 8b 86 70 09 00 00 0f b6 8e 90 04 00 00 4c 8d ba 68 02
> > 00 00 49 89 d6 4c 89 ff <48> 8b 58 08 88 4c 24 04 66 c7 44 24 05 00 00
> > c6 44 24 07 00 66 c7
> > Aug 01 08:59:33 quark kernel: RSP: 0018:ffffc900069373b0 EFLAGS: 00010282
> > Aug 01 08:59:33 quark kernel: RAX: 0000000000000000 RBX:
> > ffff888106740920 RCX: 0000000000000000
> > Aug 01 08:59:33 quark kernel: RDX: ffff888106854800 RSI:
> > ffff88810bb35ca0 RDI: ffff888106854a68
> > Aug 01 08:59:33 quark kernel: RBP: ffffc90006937420 R08:
> > 0000000000000000 R09: ffff888104c98200
> > Aug 01 08:59:33 quark kernel: R10: ffffffff7fff0000 R11:
> > 0000000000000020 R12: 0000000000000002
> > Aug 01 08:59:33 quark kernel: R13: 0000000000000000 R14:
> > ffff888106854800 R15: ffff888106854a68
> > Aug 01 08:59:33 quark kernel: FS:  00007f4265049400(0000)
> > GS:ffff888c2df40000(0000) knlGS:0000000000000000
> > Aug 01 08:59:33 quark kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > Aug 01 08:59:33 quark kernel: CR2: 0000000000000008 CR3:
> > 0000000117250000 CR4: 0000000000350ef0
> >
> > On Wed, 24 Jul 2024 at 10:36, Linux regression tracking (Thorsten
> > Leemhuis) <regressions@leemhuis.info> wrote:
> > >
> > >
> > >
> > > On 19.07.24 01:46, sean.wang@kernel.org wrote:
> > > > From: Sean Wang <sean.wang@mediatek.com>
> > > >
> > > > Fix null pointer access in mt792x_mac_link_bss_remove.
> > > >
> > > > To prevent null pointer access, we should assign the vif to bss_conf in
> > > > mt7921_add_interface. This ensures that subsequent operations on the BSS
> > > > can properly reference the correct vif.
> > > >
> > > > [...]
> > > > > Fixes: 1541d63c5fe2 ("wifi: mt76: mt7925: add
> > > mt7925_mac_link_bss_remove to remove per-link BSS")
> > > > Reported-by: Bert Karwatzki <spasswolf@web.de>
> > > > Closes: https://lore.kernel.org/linux-wireless/2fee61f8c903d02a900ca3188c3742c7effd102e.camel@web.de/#b
> > > > Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> > >
> > > TWIMC, Mike (now CCed) ran into the problem and on bugzilla confirmed
> > > that this fixes the problem:
> > >
> > > https://bugzilla.kernel.org/show_bug.cgi?id=219084
> > > https://lore.kernel.org/all/CAHbf0-HOS-jdRGvJOBmEgaaox3PDbDSTgnnZkZF9pz37Bmh2iw@mail.gmail.com/
> > >
> > > Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> > > --
> > > Everything you wanna know about Linux kernel regression tracking:d
> > > https://linux-regtracking.leemhuis.info/about/#tldr
> > > If I did something stupid, please tell me, as explained on that page.
>
> The fix to this issue has been posted here by Felix Fietkau:
> > Am Mittwoch, dem 17.07.2024 um 17:25 +0200 schrieb Felix Fietkau:
> >
> > This change should fix it: https://nbd.name/p/0747f54f
> > Please test.
> >
> > Thanks,
> >
> > - Felix
>
> Bert Karwatzki
