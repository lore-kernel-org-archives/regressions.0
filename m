Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D57543AAB
	for <regressions@lists.linux.dev>; Fri, 22 Sep 2023 20:52:20 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-530fa34ab80so9529835a12.0
        for <regressions@lists.linux.dev>; Fri, 22 Sep 2023 13:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695415939; x=1696020739; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=r3oqUTe9wNeve3d2J33jPhFoj9/rOq9QesLkANOfVRw=;
        b=M5VohK0+stmHvOYsAFg175zb+bEwy09E7JeDNpbafDIAdr9thzxAYEFxOxNnxnvX+w
         sDWcQT81fzMOigsJqRrZgDumIdqetvLFlm7cfxA8n1kOA6/WR9fw3GQBP5Lf4Vggs9GI
         xByjMn9UFTjaybJJvATPrxYqc1PsXK3+t5rjY2XC9jcvpn6U1sgm1SVqy+sfurIHeIop
         hct3nFRYjD+dO2Jf2vA7UduU1IZ5BDwlnGAmJ+LIW9zX9ewy3nWEF1MJcUqsgE7SLdcF
         PNofBv3FLvRn5rC3U85ycejUk4lm+HN4pBG4oedP7h8tGcMveI+VgpCFLDqhd4sxnaI/
         2WTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695415939; x=1696020739;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r3oqUTe9wNeve3d2J33jPhFoj9/rOq9QesLkANOfVRw=;
        b=VasA153etQ1c4fLGGhliA2gvSZkvM9de48+T2VtklBSqH3dZMSnQWJBz5CId+qi91l
         ugyLJ40/SPJVgLRJm5nF4hIt5oE6NF3ebTQiVmnxHkVrkXZ0IxhS4WS7BC0vDVUBU6sp
         0n8X91pJE/+vtkZ/ik3ghVz45cKctdprt0JXnwYCgZa48yAPGWXBDacWqtfINFLkkSsb
         6OT1Ndl4cF+F9jmpxwz1HTsybLYpl0FF2ANbCU3Urv/rQk2VNUuQ1Qa4tZIXIboYa419
         kk1ByUWT32axZ8IRxFqUl72TMR0MjX2u0eLJJ/vBgn5A/0uX+4XwyZ0oAm+VSeXJ7xAu
         64yw==
X-Gm-Message-State: AOJu0Yz+sK7O/sWVdz8mdv+u3lQHukVjdQx36zTLJMj0Z2Z+ibConcDS
	iwngJiN+dtlDUtiUstDeSL9vjOD03wFcx3kSIhw=
X-Google-Smtp-Source: AGHT+IGai71+8E/DfqHKaccXApvdAwzcb/1J5L1Y8/Im5VWZzW/x5K0fN2UeDxQgvD3eiAtUlzVAHFSO/LjCReVHRlk=
X-Received: by 2002:aa7:d293:0:b0:525:8124:20fe with SMTP id
 w19-20020aa7d293000000b00525812420femr1387283edq.18.1695415938567; Fri, 22
 Sep 2023 13:52:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <5a7f2a6e-46a4-a5c8-fe6a-c2581496b5cd@gmail.com>
 <c7e70f54-9696-4b39-aa17-576987ffce85@leemhuis.info> <CANiJ1U80VNiLGKEmgYpGjUQ2poREN9uGnv2QXM_GtzjgBtUSWQ@mail.gmail.com>
 <2662e142-8b19-6e88-8030-47815598bf12@leemhuis.info>
In-Reply-To: <2662e142-8b19-6e88-8030-47815598bf12@leemhuis.info>
From: brett hassall <brett.hassall@gmail.com>
Date: Sat, 23 Sep 2023 06:52:07 +1000
Message-ID: <CANiJ1U8VJfJ9GX3m0Z3KhGKRKwWiQOcC6-_Pi8Aj_27nBQrYqw@mail.gmail.com>
Subject: Re: Fwd: 5c8a79e8e12b ("wifi: rtw88: correct PS calculation for
 SUPPORTS_DYNAMIC_PS", 2023-05-27) increases CPU usage usage for irq
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, Bagas Sanjaya <bagasdotme@gmail.com>, 
	Ping-Ke Shih <pkshih@realtek.com>, Kalle Valo <kvalo@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Wireless <linux-wireless@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi

I don't think it is a duplicate.

https://bugzilla.kernel.org/show_bug.cgi?id=217841 affects systems
with VMD controllers. I searched the lspci output from
https://bugzilla.kernel.org/show_bug.cgi?id=217321 and the system does
not have a VMD controller.

I also checked that patch code and it does not appear related.

Thanks

On Thu, 21 Sept 2023 at 00:09, Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> On 16.09.23 01:04, brett hassall wrote:
> >
> > I'd suggest that there are actually 2 regressions
> > (https://bugzilla.kernel.org/show_bug.cgi?id=217841 and this bug). Bug
> > 217841 masks this bug
>
> Is that maybe a duplicate of this one:
> https://bugzilla.kernel.org/show_bug.cgi?id=217321
>
> In that case it might make sense to test with a proposed fix for that
> bug (that iirc is
> https://lore.kernel.org/all/20230911073352.3472918-1-mika.westerberg@linux.intel.com/
> ) to speed up fixing the rtw88 regression in case there is one.
>
> Ciao, Thorsten
>
> > as it prevents the laptop reaching package C8
> > and I'm assuming this bug shows when in C8. The patch for 21784 only
> > affects devices connected to a VMD controller so I wouldn't expect it
> > to affect the 8822CE.
> >
> > Options that I can see are:
> > 1. Park this bug until 217841 is resolved
> > 2. Try to test on a laptop with a Realtek 8822CE but not a VMD
> > controller. I have access to 5 different laptop models but none meet
> > those criteria.
> >
> >
> > Thanks for the reply
> > Brett
> >
> > On Mon, 11 Sept 2023 at 23:29, Linux regression tracking (Thorsten
> > Leemhuis) <regressions@leemhuis.info> wrote:
> >>
> >> On 27.08.23 04:37, Bagas Sanjaya wrote:
> >>>
> >>> I notice a regression report on Bugzilla [1]. Quoting from it:
> >>>
> >>>> This commit improves power saving - it enables the kernel to
> >>>> achieve package C8. To achieve package C8, 3 Ubuntu VMD commits
> >>>> must be applied as well. [...]
> >>
> >> To me that sounds like there is no upstream problem, hence this
> >> shouldn't be tracked as a regression. Please correct me if I'm wrong.
> >>
> >>> #regzbot introduced: 26a125f550a3bf
> >>> https://bugzilla.kernel.org/show_bug.cgi?id=217828 #regzbot title:
> >>> correcting SUPPORTS_DYNAMIC_PS calculation for rtw88 increases CPU
> >>> utilization #regzbot link:
> >>> https://bugs.launchpad.net/ubuntu/+source/linux-hwe-6.2/+bug/2025040
> >>>
> >>> Thanks.
> >>>
> >>> [1]: https://bugzilla.kernel.org/show_bug.cgi?id=217828
> >>
> >> #regzbot resolved: invalid: seems to only be a problem with a patched kernel
> >> #regzbot ignore-activity
> >>
> >> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> >> --
> >> Everything you wanna know about Linux kernel regression tracking:
> >> https://linux-regtracking.leemhuis.info/about/#tldr
> >> If I did something stupid, please tell me, as explained on that page.
> >>
> >>
> >
> >
