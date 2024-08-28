Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8EDC1A2C24
	for <regressions@lists.linux.dev>; Wed, 28 Aug 2024 15:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724858428; cv=none; b=JKRxn2O8yTtPzJrBMRKZvrVcu9bNZBZIOkS604QAIIACKCC2QT90I2MoPIuS3+hAxrH9wCKdK+ZQ1lrMJIvi/ryqn0YOnJCKAXOE9asJoKFSMNFH3PnRnR1p1a01cPtQGWlmwx/35cUz5BvQJM5sqjhcq1q5i0hj7KdU5DcsfsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724858428; c=relaxed/simple;
	bh=yjVk8rlNhslU5RKP81YBr8HTlsyciXJaW3tQK4726dA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rXu6TkwxIyr3r4+hHJwwOJieCsoqlBIUobB5ByQZfvvLHVvsgY7eXh03OzDG7fLuh9YgehzyVCu847Q3Q1KlS4+WAfs3oPRakDVVbwZ1Fu289UeUbPIp29XmJNNJE1UTRFgKJsauK2AVs0AwhyeEp3AUHTZ6YZh9ss4HPtYG5co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20230601.gappssmtp.com header.i=@fireburn-co-uk.20230601.gappssmtp.com header.b=Jy53aY/p; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20230601.gappssmtp.com header.i=@fireburn-co-uk.20230601.gappssmtp.com header.b="Jy53aY/p"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-6c5bcb8e8edso4937678a12.2
        for <regressions@lists.linux.dev>; Wed, 28 Aug 2024 08:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20230601.gappssmtp.com; s=20230601; t=1724858426; x=1725463226; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jT1qvVjmSriUde7CSZP+m9ZT/NzbTPlyFiDYaSgNWjs=;
        b=Jy53aY/pQPX1c7xWUq5RjsgKiLTrRdznuiTz/qIQF5rKWw80mOBxKAtBxAvlL6RyZB
         3cdKGs+UAXM+5ow3BiSgGY60g36mr/0T5+CtuS9rqf3HAzAhwDKR+6eRejl7Tf+wNn8R
         +BCMF2OikawirFeWWdDkftQ7tqXCF6VUHjb6vR0x+reJO1EmMfOzaASdIKaVFUc/hYCl
         fw4FllRTXqNKWmVkIrZuP4VjR99/FrBs6I3ztwynU//cRGbbZV+RJhNhZiMJlFE3iPOJ
         lmxeRayusuaNE+ZnRP6Ya3DbU3c99wM+j7jaVPJXhnKLY2dRhdS20KpZfqPBxlyFhXuV
         AyjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724858426; x=1725463226;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jT1qvVjmSriUde7CSZP+m9ZT/NzbTPlyFiDYaSgNWjs=;
        b=ALPcCiNXKt7NyWFM534ANx4bySVe7rTdnMdT+24sirjilwqc4dwY7mDUVBXnBPCRRy
         xS5rkJwe69Kb8IGuNz2to72yzT7TGKnLSnlqwR9vYkEsVmEWkyMiM3t+UiQjPZm1ZQk+
         538l9KXXmpy1S1gia5+Zsr8WtWbOpyWhwlQpVjZj9z1i4KGHnWRD0itd4ujDbKvieBuI
         WKfmGkbeg2XWu3OHHEPKDrvkRz7gKyVLq0TIi6sn/NO6haRd+C+lkAHkXPfRVq3TiDNf
         DsWXKoJ/+kkzSyiTchsSkbEuwo1ATHolqi0FNq7M2bA00yZp0yZ4EOvzFiJGfzIwfEhH
         DLuw==
X-Gm-Message-State: AOJu0YxOFi94LugWVeRpuJdzWUhFBrvcHMYUxmAPlXvHdTXba8TgjSNI
	hD0kR1jEab3UQWhbwmxTTjNEmdynnRJLcVuL7CYJ92Aflyqhf1Y4n3su/2j6HCv0oRL2cvDkMPV
	X2ckiK0BNg6VXxJvpGGj+2GVbOA/WxDwDKI3x
