Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795593119;
	b=K3JMW+k0yXvb8tZdbWEIFoYN9z67YpJxxapYNwC+s1AiMmHF/5nOtzbdE3NLKAwJDdJN
	 abbPfoS1wCb0jfZ6Cs0yOUl9Cnfi3uPDTnUiq6P9Ees6Sdo9zkO8zdpO8LMZsXsXfn7R+
	 gSxXlG2JwpPdFiiVEt4ovVue5jBai8VmsJtknKMdyWHu/QwIFqG0vF8Rn/s0QBKhybIiZ
	 wiimWDsaF1/BDAVlwE5hMjGlMHFvWQFsMOkF0SMToSF4R6OmMCvn+dokaESnNi00gLZOi
	 0ZW5S3SfrugNJTCy5GMiYvp0efXEisc9YbdfquiW7O60QduZhBA0zDtFYFtN21ztKQg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795593119;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Jvc6T0hsHWXffEvQKNFhCmtcAcfBWvvbJSXZbmwAzQQ=;
	b=GNySW0/7Y+CGjVdKrgR8ZIiGMrfSdNkKduZIV8lXb4tDjA9r+7j9Ob971GwLXBEHSXLN
	 RPwXteEkJX6rHspHtZIIXA0uNhg/HwxGynxiWrdbMMI6RUWUE398bdlPL+PCUuWaz8lKw
	 m6LUARmScQkoAWBAmSFd9xH0Blkaekh3BWVtupL+uuu4axEpncaPNzRMLFeTHwveSnO6P
	 clVA/jlHoIvCcE0ncVVmEGX21UjzffGrUZf8Ohi6L3CAuQy0BouKw8k1hOKkolknwtC7J
	 ZyPWx93JkURuyU/yZfxNU35tCNWeNSDXUJoCNntetiN34zfvJC8uOHRdYdtkTITGFkA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=vqRzHD+b;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21BA606A326
	for <regressions@lists.linux.dev>; Wed, 25 Nov 2026 07:51:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D21BA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=vqRzHD+b
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b8a1f59d5eso7004093a12.3
        for <regressions@lists.linux.dev>; Tue, 24 Nov 2026 23:51:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795593112; cv=none;
        d=google.com; s=arc-20260327;
        b=boklRMoTwzWphNUoOZAv3ZHHqRzV4RdrP+NG7J55EcsIKJqrS/hEiKzWu18lXrd9ZJ
         yDN+HgRRY/OM/tV+DybDMF6x1EMX1QDaZwwgqS36yXVWhlZOnluw0kl7+Bl/krAHYBAv
         VTjdJpGDigjmbN2B9GPO+a6oQMFkgwHMN5X/6BilR3Lt5HUhxytiu/O9k6cAw8yyk1Ue
         vk6fdRsQ5DgrY9t7pxEF4X43moEDP6aJBWxpbetQeu4THiaYk+Hik/GNOXWemD2ef5aB
         kCqXV1AGPuy1qOz2v9ckbsk/ZBKp9BHretHGr+DQpbg20swQQ88mp02o88yFni+Txoq9
         W+WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Jvc6T0hsHWXffEvQKNFhCmtcAcfBWvvbJSXZbmwAzQQ=;
        fh=Bv+7aSOPCnILLbmujA+XlcYMdvhI+WP+lz6mnwY1Ahk=;
        b=ngJ3tKp4y54SLVFKsaEXZPIiGaAswnFAVST6EZ0s6yYFbad35i5/JCADYIY4QDX89T
         f7vi3yB7MFJsQUlNNYzSPxvweLXc/FTNTn2gaVDVXti/BBw4BdnUh5GvXbDtuHY+KyBM
         jOWvNSYmixdYoLeViYYkjtv5zmd2aFLD3mctHYrKRHtDkYZEeICjb8bvWfsDKkbyiH5d
         ypwB7rfC0cwEwYwjTdqja75hhj8IVg/FOPEP763zxSpIBCQGnGMCSfZKXKL7seLcw2hp
         HRej2Zv3X2AnAalLCOMJ4YGRRYtxhPJqQISc6cDprfyJGM8v87edBqpHIWXq7a+5/Cig
         Y9pA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795593112; x=1796197912; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jvc6T0hsHWXffEvQKNFhCmtcAcfBWvvbJSXZbmwAzQQ=;
        b=vqRzHD+bf+sQPyzlsaPujY/uZTjrhsK5to3sUf++vi7F46UOLLgrR5wW/CMW0bDS3l
         VPPDRZu4nwWx3kZaKJKQhIafdKqqz0M662wMGP8Vbdm8IHYHaMoSeEviR2gHu4s7GBKT
         XBI9XPLrAMWQLaMu6y53D789meK9rIya+m+eOFvfl3nOwcevummbkYLCx6mZ3ciV6eEN
         wPWg0U6ugeZmayouacS1ZZ2LvDvhpAvUlsOfYTp1mqVMMuVBsQB9s9Gu1aDxT9DiqEb5
         DlH8FJAklLy7Hx8eEv5kud5Xiv3hGu8isjLRr7btS3+m34qhrvaHQ7mIOD6rFahhWJ6T
         XXHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795593112; x=1796197912;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jvc6T0hsHWXffEvQKNFhCmtcAcfBWvvbJSXZbmwAzQQ=;
        b=YjKqoyJmyttqgulDGIrDbLumIb5orr0+CQJFa+5PAui/XWgP9MSNeCCNGE+dMHVTF5
         vEllR7yOEecdf2Ogz04X0A8/VdZlw/KQYvwd4SixhTDtA7yRyB+0g8j3gReicgullZbE
         V2pp7Z967Ib9ggtM9dEOJl0zWM5pV95Bn/7uqR0BR5giL+o1jDyAUr5egxhYpAPjSrlQ
         YJQTVtRnUJpWL9UcPfwXOGwKmsq1kL13KBoG1UWHWugwdcGSFDipZPqJerzijwTS7W8D
         Jq2d2dv3nsnSREoPoQzFer3QGN4mABcAzir1ymtlM0BcXCOHn0aYHJx/2bh/mk0JfGH5
         7iCQ==
