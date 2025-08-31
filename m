Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E172494ED
	for <regressions@lists.linux.dev>; Sun, 31 Aug 2025 08:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756630242; cv=none; b=SvSviu52H/dKp0zNC4JFeQL97LZO9Ufx0/Xd9e9cN5kdfJmLkFWMby6nIBML7YUjxkeo9NugDpyVZ947g/4EO+ag4j4SXgUrjHBaOgq45e5HNEp9ZRit0Ix47fm/iY/Pw5a1c1PL5tqII5DEL8/ViMSEt94EZvYDl4ONDe2/PlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756630242; c=relaxed/simple;
	bh=62ZRVz/a+iniPXqEtHjttYlsm229Roujk0h7I8/fUu8=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject; b=eQ8fC0q2Bg2GrBz1zRt4uRuZ25hAwlgSE+YakXjWL2knKh+hfHskQY6y9Fcm0RwISQ1CEIzaUFSL25koUZCmvYvXXlAxXjaaiyKymXE9c4r18fb/8DWj4eJ4L3Yat2wD+9mSCtbdlOmw2CUqFDNnzG8xAEqNUQ/+9hBTHY97YnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gVeTnjzK; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gVeTnjzK"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45b869d3571so582915e9.1
        for <regressions@lists.linux.dev>; Sun, 31 Aug 2025 01:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756630238; x=1757235038; darn=lists.linux.dev;
        h=subject:cc:to:from:message-id:date:content-transfer-encoding
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SDzUuUDnSod+LyxqsRnFLfeinRJ17SRAkYjqkM4gx88=;
        b=gVeTnjzKxyTD70lgipWuAxbGG1+7JYnvtGRnn5oHxwfTwhfk038MVXEFYRtwMHVn/S
         qyAx2C8IX6EqUqYjaXa8ln+w6qvsM+erL0evUjJOrrh3s+qwAVOWbCaXK6J3Xfcz7WON
         zgH+WgkhLDUcbaZ/hi/wtujFDnKV3b7Uxtrup7ZwV1rwlUrtM/Lsdlo4D4+rMc/SIo+E
         1Y3JOPhZzvBbbXhGXy8ukmgH+sQrRh61dZ49LW2IMMrwunMnkAKasyWDYcIrMbGLPbNL
         ojZeiib3vdoMx7Eac87cLMj4ZQWEFLHP9Y0IbCWKQBlPH2XNnT0ZcSNyG8aNvF7F0SEr
         eUgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756630238; x=1757235038;
        h=subject:cc:to:from:message-id:date:content-transfer-encoding
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SDzUuUDnSod+LyxqsRnFLfeinRJ17SRAkYjqkM4gx88=;
        b=kofKjd/lQUABB348tDlNpi74luJgHy6ed2SsgHcmJcuJWYqeH/dbNK1AJ8TdMDiFlv
         88tzCoOC8ajMjxoPHwCXzuK/7XDJNLdsGc9coImXCtMvCrWMt9VCCPtMCURcWZHZQob2
         Ve9nhUERtnTppeFG0SqmD1laRFXDtWx8iyeJGUyK81sYhk48B6pqqlI962ACNs9h0q4s
         KjzX0S9a+X0sDGmjKg67IlxSvM7t4EfdQuesiBlW4DvCRm2a71sOSqes9Uaov7HGJ4cb
         21v9IrEKlVYsz8T8e/cpQlCmVXHgtjNwrZ7YqkTn8H/b57Y1z5wycYghbEzgWn2MpIbx
         HqBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZYB5vD3iue+PfvDJyL9eoVhlNnA5qZZaV86lEthztrYPaqu/caVqIjnpwLqnUxd0XFE/OjdNQu34W8Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyis5ct5VgMOvcuY5ujunFQelG5+IA6xfmlDm1vOJ8kM004XhWh
	dD+3wYDfz7GolD+yvTa9GHACaez+fGRRJOjv7ASCeu9ayLT6BF0Xb5bQ
X-Gm-Gg: ASbGnctvfWLJHbJDE14bmx9gksszyQXiFH7nUwiNS3CZT6S1lIocanPGcWgOqdvqufK
	UUGUk3OPeI33jAnqnHyxsdjIrRZz8w+/kg5iUBbqiz8JAg3Cfcgx2zA1OLDZCUBf86y9rwUO7Yo
	qsfm/FMoM6woT63ezvaO0Pe6ICSG1ww6VwoLrStLRRnqruWPhmoJdUOkfHdFnW+mZ2POKSVK3Hi
	rb+2eT/dMHNllh4omJAN+oLdqeKcnhanwjkIZFZRO3WIyprgPjt9TBOsA62L/lTeDnog0ICQHb7
	traua9VzA6GqjitpoqCcSZxKTCjNZ8YZvSuoyU3UwDN81YN2i5nc6EiRHU+2YPGtiIJFt+v2h6v
	K+I1GfG4LZBGj/rqv36H0GuBX1sEvDwhHVg3woWAbzjruXVS0ZWKqlr7/8yAv1cBVY1aW0aGvaS
	TlW0B2a9BTphFg
