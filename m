Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA117C
	for <regressions@lists.linux.dev>; Fri, 10 Jun 2022 10:19:08 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id y196so23473188pfb.6
        for <regressions@lists.linux.dev>; Fri, 10 Jun 2022 03:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=flqxXimirowJNuglzm+iY8eAyFjqn/H8IHiW8NGofj8=;
        b=k4V/F0UpVf5FPEViUMa9+6OpFwNk3APclZ9Irscks57/L60qsd7+x9Sy20qecljkg0
         t/eMXZhTDl3sYX8xEoGzFZGJoXUIYQO208QnbyRjjkyxIlN3ZwI9uzXgb8ZRuKZceE2/
         dfgjk6s89T7GH2bVMzOou2eRPYCgKb21Jh5McwnsfVs1n7x3nflw3zs+4R0i/KKIO1A8
         tZRiHjkk2bVv8mMgTdD7DfKfkS4o1hy1wSH6xgjD5F72n1PmStQeYCC6QzaAMRAMuknm
         GHJxgNhAgZHrfFlcaN9ILbxCYs0nzoJvsTFe/v3hw4Sq1XYewFdJAGSnJWN9h7HYxc2t
         Wd6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=flqxXimirowJNuglzm+iY8eAyFjqn/H8IHiW8NGofj8=;
        b=J3ghuYb+4qybbYsqHdI5GVPKqH9Tp7X1tbFxnlWVkaIblOvf6WDFl9zXgVIIl+H8MK
         XDKimoUPBdZEE0Mz84Jcqt6gqEnYBR8vu+SPX65AeZGKTySAemTjtpqXtc5J6o/SHMgq
         bsLqfHr4Y3s9kSQ56+NS+sSLS6vlYcshXZ0eN/97jzU/zNx7QI2JpvxjckN5G/DY6LUO
         8SANIZTTA8V8QTyba2xB46cjJxFcyEZWGHbBzPe+b1cZ9DTZ5bf7unZJ/+myrQ5VQ/FA
         qnciieLd4vtEnSYmjkhO1GqOkMhImNdfpdPZCuvLsF+K7Xs9NMGB+9Y5I5AoRvvOpZzb
         h9Hw==
X-Gm-Message-State: AOAM5313+WBqp+dVK74aMHXCd3GtLCq/cSmZfZAiCw0gIsq0eq2JCX8a
	qk1V5jfRBh81Siimd0MMRUL956/B9IIJHmMyRgg=
X-Google-Smtp-Source: ABdhPJxa+1PaIzV2SeWigAArIofszMuUuXi5NI4JHc2ZHMW4CWRJLhwxIP8UvpeEC0m0DrWf37kh2iRcU7JomNB1LkY=
X-Received: by 2002:a63:f942:0:b0:402:42f3:6200 with SMTP id
 q2-20020a63f942000000b0040242f36200mr3095695pgk.192.1654856348237; Fri, 10
 Jun 2022 03:19:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Alex Natalsson <harmoniesworlds@gmail.com>
Date: Fri, 10 Jun 2022 13:18:56 +0300
Message-ID: <CADs9LoMEF86Fp2-0ji7d9CNA5F=8ArwPWnj09h_Cwo6poNsWVA@mail.gmail.com>
Subject: echo mem > /sys/power/state write error "Device or resource busy" on
 Amlogic A311D device
To: stable@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello friends.
Suspend to RAM on Amlogic A311D chip (Khadas VIM3 SBC) was broken with
5.17.13 and with 5.18.2 it also presents.

When I trying do this I recieve error message:
VIM3 ~ # LANG=C echo mem > /sys/power/state
[  952.824117] PM: suspend entry (deep)
[  952.828333] Filesystems sync: 0.003 seconds
[  952.829473] Freezing user space processes ...
[  972.833509] Freezing of tasks failed after 20.003 seconds (1 tasks
refusing to freeze, wq_busy=0):
[  972.841178] task:mplayer         state:D stack:    0 pid:  779
ppid:   736 flags:0x00000205
[  972.849457] Call trace:
[  972.851868]  __switch_to+0xf8/0x150
[  972.855315]  __schedule+0x1f8/0x570
[  972.858758]  schedule+0x48/0xc0
[  972.861856]  schedule_preempt_disabled+0x10/0x20
[  972.866417]  __mutex_lock.constprop.0+0x158/0x590
[  972.871071]  __mutex_lock_slowpath+0x14/0x20
[  972.875296]  mutex_lock+0x5c/0x70
[  972.878573]  dpcm_fe_dai_open+0x44/0x194
[  972.882456]  snd_pcm_open_substream+0xa4/0x174
[  972.886857]  snd_pcm_open.part.0+0xd8/0x1dc
[  972.890994]  snd_pcm_playback_open+0x64/0x94
[  972.895223]  snd_open+0xac/0x1d0
[  972.898411]  chrdev_open+0xdc/0x2c4
[  972.901861]  do_dentry_open+0x12c/0x380
[  972.905652]  vfs_open+0x30/0x3c
[  972.908758]  do_open+0x1e4/0x3a0
[  972.911948]  path_openat+0x10c/0x280
[  972.915486]  do_filp_open+0x80/0x130
[  972.919019]  do_sys_openat2+0xb4/0x170
[  972.922731]  __arm64_sys_openat+0x64/0xb0
[  972.926700]  invoke_syscall+0x48/0x114
[  972.930421]  el0_svc_common.constprop.0+0xd4/0xfc
[  972.935070]  do_el0_svc+0x28/0x90
[  972.938347]  el0_svc+0x34/0xb0
[  972.941367]  el0t_64_sync_handler+0xa4/0x130
[  972.945595]  el0t_64_sync+0x18c/0x190

[  972.950674] OOM killer enabled.
[  972.953781] Restarting tasks ... done.
-bash: echo: write error: Device or resource busy
VIM3 ~ :( #

With 5.16.2 kernel version suspend to RAM is working, but system very
slow after resume.
