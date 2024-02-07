Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D30317BC5
	for <regressions@lists.linux.dev>; Wed,  7 Feb 2024 10:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707302437; cv=none; b=Wq9dj7nxsvDVfQ+iA+0V89byl7R7jCbUBIoj0cx4OnPrKt3HCSM62PcA+8H0LSlkmEYankHOfZYIl8Wj6PNX0S73D1nT1trnarmRHjxFHq5t6NfREOhfFfUEDo+8V0CKXEng+LKUGGVrg+Uxa/YmdeEj+amJ9V9fG7wOKJgtQrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707302437; c=relaxed/simple;
	bh=SBYaeaIuRnUC3w0K5e3nyt12xvcEJ6H6M2CDDRVw8Nk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OFEX7ZDC9HFP6EA9NRYd/CoPV9aajIhEiamx/Pfkml3V45wDn+xz203vmqex8js4lih4F9ja+zgNvKQgHB14WpFXfi53qM9IJRTkLpCf7cq+EWn9+G3DYhciolvQjk+joJMExKXvgqxwOl83snjVC3ZQqMZo8AFYve0kTlexyLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jceNEcnB; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jceNEcnB"
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-dc6e0fe3195so441800276.0
        for <regressions@lists.linux.dev>; Wed, 07 Feb 2024 02:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707302435; x=1707907235; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SBYaeaIuRnUC3w0K5e3nyt12xvcEJ6H6M2CDDRVw8Nk=;
        b=jceNEcnB4BeJTn8i5hKcHvcevqrcswJAaWOrdDG6Iedd5xISKMt0rEGpjcmOOR07hD
         v33Mx1AZy/c0JkgqOU0M0K3wzbeaIk0fKzsmvNCnZzA7A+R9Jy227FgEq58YJQr3oBI2
         ZftYGiBev+Gp2/xtQjDC9vhG1o53/CGQ7IcJedZNXAHR+Txbb8/1dXm9/e/FHBPLVTkt
         kQo6uXP3qW1cHJMXNGk/tYojxGHRgx6tQvnSLc9nTjOcyLvWJNdKmTFBQKWUyUgOZ0iC
         MmquFIhzXUOmEtPdkybn75scSd6busBwCJepzdcAtVAH1NZ4xNkcdvu54zaU/mXY4vp4
         ac4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707302435; x=1707907235;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SBYaeaIuRnUC3w0K5e3nyt12xvcEJ6H6M2CDDRVw8Nk=;
        b=FGxDJA5lioaGbjbIuayweviYX53wd7RcNylA9iS5iBPzHiu9PMJf+zE1qldI2bMuzN
         Sc0ghQ34HCdS/B0kVdfl1hyvJ+7xy92Y50G4H7ROK+8R2oDWizIrE5k5msx1tGNm/3GR
         ToTY99CALtbOVDuISJHxffHQrjYIfVAzja8HBxlDqbH7NIiQbhTPG3vg+i93wjarbXEq
         FvmIlPqSa9IgkNEsNSh4CtYqthRMDctRubreJ0SRqv9iz1YhoNIwEWdQytVSCFqny01N
         QgF54SrSqzuXP07HeCSMf6j2YXAjIbH0xrT+uN4ZtGj+KUDItUc4y2VJSbk7fQ2zgVwB
         2hLA==
X-Gm-Message-State: AOJu0YzndUtQo81t1SEQSvg6RqZVokssdSvLibRhi6uTwZJLTakA71AX
	zeR6dhWUBnGspxxbJD8TGaOm1XqVLkW9w8r0gJyH4aPt/bbpnRmDjxfHlh4W8RBYGh7GHa2ib8r
	bfIMfCuaXsco0vxrtIfavGXTMBM/rNNc71KXOMWFV2i9UuQd84Pc=
X-Google-Smtp-Source: AGHT+IEz7LQWmT6JbJREKGnbwdfQXPNZ58Y4gBzTwXRC1OvL+RlYu/fuYoEdElXzdsKyWagQjMcXUqHmCDDHbwhFeCE=
X-Received: by 2002:a5b:b87:0:b0:dc2:2608:af74 with SMTP id
 l7-20020a5b0b87000000b00dc22608af74mr4439839ybq.26.1707302435177; Wed, 07 Feb
 2024 02:40:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240123180818.3994-1-mario.limonciello@amd.com>
 <CACRpkdZxOovTOF0rOjyU1WwaRLZqML41hfYcC7z=HsAQjY8BsA@mail.gmail.com> <4e9e5ec1-e040-49e0-84a4-9f86c0fcec1b@leemhuis.info>
In-Reply-To: <4e9e5ec1-e040-49e0-84a4-9f86c0fcec1b@leemhuis.info>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 7 Feb 2024 11:40:48 +0100
Message-ID: <CACRpkdZ4pyFh50imdgL6ZxgAyRYCxsuz0DbmssELZ0mAxVcRcA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: amd: Add IRQF_ONESHOT to the interrupt request
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Mario Limonciello <mario.limonciello@amd.com>, 
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, 
	"open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Christian Heusel <christian@heusel.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 7, 2024 at 9:07=E2=80=AFAM Linux regression tracking (Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:

> [me]
> > Patch applied for fixes!
>
> Hmm, Linus, that was a week ago and I still can't spot the fix in -next
> or
> https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
> ; am I missing something or did something come up?

Something came up but it's just illnesses travels and other such
excuses.

I have merged down fixed to for-next and the patch should appear
in linux-next and after that I can send it to Torvalds.

> Furthermore Christian seems to grow impatient -- and I do as well, as I
> recently couldn't wake up my laptop due to this while on the road. :-/

Sorry, my fault :(

I will try to get this upstream as quick as possible.

Thanks for chasing me!

Yours,
Linus Walleij