X-Forwarded-Encrypted: i=1; AL+hErGRTwcLL1+WXZS6pbfzUZrs+lxc21sUAl3SKqay2Vhw20At9/R1I5FWpjbumF6L45mCjnMADHyEzMBpeg==@lists.linux.dev
X-Gm-Message-State: APuU4Z/Pf2YWhGlXDX5C9w6NwDq0V+aytg5MVkkT1412RMlkOunq1uZ6
	SsHsXTbC8IKPghsEaGH69P1vqn0KrgQxiifcOQ1g9L1mKo1gj60uNA7Fvp2BelRH45vvQ8PEiy/
	Y+1oLqpHpdrsKAa2zckmpGXNjmAzWHaL60KQl+pJR5w==
X-Gm-Gg: AZFdTZc0MsQTMiGVpnQGQZ+PDdAkMKgIocDAJNmv/0B52omkQmLI/Mi2hGMeBcmfsMu
	A2ulvLc9pAkxjOkPsMwQkpPowNMG1xKEnmSUkilQo9IWBYN6ReN52iSWMzgYj2VcqyXKnJkte7H
	+WUcRpTabbkgE/cIMNX0ohYDQokRwYVCgHhFkuYLZjNczOK9ijghs+pGBNuwrM2fSpTz3ujBcpe
	Gxv4Q8POldNft+T0bMUjyFJj2zVHevmUoD+251DCcQjSngIw4lXYJEa139X7vgFuRdjHSC8vauh
	2gj2Z62LYw8dtXXf5rsfFVjNg+ORM4aXI2x4qdQRNNUjYWWv4iaRQFNTIxUR0G+7sgDNuBPpN+o
	RWwnmFNEgFf/XtFAmWY2hQ4UI/3pVYrdiJ3dMOsijX/pI/TKBkod4aV7aoHnJqVIOaBTQ
X-Received: by 2002:a05:6402:c88e:20b0:6b8:854:da16 with SMTP id
 4fb4d7f45d1cf-6bae6cc26f1mr3051170a12.18.1795593112101; Tue, 24 Nov 2026
 23:51:52 -0800 (PST)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <CY5P221MB09262B7D6A68954CC1B3199FBD442@CY5P221MB0926.NAMP221.PROD.OUTLOOK.COM>
 <awWOCejxtjP12xFX@gpd4> <ce38fb8b-94d7-48ba-93bb-3b72cfcb3e61@amd.com>