X-Google-Smtp-Source: AGHT+IFVKA49diDb1kHmVgVOw4Z/GlIBlMufFjdRe8fWtG1R/vlyL6dSlDFFSWc04qEN0fBFzYQQEw==
X-Received: by 2002:a05:600c:4f87:b0:45b:8482:5ad4 with SMTP id 5b1f17b1804b1-45b855341femr29104325e9.13.1756630237982;
        Sun, 31 Aug 2025 01:50:37 -0700 (PDT)
Received: from localhost (public-gprs292944.centertel.pl. [31.62.31.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e74b72esm110605875e9.0.2025.08.31.01.50.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 Aug 2025 01:50:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 31 Aug 2025 10:50:35 +0200
Message-Id: <DCGHG5UJT9G3.2K1GHFZ3H87T0@gmail.com>
From: =?utf-8?q?Hubert_Wi=C5=9Bniewski?= <hubert.wisniewski.25632@gmail.com>
To: "Andrew Lunn" <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, "Eric Dumazet" <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Oleksij
 Rempel" <linux@rempel-privat.de>
Cc: <linux-usb@vger.kernel.org>, <netdev@vger.kernel.org>,
 <regressions@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: [REGRESSION] net: usb: asix: deadlock on interface setup
X-Mailer: aerc 0.20.0

Trying to bring an AX88772B-based USB-Ethernet adapter up results in a
deadlock if the adapter was suspended at the time. Most network-related
software hangs up indefinitely as a result. This can happen on systems
which configure USB power control to 'auto' by default, e.g. laptops
running `tlp`.


Steps to reproduce:
  Try to bring the interface up while the adapter is suspended. For
  example, assuming that the device is on bus 1, port 1:
    root@usb-eth-test:/sys/bus/usb/devices/1-1/power# echo auto > control
    root@usb-eth-test:/sys/bus/usb/devices/1-1/power# cat runtime_status
    suspended
    root@usb-eth-test:/sys/bus/usb/devices/1-1/power# ip link set enp0s1u1 =
up


Expectations vs reality:
  The interface should be brought up and be able to operate, but instead
  the `ip` command hangs up and never returns, and lockdep emits the
  following warning (decoded here):
    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
    WARNING: possible recursive locking detected
    6.17.0-rc3 #1 Not tainted
    --------------------------------------------
    ip/273 is trying to acquire lock:
    ffffffffb906e748 (rtnl_mutex){+.+.}-{4:4}, at: ax88772_resume (drivers/=
net/usb/asix_devices.c:650)

    but task is already holding lock:
    ffffffffb906e748 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_newlink (net/core/r=
tnetlink.c:3893 net/core/rtnetlink.c:4057)

    other info that might help us debug this:
    Possible unsafe locking scenario:

    CPU0
    ----
    lock(rtnl_mutex);
    lock(rtnl_mutex);

    *** DEADLOCK ***

    May be due to missing lock nesting notation

    1 lock held by ip/273:
    #0: ffffffffb906e748 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_newlink (net/co=
re/rtnetlink.c:3893 net/core/rtnetlink.c:4057)

    stack backtrace:
    CPU: 0 UID: 0 PID: 273 Comm: ip Not tainted 6.17.0-rc3 #1 PREEMPT(volun=
tary)
    Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-=
