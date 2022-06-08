Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C177C
	for <regressions@lists.linux.dev>; Wed,  8 Jun 2022 13:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654694373;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bYfqG+mmrZsYnB3Q4WWY9yIatSaBCKfG6eFWUGz94/w=;
	b=KbXn7YxVc/o3KeUr9OWfmDc8EAtPcoKZVAOvRqo/Ggg2QyZVGCypPYTG2RuD408NptAgN6
	JarsabUJTX0hhx3kTchNt91WtH/q/U+SA9tQCnU4XrV5/i/PCjSrIxGDnSIgJ0aMULGScR
	tsndoUoGIB+LE2vXFRg6ooz8o82P3nA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-56-_Vc4c9FkMQ2UpOHpNpfEjw-1; Wed, 08 Jun 2022 09:19:32 -0400
X-MC-Unique: _Vc4c9FkMQ2UpOHpNpfEjw-1
Received: by mail-ed1-f71.google.com with SMTP id m6-20020aa7c2c6000000b0042dc237d9e7so14912799edp.15
        for <regressions@lists.linux.dev>; Wed, 08 Jun 2022 06:19:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=bYfqG+mmrZsYnB3Q4WWY9yIatSaBCKfG6eFWUGz94/w=;
        b=SbKRMv3+FfuzW5/b10Bpn4G16jlvkK4KngFNlkJijIAJevx6swA53VeHddC1I4wi0D
         2bMjYpQ4lgreRk8Wk8ZIvwI7UpKq6BFhWPsVjgu9SjfWshfEv0ft8PoOeCAI85OFgMcv
         w7hQP3ISEzF5PPixMZbRPJTPan3BAgWzbrxBAuMHoV8g5p9IUIsNrTSDS52FrCQhDmJy
         7qiWned70CX9lrmAS/2v6dj29hAn6gJBF/HXBpyjKC099PBYUEKRtlgBB0T2P7NmsfuR
         73VycNgpEwOSLffL06WeDlC9ipNPjdedeQKKyyt4jeXIiVfoEQ2ABB3/PgVqOMmwgjJO
         aGwg==
X-Gm-Message-State: AOAM531LLCoUd4nQvuqvFgEznMORbyKN6IgM/s0VbiQhkNWEnCsaN5KJ
	BwUC6T8aK+0kWvpX78ef8O8oLmUzw1ZD+rhEWOZgJYidGYCmtHZGq2Sr3IbondZSrLFeNZ1jftk
	4S8SKhW5+e+HqW58I/ptrMB8=
X-Received: by 2002:a05:6402:5412:b0:42d:cf78:6479 with SMTP id ev18-20020a056402541200b0042dcf786479mr38921206edb.18.1654694371245;
        Wed, 08 Jun 2022 06:19:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJR7nP64yd4YZRsPhWHmm59xX78RLn8pWZ0uVCy9QR4GDl1fZWhfXW4CbNL/YItnMe9arVAA==
X-Received: by 2002:a05:6402:5412:b0:42d:cf78:6479 with SMTP id ev18-20020a056402541200b0042dcf786479mr38921189edb.18.1654694371055;
        Wed, 08 Jun 2022 06:19:31 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id m25-20020a509999000000b0042bd25ca29asm12567155edb.59.2022.06.08.06.19.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jun 2022 06:19:30 -0700 (PDT)
Message-ID: <3fdb48d6-4892-8004-bcff-5cbbcaf4d9a3@redhat.com>
Date: Wed, 8 Jun 2022 15:19:29 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [REGRESSION] r8169: RTL8168h "transmit queue 0 timed out" after
 ASPM L1 enablement
To: Bernhard Hampel-Waffenthal <bernhard.hampelw@posteo.at>,
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: nic_swsd@realtek.com, netdev@vger.kernel.org,
 regressions@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>
References: <9ebb43ee-52a1-c77d-d609-ca447a32f3e6@posteo.at>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <9ebb43ee-52a1-c77d-d609-ca447a32f3e6@posteo.at>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 6/8/22 02:44, Bernhard Hampel-Waffenthal wrote:
> #regzbot introduced: 4b5f82f6aaef3fa95cce52deb8510f55ddda6a71
> 
> Hi,
> 
> since the last major kernel version upgrade to 5.18 on Arch Linux I'm unable to get a usable ethernet connection on my desktop PC.
> 
> I can see a timeout in the logs
> 
>> kernel: NETDEV WATCHDOG: enp37s0 (r8169): transmit queue 0 timed out
> 
> and regular very likely related errors after
> 
>> kernel: r8169 0000:25:00.0 enp37s0: rtl_rxtx_empty_cond == 0 (loop: 42, delay: 100).
> 
> 
> The link does manage to go up at nominal full 1Gbps speed, but there is no usable connection to speak of and pings are very bursty and take multiple seconds.
> 
> I was able to pinpoint that the problems were introduced in commit 4b5f82f6aaef3fa95cce52deb8510f55ddda6a71 with the enablement of ASPM L1/L1.1 for ">= RTL_GIGA_MAC_VER_45", which my chip falls under. Adding pcie_aspm=off the kernel command line or changing that check to ">= RTL_GIGA_MAC_VER_60" for testing purposes and recompiling the kernel fixes my problems.
> 
> 
> I'm using a MSI B450I GAMING PLUS AC motherboard with a RTL8168h chip as per dmesg:

Hmm, my main workstation has a "MSI B550M PRO-VDH" which is similar(ish)
to your motherboard and is using the exact same ethernet controller and
I'm not seeing any issues with 5.18.0.

ASPM issues may be BIOS related, are you at the latest BIOS version?

And are all your (relevant) BIOS settings set to the default settings?

Regards,

Hans


> 
>> r8169 0000:25:00.0 eth0: RTL8168h/8111h, 30:9c:23:de:97:a9, XID 541, IRQ 101
> 
> lspci says:
> 
>> 25:00.0 Ethernet controller [0200]: Realtek Semiconductor Co., Ltd. RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller [10ec:8168] (rev 15)
>         Subsystem: Micro-Star International Co., Ltd. [MSI] Device [1462:7a40]
>         Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
>         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
>         Latency: 0, Cache Line Size: 64 bytes
>         Interrupt: pin A routed to IRQ 30
>         IOMMU group: 14
>         Region 0: I/O ports at f000 [size=256]
>         Region 2: Memory at fcb04000 (64-bit, non-prefetchable) [size=4K]
>         Region 4: Memory at fcb00000 (64-bit, non-prefetchable) [size=16K]
>         Capabilities: <access denied>
>         Kernel driver in use: r8169
>         Kernel modules: r8169
> 
> 
> If you need more info I'll do my best to provide what I can, hope that helps already.
> 
> Regards,
> Bernhard
> 

