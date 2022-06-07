Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B15B7C
	for <regressions@lists.linux.dev>; Tue,  7 Jun 2022 06:44:24 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id 3-20020a17090a174300b001e426a02ac5so16786614pjm.2
        for <regressions@lists.linux.dev>; Mon, 06 Jun 2022 23:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GzEm5jqlekQS2E69TLpvZ6DXTFb1mHUyOolgBivv5/c=;
        b=KvJDycZnUMrvh8JswpwAudxPqdgqMKXeNkRKM6/ll5Sbpo3gVxMfPTteKcUV+K0ODe
         wV2/k4Pqve82ruqgqp5WA5ayFmvdn66gJIXFOzxJHHD1zZq4dFovK75YWMJGnPqOr+5U
         uxll4W0fCcbEcMql6qhrx7UlOIyfTOLrqMPlnyPmF/z0aLFUJnxOja5iRhzmkFMWM9Uo
         OOi6J1HBmxbA6whXfvlZoKZs0WCF4fP31wQpk6SY0rmO/6epmzMaeBI1kBenj8fRYkej
         j9RM4qz6QNrnNpM1SXPaG3yucpNMCUPK8QCH/Cb9fMXzfrqo/o7yzOTnbqKneyXJZWxb
         KzRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GzEm5jqlekQS2E69TLpvZ6DXTFb1mHUyOolgBivv5/c=;
        b=r+F/RV4DmiVNSX9qKx6pg31fCtJMnyIAs6ABemBVwGDVCKRVhu0AJbZ4/hDgfUxyls
         WcIwXL3alO9w0qpO/RE4MSnPu/CFw2Y0dyKafKbJjA6w6QzXSQoAqrMTW4p8w+hQXUvr
         qJhbh0x18p3TPDm0rp+Qe2igAcpfRnhakRjrrRoyJdjrgaXp3lOHY0ifGuD34QmWucRb
         +JDRZpljgaeKhFZIT1FXZYMy5KxNqxWxom82+5uC/+XE/N2QzSay/lARr0hyma4U2yzH
         zmKp8ksPNTUOXKRBz4+sEFMgI3PWLL0wGy97BVI/zyPCiF1IRMyIs6lrkeiLUzqYCh9L
         kcng==
X-Gm-Message-State: AOAM533e/PHPNuji08Lt4DQMcAghJ7Gb8h8QSoaEPyykUdM6i1dSndLq
	ZvA2Q6vUzcFbtzJG7MfpMi3LC3DN4hTQSKDQTgMgqw==
X-Google-Smtp-Source: ABdhPJyiJ1kgXF3d95mk6ZoiyKqVYZuzzYbnd0ek3tLxWUwtNIRKftrWoMNME7yKuVGl6/jJoQTBLqzz/oYipJAixq0=
X-Received: by 2002:a17:902:ab8c:b0:167:4d5c:3542 with SMTP id
 f12-20020a170902ab8c00b001674d5c3542mr19708637plr.6.1654584264279; Mon, 06
 Jun 2022 23:44:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYv7fESqpGoeKmHoJsst6wfRNMi2wQLGm+PsjbLDuDjdMQ@mail.gmail.com>
 <CA+G9fYsJThWFAxXTbAcJmjshx+oYxVVd+gMM680hS0X1z37+FQ@mail.gmail.com>
 <20220607162504.7fd5a92a@canb.auug.org.au> <CALvZod5XBjw7MZfYSNv-UnE7pHMKTquUNomqyC5T05Qu_ef6Zw@mail.gmail.com>
In-Reply-To: <CALvZod5XBjw7MZfYSNv-UnE7pHMKTquUNomqyC5T05Qu_ef6Zw@mail.gmail.com>
From: Shakeel Butt <shakeelb@google.com>
Date: Mon, 6 Jun 2022 23:44:13 -0700
Message-ID: <CALvZod4DhM00LXsPty=cnYyv3Ci5YS5otasu_tr9o7ujQekKLw@mail.gmail.com>
Subject: Re: [next] arm64: boot failed - next-20220606
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	regressions@lists.linux.dev, lkft-triage@lists.linaro.org, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-mm <linux-mm@kvack.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Raghuram Thammiraju <raghuram.thammiraju@arm.com>, Mark Brown <broonie@kernel.org>, 
	Will Deacon <will@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Vasily Averin <vvs@openvz.org>, Qian Cai <quic_qiancai@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 6, 2022 at 11:36 PM Shakeel Butt <shakeelb@google.com> wrote:
>
> On Mon, Jun 6, 2022 at 11:25 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi Naresh,
> >
> > On Tue, 7 Jun 2022 11:00:39 +0530 Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> > >
> > > On Mon, 6 Jun 2022 at 17:16, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> > > >
> > > > Linux next-20220606 arm64 boot failed. The kernel boot log is empty.
> > > > I am bisecting this problem.
> > > >
> > > > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> > > >
> > > > The initial investigation show that,
> > > >
> > > > GOOD: next-20220603
> > > > BAD:  next-20220606
> > > >
> > > > Boot log:
> > > > Starting kernel ...
> > >
> > > Linux next-20220606 and next-20220607 arm64 boot failed.
> > > The kernel panic log showing after earlycon.
> > >
> > > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> >
> > Can you test v5.19-rc1, please?  If that does not fail, then you could
> > bisect between that and next-20220606 ...
> >
>
> This is already reported at
> https://lore.kernel.org/all/Yp4F6n2Ie32re7Ed@qian/ and I think we know
> the underlying issue (which is calling virt_to_page() on a vmalloc
> address).

Sorry, I might be wrong. Just checked the stacktrace again and it
seems like the failure is happening in early boot in this report.
Though the error "Unable to handle kernel paging request at virtual
address" is happening in the function mem_cgroup_from_obj().

Naresh, can you repro the issue if you revert the patch "net: set
proper memcg for net_init hooks allocations"?
