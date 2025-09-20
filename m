Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F87264A76
	for <regressions@lists.linux.dev>; Sat, 20 Sep 2025 22:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758407325; cv=none; b=oY5SNZXiMnT9XQDp09p7eKXV4CEkUzWOS2chACeOYPVpqbLnWrUW77oCS/WKy93Rj4AOXvRLUFserHPeMFx//uXHMC4E4fas8czGzNIaWIZkRaLk6Hd+n/TN98PMflj535MBdTnV6DxlLkhAiOey7+MCXTcFC2evcqlxGoTLaW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758407325; c=relaxed/simple;
	bh=9gu6hJVAnIfRTHtgnZ0zrWIon8dUaef830KhxqL6EZs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fRLNRx21ckuhKuSf7lhbAgK/NxL6AECJ4gB2b79hTqDZkgw7lPWivqiFTBCAhDDMSnY2PX05rDvSMRn8Pg544WGU3dMemcsaU2fkQu4YhQMZaulN7v/Ra65iRXNdcRA2V7EFLaIYJ1VhybmuHkndtbfBGNBvUj57hO8vb/cXXMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fqxaGd0R; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fqxaGd0R"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-74595f3852cso2391691a34.0
        for <regressions@lists.linux.dev>; Sat, 20 Sep 2025 15:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758407322; x=1759012122; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nA0qvsHjha/KfwIagmo7Q/qF5pnKgf1p52tDDCS5guk=;
        b=fqxaGd0RkncgQhWgkADIpIr0ieVgtZd2Vu2SnCKwTq9ewRmd53HNWR7Uca0hWSDq5/
         ONwAPjEkXtCWw1afjKrGmQeUpDArJLxFkjGnlNPLgjhpxbMXs7Ai+BqN/ie4jn0JvEF6
         tFFKveRuTS33KrGpTzUQGqua9K6JlQREwuc/aEx8/wtFgNXeMULpSdK4BN/4qpRNcoIa
         rhmElJoS/UIMhRvQx7ptZGLLnmuhRyfB3CeT298PrOMW5YPizVbg8qCVz6yRZsLnr3Yj
         Tq4SG+z+Kw+TDyzrsZtwosehdcEUtBEp0myXnf/bcGDaMXXI3lPTGqNFNZ5hlSmQRwsi
         y9zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758407322; x=1759012122;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nA0qvsHjha/KfwIagmo7Q/qF5pnKgf1p52tDDCS5guk=;
        b=Jfstd0bhh2QUKcCCtefM59y+EdOtvLHQT83t4Ew1mqISTbdBiIKAG6ZmRrE/Q/LUV1
         4fXOqwEpwP+g65I//0s5/1LBb9K8vz/AkSlgtZLP5SE1xpXSRvBwloVz2Zk7iZSPE+sy
         W9SOguIde8iWsXIUEw7KThe04gRIimKI5WoBjcWk8XMxHdiMoAAh37WsazwLpQhZF/lz
         HS5StnKDjll0JovcaWONPFPyOpBdzZ0twrBA1iaWdg/kN6y10a95NSN7l+5WcZ5SF/nw
         EX/7QvHWsYt8I5KEr/8BkwuNloJQ4ThQM6kwXIImNA4Flum6MNGmNhTmXSYVKq9j8Ru6
         wD3g==
X-Forwarded-Encrypted: i=1; AJvYcCWrDdtZvgXIgqobWp7LsU34LtQZQjYx1hMEx+6r5tV4Ir20/D6qkxtA7YdC/7oKlW53z8b/+ddSSRJvRQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxpCTpyG3whSQxuesfrhMmQgEpuYCpywbEB/06c5b7JfcMPMVO4
	uRe7F41UfTOWJstYn2KGFd1DoTw+g1aqrwGItIDD0bsrz1XKcbH5A8KY