1.16.3-2 04/01/2014
    Call Trace:
    <TASK>
    dump_stack_lvl (lib/dump_stack.c:122)
    print_deadlock_bug.cold (kernel/locking/lockdep.c:3044)
    __lock_acquire (kernel/locking/lockdep.c:3897 kernel/locking/lockdep.c:=
5237)
    ? usb_start_wait_urb (drivers/usb/core/message.c:83)
    lock_acquire (kernel/locking/lockdep.c:470 (discriminator 4) kernel/loc=
king/lockdep.c:5870 (discriminator 4) kernel/locking/lockdep.c:5825 (discri=
minator 4))
    ? ax88772_resume (drivers/net/usb/asix_devices.c:650)
    __mutex_lock (arch/x86/include/asm/jump_label.h:36 include/trace/events=
/lock.h:95 kernel/locking/mutex.c:600 kernel/locking/mutex.c:760)
    ? ax88772_resume (drivers/net/usb/asix_devices.c:650)
    ? ax88772_resume (drivers/net/usb/asix_devices.c:650)
    ? __usbnet_read_cmd (drivers/net/usb/usbnet.c:2065)
    ? ax88772_resume (drivers/net/usb/asix_devices.c:650)
    ? srso_alias_return_thunk (arch/x86/lib/retpoline.S:183)
    ax88772_resume (drivers/net/usb/asix_devices.c:650)
    asix_resume (drivers/net/usb/asix_devices.c:663)
    usb_resume_interface.isra.0 (drivers/usb/core/driver.c:1375)
    usb_resume_both (drivers/usb/core/driver.c:1532 (discriminator 1))
    ? __pfx_usb_runtime_resume (drivers/usb/core/driver.c:1981)
    __rpm_callback (drivers/base/power/runtime.c:406)
    ? srso_alias_return_thunk (arch/x86/lib/retpoline.S:183)
    ? srso_alias_return_thunk (arch/x86/lib/retpoline.S:183)
    rpm_callback (include/linux/sched/mm.h:339 (discriminator 1) include/li=
nux/sched/mm.h:369 (discriminator 1) drivers/base/power/runtime.c:458 (disc=
riminator 1))
    ? __pfx_usb_runtime_resume (drivers/usb/core/driver.c:1981)
    rpm_resume (drivers/base/power/runtime.c:934)
    ? srso_alias_return_thunk (arch/x86/lib/retpoline.S:183)
    ? lock_release (kernel/locking/lockdep.c:5536 kernel/locking/lockdep.c:=
5889 kernel/locking/lockdep.c:5875)
    rpm_resume (drivers/base/power/runtime.c:913)
    __pm_runtime_resume (include/linux/spinlock.h:406 drivers/base/power/ru=
ntime.c:1193)
    usb_autopm_get_interface (include/linux/pm_runtime.h:532 drivers/usb/co=
re/driver.c:1828)
    usbnet_open (drivers/net/usb/usbnet.c:899)
    __dev_open (net/core/dev.c:1684)
    __dev_change_flags (net/core/dev.c:9549)
    netif_change_flags (net/core/dev.c:9612)
    do_setlink.isra.0 (net/core/rtnetlink.c:3143 (discriminator 1))
    ? lock_release (kernel/locking/lockdep.c:5536 kernel/locking/lockdep.c:=
5889 kernel/locking/lockdep.c:5875)
    ? rtnl_newlink (net/core/rtnetlink.c:3893 net/core/rtnetlink.c:4057)
    ? srso_alias_return_thunk (arch/x86/lib/retpoline.S:183)
    ? __mutex_lock (include/trace/events/lock.h:122 (discriminator 2) kerne=
l/locking/mutex.c:607 (discriminator 2) kernel/locking/mutex.c:760 (discrim=
inator 2))
    ? srso_alias_return_thunk (arch/x86/lib/retpoline.S:183)
    ? rtnl_newlink (net/core/rtnetlink.c:3893 net/core/rtnetlink.c:4057)
    ? lock_release (kernel/locking/lockdep.c:5536 kernel/locking/lockdep.c:=
5889 kernel/locking/lockdep.c:5875)
    rtnl_newlink (net/core/rtnetlink.c:3761 (discriminator 1) net/core/rtne=
tlink.c:3920 (discriminator 1) net/core/rtnetlink.c:4057 (discriminator 1))
    ? lock_acquire (kernel/locking/lockdep.c:470 (discriminator 4) kernel/l=
ocking/lockdep.c:5870 (discriminator 4) kernel/locking/lockdep.c:5825 (disc=
riminator 4))
    ? srso_alias_return_thunk (arch/x86/lib/retpoline.S:183)
    ? find_held_lock (kernel/locking/lockdep.c:5350 (discriminator 1))
    ? rtnetlink_rcv_msg (include/linux/rcupdate.h:341 (discriminator 1) inc=
lude/linux/rcupdate.h:871 (discriminator 1) net/core/rtnetlink.c:6944 (disc=
riminator 1))
    ? __pfx_rtnl_newlink (net/core/rtnetlink.c:3948)
    ? srso_alias_return_thunk (arch/x86/lib/retpoline.S:183)
    ? rtnetlink_rcv_msg (net/core/rtnetlink.c:6945)
    ? srso_alias_return_thunk (arch/x86/lib/retpoline.S:183)
    ? __pfx_rtnetlink_rcv_msg (net/core/rtnetlink.c:6849)
    netlink_rcv_skb (net/netlink/af_netlink.c:2552)
    netlink_unicast (net/netlink/af_netlink.c:1321 net/netlink/af_netlink.c=
:1346)
    netlink_sendmsg (net/netlink/af_netlink.c:1896)
    ____sys_sendmsg (net/socket.c:714 (discriminator 1) net/socket.c:729 (d=
iscriminator 1) net/socket.c:2614 (discriminator 1))
    ___sys_sendmsg (net/socket.c:2670)
    ? lock_release (kernel/locking/lockdep.c:5536 kernel/locking/lockdep.c:=
5889 kernel/locking/lockdep.c:5875)
    __sys_sendmsg (net/socket.c:2700 (discriminator 1))
    ? srso_alias_return_thunk (arch/x86/lib/retpoline.S:183)
    do_syscall_64 (arch/x86/entry/syscall_64.c:63 (discriminator 1) arch/x8=
6/entry/syscall_64.c:94 (discriminator 1))
    entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130)
    RIP: 0033:0x7fddcbcb2687
    Code: 48 89 fa 4c 89 df e8 58 b3 00 00 8b 93 08 03 00 00 59 5e 48 83 f8=
 fc 74 1a 5b c3 0f 1f 84 00 00 00 00 00 48 8b 44 24 10 0f 05 <5b> c3 0f 1f =
