Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D49216430
	for <regressions@lists.linux.dev>; Tue, 12 Sep 2023 12:29:38 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-31ae6bf91a9so5602594f8f.2
        for <regressions@lists.linux.dev>; Tue, 12 Sep 2023 05:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694521777; x=1695126577; darn=lists.linux.dev;
        h=mime-version:message-id:cc:to:subject:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=R9IuEw4G9LWwDgWkkTsMBJnIy6GFGBJ28aUkaVyc45w=;
        b=fw2XQBzYYB3LSK3TboNUVV7P81X7bLJt7unsHU2HmATEjNZtWdB8LR+XAYMPZS1Pe0
         8g+BLZFZnFUM8YbY9PbSCyS2qtidUN6El3KQsfgr9f1tOfKnSXFFw7ooCd46ZjIagpHC
         kC7tLJZCbFqdWeHx8tHltQ1gp4UJGO91tAbkP4Qr8zu1ivhtpy1AgN4grtpA+plXMKcN
         bJJ5yJe0gBKkPKe1+vRZcLi5UpRMlBw/F2O6nzh8xQvqTlWcCIL6xmw86pn15DKRiXvM
         9G1ktGK2QChFZQCmVCFQD3fStgmhuck6heFicpn1UhohneYJ1qTz3ciYuzj86r5PvtcO
         fW9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694521777; x=1695126577;
        h=mime-version:message-id:cc:to:subject:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R9IuEw4G9LWwDgWkkTsMBJnIy6GFGBJ28aUkaVyc45w=;
        b=vG8eQ0SUWMFDDs7cLA5ub02boMrO9KmSx9qkoJi7d6iRTNxgrWu6BFrATFSvsk+GOq
         n9qdiaicHP6lhRNp1JCnaLeMFIgR2uRD6pUPGujsvKcR7292k++Y19KF5rGoDPD3OEoI
         1IofoYVmmAPoamDtCjXnBmS7WeFDK0VzwZbT+YnSMHmgVIX1P9AKpdf8XzYA6exvxaQ/
         GX7ttYB07rmucORVVT6lcRLLKTW3evGLZ+gijfznK0H3gLKpgP9fHUF81jIWMoVSCQrH
         AvN1IFsKMw+0aCMc0FA+jDWr6kXmUpoSTWi79Koes4LVjlLo9DMliAP8S/6Jyp0oNPmE
         5O4A==
X-Gm-Message-State: AOJu0YyigPZO/TlYXPZbxBQ9m45j9cimaGq3c5kj0Qlz9au9sMwAuQhN
	kLov0nWvVi0ZvphJL7XfYY4=
X-Google-Smtp-Source: AGHT+IEzzh91BX3W97ldgbmINVWNcJhn9/xYPrxDri1Hu+B+eA5d2IN7V8Y33pF7Dwo7/aiEVn5ytw==
X-Received: by 2002:adf:cd0b:0:b0:317:3b13:94c3 with SMTP id w11-20020adfcd0b000000b003173b1394c3mr10518864wrm.41.1694521776281;
        Tue, 12 Sep 2023 05:29:36 -0700 (PDT)
Received: from [192.168.1.7] (82-64-78-170.subs.proxad.net. [82.64.78.170])
        by smtp.gmail.com with ESMTPSA id e12-20020a5d594c000000b0031ad5470f89sm12645807wri.18.2023.09.12.05.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 05:29:35 -0700 (PDT)
Date: Tue, 12 Sep 2023 14:29:29 +0200
From: Paul Grandperrin <paul.grandperrin@gmail.com>
Subject: Regression since 6.1.46 (commit 8ee39ec): rtsx_pci from
 drivers/misc/cardreader breaks NVME power state, preventing system boot
To: stable@vger.kernel.org
Cc: regressions@lists.linux.dev, Wei WANG <wei_wang@realsil.com.cn>,
	Roger Tseng <rogerable@realtek.com>, Ricky WU <ricky_wu@realtek.com>
Message-Id: <5DHV0S.D0F751ZF65JA1@gmail.com>
X-Mailer: geary/43.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed

Hi kernel maintainers!

My computer doesn't boot with kernels newer than 6.1.45.

Here's what happens:
- system boots in initramfs
- detects my encrypted ZFS pool and asks for password
- mount system, pivots to it, starts real init
- before any daemon had time to start, the system hangs and the kernel 
writes on the console
"nvme 0000:04:00.0: Unable to change power state from D3cold to D0, 
device inaccessible"
- if I reboot directly without powering off (using magic sysrq or 
panic=10), even the UEFI complains about not finding any storage to 
boot from.
- after a real power off, I can boot using a kernel <= 6.1.45.

The bug has been discussed here: 
https://bugzilla.kernel.org/show_bug.cgi?id=217705

My laptop is a Dell XPS 15 9560 (Intel 7700hq).

I bisected between 6.1.45 and 6.1.46 and found this commit

commit 8ee39ec479147e29af704639f8e55fce246ed2d9
Author: Ricky WU <ricky_wu@realtek.com>
Date:   Tue Jul 25 09:10:54 2023 +0000

    misc: rtsx: judge ASPM Mode to set PETXCFG Reg

    commit 101bd907b4244a726980ee67f95ed9cafab6ff7a upstream.

    ASPM Mode is ASPM_MODE_CFG need to judge the value of clkreq_0
    to set HIGH or LOW, if the ASPM Mode is ASPM_MODE_REG
    always set to HIGH during the initialization.

    Cc: stable@vger.kernel.org
    Signed-off-by: Ricky Wu <ricky_wu@realtek.com>
    Link: 
https://lore.kernel.org/r/52906c6836374c8cb068225954c5543a@realtek.com
    Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

 drivers/misc/cardreader/rts5227.c  |  2 +-
 drivers/misc/cardreader/rts5228.c  | 18 ------------------
 drivers/misc/cardreader/rts5249.c  |  3 +--
 drivers/misc/cardreader/rts5260.c  | 18 ------------------
 drivers/misc/cardreader/rts5261.c  | 18 ------------------
 drivers/misc/cardreader/rtsx_pcr.c |  5 ++++-
 6 files changed, 6 insertions(+), 58 deletions(-)

If I build 6.1.51 with this commit reverted, my laptop works again, 
confirming that this commit is to blame.

Also, blacklisting `rtsx_pci_sdmmc` and `rtsx_pci`, while preventing to 
use the sd card reading, allows to boot the system.

I can't try 6.4 or 6.5 because my system is dependent on ZFS..

Have a nice day,
Paul Grandperrin


