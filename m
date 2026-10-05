Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AB8453A44
	for <regressions@lists.linux.dev>; Mon,  5 Oct 2026 10:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791195255; cv=none; b=BB3yB6iGwKKdbfjBVuKurW85LEQE9VQ5bnhB6DK8ZolOYrP2rNSYSK42Vlf7legyn7SvPIT0b9uPRqCgGyyTD6ALHf2dIFkBCZ4yL5kAytWn6rkFI6LKM6EhCNPCmC8jP66VowUTpx3qo7q4oyp+7K2FhET2/wzt+Qf1WJrami0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791195255; c=relaxed/simple;
	bh=EM0J4RW0TJcHUV0GbCldQVqg7twkRwPbEZ1nyYBdBv8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VK3L7PBFZ6iQ2V4Nn1OVA2WsthUYVcltV70yHsgw2rjjlGa6Qsg09WlJp7zRabLCBbIxlpcePaEPrEAS9IzdInLVPbFjTv/8JnF0qZSxOyx6DNUcqRi/GFWMR/pRNIJtc5D1XZsH7rBDLYLpsC+9hVYQz4ST2VGdYeZ9CS4cyDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gxBRdnYN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gxBRdnYN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 437591F0089B
	for <regressions@lists.linux.dev>; Mon,  5 Oct 2026 10:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791195254;
	bh=xSsLA+IqY51yLDT1KxVLTTzC4fGN0KbJY5YYj55fyhA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=gxBRdnYNshaj9sEesa68nQPILYOllVM1AJPic2nBL1Q5PORb3gg1adRPL5dW9Bgje
	 lJOSsaM1Ffzd52Zg2PHwGXYN++6ko7S1nREdpdq+pjAyld6+D4AWhhkj1jTt3RNJOb
	 fc/hdeVjmKOVDZagOzd0B13dIFHtWrymLPDlJQK685UOm/Exi0N+Ij+KGVlml+zzVY
	 oWfjpm3CmJyGXSOX+OJQuP/7uWxUQ3boydEygAfu9Y3081YVp5t8Ycg5zPC6jkEk4a
	 8YQu9calm5EQKym9VH+iY4c/3NbPEIbxLRMT68XcSFpXB6SJTPIktHHadDf/bkabaG
	 WPy0ZLbLpC/tQ==
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-48ed460be50so869085fac.2
        for <regressions@lists.linux.dev>; Mon, 05 Oct 2026 03:14:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBySRK3rgmFlC5kqUw/6Smuz5CKAzvHwxOMwD9A/qpN1LksnucNSqG2aHh6KWcCJAJAiEKgyMwGVoJsxKQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYIXym1ZT4VXsgF69k8GMgKUday1RXSMtXIbAdqwwzs1nkZWy5/Z
	l1J5ilWACTj8Cm4zTGdFVnD2UtMYGNZfTYZGH5wMFQNfPrVgQv3Vp6owMHELlwd0UEUUVUVGGsy
	zkOXPzT9ahVSZXxSx0mIJPzsxxH7bMG8=
X-Received: by 2002:a05:6870:b02a:b0:493:ce9e:5c7d with SMTP id
 586e51a60fabf-49e3aa0d200mr5742235fac.60.1791195253538; Mon, 05 Oct 2026
 03:14:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261004122616.56714cbd@nargothrond> <f0c52ecb-b85d-4a53-8329-a8d2fd5d72b8@kernel.org>
 <20261004163532.3134dd41@nargothrond> <20261004192902.3ab3b7f3@nargothrond>
 <919dcfaa-005f-4bfd-8889-39acda5f7a92@kernel.org> <854f3985-a4ab-4014-b18d-9fead61602e1@kernel.org>
 <CACKFLine2gKepH57mg5j2YYWsX-qU8-EfJfnqWiYUEhpXL1F9Q@mail.gmail.com>
 <ef6eb827-71a6-40a6-a4b7-8e514ab595d3@kernel.org> <1791193344.w5j2m55mib.astroid@yuna.none>
In-Reply-To: <1791193344.w5j2m55mib.astroid@yuna.none>
From: Eric Dumazet <edumazet@kernel.org>
Date: Mon, 5 Oct 2026 12:14:00 +0200
X-Gmail-Original-Message-ID: <CAL4WiioggQU3VtWSL9nrExg5SZZbKiPA8pWmzeH+uRa0gy2ApA@mail.gmail.com>
X-Gm-Features: AclHuK_byAt-ykfE_NIEd6L8_DC36yPcKDXrW_cT-wbCsEvjo3tLjEFgx-SE9lo
Message-ID: <CAL4WiioggQU3VtWSL9nrExg5SZZbKiPA8pWmzeH+uRa0gy2ApA@mail.gmail.com>
Subject: Re: [REGRESSION] Commit 447cbe95ebb9 causes IOMMU DMA faults on
 macvlan/vlan with bnxt_en
To: =?UTF-8?Q?Fabian_Gr=C3=BCnbichler?= <f.gruenbichler@proxmox.com>
Cc: Michael Chan <michael.chan@broadcom.com>, Joe Damato <joe@dama.to>, netdev@vger.kernel.org, 
	Pavan Chebbi <pavan.chebbi@broadcom.com>, regressions@lists.linux.dev, 
	Stefan Fleischmann <sfle@kth.se>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 5 oct. 2026 =C3=A0 11:44, Fabian Gr=C3=BCnbichler
<f.gruenbichler@proxmox.com> a =C3=A9crit :
>
> On October 5, 2026 3:59 am, Eric Dumazet wrote:
> >
> >
> > On 10/5/26 00:29, Michael Chan wrote:
> >>
> >> I think skb->len is not updated with the padded length here.  So the
> >> HW will drop the packet seeing that the length is too short.  There is
> >> another skb_put_padto() that might work better?
> >
> > +1 Exactly, thanks!
>
> FWIW, we suspect we have quite a few users running into this since
> importing upstream changes from 7.2.2-7.2.5.
>
> Will report back once we've provided those users with a kernel with the
> below diff.

Patch has been sent for review:

https://lore.kernel.org/netdev/20261005023812.130639-1-edumazet@kernel.org/