80 00 00 00 00 83 e2 39 83 fa 08 75 de e8 23 ff ff ff
    All code
    =3D=3D=3D=3D=3D=3D=3D=3D
       0:	48 89 fa             	mov    %rdi,%rdx
       3:	4c 89 df             	mov    %r11,%rdi
       6:	e8 58 b3 00 00       	call   0xb363
       b:	8b 93 08 03 00 00    	mov    0x308(%rbx),%edx
      11:	59                   	pop    %rcx
      12:	5e                   	pop    %rsi
      13:	48 83 f8 fc          	cmp    $0xfffffffffffffffc,%rax
      17:	74 1a                	je     0x33
      19:	5b                   	pop    %rbx
      1a:	c3                   	ret
      1b:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
      22:	00
      23:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
      28:	0f 05                	syscall
      2a:*	5b                   	pop    %rbx		<-- trapping instruction
      2b:	c3                   	ret
      2c:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
      33:	83 e2 39             	and    $0x39,%edx
      36:	83 fa 08             	cmp    $0x8,%edx
      39:	75 de                	jne    0x19
      3b:	e8 23 ff ff ff       	call   0xffffffffffffff63

    Code starting with the faulting instruction
    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
       0:	5b                   	pop    %rbx
       1:	c3                   	ret
       2:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
       9:	83 e2 39             	and    $0x39,%edx
       c:	83 fa 08             	cmp    $0x8,%edx
       f:	75 de                	jne    0xffffffffffffffef
      11:	e8 23 ff ff ff       	call   0xffffffffffffff39
    RSP: 002b:00007fffad1c7b60 EFLAGS: 00000202 ORIG_RAX: 000000000000002e
    RAX: ffffffffffffffda RBX: 00007fddcba85840 RCX: 00007fddcbcb2687
    RDX: 0000000000000000 RSI: 00007fffad1c7c10 RDI: 0000000000000003
    RBP: 00007fffad1c7c10 R08: 0000000000000000 R09: 0000000000000000
    R10: 0000000000000000 R11: 0000000000000202 R12: 00007fffad1c8300
    R13: 0000000000000000 R14: 0000555b0fa13020 R15: 0000000000000000
    </TASK>


Details:
  I have used QEMU with USB passthrough to catch the issue, but this
  happens on real hardware as well.

  The bug has already been reported on bugzilla
  (https://bugzilla.kernel.org/show_bug.cgi?id=3D215199), but this was
  probably not the right place.

  USB device: Edimax USB 2.0 Fast Ethernet Adapter, model no. EU-4208
  USB device IDs: 0b95:772b ASIX Electronics Corp. AX88772B

  Kernel version (/proc/version):
    Linux version 6.17.0-rc3 (hubert25632@B550M-AE) (gcc (Debian 14.2.0-19)
    14.2.0, GNU ld (GNU Binutils for Debian) 2.44) #1 SMP PREEMPT_DYNAMIC
    Sat Aug 30 21:43:30 CEST 2025

  iproute2 version: ip utility, iproute2-6.16.0, libbpf 1.6.2
  OS: Debian GNU/Linux forky/sid
  CPU architecture: x86_64
  Kernel config: https://pastebin.com/MiBZnCgC
  dmesg log: https://pastebin.com/JXiZTiAT

  Last good kernel version: v5.13
  First bad commit: 4a2c7217cd5a ("net: usb: asix: ax88772: manage PHY PM f=
rom MAC")


Possible workaroud:
  Users of `tlp` can add the following statement to `/etc/tlp.conf` to
  prevent the adapter from being suspended automatically:
    USB_DENYLIST=3D"0b95:772b"


#regzbot introduced: 4a2c7217cd5a
