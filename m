Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567034C75
	for <regressions@lists.linux.dev>; Wed, 23 Aug 2023 11:14:12 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1bf6ea270b2so22995255ad.0
        for <regressions@lists.linux.dev>; Wed, 23 Aug 2023 04:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692789251; x=1693394051;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4qBzTYpIaY0eNPOXEfLhPS1Eq02rOoxrsLBeQtRmQkI=;
        b=R/mEGaiawMIbszpvQxLNPN68CM1+qQNzewkt3WGF8+56pXjm/OzuAXNhQ7uf/5ArUS
         kDlkW7/jybJUdp5VQgCgtIu96diGeTiBlxW1oFSFqImLtDfVIOaJVaE4kfU+G6quW6pJ
         shs64jHufCYLfV2naz7xMrn+EWzjOfYWhFcwz8A45h4MTUqtwHuWxJSwoWTWsJWnLzQ9
         0LmpjQtOCZ6aiIoBvPMLuQMzDPhbZr1ql3lOeN8UiguziWnAk06Ye7lnlrtj/JXxLG0D
         RJBa6mz2O0z8Li2ERBkHUoV0fXU2mdlNC731frugQ925YcFbGIj9QeAYX6m2HLHoul93
         x+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692789251; x=1693394051;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4qBzTYpIaY0eNPOXEfLhPS1Eq02rOoxrsLBeQtRmQkI=;
        b=IZNDGm9DoTU/hfMef4Uu9sLwexGHbipE4YBLhG6r6qEWjsbnb/onKbSbbKjbP6BQj/
         Tq43mwFuPpupDV7i6pxRYdgM5ceKaJOvFmckRlOpreTp/mm6G63TUi2Sdmynd8sikN4+
         gXRqWrQMrzkQrhlu7K2tk3xFTcFZHxzxV4NlHQaE3nzfgIcxIj4JExjpq2Fc1yVwD6JQ
         dqLlf7AMljXQ4xWj/K5n9ozGzBHPGkQZgjJMedcBy3agcmEaCdhV+35w6cHoKbVRYDvO
         484wzwYhSJVbviMu/aUsnhjtsyY2MklqDJuaNUD6+0k+gACTrbiInz0iyz2qV6fzLMm3
         s40Q==
X-Gm-Message-State: AOJu0Yz5gCCK01qFYQFGi8f1SFTIEW5/GLzcainfGG32+30W/dQBUlSL
	/Qte/2qd44P3908LmHKhTho=
X-Google-Smtp-Source: AGHT+IFQ4GfEQHwFW5B3P9gxyx57bQiXP0/ODLLyX8/UN4QA56F0uCMfoyrIu93LoDEqTbavxCLKDg==
X-Received: by 2002:a17:902:d705:b0:1bb:1523:b311 with SMTP id w5-20020a170902d70500b001bb1523b311mr8326641ply.41.1692789251390;
        Wed, 23 Aug 2023 04:14:11 -0700 (PDT)
Received: from [192.168.0.105] ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id 4-20020a170902c24400b001bf10059251sm10611051plg.239.2023.08.23.04.14.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Aug 2023 04:14:10 -0700 (PDT)
Message-ID: <d9255749-bf1e-c498-ace6-048d36fa962f@gmail.com>
Date: Wed, 23 Aug 2023 18:14:03 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To: Chuck Lever <chuck.lever@oracle.com>, Jeff Layton <jlayton@kernel.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Anna Schumaker <anna@kernel.org>, greg@greg.net.au
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux Network File System <linux-nfs@vger.kernel.org>
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: kernel 6.4/6.5 nfs 4.1 unresponsive
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I notice a regression report on Bugzilla [1]. Quoting from it:

> I have two Synology Disk station NAS devices with NFS mounts present on Gentoo servers with the following fstab mount configuration:
> 
> 10.200.1.247:/volume1/filer02-sata      /mnt/filer02-sata       nfs     vers=4.1,tcp,rsize=32768,wsize=32768,nolock,noatime,nodiratime,hard,timeo=60,retry=6,retrans=6,nconnect=4 0 0
> 10.200.1.247:/volume1/filer03-sata      /mnt/filer03-sata       nfs     vers=4.1,tcp,rsize=32768,wsize=32768,nolock,noatime,nodiratime,hard,timeo=60,retry=6,retrans=6,nconnect=4 0 0
> 10.200.1.246:/volume1/filer04-sata      /mnt/filer04-sata       nfs     vers=4.1,tcp,rsize=32768,wsize=32768,nolock,noatime,nodiratime,hard,timeo=60,retry=6,retrans=6,nconnect=4 0 0
> 
> 
> On Linux Kernel 6.3.6 these work perfectly fine.
> 
> As soon as I upgrade to 6.4 (tested 6.4.7 through 6.4.11) or 6.5-rc7 NFS mounts randomly hang and block system operation with high load times eventually resulting in a system freeze.
> 
> dmesg/syslog:
> 
> Aug 22 18:13:49 sjc-www2 kernel: nfs: server 10.200.1.247 OK
> Aug 22 18:13:49 sjc-www2 kernel: nfs: server 10.200.1.247 OK
> Aug 22 18:13:49 sjc-www2 kernel: nfs: server 10.200.1.247 OK
> Aug 22 18:13:49 sjc-www2 kernel: nfs: server 10.200.1.247 OK
> Aug 22 18:14:35 sjc-www2 kernel: nfs: server 10.200.1.247 not responding, still trying
> Aug 22 18:14:35 sjc-www2 kernel: nfs: server 10.200.1.247 not responding, still trying
> Aug 22 18:14:35 sjc-www2 kernel: nfs: server 10.200.1.247 not responding, still trying
> Aug 22 18:14:35 sjc-www2 kernel: nfs: server 10.200.1.247 not responding, still trying
> Aug 22 18:14:35 sjc-www2 kernel: nfs: server 10.200.1.247 not responding, still trying
> Aug 22 18:14:35 sjc-www2 kernel: nfs: server 10.200.1.247 not responding, still trying
> Aug 22 18:14:35 sjc-www2 kernel: nfs: server 10.200.1.247 not responding, still trying
> Aug 22 18:14:35 sjc-www2 kernel: nfs: server 10.200.1.247 not responding, still trying
> Aug 22 18:14:35 sjc-www2 kernel: nfs: server 10.200.1.247 not responding, still trying
> Aug 22 18:14:35 sjc-www2 kernel: nfs: server 10.200.1.247 not responding, still trying
> Aug 22 18:15:23 sjc-www2 kernel: nfs: server 10.200.1.247 OK
> Aug 22 18:15:23 sjc-www2 kernel: nfs: server 10.200.1.247 OK
> Aug 22 18:15:23 sjc-www2 kernel: nfs: server 10.200.1.247 OK
> Aug 22 18:15:23 sjc-www2 kernel: nfs: server 10.200.1.247 OK
> Aug 22 18:15:23 sjc-www2 kernel: nfs: server 10.200.1.247 OK
> Aug 22 18:15:23 sjc-www2 kernel: nfs: server 10.200.1.247 OK
> Aug 22 18:15:23 sjc-www2 kernel: nfs: server 10.200.1.247 OK
> Aug 22 18:15:23 sjc-www2 kernel: nfs: server 10.200.1.247 OK
> Aug 22 18:15:23 sjc-www2 kernel: nfs: server 10.200.1.247 OK
> Aug 22 18:15:23 sjc-www2 kernel: nfs: server 10.200.1.247 OK
> Aug 22 18:16:05 sjc-www2 kernel: nfs: server 10.200.1.247 not responding, still trying
> Aug 22 18:16:05 sjc-www2 kernel: nfs: server 10.200.1.247 not responding, still trying
> Aug 22 18:16:05 sjc-www2 kernel: nfs: server 10.200.1.247 not responding, still trying
> Aug 22 18:16:05 sjc-www2 kernel: nfs: server 10.200.1.247 not responding, still trying
> Aug 22 18:16:05 sjc-www2 kernel: nfs: server 10.200.1.247 not responding, still trying
> Aug 22 18:16:05 sjc-www2 kernel: nfs: server 10.200.1.247 not responding, still trying
> Aug 22 18:16:05 sjc-www2 kernel: nfs: server 10.200.1.247 not responding, still trying
> Aug 22 18:16:05 sjc-www2 kernel: nfs: server 10.200.1.247 not responding, still trying
> Aug 22 18:16:05 sjc-www2 kernel: nfs: server 10.200.1.247 not responding, still trying
> Aug 22 18:16:05 sjc-www2 kernel: nfs: server 10.200.1.247 not responding, still trying
> Aug 22 18:16:54 sjc-www2 kernel: nfs: server 10.200.1.247 OK
> Aug 22 18:16:54 sjc-www2 kernel: nfs: server 10.200.1.247 OK
> Aug 22 18:16:54 sjc-www2 kernel: nfs: server 10.200.1.247 OK
> Aug 22 18:16:54 sjc-www2 kernel: nfs: server 10.200.1.247 OK
> Aug 22 18:16:54 sjc-www2 kernel: nfs: server 10.200.1.247 OK
> Aug 22 18:16:54 sjc-www2 kernel: nfs: server 10.200.1.247 OK
> Aug 22 18:16:54 sjc-www2 kernel: nfs: server 10.200.1.247 OK
> Aug 22 18:16:54 sjc-www2 kernel: nfs: server 10.200.1.247 OK
> Aug 22 18:16:54 sjc-www2 kernel: nfs: server 10.200.1.247 OK
> Aug 22 18:16:54 sjc-www2 kernel: nfs: server 10.200.1.247 OK
> 
> 
> The box in question i have been testing the kernel upgrades on has 1 x 10G NIC set with MTU 9000 for NFS volumes and i can successfully ping the nfs host with 9000 byte packets:
> 
> sjc-www2 ~ # ping -4 -s 9000 10.200.1.247
> PING 10.200.1.247 (10.200.1.247) 9000(9028) bytes of data.
> 9008 bytes from 10.200.1.247: icmp_seq=1 ttl=64 time=0.205 ms
> 9008 bytes from 10.200.1.247: icmp_seq=2 ttl=64 time=0.279 ms
> 9008 bytes from 10.200.1.247: icmp_seq=3 ttl=64 time=0.402 ms

See Bugzilla for the full thread.

Anyway, I'm adding this regression to be tracked by regzbot:

#regzbot introduced: v6.3..v6.4 https://bugzilla.kernel.org/show_bug.cgi?id=217815
#regzbot title: nfs server not responding loop on Synology NAS devices

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=217815

-- 
An old man doll... just what I always wanted! - Clara