X-Gm-Gg: ASbGncuztMzXkwB3MYlXs39JzElBQdE0USAw1SL9/Ul/hXoh1P6Sc3j2FtzS3XggPJn
	vpWbn+JlT0VvZHkIHddLdAkehmGIUV9d+xzMzwFSNO15g/R3Do+XAo1KpLPQ1tFhL7c4Ie9bzMJ
	/Bz4xo4CQ9wJz+utevaJbAhBaQpvAwEn7mAGMrbUr6B4PhyzyT+tpMrL82W2WkeRsZbG0BH4B4u
	O3l+356NAOksreB5/kfHW5bXUiHNbNcBLkx3KqOLTAqy9EqJp7mmugBLvsjkFoHLf4leFcW97Jm
	iWBfoMWr1ezc5GBwZabc4682TdYJoaAEYbS0l8aCAfwMyoAn3X49jMS0mZUBntoz2+qR4fZ3V76
	lEXu5VA1GYl/ihqABa+RGugaTcL4OVZvZW8TKBUm5gTzzHjNDDZcwP4wEVTfKSd04gOoidI5wpa
	1zGR0V71yzOe+MW68d/5To4f6KQ3qausmmOrE=
X-Google-Smtp-Source: AGHT+IEQ4dNngj00vQnCTq2dGbkr6X6Uyiu6Awm/G2AhyR9r9uQMYSQ+ael8GKCRVsJEaC3eNEb/cQ==
X-Received: by 2002:a05:6830:398a:b0:74a:ed47:a2fd with SMTP id 46e09a7af769-76f70bfd509mr4198600a34.9.1758407322247;
        Sat, 20 Sep 2025 15:28:42 -0700 (PDT)
Received: from [10.0.11.20] (57-132-132-155.dyn.grandenetworks.net. [57.132.132.155])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7692c72528esm4150535a34.42.2025.09.20.15.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 15:28:41 -0700 (PDT)
Message-ID: <6980dba4ac0be1d6bbed8cb595d38114d89a14f5.camel@gmail.com>
Subject: Re: [REGRESSION] af_unix: Introduce SO_PASSRIGHTS - break OpenGL
From: brian.scott.sampson@gmail.com
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: christian@heusel.eu, davem@davemloft.net, difrost.kernel@gmail.com, 
	dnaim@cachyos.org, edumazet@google.com, horms@kernel.org, kuba@kernel.org, 
	kuni1840@gmail.com, linux-kernel@vger.kernel.org,
 mario.limonciello@amd.com, 	netdev@vger.kernel.org, pabeni@redhat.com,
 regressions@lists.linux.dev
Date: Sat, 20 Sep 2025 17:28:40 -0500
In-Reply-To: <20250920035146.2149127-1-kuniyu@google.com>
References: <caa08e5b15bc35b9f3c24f679c62ded1e8e58925.camel@gmail.com>
		 <20250920035146.2149127-1-kuniyu@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.0 (flatpak git) 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

> Thank you for your patience.
>=20
> I assumed SO_PASSCRED was the problem, but I missed
> SO_PASSCRED was also inherited durint accept().
>=20
> Could you apply this on top of the previous changes ?
>=20
> Also, could you tell what desktop manager and distro
> you are using ?=C2=A0 If this attempt fails, I'll try to
> reproduce with the same version on my desktop.

No worries! I just applied this patch as well(on top of the other two
in the order you originally provided), and still seeing the black
screen upon resume. I am seeing a stack trace now when I check
systemd's journal, which wasn't there before(not sure if its related).
I do have the System.map as well for this build, but not sure why
everything seemed to end up so cryptic. I'll paste it below as well as
my desktop:=C2=A0

Desktop Environment:=C2=A0Gnome 48.5=C2=A0
Window Manager: Mutter (Wayland)=C2=A0
Distribution: CachyOS


Trace:

=E2=9D=AF sudo journalctl -k -b -1 | grep "cut here" -A52 | awk -F 'kernel:=
 '