X-Google-Smtp-Source: AGHT+IHJl2W4jZ+l20ttx7NDkecDMEc56gzYUXY9cSXHwm4kMwRSs3MZ0pORZxBuSYNI49WYMa2W7lCXwEuOxj6ASWk=
X-Received: by 2002:a17:90a:bc90:b0:2cd:7d6f:31ad with SMTP id
 98e67ed59e1d1-2d646d1e89emr18404861a91.31.1724858425587; Wed, 28 Aug 2024
 08:20:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240718234633.12737-1-sean.wang@kernel.org> <0124ff39-7d63-49f8-bacd-3a40ce37ec4d@leemhuis.info>
 <CAHbf0-Hn=ZyYpk7bS1yLK7K3ZpfWKgt3-t=c9Nhdj3Ov3H84mQ@mail.gmail.com>
 <f7197c55d059cc8ddbf6c3def16dc414c5ec0b42.camel@web.de> <CAHbf0-EBHERbxPGakY4-1jTQWqGqua3F0OYZjxcakdemJ5Soqw@mail.gmail.com>
 <51e80bde6e3f3256ecdea2e5260463341e65578e.camel@web.de> <CAHbf0-HYi=x11bc-sMJFbZ4cbkdphMYQ_hjzD_wrPvJevVwyYg@mail.gmail.com>
 <980698e0d6dfa1e0043edfed6e174ff17705e053.camel@web.de>
In-Reply-To: <980698e0d6dfa1e0043edfed6e174ff17705e053.camel@web.de>
From: Mike Lothian <mike@fireburn.co.uk>
Date: Wed, 28 Aug 2024 16:20:14 +0100
Message-ID: <CAHbf0-FfAQhuu1TgQ_jVcxPqLsF-ON8vC1QJ=mNhis44dYWufw@mail.gmail.com>
Subject: Re: [PATCH] wifi: mt76: mt7921: fix null pointer access in mt792x_mac_link_bss_remove
To: Bert Karwatzki <spasswolf@web.de>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, sean.wang@kernel.org, nbd@nbd.name, 
	lorenzo.bianconi@redhat.com, sean.wang@mediatek.com, deren.wu@mediatek.com, 
	mingyen.hsieh@mediatek.com, linux-wireless@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 28 Aug 2024 at 09:17, Bert Karwatzki <spasswolf@web.de> wrote:
>
> Am Mittwoch, dem 28.08.2024 um 00:38 +0100 schrieb Mike Lothian:
> > But not the follow on fix which fixes suspend...
> >
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> > b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> > index 2e6268cb06c0..a85c19da77e5 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> > +++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> > @@ -1182,7 +1182,7 @@ static void mt7921_ipv6_addr_change(struct
> > ieee80211_hw *hw,
> >       struct inet6_dev *idev)
> >  {
> >   struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
> > - struct mt792x_dev *dev = mvif->phy->dev;
> > + struct mt792x_dev *dev = mt792x_hw_dev(hw);
> >   struct inet6_ifaddr *ifa;
> >   struct in6_addr ns_addrs[IEEE80211_BSS_ARP_ADDR_LIST_LEN];
> >   struct sk_buff *skb;
> > @@ -1205,6 +1205,9 @@ static void mt7921_ipv6_addr_change(struct
> > ieee80211_hw *hw,
> >   },
> >   };
> >
> > + if (!mvif->phy)
> > + return;
> > +
> >   read_lock_bh(&idev->lock);
> >   list_for_each_entry(ifa, &idev->addr_list, if_list) {
> >   if (ifa->flags & IFA_F_TENTATIVE)
> >
> > > > >
> > >
>
> That is interesting (or odd) because suspend (s2idle) works for me in next-
> 20240827 on this hardware:
>
> 04:00.0 Network controller [0280]: MEDIATEK Corp. MT7921K (RZ608) Wi-Fi 6E 80MHz
> [14c3:0608]
>
> are you using a different model?
>
> [  272.780054] [    T848] wlp4s0: deauthenticating from 54:67:51:3d:a2:d2 by
> local choice (Reason: 3=DEAUTH_LEAVING)
> [  273.067438] [   T3437] PM: suspend entry (s2idle)
> [  273.151140] [   T3437] Filesystems sync: 0.083 seconds
> [  273.157029] [   T3437] Freezing user space processes
>
> Can your the post the backtrace of your error (when commit 479ffee68d59c599f is
> applied)?
>
> Bert Karwatzki

Apologies, it wasn't a suspend issue, it was when the router was restarted

The error I saw was previously in this thread and someone pointed me
to the patch that fixed it - but that hasn't made it upstream yet

Aug 01 08:59:33 quark kernel: BUG: kernel NULL pointer dereference,
address: 0000000000000008
Aug 01 08:59:33 quark kernel: #PF: supervisor read access in kernel mode
Aug 01 08:59:33 quark kernel: #PF: error_code(0x0000) - not-present page
Aug 01 08:59:33 quark kernel: PGD 0 P4D 0
Aug 01 08:59:33 quark kernel: Oops: Oops: 0000 [#1] PREEMPT SMP
Aug 01 08:59:33 quark kernel: CPU: 13 UID: 0 PID: 468 Comm:
NetworkManager Not tainted 6.11.0-rc1-tip+ #3200
9c927d6f3c59d826d15d8e39c195392d1d16b8a8
Aug 01 08:59:33 quark kernel: Hardware name: Micro Computer (HK) Tech
Limited EliteMini Series/HPBSD, BIOS 1.02 03/28/2024
Aug 01 08:59:33 quark kernel: RIP: 0010:mt7921_ipv6_addr_change
Aug 01 08:59:33 quark kernel: Code: 41 57 41 56 41 54 53 48 83 e4 f0
48 83 ec 50 48 8b 86 70 09 00 00 0f b6 8e 90 04 00 00 4c 8d ba 68 02
00 00 49 89 d6 4c 89 ff <48> 8b 58 08 88 4c 24 04 66 c7 44 24 05 00 00
c6 44 24 07 00 66 c7
Aug 01 08:59:33 quark kernel: RSP: 0018:ffffc900069373b0 EFLAGS: 00010282
Aug 01 08:59:33 quark kernel: RAX: 0000000000000000 RBX:
ffff888106740920 RCX: 0000000000000000
Aug 01 08:59:33 quark kernel: RDX: ffff888106854800 RSI:
ffff88810bb35ca0 RDI: ffff888106854a68
Aug 01 08:59:33 quark kernel: RBP: ffffc90006937420 R08:
0000000000000000 R09: ffff888104c98200
Aug 01 08:59:33 quark kernel: R10: ffffffff7fff0000 R11:
0000000000000020 R12: 0000000000000002
Aug 01 08:59:33 quark kernel: R13: 0000000000000000 R14:
ffff888106854800 R15: ffff888106854a68
Aug 01 08:59:33 quark kernel: FS:  00007f4265049400(0000)
GS:ffff888c2df40000(0000) knlGS:0000000000000000
Aug 01 08:59:33 quark kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Aug 01 08:59:33 quark kernel: CR2: 0000000000000008 CR3:
0000000117250000 CR4: 0000000000350ef0
Aug 01 08:59:33 quark kernel: Call Trace:
Aug 01 08:59:33 quark kernel:  <TASK>
Aug 01 08:59:33 quark kernel:  ? __die_body+0x66/0xb0
Aug 01 08:59:33 quark kernel:  ? page_fault_oops+0x39a/0x410
Aug 01 08:59:33 quark kernel:  ? exc_page_fault+0x59/0xa0
Aug 01 08:59:33 quark kernel:  ? asm_exc_page_fault+0x22/0x30
Aug 01 08:59:33 quark kernel:  ? mt7921_ipv6_addr_change
Aug 01 08:59:33 quark kernel:  ? __try_to_del_timer_sync
Aug 01 08:59:33 quark kernel:  ieee80211_ifa6_changed+0x68/0x120
Aug 01 08:59:33 quark kernel:  atomic_notifier_call_chain+0x45/0xc0
Aug 01 08:59:33 quark kernel:  addrconf_ifdown+0x521/0x7d0
Aug 01 08:59:33 quark kernel:  addrconf_notify+0x1ed/0x4a0
Aug 01 08:59:33 quark kernel:  raw_notifier_call_chain+0x45/0xb0
Aug 01 08:59:33 quark kernel:  __dev_notify_flags+0xf4/0x200
Aug 01 08:59:33 quark kernel:  dev_change_flags+0x49/0x50
Aug 01 08:59:33 quark kernel:  do_setlink+0x49b/0x1300
Aug 01 08:59:33 quark kernel:  ? terminate_walk+0x6b/0x100
Aug 01 08:59:33 quark kernel:  ? __nla_validate_parse
Aug 01 08:59:33 quark kernel:  ? filename_lookup+0xc7/0x1b0
Aug 01 08:59:33 quark kernel:  rtnl_newlink+0xb6a/0xde0
Aug 01 08:59:33 quark kernel:  ? __wake_up_sync_key+0x51/0x80
Aug 01 08:59:33 quark kernel:  ? scm_destroy+0xc/0x30
Aug 01 08:59:33 quark kernel:  ? security_capable+0x38/0x50
Aug 01 08:59:33 quark kernel:  rtnetlink_rcv_msg+0x2dd/0x330
Aug 01 08:59:33 quark kernel:  ? select_task_rq_fair
Aug 01 08:59:33 quark kernel:  ? rtnetlink_bind+0x30/0x30
Aug 01 08:59:33 quark kernel:  netlink_rcv_skb+0xb5/0xf0
Aug 01 08:59:33 quark kernel:  netlink_unicast+0x230/0x330
Aug 01 08:59:33 quark kernel:  netlink_sendmsg+0x3b1/0x460
Aug 01 08:59:33 quark kernel:  ____sys_sendmsg
Aug 01 08:59:33 quark kernel:  ? chacha_block_generic+0x6a/0x130
Aug 01 08:59:33 quark kernel:  ___sys_sendmsg+0x282/0x2a0
Aug 01 08:59:33 quark kernel:  ? __fget_files+0x95/0xb0
Aug 01 08:59:33 quark kernel:  __se_sys_sendmsg+0xf4/0x120
Aug 01 08:59:33 quark kernel:  do_syscall_64+0x7e/0x130
Aug 01 08:59:33 quark kernel:  ? pollwake+0x52/0x60
Aug 01 08:59:33 quark kernel:  ? do_task_dead+0x50/0x50
Aug 01 08:59:33 quark kernel:  ? __wake_up_locked_key+0x48/0x70
Aug 01 08:59:33 quark kernel:  ? eventfd_write+0x193/0x1b0
Aug 01 08:59:33 quark kernel:  ? syscall_exit_to_user_mode+0x93/0xc0
Aug 01 08:59:33 quark kernel:  ? vfs_write+0xfa/0x3d0
Aug 01 08:59:33 quark kernel:  ? __fget_files+0x95/0xb0
Aug 01 08:59:33 quark kernel:  ? __fget_files+0x95/0xb0
Aug 01 08:59:33 quark kernel:  ? ksys_write+0x8f/0xb0
Aug 01 08:59:33 quark kernel:  ? arch_exit_to_user_mode_prepare+0x11/0x50
Aug 01 08:59:33 quark kernel:  ? syscall_exit_to_user_mode+0x93/0xc0
Aug 01 08:59:33 quark kernel:  ? do_syscall_64+0x8a/0x130
Aug 01 08:59:33 quark kernel:  ? syscall_exit_to_user_mode+0x93/0xc0
Aug 01 08:59:33 quark kernel:  ? do_syscall_64+0x8a/0x130
Aug 01 08:59:33 quark kernel:  ? do_syscall_64+0x8a/0x130
Aug 01 08:59:33 quark kernel:  ? do_syscall_64+0x8a/0x130
Aug 01 08:59:33 quark kernel:  ? arch_exit_to_user_mode_prepare+0x11/0x50
Aug 01 08:59:33 quark kernel:  entry_SYSCALL_64_after_hwframe+0x4b/0x53
Aug 01 08:59:33 quark kernel: RIP: 0033:0x7f4264d31fae
Aug 01 08:59:33 quark kernel: Code: 20 89 54 24 1c 48 89 74 24 10 89
7c 24 08 e8 a9 75 f7 ff 41 89 c0 8b 54 24 1c 48 8b 74 24 10 b8 2e 00
00 00 8b 7c 24 08 0f 05 <48> 3d 00 f0 ff ff 77 3a 44 89 c7 48 89 44 24
08 e8 fd 75 f7 ff 48
Aug 01 08:59:33 quark kernel: RSP: 002b:00007ffff4b1afa0 EFLAGS:
00000293 ORIG_RAX: 000000000000002e
Aug 01 08:59:33 quark kernel: RAX: ffffffffffffffda RBX:
000055c35260c570 RCX: 00007f4264d31fae
Aug 01 08:59:33 quark kernel: RDX: 0000000000000000 RSI:
00007ffff4b1afe0 RDI: 000000000000000d
Aug 01 08:59:33 quark kernel: RBP: 00007ffff4b1b050 R08:
0000000000000000 R09: 0000000000000000
Aug 01 08:59:33 quark kernel: R10: 000000000000009d R11:
0000000000000293 R12: 0000000000000004
Aug 01 08:59:33 quark kernel: R13: 0000000000000000 R14:
0000000000000000 R15: 0000000000000000
Aug 01 08:59:33 quark kernel:  </TASK>
Aug 01 08:59:33 quark kernel: Modules linked in:
Aug 01 08:59:33 quark kernel: CR2: 0000000000000008
Aug 01 08:59:33 quark kernel: ---[ end trace 0000000000000000 ]---
Aug 01 08:59:33 quark kernel: RIP: 0010:mt7921_ipv6_addr_change
Aug 01 08:59:33 quark kernel: Code: 41 57 41 56 41 54 53 48 83 e4 f0
48 83 ec 50 48 8b 86 70 09 00 00 0f b6 8e 90 04 00 00 4c 8d ba 68 02
00 00 49 89 d6 4c 89 ff <48> 8b 58 08 88 4c 24 04 66 c7 44 24 05 00 00
c6 44 24 07 00 66 c7
Aug 01 08:59:33 quark kernel: RSP: 0018:ffffc900069373b0 EFLAGS: 00010282
Aug 01 08:59:33 quark kernel: RAX: 0000000000000000 RBX:
ffff888106740920 RCX: 0000000000000000
Aug 01 08:59:33 quark kernel: RDX: ffff888106854800 RSI:
ffff88810bb35ca0 RDI: ffff888106854a68
Aug 01 08:59:33 quark kernel: RBP: ffffc90006937420 R08:
0000000000000000 R09: ffff888104c98200
Aug 01 08:59:33 quark kernel: R10: ffffffff7fff0000 R11:
0000000000000020 R12: 0000000000000002
Aug 01 08:59:33 quark kernel: R13: 0000000000000000 R14:
ffff888106854800 R15: ffff888106854a68
Aug 01 08:59:33 quark kernel: FS:  00007f4265049400(0000)
GS:ffff888c2df40000(0000) knlGS:0000000000000000
Aug 01 08:59:33 quark kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Aug 01 08:59:33 quark kernel: CR2: 0000000000000008 CR3:
0000000117250000 CR4: 0000000000350ef0
