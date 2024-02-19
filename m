Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F3D2C6AD
	for <regressions@lists.linux.dev>; Mon, 19 Feb 2024 11:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708342875; cv=none; b=m6WmsEr1u8hd5dap8tndPSdDQHDpoBS+/ChpMH2kIjNoKomhVLmlTvjcCcIP42OeOX4Cgl1bbxvtmvTdQbiUxXx/aNJdn/knIvxCv9WLvKeUBGyhCUsN1Yb7XYGgoF9Gfv4Lyh8oh/neIkxDW84oICQSgGAmLgDfDT1POA5B6mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708342875; c=relaxed/simple;
	bh=y1rKN4wN4lgtcvFaxZae1zsrB/QMGO6MiKKT9GWoOEg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e6ObsVN6P5sORVHHP01AW1Oh14bhLvxszRyFxg1czzYcO6XK00YjTtkeRx+T2duby0vq1a2GWvOnodriVac9+yuz+ibCn/9RjNh+LLR49thLg9fJBBYHkr4jHLoC8hAH+OEKioWJuU46tUR3bViuhhFYrg6uG3Hna/U8Zk72pV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gooddata.com; spf=pass smtp.mailfrom=gooddata.com; dkim=pass (1024-bit key) header.d=gooddata.com header.i=@gooddata.com header.b=EVSjV06I; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gooddata.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gooddata.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gooddata.com header.i=@gooddata.com header.b="EVSjV06I"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a26ed1e05c7so573601666b.2
        for <regressions@lists.linux.dev>; Mon, 19 Feb 2024 03:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gooddata.com; s=google; t=1708342871; x=1708947671; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y1rKN4wN4lgtcvFaxZae1zsrB/QMGO6MiKKT9GWoOEg=;
        b=EVSjV06Irx29zTawZNnuPrQm6r3xNI7pu4LdX4csetC6In+zewaNtmiXQARSIADdky
         CMAVTGT9JShw4nbJRge2eoTQs1NP/Nmg844HKL6H5/YZjlGSK3ut9YQF7xo8XwB1h0tH
         gRcp2eze9l5zpuCBj7y7zt5kZiByShehDH0Is=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708342871; x=1708947671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y1rKN4wN4lgtcvFaxZae1zsrB/QMGO6MiKKT9GWoOEg=;
        b=Q5WFAl8y4LSKTFPu6BOcdj5+ktBintEHUC58BNxgtxxSl4blKy8HL5GH813+hHVJvP
         eywedXqeK/C5wZ0xN5mw1DmWk19PYQuGvPx7cpsQpAtkIx7ruyuA4XoeFbovJwx9Db5D
         O9SS2finT13Z1j3qsJ9vFwhEKCiFkvyIBxzu5Clj/rfpNcY71ulBIae89mQNg3BJXDlc
         5qkOZSbYfyalbucGOJDHj4DXFiLLuZrCgUlTLRH1mVJtOCIXY656Wq5cm9Bx+MXAbLtS
         4+IXlcJBGv66M8ac7GfXYbaJaa4yxO7WQOdSa/hCwcRXjnvREsu0crJ4IaaKqgtSUQVu
         khOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOQQIZ+nE2MZHw+8ZD8lbZ3Sr15qYBcPyH4jGRxSMXJvVjrAerXkuQCwnboILRie69QwspikK4CMQyAJoFJ5IaVEFrrBg/+FBX+Ws=
X-Gm-Message-State: AOJu0Yxprw7/FxxFbMV1pB9Wj35A8cIq+Kho4SgKPIpZzVSqTsaxT0GR
	g0HKSHlCiglIsjiSua4//pR6hQNPECXSWz7xwJZ0Izj2f2rlPt0JRDKaJcqDjI4X4c1r5liT6Lu
	Na/LEpfAvFjELmW/ikjvQ+ycG+ytcBjZG+QjY
