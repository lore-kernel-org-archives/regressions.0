Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0761C06
	for <regressions@lists.linux.dev>; Mon, 16 Jan 2023 10:15:07 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id z13so2061968plg.6
        for <regressions@lists.linux.dev>; Mon, 16 Jan 2023 02:15:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bxvo5PRWAMnMhPhKPqi0zZIa8lc5uYeIQUDZrRe/SdA=;
        b=GX4KY1aAd9SKyx3gs+tVjjyrbSYAp0c8FajrwJBFxaFSqMmVjoGmOkUxRHg2RAzS1o
         Q0bguuONxvLILR6CaRY3b9zRxREh8ciQ2yYXCDA7+Uz0KHQtD0F+snfBfqtN0shiVKhZ
         znxHuzNApPQZOWpejDOWrvkR2jPu5YJ31kN+oJFnwPBiMIfElQBHNOPJ/kRv/TBFyTeJ
         iSI8uFyACQg5EMU2gaqe8eH9re23eGkkWgcWVQjTkT+22f7YSA2PM+8QKIJT1NDLwPsR
         KAsRqYWgiTOvnfDcYQJnBr8aEhN15iEqpZpfFCpO9guJ3x3RPWIciTdp8uaulvjcLlzR
         CxGA==
X-Gm-Message-State: AFqh2koP//q2wwFLm7j7seA+CTElcL1d9Ms/TdDnCy1nySF96Erp0Fmg
	HfWunhtYVrHN9DURFZRbU3bwBQ8RCLxssG0=
X-Google-Smtp-Source: AMrXdXvw4I/b7X3N3UDU0ic1K/yzPguhPiKMXtFQCXTvOi8hzNdLcY3tM7cH0TKjOJ54X2AcgJnV2A==
X-Received: by 2002:a17:902:7583:b0:189:4bf4:2cfc with SMTP id j3-20020a170902758300b001894bf42cfcmr88306738pll.31.1673864106810;
        Mon, 16 Jan 2023 02:15:06 -0800 (PST)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com. [209.85.214.174])
        by smtp.gmail.com with ESMTPSA id y16-20020a170902b49000b00192d553d3d2sm18873412plr.157.2023.01.16.02.15.05
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jan 2023 02:15:05 -0800 (PST)
Received: by mail-pl1-f174.google.com with SMTP id b17so22358486pld.7
        for <regressions@lists.linux.dev>; Mon, 16 Jan 2023 02:15:05 -0800 (PST)
X-Received: by 2002:a17:902:a505:b0:192:d553:d3c6 with SMTP id
 s5-20020a170902a50500b00192d553d3c6mr729996plq.103.1673864104630; Mon, 16 Jan
 2023 02:15:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAPH51bc1ZoP2ukJJh8nfrNY1FCp1nk7AP0jGGCvoskq2XbmAoA@mail.gmail.com>
 <029045a9-5006-e663-571f-b67344fa3a50@leemhuis.info> <2f866122-6a56-dfc7-9add-5168a4e796b2@leemhuis.info>
In-Reply-To: <2f866122-6a56-dfc7-9add-5168a4e796b2@leemhuis.info>
From: Peifeng Qiu <linux@qiupf.dev>
Date: Mon, 16 Jan 2023 19:14:53 +0900
X-Gmail-Original-Message-ID: <CAPH51bdcXFCiHrFPnMYGznsrCTOHDB0fyujFy3y5e8PWWYnnbQ@mail.gmail.com>
Message-ID: <CAPH51bdcXFCiHrFPnMYGznsrCTOHDB0fyujFy3y5e8PWWYnnbQ@mail.gmail.com>
Subject: Re: Missing sriov_numvfs after removal of EfiMemoryMappedIO from E820 map
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: bhelgaas@google.com, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 16, 2023 at 12:41 AM Linux kernel regression tracking
(Thorsten Leemhuis) <regressions@leemhuis.info> wrote:
>
> Forget to mention one small detail:
>
> On 15.01.23 15:21, Linux kernel regression tracking (Thorsten Leemhuis)
> wrote:
> > [CCing the regression list, as it should be in the loop for regressions:
> > https://docs.kernel.org/admin-guide/reporting-regressions.html]
> >
> > Hi, this is your Linux kernel regression tracker.
> >
> > On 15.01.23 10:21, Peifeng Qiu wrote:
> >>
> >> I'm using a dual Xeon system with Intel e810 25G network card and make use
> >> of SRIOV feature heavily. I have a script to setup the NIC the first step is
> >> echo $VFS > /sys/class/net/$DEVNAME/device/sriov_numvfs
> >>
> >> After switching from v6.1 to v6.2-rc1 "sriov_numvfs" is no longer present. If I
> >> switch back to v6.1 it's back. Command line parameters are the same so it's
> >> most likely kernel changes. I did git bisect and found the culprit to be
> >> 07eab0901ed(efi/x86: Remove EfiMemoryMappedIO from E820 map)
> >
> > This is not my area of expertise, but there is another report about an
> > issue that was bisected to that particular commit:
> >
> > https://lore.kernel.org/lkml/ac2693d8-8ba3-72e0-5b66-b3ae008d539d@linux.intel.com/
> >
> > A fix for that one was posted here:
> >
> > https://lore.kernel.org/lkml/20230110180243.1590045-1-helgaas@kernel.org/
> >
> > You might want to look into the report and if it looks like a possible
> > duplicate give the proposed fix a try.
>
> FWIW, that patch was recently mainlined and thus will be in 6.2-rc4 that
> Linus will likely release in a few hours.
>
> Ciao, Thorsten

I just tested the latest v6.2-rc4 and I can confirm that the issue is
fixed. Thanks!

Best regards,
Peifeng Qiu