'{print $2}'
------------[ cut here ]------------
WARNING: CPU: 3 PID: 545 at net/core/sock.c:1548
sk_setsockopt+0x1709/0x1b50
Modules linked in: dm_mod crypto_user loop nfnetlink lz4 zram
842_decompress lz4hc_compress 842_compress lz4_compress amdgpu amdxcp
i2c_algo_bit drm_ttm_helper ttm drm_exec gpu_sched drm_suballoc_helper
video rtsx_pci_sdmmc mmc_core drm_panel_backlight_quirks nvme drm_buddy
nvme_core drm_display_helper serio_raw rtsx_pci nvme_keyring cec
nvme_auth wmi
CPU: 3 UID: 0 PID: 545 Comm: systemd-journal Not tainted 6.17.0-rc6-
local-00268-g3b08f56fbbb9-dirty #1 PREEMPT(full)=20
c74d467c5c838be6e0491dc375b7e67fc07dfcf3
Hardware name: Alienware Alienware m18 R1 AMD/0HR91K, BIOS 1.19.0
07/01/2025
RIP: 0010:sk_setsockopt+0x1709/0x1b50
Code: 00 e9 30 eb ff ff ba a1 ff ff ff e9 64 eb ff ff 0f b6 43 12 3c 0a
0f 85 d0 f3 ff ff 8b 83 b8 00 00 00 85 c0 0f 84 c2 f3 ff ff <0f> 0b e9
bb f3 ff ff 48 8d 7c 24 38 b9 08 00 00 00 4c 89 de 4c 89
RSP: 0018:ffffccbfc3e8bbf8 EFLAGS: 00010202
RAX: 0000000000000010 RBX: ffff8a3598268cc0 RCX: ffff8a35805db400
RDX: 0000000000000001 RSI: 0000000000000001 RDI: ffffffffadc442f3
RBP: ffffccbfc3e8bc98 R08: ffff8a35c4ed8000 R09: 0000000000000004
R10: 0000000000000010 R11: 00007ffeb08dc62c R12: 0000000000000000
R13: 0000000000000001 R14: 0000000000000001 R15: ffffccbfc3e8bd30
FS:  00007f47de2c7880(0000) GS:ffff8a3d0dc30000(0000)
knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f47de0bb910 CR3: 000000011431b000 CR4: 0000000000f50ef0
PKRU: 55555554
Call Trace:
 <TASK>
 ? __x64_sys_fcntl+0x80/0x110
 unix_setsockopt+0x42/0xd0
 ? security_socket_setsockopt+0x52/0x160
 do_sock_setsockopt+0xb2/0x190
 ? __seccomp_filter+0x41/0x4e0
 __sys_setsockopt+0x7b/0xc0
 __x64_sys_setsockopt+0x1f/0x30
 do_syscall_64+0x81/0x970
 ? srso_alias_return_thunk+0x5/0xfbef5
 ? srso_alias_return_thunk+0x5/0xfbef5
 ? do_syscall_64+0x81/0x970
 ? srso_alias_return_thunk+0x5/0xfbef5
 ? do_sock_getsockopt+0x1cc/0x210
 ? srso_alias_return_thunk+0x5/0xfbef5
 ? __sys_getsockopt+0x77/0xc0
 ? srso_alias_return_thunk+0x5/0xfbef5
 ? srso_alias_return_thunk+0x5/0xfbef5
 ? do_syscall_64+0x81/0x970
 ? srso_alias_return_thunk+0x5/0xfbef5
 ? do_syscall_64+0x81/0x970
 ? srso_alias_return_thunk+0x5/0xfbef5
 ? exc_page_fault+0x7e/0x1a0
 entry_SYSCALL_64_after_hwframe+0x76/0x7e
RIP: 0033:0x7f47ddb42b4e
Code: 48 83 ec 10 48 63 c9 48 63 ff 45 89 c9 6a 2c e8 48 39 f6 ff 48 83
c4 18 c3 0f 1f 00 f3 0f 1e fa 49 89 ca b8 36 00 00 00 0f 05 <48> 3d 00
f0 ff ff 77 0a c3 66 0f 1f 84 00 00 00 00 00 48 8b 15 81
RSP: 002b:00007ffeb08dc618 EFLAGS: 00000202 ORIG_RAX: 0000000000000036
RAX: ffffffffffffffda RBX: 000055798b740c40 RCX: 00007f47ddb42b4e
RDX: 0000000000000010 RSI: 0000000000000001 RDI: 0000000000000005
RBP: 00007ffeb08dc630 R08: 0000000000000004 R09: 0000000000000000
R10: 00007ffeb08dc62c R11: 0000000000000202 R12: 0000000000000005
R13: 00007ffeb08dc6d0 R14: 0000000000000006 R15: 0000000000000000
 </TASK>
---[ end trace 0000000000000000 ]---




