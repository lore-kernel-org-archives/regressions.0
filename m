Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274BC36C
	for <regressions@lists.linux.dev>; Wed, 30 Mar 2022 08:02:20 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id h1so23446226edj.1
        for <regressions@lists.linux.dev>; Wed, 30 Mar 2022 01:02:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0nhYzrk89CFYhP0OL9hhz1b8TpKXi7qnAX0VfrTasFU=;
        b=XerG2TmbVLI1LMLDDPjb/ZpmPSOz3E1JdsifOx9UJpGJleQdWJZK+Q/kG5s7grgNvK
         2veXIqGULxfTu11HZPHpKd9aSiZc2e6s3TGqvnQMhgcJa3QlziOg1A0mg2mgnhAijUcX
         qa2Wuf5qZYWkM235lGTJXqczfb8KRogRP08WIYly4TqbDSehUhOjRq6dAxAZux9RDMzz
         K2HBjeZG64vtawHcNOUk1ORBOK6OTaPJ2frbfRS7kOHARNdGg79oGV3scbrmtI7r8zxO
         PFgZ1Jz8YgzK3aXdpWe/ZONyNZK7cqoPTpGl8sGcOPwYaO4MgyJXzcygnnA3I4toycRi
         bqXA==
X-Gm-Message-State: AOAM5304vbiYjPUhG3yenZw/o8uEWTBjV3cdn4TL6678AfCvq10LOqF7
	kQf+BxaNqRcUe6nqoskGbpA=
X-Google-Smtp-Source: ABdhPJx+jLhT7yt4Ec4HKq1/sZa+KCGnRWXebnA30Qq39MunDzYYqU8wVc6jku+/XPAqTN0Zy83YrA==
X-Received: by 2002:a05:6402:b7a:b0:419:3046:3abb with SMTP id cb26-20020a0564020b7a00b0041930463abbmr9076948edb.257.1648627338356;
        Wed, 30 Mar 2022 01:02:18 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
        by smtp.gmail.com with ESMTPSA id u9-20020a170906124900b006ce88a505a1sm8147711eja.179.2022.03.30.01.02.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Mar 2022 01:02:17 -0700 (PDT)
Message-ID: <292d7225-5ac2-71f0-08bc-8c33217fb93f@kernel.org>
Date: Wed, 30 Mar 2022 10:02:16 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: mainline: qemu_arm64 boot failed - Failed to start Hostname
 Service - Stopped Serial Getty on ttyAMA0
Content-Language: en-US
To: Naresh Kamboju <naresh.kamboju@linaro.org>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 regressions@lists.linux.dev, Linux ARM <linux-arm-kernel@lists.infradead.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Vincent Whitchurch <vincent.whitchurch@axis.com>
References: <CA+G9fYtk6rpp=0WG9LyfQRCsMbbvf=P7uhMuon4RzZz3UjYVYQ@mail.gmail.com>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <CA+G9fYtk6rpp=0WG9LyfQRCsMbbvf=P7uhMuon4RzZz3UjYVYQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I am not sure what this report is good for. See below.

On 30. 03. 22, 9:16, Naresh Kamboju wrote:
> Linux mainline kernel booting qemu_arm64 and Raspberry Pi 4 boot
> failed [1] and [2].
> 
> Boot log:
> [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x413fd0c1]
> [    0.000000] Linux version 5.17.0 (tuxmake@tuxmake)
> (aarch64-linux-gnu-gcc (Debian 11.2.0-18) 11.2.0, GNU ld (GNU Binutils
> for Debian) 2.38) #1 SMP PREEMPT @1648607824
> [    0.000000] Machine model: linux,dummy-virt
> 
> <trim>
> 
>           Starting Hostname Service...
> [FAILED] Failed to start Hostname Service.
> See 'systemctl status systemd-hostnamed.service' for details.

One failure here.

