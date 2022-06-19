Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A342A7B
	for <regressions@lists.linux.dev>; Sun, 19 Jun 2022 17:00:58 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id 43so13128737qvb.3
        for <regressions@lists.linux.dev>; Sun, 19 Jun 2022 10:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gooddata.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=P2Pzb/PaJ7Z+/ZicwcRN0lssuLoakMdj+znnhHREnpM=;
        b=I25eIhLsilWbc24M5LzyajgvEN8Sn9jgS4f3qZqIi52kOrXVJAVjoZ54iAUcrfzZUo
         CpT/X7RzR3brNxXXO9hmBWMDc5I/ZaR5dpfE+6ee2ebYKQXwlelu5N6C3MnOCVhY/QXn
         B9nLXoxcWOH3eAmY9ouaMyxn/CZv5WTz5rnes=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=P2Pzb/PaJ7Z+/ZicwcRN0lssuLoakMdj+znnhHREnpM=;
        b=OM2pSUhrs1XUzs32MkkoZXAnDrgBiSMXn3LZlO9XpfzcFBcjXXHKO30Ztqg7WulTnP
         YYlaHVNvlSg9xWyUR6nrIp4mg3tea4KxXI2ljKBvjp3IkY6chwtYUmeZrEJmqQ+zddfb
         uctyo1jNjjWs7IbKPyyVUPrDTERNuSKt0k1m7ZdZesPZIxabbP1PnsekrKx84sN3/DJC
         T3MjJ2liYpZ/oo6q6AFIbrZoojmBKE+JBbdCLc7iNbW5dVuPuG2fnGTBy6Qt5F/OtzcG
         MIDtRBaz5jJKFs/IwR6tnq48HDSr0kI+K9TzttcUkZ2L9LvEFVpuIEOh66fXSeWzfBis
         jMrQ==
X-Gm-Message-State: AJIora/GoVH+HKn/vYazqy3AwgCT+fs65p1oIubWuCBktE9Dyv2XfMKv
	xKa8m0EOjW2SI5FObqtzEZQGxTI1VExh33TLsUTNWg==
X-Google-Smtp-Source: AGRyM1u9BpxR11DJpEOt1YEvxLdgRzei2TxuhlqZv4bFrv9cru4rmZePHEnZXLDUe7k+tLaV38XT+SyxVvcS2YiQbus=
X-Received: by 2002:a05:6214:5187:b0:46b:c045:1a2c with SMTP id
 kl7-20020a056214518700b0046bc0451a2cmr15945097qvb.33.1655658057453; Sun, 19
 Jun 2022 10:00:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAK8fFZ7m-KR57M_rYX6xZN39K89O=LGooYkKsu6HKt0Bs+x6xQ@mail.gmail.com>
 <2596b2c6-71e4-543f-799f-b4b174c21f31@leemhuis.info>
In-Reply-To: <2596b2c6-71e4-543f-799f-b4b174c21f31@leemhuis.info>
From: Jaroslav Pulchart <jaroslav.pulchart@gooddata.com>
Date: Sun, 19 Jun 2022 19:00:31 +0200
Message-ID: <CAK8fFZ6hS69JMtnvFnLVt9aiWEivZ9-izNgMHtB+KeAWAfaXaQ@mail.gmail.com>
Subject: Re: [Intel-wired-lan] ice: Error setting promisc mode on VSI 6
 (rc=-17) @ 5.18.x
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: intel-wired-lan@lists.osuosl.org, 
	Jesse Brandeburg <jesse.brandeburg@intel.com>, Tony Nguyen <anthony.l.nguyen@intel.com>, 
	LKML <linux-kernel@vger.kernel.org>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

yes, I revert that commit. Still the promiscs cannot be set and the dmesg
error message changed to:
---------------
$ ip link set em1 promisc on
$ dmesg
...
ice 0000:63:00.0 em1: Error setting Multicast promiscuous mode on VSI 6
...
---------------

Jaroslav P.

ne 19. 6. 2022 v 13:51 odes=C3=ADlatel Thorsten Leemhuis
<regressions@leemhuis.info> napsal:

>
> [TLDR: I'm adding this regression report to the list of tracked
> regressions; all text from me you find below is based on a few templates
> paragraphs you might have encountered already already in similar form.]
>
> Hi, this is your Linux kernel regression tracker.
>
> On 09.06.22 08:58, Jaroslav Pulchart wrote:
> >
> > I'm struggling with broken network connectivity at VMs using linux
> > bridge at host after update of kernel from 5.17.x to 5.18.x @ Dell
> > R750 server with E810-XXV NICs.
> >
> > I noticed the kernel reports "Error setting promisc mode" in dmesg.
> >
> > # dmesg  | grep 'Error setting promisc'
> > [   24.863557] ice 0000:31:00.0: Error setting promisc mode on VSI 6 (r=
c=3D-17)
> > [   24.878369] ice 0000:31:00.0: Error setting promisc mode on VSI 6 (r=
c=3D-17)
> > [   25.045834] ice 0000:31:00.0: Error setting promisc mode on VSI 6 (r=
c=3D-17)
> > [   25.129840] ice 0000:b1:00.0: Error setting promisc mode on VSI 6 (r=
c=3D-17)
> > [   25.144440] ice 0000:b1:00.0: Error setting promisc mode on VSI 6 (r=
c=3D-17)
> >
> > # lspci -s 0000:31:00.0
> > 31:00.0 Ethernet controller: Intel Corporation Ethernet Controller
> > E810-XXV for SFP (rev 02)
> > # lspci -s 0000:b1:00.0
> > b1:00.0 Ethernet controller: Intel Corporation Ethernet Controller
> > E810-XXV for SFP (rev 02)
> >
> > It is easy to reproduce by:
> >   # ip link set em1 promisc on
> >   # dmesg -T | tail -n 1
> >   [Thu Jun  9 08:48:19 2022] ice 0000:31:00.0: Error setting promisc
> > mode on VSI 6 (rc=3D-17)
> >
> > Could it be an 'ice' driver bug introduced in the 5.18 kernel?
>
> CCing the regression mailing list, as it should be in the loop for all
> regressions, as explained here:
> https://www.kernel.org/doc/html/latest/admin-guide/reporting-issues.html
>
> Jaroslav, did you try to revert the change that was suggested to you in
> https://lore.kernel.org/all/d993bbb6-e583-5d91-76c0-841cc5da86af@roeck-us=
.net/
> Did it help?
>
> Anyway: To be sure below issue doesn't fall through the cracks
> unnoticed, I'm adding it to regzbot, my Linux kernel regression tracking
> bot:
>
> #regzbot ^introduced v5.17 to v5.18
> #regzbot title net: ice: Error setting promisc mode on VSI 6 (rc=3D-17) @
> 5.18.x
> #regzbot monitor
> https://lore.kernel.org/all/CAK8fFZ68+xZ2Z0vDWnihF8PeJKEmEwCyyF-8W9PCZJTd=
8zfp-A@mail.gmail.com/
> #regzbot monitor
> https://lore.kernel.org/all/CAK8fFZ61mQ3AYpdWjWtyUXzrs-RVMW61mBLrjRDXBxB-=
F9GzbA@mail.gmail.com/
> #regzbot ignore-activity
>
> This isn't a regression? This issue or a fix for it are already
> discussed somewhere else? It was fixed already? You want to clarify when
> the regression started to happen? Or point out I got the title or
> something else totally wrong? Then just reply -- ideally with also
> telling regzbot about it, as explained here:
> https://linux-regtracking.leemhuis.info/tracked-regression/
>
> Reminder for developers: When fixing the issue, add 'Link:' tags
> pointing to the report (the mail this one replied to), as the kernel's
> documentation call for; above page explains why this is important for
> tracked regressions.
>
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
>
> P.S.: As the Linux kernel's regression tracker I deal with a lot of
> reports and sometimes miss something important when writing mails like
> this. If that's the case here, don't hesitate to tell me in a public
> reply, it's in everyone's interest to set the public record straight.
