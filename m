Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FA6481A3
	for <regressions@lists.linux.dev>; Mon, 25 Mar 2024 17:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711386630; cv=none; b=i7Awu7X8lbKMBigyBMRbGm2DgMZbJd4Vf6zEuq00iGfLyEUxli4dMUcjYw+cSbdt1slPpErFbiPUxwcJd3FzUJR9HFbupk4vh0iF8jg42/3KtAViTR1N5O5NhppULz5ol5ZnMyOq0lNAAGVF9hW2PWeFdJULxdLy4U2jQDjNY6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711386630; c=relaxed/simple;
	bh=pFp4gPtTDKexn2npyj7o2olGRBQTvM/rJe6ltASYeT0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X4ofO+DTIZn9Wtk5BXTOuNWKHK4hPvLimiv6/HCumd4a4SjI4Y2wgUlFdBi4W+K+mdOlsAC7+ktN8UzN8epbgDEWodt5sq1hoO1RYd4ceIz1neN6JOJzBs3f56qJTkPOG1Bae8z2Px3EBK8Jjmz9lg0w+Uc9Iq6Yu8L8ZPyIdbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QFgzUelG; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QFgzUelG"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2d6a1af9c07so66050201fa.3
        for <regressions@lists.linux.dev>; Mon, 25 Mar 2024 10:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711386626; x=1711991426; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BwMLgzH6wnxYe3UAd8y0FxS7cIE9QmN5MqBKxy7JrsM=;
        b=QFgzUelGF2WVhQ1gs/0LOBOyEr88cjOdEZ91ldmGoqQIjliVXXeWjiy8ku+VMKSdms
         K/WEVEcFApfwNRvHq4Sc9CB1eVc2dOwQnXDbOcZvBFqH0bN+zLlPRd5ASZVbh6yzl6WZ
         cFBGD72ATa7Z1iYSGXpOvWB8R7kAUu0NAppHmxRDHy33K+0wMLXLVBBvJ3uC6ulFqJLC
         0iKqhY2n3U7WS9claLabQEuXDQoQ3Yx41qasg1E1rmDSe9yebTRsVtqxogcNdAIbLFlW
         VXuPy3kzzZjXBp1kK9fwe43y+lJQAInPhgfvZjNpgOgZ8qlWRQuPln3pE7GnXBjxy0Db
         oHtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711386626; x=1711991426;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BwMLgzH6wnxYe3UAd8y0FxS7cIE9QmN5MqBKxy7JrsM=;
        b=b/PWQCYa34eigHQlnYra14v0hbQfs9gZzWSWliOpFvIhgvMYpQPDkk6RFq8GlvpepQ
         lMdxje1KZodYModmzzGEQmCulG/42HGBGEF50tZIxFWlfRJ99k+lwD7Ce6AopmZ0AfG+
         grn9yOnumb3qiSJ4jOn2ZMdyaloTgAnkwOJAcptfaoOee1KPnt6cmA92YK8bWEzyjsob
         kizQ5QvY2sLdIIyN1BLoyTlGStRdo9m1R3ZGxJdH8pPT9w9GkhURwY/eZ52vg8RXhktf
         phldr51WEN/tJdKsdPil3b2NQPKMAom5r4hSSVIfdHpVQJmnG4q3H4i0p5PJIH16Xdoh
         RcBA==
X-Gm-Message-State: AOJu0Ywd3CFIk8QKdjq8DA17OjVfrgFX46MTzLNNKvyY3A94z5wCOcWS
	+SHi6YjaE//7b/XuPektxhsJ5LAOmBG66KjiPlwuuHUjdmdSnYa4jX15+HiJDvSRBwC5Vv/VKsK
	dkedIb92Tnzl5rpp1b9jB1kjQnS7YgZE659g=
X-Google-Smtp-Source: AGHT+IH0uLBDu+CPcEXoaO/ggiaMnED1lydzcIxcbXNL3AtmSh1RdhO63bQbgK7wy1bO4NKMyxlFdYHjUYZCH/wcP3E=
X-Received: by 2002:a2e:7804:0:b0:2d6:ab62:2eae with SMTP id
 t4-20020a2e7804000000b002d6ab622eaemr4734300ljc.17.1711386625643; Mon, 25 Mar
 2024 10:10:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240314084412.1127-1-johan+linaro@kernel.org>
 <CABBYNZJV1htg46Gyu=7_iUWdukM+rHLitsLjxmWWYFGXty3tVw@mail.gmail.com>
 <ZfMStHjwtCT1SW3z@hovoldconsulting.com> <964131ff-293d-47d1-8119-a389fa21f385@leemhuis.info>