> [    2.453172] random: crng init done
> [    2.453522] random: 7 urandom warning(s) missed due to ratelimiting
> [    2.483013] audit: type=1334 audit(1648621045.348:8): prog-id=0 op=UNLOAD
> [    2.483953] audit: type=1334 audit(1648621045.348:9): prog-id=0 op=UNLOAD
> [    2.609230] audit: type=1334 audit(1648621045.476:10): prog-id=10 op=LOAD
> [  OK  ] Started Resize root filesystem to fit available disk space.
> [     ] A start job is running for Network Manager (6s / 1min 30s)
> ] A start job is running for Network Manager (7s / 1min 30s)[   ] A
> start job is running for Network Manager (7s / 1min 30s)[   ] A start
> job is running for Network Manager (8s / 1min 30s)[   ] A start job is

So NM is unable to start -- another networking failure.

> ...
> running for Network Manager (25s / 1min 30s)[  OK  ] Started Network
> Manager.
> [  OK  ] Listening on Load/Save RF Kill Switch Status /dev/rfkill Watch.
>           Starting Network Manager Script Dispatcher Service...
> [   27.359980] kauditd_printk_skb: 11 callbacks suppressed
> [   27.359988] audit: type=1701 audit(1648621070.228:22):
> auid=4294967295 uid=0 gid=0 ses=4294967295 pid=313 comm=\"(spatcher)\"
> exe=\"/lib/systemd/systemd\" sig=6 res=1
> [  OK  ] Reached target Network.
>           Starting DNS forwarder and DHCP server...
> [   27.367248] audit: type=1701 audit(1648621070.232:23):
> auid=4294967295 uid=0 gid=0 ses=4294967295 pid=315 comm=\"(dnsmasq)\"
> exe=\"/lib/systemd/systemd\" sig=6 res=1
>           Starting Permit User Sessions...
> [   27.371110] audit: type=1701 audit(1648621070.240:24):
> auid=4294967295 uid=0 gid=0 ses=4294967295 pid=317 comm=\"(sessions)\"
> exe=\"/lib/systemd/systemd\" sig=6 res=1
> [FAILED] Failed to start Network Manager Script Dispatcher Service.
> See 'systemctl status NetworkManager-dispatcher.service' for details.

And finally NM failed here. And it also tells you what to do for further 
investigation.

> [FAILED] Failed to start DNS forwarder and DHCP server.
> See 'systemctl status dnsmasq.service' for details.

Again, a network service.

> [FAILED] Failed to start Permit User Sessions.
> See 'systemctl status systemd-user-sessions.service' for details.
> [  OK  ] Started Getty on tty1.
> [  OK  ] Started Serial Getty on ttyAMA0.
> [  OK  ] Reached target Login Prompts.
> [  OK  ] Reached target Multi-User System.
>           Starting Update UTMP about System Runlevel Changes...
> [   27.402975] audit: type=1701 audit(1648621070.268:25):
> auid=4294967295 uid=0 gid=0 ses=4294967295 pid=322 comm=\"(ate-utmp)\"
> exe=\"/lib/systemd/systemd\" sig=6 res=1
> [FAILED] Failed to start Update UTMP about System Runlevel Changes.
> See 'systemctl status systemd-update-utmp-runlevel.service' for details.
> [   32.398140] audit: type=1701 audit(1648621075.264:26):
> auid=4294967295 uid=0 gid=0 ses=4294967295 pid=320 comm=\"(agetty)\"
> exe=\"/lib/systemd/systemd\" sig=6 res=1
> [   32.399187] audit: type=1701 audit(1648621075.264:27):
> auid=4294967295 uid=0 gid=0 ses=4294967295 pid=321 comm=\"(agetty)\"
> exe=\"/lib/systemd/systemd\" sig=6 res=1
> [  OK  ] Stopped Serial Getty on ttyAMA0.
> [  OK  ] Started Serial Getty on ttyAMA0.

      ^^ This one is "OK", so I see no connection to serial layer at all 
as the Subject and CCed people list suggest. Am I missing something?

regards,
-- 
js
suse labs