X-Google-Smtp-Source: AGHT+IFkzKLnByBb5OojiCyRc2n/pce5NbSG4IiLldK1gOdgrydITw+b165jPIZbct5ZgG9j3PeK7Lrs24w2rFGV7xQ=
X-Received: by 2002:a17:906:b316:b0:a3e:6036:3e45 with SMTP id
 n22-20020a170906b31600b00a3e60363e45mr2322845ejz.30.1708342871514; Mon, 19
 Feb 2024 03:41:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAK8fFZ7Xi3=1HFY400firmpRWzHDPsi90cUU5bjOkF00KNZWeA@mail.gmail.com>
 <bce78734-d359-499b-9693-05549e6a73a4@intel.com> <CAK8fFZ6PqCwgt1n4iuROs=76esQVSOS-HHL=0eN7+efeKT25Uw@mail.gmail.com>
 <898b6ac8-186d-4675-a1e7-abd78b885d01@leemhuis.info> <20240201065726.50a0b1f2@kernel.org>
 <CAK8fFZ6jige-zA5YPMKVf3bB2gCL8WDrY-SCs5EWeJBn5A7YQg@mail.gmail.com> <5727309c-6ced-45b8-bb0c-110b3893aa4f@leemhuis.info>
In-Reply-To: <5727309c-6ced-45b8-bb0c-110b3893aa4f@leemhuis.info>
From: Jaroslav Pulchart <jaroslav.pulchart@gooddata.com>
Date: Mon, 19 Feb 2024 12:40:45 +0100
Message-ID: <CAK8fFZ73=DQrwep_0kdmr9EfjA5CmxKOHcWCyiO7Lg5m1Gqx3A@mail.gmail.com>
Subject: Re: [Intel-wired-lan] [REGRESSION] Intel ICE Ethernet driver in linux
 >= 6.6.9 triggers extra memory consumption and cause continous kswapd* usage
 and continuous swapping
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Jakub Kicinski <kuba@kernel.org>, Jesse Brandeburg <jesse.brandeburg@intel.com>, 
	Dave Ertman <david.m.ertman@intel.com>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, Tony Nguyen <anthony.l.nguyen@intel.com>, 
	Igor Raits <igor@gooddata.com>, Daniel Secik <daniel.secik@gooddata.com>, 
	intel-wired-lan@lists.osuosl.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

If the question is for me then my opinion about it is this:

I'm fine with the behaviour of a driver about memory consumption if it
is predictable/described with the possibility to change it from
default values. My understanding of "predictable" is something like
this:

The ICE driver is going to
* Setup 64 queues per each port, not active included.
* Each queue consumes "xxxx MB" amount of kernel memory per each numa node.
example: Two 2 ports Intel NICs using ICE driver will consume ~6GB of
RAM of each NUMA node, please consider changing the defaults values to
avoid OOM :-).

po 19. 2. 2024 v 12:29 odes=C3=ADlatel Thorsten Leemhuis
<regressions@leemhuis.info> napsal:
>
> On 01.02.24 18:19, Jaroslav Pulchart wrote:
> >>
> >> On Wed, 24 Jan 2024 15:29:38 +0100 Linux regression tracking (Thorsten
> >> Leemhuis) wrote:
> >>>>> I think that's a bad bisect. There is no reason I could understand =
for
> >>>>> that change to cause a continuous or large leak, it really doesn't =
make
> >>>>> any sense. Reverting it consistently helps? You're not just rewindi=
ng
> >>>>> the tree back to that point, right? just running 6.6.9 without that
> >>>>> patch? (sorry for being pedantic, just trying to be certain)
> >>>>
> >>>> Reverting just the single bisected commit continuously helps for >=
=3D
> >>>> 6.6.9 and as well for current 6.7.
> >>>> We cannot use any new linux kernel without reverting it due to this
> >>>> extra memory utilization.
> >>>
> >>> Quick query: what's the status wrt to this regression? Looks like
> >>> nothing happened in the past week.
> >>
> >> Is someone working on this? Indeed the commit in question looks
> >> harmless but can't argue with the revert helping :S
> >
> > No clue if someone is working on it,
>
> Yeah, a quick public status update would be really helpful. And maybe
> some debugging tips that might enable Jaroslav to pinpoint the real
> problem.
>
> > however the commit itself is a
> > trigger of some other issue.
> >
> > The analysis of my colleague Igor (see previous email) shows the
> > memory consumption is caused by queues of each ice network interface
> > (even the unused ones). Our final fix was to lower the queues to 6 for
> > used interfaces and 2 of unused interfaces manually.
>
> Despite the above allow me to ask: Can you live with that workaround?
> Ideally of course this should be fixed, but well, the world sometimes is
> a tricky place. :-/
>
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> If I did something stupid, please tell me, as explained on that page.
>
> #regzbot poke
