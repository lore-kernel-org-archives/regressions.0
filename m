Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367D0168
	for <regressions@lists.linux.dev>; Fri,  2 Jul 2021 00:31:57 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id i24so10917475edx.4
        for <regressions@lists.linux.dev>; Thu, 01 Jul 2021 17:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jY4md3mqLHqztzu+evEzUfuOkWX+XTGArVYH6u63Kg4=;
        b=T10DDQ1Xik+8Y9hhpOldamAbvYgad+QOrl2OYn1mc8db60egX9skNM4GA5/Z8xLrYP
         tCfsRAe9THqjzvrJwthqKO39LRNyzD2K5lXsi0I9PzCnw1FK8eObgIm2HglFHrmfrNRk
         x5+8cGHfKAxa6bKc3kpHEP7pVwe/I1/mttBlaVFksfMvBSFP34+/+69Fe1o/FYpUaXSz
         45j3QrIYE54wR6txWFgbF36k6f4TqKWTJmTtS8e9w8MecHMR7kwcL6bTkAePX3XHS4Cv
         MDH6pJd20CmTkbyQsFLys5oyAiv7QxEkdxYhiimtH/2lBL/Bf2wKh8wrDluPR3bYWej9
         O38g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jY4md3mqLHqztzu+evEzUfuOkWX+XTGArVYH6u63Kg4=;
        b=nRNnoIBLM+WqrrvCTk/BwLnhFp3Flb6LKvmZgA9krMopGMX4sQQEPWOrDfAULL/3H2
         2qVdxQfDXE00SYskkywBm6eQprzveClitIEBGRDR/Mqql5bAm1BTdtNjxVLRAvF1qNRY
         nZMFDJigTCQQTclYSnhKfoOPP1QgyqFJTub3CpUy4aIlAi2ulbZUw4CRB+35JCR3neUE
         v7+DjzHTXRklmVr9O/UxHf6htlzJFkEPiPOQrBIME+yJf4bRHHIFiyiSLVdw8QbjWUMQ
         AyR2Uatsny/KrQazWoO5uJJRdIHGU8goliH7llJd4QJwOiTdzyIPmzAB73/TIw3MvkEn
         nmUg==
X-Gm-Message-State: AOAM532vP0wOv/rQ8pJFDNZb9/xoD4MGI6JD5PROl9EbwtKzqYPSZ+tv
	5YiDGZ2KR/JGx94lUjKjPf/3emPpjwE=
X-Google-Smtp-Source: ABdhPJxyFs/GGDwyxsX3DhYqfdW/z+3cXoo4R0HWuWPiSOwzD/Qi6whxHxtRsmXYRGhC357/oFulvg==
X-Received: by 2002:a05:6402:448:: with SMTP id p8mr3197124edw.60.1625185915774;
        Thu, 01 Jul 2021 17:31:55 -0700 (PDT)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com. [209.85.221.53])
        by smtp.gmail.com with ESMTPSA id b23sm580329edy.44.2021.07.01.17.31.54
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jul 2021 17:31:55 -0700 (PDT)
Received: by mail-wr1-f53.google.com with SMTP id p8so10392582wrr.1
        for <regressions@lists.linux.dev>; Thu, 01 Jul 2021 17:31:54 -0700 (PDT)
X-Received: by 2002:a5d:6502:: with SMTP id x2mr2440520wru.327.1625185914070;
 Thu, 01 Jul 2021 17:31:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210701124732.Horde.HT4urccbfqv0Nr1Aayuy0BM@mail.your-server.de> <38ddc0e8-ba27-279b-8b76-4062db6719c6@gmail.com>
In-Reply-To: <38ddc0e8-ba27-279b-8b76-4062db6719c6@gmail.com>
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date: Thu, 1 Jul 2021 20:31:14 -0400
X-Gmail-Original-Message-ID: <CA+FuTSc3POcZo0En3JBqRwq2+eF645_Cs4U-4nBmTs9FvjoVkg@mail.gmail.com>
Message-ID: <CA+FuTSc3POcZo0En3JBqRwq2+eF645_Cs4U-4nBmTs9FvjoVkg@mail.gmail.com>
Subject: Re: [regression] UDP recv data corruption
To: David Ahern <dsahern@gmail.com>
Cc: Matthias Treydte <mt@waldheinz.de>, stable@vger.kernel.org, 
	Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, regressions@lists.linux.dev, 
	davem@davemloft.net, yoshfuji@linux-ipv6.org, dsahern@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 1, 2021 at 11:39 AM David Ahern <dsahern@gmail.com> wrote:
>
> [ adding Paolo, author of 18f25dc39990 ]
>
> On 7/1/21 4:47 AM, Matthias Treydte wrote:
> > Hello,
> >
> > we recently upgraded the Linux kernel from 5.11.21 to 5.12.12 in our
> > video stream receiver appliance and noticed compression artifacts on
> > video streams that were previously looking fine. We are receiving UDP
> > multicast MPEG TS streams through an FFMpeg / libav layer which does the
> > socket and lower level protocol handling. For affected kernels it spills
> > the log with messages like
> >
> >> [mpegts @ 0x7fa130000900] Packet corrupt (stream = 0, dts = 6870802195).
> >> [mpegts @ 0x7fa11c000900] Packet corrupt (stream = 0, dts = 6870821068).
> >
> > Bisecting identified commit 18f25dc399901426dff61e676ba603ff52c666f7 as
> > the one introducing the problem in the mainline kernel. It was
> > backported to the 5.12 series in
> > 450687386cd16d081b58cd7a342acff370a96078. Some random observations which
> > may help to understand what's going on:
> >
> >    * the problem exists in Linux 5.13
> >    * reverting that commit on top of 5.13 makes the problem go away
> >    * Linux 5.10.45 is fine
> >    * no relevant output in dmesg
> >    * can be reproduced on different hardware (Intel, AMD, different
> > NICs, ...)
> >    * we do use the bonding driver on the systems (but I did not yet
> > verify that this is related)
> >    * we do not use vxlan (mentioned in the commit message)
> >    * the relevant code in FFMpeg identifying packet corruption is here:
> >
> > https://github.com/FFmpeg/FFmpeg/blob/master/libavformat/mpegts.c#L2758
> >
> > And the bonding configuration:
> >
> > # cat /proc/net/bonding/bond0
> > Ethernet Channel Bonding Driver: v5.10.45
> >
> > Bonding Mode: fault-tolerance (active-backup)
> > Primary Slave: None
> > Currently Active Slave: enp2s0
> > MII Status: up
> > MII Polling Interval (ms): 100
> > Up Delay (ms): 0
> > Down Delay (ms): 0
> > Peer Notification Delay (ms): 0
> >
> > Slave Interface: enp2s0
> > MII Status: up
> > Speed: 1000 Mbps
> > Duplex: full
> > Link Failure Count: 0
> > Permanent HW addr: 80:ee:73:XX:XX:XX
> > Slave queue ID: 0
> >
> > Slave Interface: enp3s0
> > MII Status: down
> > Speed: Unknown
> > Duplex: Unknown
> > Link Failure Count: 0
> > Permanent HW addr: 80:ee:73:XX:XX:XX
> > Slave queue ID: 0
> >
> >
> > If there is anything else I can do to help tracking this down please let
> > me know.

That library does not enable UDP_GRO. You do not have any UDP based
tunnel devices (besides vxlan) configured, either, right?

Then no socket lookup should take place, so sk is NULL.

It is also unlikely that the device has either of NETIF_F_GRO_FRAGLIST
or NETIF_F_GRO_UDP_FWD configured. This can be checked with `ethtool
-K $DEV`, shown as "rx-gro-list" and "rx-udp-gro-forwarding",
respectively.

Then udp_gro_receive_segment is not called.

So this should just return the packet without applying any GRO.

I'm referring to this block of code in udp_gro_receive:

        if (!sk || !udp_sk(sk)->gro_receive) {
                if (skb->dev->features & NETIF_F_GRO_FRAGLIST)
                        NAPI_GRO_CB(skb)->is_flist = sk ?
!udp_sk(sk)->gro_enabled : 1;

                if ((!sk && (skb->dev->features & NETIF_F_GRO_UDP_FWD)) ||
                    (sk && udp_sk(sk)->gro_enabled) ||
NAPI_GRO_CB(skb)->is_flist)
                        pp = call_gro_receive(udp_gro_receive_segment,
head, skb);
                return pp;
        }

I don't see what could be up.

One possible short-term workaround is to disable GRO. If this commit
is implicated, that should fix it. At some obvious possible cycle
cost.