In-Reply-To: <964131ff-293d-47d1-8119-a389fa21f385@leemhuis.info>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Mon, 25 Mar 2024 13:10:13 -0400
Message-ID: <CABBYNZJ0ukd_8=SFzy8CEwgP7hV5unodca0NZ2zDZh+jPJsEFQ@mail.gmail.com>
Subject: Re: [PATCH] Revert "Bluetooth: hci_qca: Set BDA quirk bit if fwnode
 exists in DT"
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Johan Hovold <johan@kernel.org>, Johan Hovold <johan+linaro@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Janaki Ramaiah Thota <quic_janathot@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Johan,

On Mon, Mar 25, 2024 at 9:57=E2=80=AFAM Linux regression tracking (Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
> Bluetooth Maintainers, what's...
>
> On 14.03.24 16:07, Johan Hovold wrote:
> > On Thu, Mar 14, 2024 at 10:30:36AM -0400, Luiz Augusto von Dentz wrote:
> >> On Thu, Mar 14, 2024 at 4:44=E2=80=AFAM Johan Hovold <johan+linaro@ker=
nel.org> wrote:
> >
> >>> This reverts commit 7dcd3e014aa7faeeaf4047190b22d8a19a0db696.
> >>>
> >>> Qualcomm Bluetooth controllers like WCN6855 do not have persistent
> >>> storage for the Bluetooth address and must therefore start as
> >>> unconfigured to allow the user to set a valid address unless one has
> >>> been provided by the boot firmware in the devicetree.
> >>>
> >>> A recent change snuck into v6.8-rc7 and incorrectly started marking t=
he
> >>> default (non-unique) address as valid. This specifically also breaks =
the
> >>> Bluetooth setup for some user of the Lenovo ThinkPad X13s.
> >>>
> >>> Note that this is the second time Qualcomm breaks the driver this way
> >>> and that this was fixed last year by commit 6945795bc81a ("Bluetooth:
> >>> fix use-bdaddr-property quirk"), which also has some further details.
> >>>
> >>> Fixes: 7dcd3e014aa7 ("Bluetooth: hci_qca: Set BDA quirk bit if fwnode=
 exists in DT")
> >>> Cc: stable@vger.kernel.org      # 6.8
> >>> Cc: Janaki Ramaiah Thota <quic_janathot@quicinc.com>
> >>> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> >>
> >> Well I guess I will need to start asking for evidence that this works
> >> on regular Linux distros then, because it looks like that is not the
> >> environment Janaki and others Qualcomm folks are testing with.
> >>
> >> What I probably would consider as evidence is bluetoothd logs showing
> >> that the controller has been configured correctly or perhaps there is
> >> a simpler way?
> >
> > Well, in this case we actually want the controller to remain
> > unconfigured (e.g. to avoid having every user of the X13s unknowingly
> > use the same default address).
> >
> > I'm not sure why Qualcomm insists on breaking these quirks, but I guess
> > they just haven't understood why they exist. It's of course convenient
> > to be able to use the default address during development without first
> > having to provide an address, but that's not a valid reason to break th=
e
> > driver.
> >
> > From what I hear the Qualcomm developers only care about Android and I
> > believe they have some out-of-tree hack for retrieving the device
> > address directly from the rootfs.
> >
> > For the X13s, and as I think I've mentioned before, we have been trying
> > to get Qualcomm to tell us how to access the assigned addresses that ar=
e
> > stored in some secure world storage so that we can set it directly from
> > the driver. But until we figure that out, users will need to continue
> > setting the address manually.
>
> ...the plan forward here? This to me sounds like a case where a quick
> revert is the right (interim?) solution, but nevertheless nothing
> happened for ~10 days now afaics. Or am I missing something?
>
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> If I did something stupid, please tell me, as explained on that page.
>
> #regzbot poke

I guess the following is the latest version:

https://patchwork.kernel.org/project/bluetooth/list/?series=3D836664

Or are you working on a v5?

--=20
Luiz Augusto von Dentz