In-Reply-To: <ce38fb8b-94d7-48ba-93bb-3b72cfcb3e61@amd.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Wed, 25 Nov 2026 08:51:39 +0100
X-Gm-Features: Aa3M54rR6ZVPUahJy75241j29uSb7ZkPGUY3AC_gpwVLxdzpj7tWpPJ6cpSau0Y
Message-ID: <CAKfTPtCudy4NV8sU+JWE=dcJpbKd+LVNZPZztU_0nD1a04Ca9g@mail.gmail.com>
Subject: Re: [REGRESSION] sched/fair: SIS_UTIL limit in select_idle_capacity()
 leaves busy tasks on little CPUs while big CPUs are idle
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Andrea Righi <arighi@nvidia.com>, James Buck <jbuck2005.linux@outlook.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Juri Lelli <juri.lelli@redhat.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Valentin Schneider <vschneid@redhat.com>, Usama Arif <usama.arif@linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 25 Nov 2026 at 03:53, K Prateek Nayak <kprateek.nayak@amd.com> wrot=
e:
>
> Hello Andrea,
>
> On 11/24/2026 6:45 PM, Andrea Righi wrote:
> > Hi James,
> >
> > On Tue, Nov 24, 2026 at 11:56:52AM +0000, James Buck wrote:
> >> Hi,
> >>
> >> Since commit 61ea17a63719 ("sched/fair: Add SIS_UTIL support to select=
_idle_capacity()"), first in v7.2, CPU-bound multi-threaded work on my big.=
LITTLE arm64 board runs 12-19% slower than on v7.1 and earlier, because wak=
ing threads are placed on idle little CPUs while idle big CPUs are never lo=
oked at.
> >>
> >> Turning SIS_UTIL off at runtime restores the old speed. select_idle_ca=
pacity() and update_idle_cpu_scan() are unchanged in v7.4-rc4, so I expect =
mainline to behave the same.
> >
> > A related regression from the same commit was reported by Usama here:
> > https://lore.kernel.org/r/20261113153157.2495664-1-usama.arif@linux.dev=
/
> >
> > On Grace, a zero SIS_UTIL budget skips the search despite suitable CPUs
> > being idle. Your case shows that a nonzero budget can stop the scan
> > before reaching an idle big CPU.
> >
> > We've discussed a minimum scan budget and accounting for idle CPU
> > availability, though a small minimum alone may not fix your case.
>
> This had problems in the past when Chenyu was iterating on SIS_UTIL
> where the search opportunity at higher utilization is actually very
> low and cutting off search for !idle core was beneficial for SMT
> systems.
>
> Now, for systems without SMT, it has its benefits too but a system
> without SMT should be equivalent to a SMT one where test_idle_core()
> returns true always if an idle CPU is present.
>
> So I'm wondering if {set,test}_idle_cores() can be extended !SMT
> to act like a gating indicator to say if an idle core exists or
> not much like how !get_rd_overloaded(this_rq->rd) serves as a
> gate for newidle balance - it can be flipped to true when a CPU
> goes idle or if load balancer sees an idle CPU. Thoughts?

I tested idle_cores tracking for !SMT and EAS months ago [1]
[1] https://lore.kernel.org/all/20251202181242.1536213-6-vincent.guittot@li=
naro.org/

>
> > Given both reports, reverting the commit seems the safest thing to do
> > for now. That would restore the previous asym search behavior and we ca=
n
> > revisit a better consistent strategy to cover both sym and asym CPU
> > selection later.
> >
> > Prateek, Vincent, what do you think?
>
> IMO it still makes sense for SMT systems since capacity on systems
> with SMT only makes sense if the entire core is idle and then it is
> just a best effort thing right?
>
> set_idle_cores(), would flip the flag as soon as an idle core is
> available and after that SIS_UTIL is bypassed. I don't think the
> SIS_UTIL cut-off for non-SMT ASYM_CAPACITY systems makes that much
> sense given misfit penalty is much higher.

In fact that depends on the number of CPUs in your LLC.
The current SIS_UTIL is unfair for small system because you skip the
loop with "low" utilization:
- with 12 cores per LLC, you skip the loop if the avg utilization per
cpu is above 839 whereas it also means that you have the compute
capacity of more than 2 CPUs that is not used and util_est can worse
the situation
- but with 64 cores LLC, you still tries 5 CPUs for the same avg
utilization per CPU
- and with 12864 cores LLC, it's 10 CPUs


>
> --
> Thanks and Regards,
> Prateek
>
