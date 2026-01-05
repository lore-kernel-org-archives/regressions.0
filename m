Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3923D311975
	for <regressions@lists.linux.dev>; Mon,  5 Jan 2026 18:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767637974; cv=none; b=JAvAbIHCyfyj82Ip5+6NGCbRswIS1LhZd+qoE0x5PzHElPIAa7dNzIzg+BcYZvvn2OuTJcbUJ2JLUOp0003fP0Q9f8UQiZwBftZyxgLBxFFODYLEmvccEDbax2Muv75T7VeE7X+F6z5J7Mpgt2+a80Pnt9auJMv9UKNg+kTRcN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767637974; c=relaxed/simple;
	bh=UcA2PKJWmLnQbodbzmcAjhreD3tSvaZhTxTKoHDkBRw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N7dnDRWCyugS4ih54Ea5c6BL7Vy9/AO7+wL0zZjZ74Z3KJ+ux6DGVLIMMrEEW5CbCJF4dliXkw7IwWVQINukQaxBuonffwYr/WnYkfFIFtFFmHEWHxumMKc7P86/KiK9TYP7e3Y7cNjlnJEqndyCIR+49yX3KuIkfFbft0RFFRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Wmf2c8Da; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Wmf2c8Da"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-595910c9178so143576e87.1
        for <regressions@lists.linux.dev>; Mon, 05 Jan 2026 10:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1767637970; x=1768242770; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BVTE+mywRMMvpNgWCLEV1bveDjP0Q+44SFkE/SVMdGY=;
        b=Wmf2c8DaSq3wdDtlRJAemF1KQ2t1h8V5ecy70lj5/Ay+QjMGgjfcubcmBn7Tya72/y
         CHJdpNnT7EsH5gYpwCbt+R2rQdoZSxhGbLeMYBLw5g1hJWWRR02yJvHnS7LNbPsSmLlr
         +6gfOlkfk31t8OhmF0MnD8rY5hlbhIUGCRu3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767637970; x=1768242770;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BVTE+mywRMMvpNgWCLEV1bveDjP0Q+44SFkE/SVMdGY=;
        b=E2aTmxd/iVOAhbUVQMGmVH4g7g6kCiOYE0jFuhqcEKdvVmHLOJ80eUAgyOTL0rfBDJ
         AunKs7taELukHQwg8TCqB570/YzdY4ZDuiEQtbg5kts0RlkWcUMOPY39Jsk9RQL6ohOi
         /jnhrc8MRsWnrckX7ViJkNJPBSGAKSt8QpFBlRiMfYQ8CReKVHefna3Z//fYGWmDloIh
         uQtd//lDb9+VORyxdlNJ3b7OeLs+yfHHBT5hKO+IHh+5RVKd9e1T4DSzD83tU0v2I4pr
         Nf1nx5NfKuQS/ZSeN26xFwSYqxPa4fXTXrRP/Sl7LpOeB5Q9FoNzQSziWEHMEwdYO5fB
         VECQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRqFqsFq8EIPiwgPN+TJYAgaK9wwgx8ec7KW634UpO9Et1cwC0Gm7ZSKIP2rJi9+/vN32auXbMMTJUXg==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywfzb4eQjasG6gMR9HRHbxhg5XAkBGaiyYTs8LkXEQB+Eh/5Kox
	0WS3D+igrTl87UpaBiVkIWb3VxETG4W4NkfhQaXxNZSoSdflcpUmAlPuavuTfYADtktP0YdLRuF
	8oFTwnA==
X-Gm-Gg: AY/fxX7nQd4/e4dF1PusOdG6O23AqoXFhFmfhuvijjr+K92CDQYVXt1ZQ0pZLWWspWC
	GuX30EKmnGcyVkf10NhK+/vaWM4xolHm8WcwCjfcvbiI/wOg2+OrueSmTWKUfpTvOjhlvA5XhEV
	dy54WNhI8C2n4MHNCjO5+wWYVVuHwWsw3HtUqMXfXj9Ce0RPoZuMnG1pawtQu5Mc9RDvohq/qqf
	a0v54aVpyu1HdV0/IHdFAmVN4XXQC5ysiW7avRPjod+TbUfwB8N9lmzAX9lr6mnNjJMXkkAyk2N
	ThBkOV1T2iXIJeQPR6xhc2YN8MUdGpBpdX7JZx4ZrbrxBa1bfCVYFLAQz/5jmyZEoBHCXIUcztm
	6D0IhrMMKuBLg7bHK5FUQ3tcWU6U3nLIq0x2AhF0R3wuSJv7WFaPpid0lfHeObqhGSEpdPDwgPn
	sAtGf4hJ3x7GFU6u0h9illET71rXcMSktccFJkde3RST8h8WJ6KBIN
X-Google-Smtp-Source: AGHT+IEcbwZuG6HFAnnhkB41CB0wndNWyCm6Hqk64Z42+uCA9xJ2rkDaF4nQDyX8V77MpoZGrVzFLA==
X-Received: by 2002:a05:6512:3d0c:b0:595:7df4:5a73 with SMTP id 2adb3069b0e04-59b652bbca1mr195295e87.24.1767637969851;
        Mon, 05 Jan 2026 10:32:49 -0800 (PST)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b654d4731sm75633e87.21.2026.01.05.10.32.48
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 10:32:49 -0800 (PST)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-37b96cbd875so1884341fa.3
        for <regressions@lists.linux.dev>; Mon, 05 Jan 2026 10:32:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV2rV8rHH3Cscr80vU+MSVYIOLOlihgkoGPrSHmLTH3ZK2oQbN29nSJlAKA1mTXXsvbBXCc2Bk+AHhgHQ==@lists.linux.dev
X-Received: by 2002:a05:651c:3057:b0:37b:af2d:13a3 with SMTP id
 38308e7fff4ca-382ea9e6f93mr761391fa.7.1767637968327; Mon, 05 Jan 2026
 10:32:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <aS8YBLEPwF0-NtJO@eldamar.lan> <ba9a132e-6296-451f-8351-4045c0b72d6c@ralfj.de>
 <4rnbopkefvp6h3dwttj4h7cexehqtbuzzz4gatnebdnjzdy2li@bupytpnlk2xh>
 <2ed13f74-8de3-4caf-8972-26dd5a31e9fc@ralfj.de> <uboug5ectzm4s32yfgopjbcxq2uhsoc4kluaby7a4b7nzfjave@boco7oocnftr>
 <176458169204.346596.13968096833088921213.reportbug@r-ethtop>
 <0490a39a-28d9-4925-a162-5e4d498be257@ralfj.de> <aVfPmZ8rUm3Vf7pT@eldamar.lan>
 <58a7c628-63dc-48f7-8a46-357ca2d7d500@ralfj.de> <CANiDSCtX-RJrmfiK_rOqi870CK06_ONvnsvqWRZczBXY38eg0w@mail.gmail.com>
 <20260105180033.GE10026@pendragon.ideasonboard.com>
In-Reply-To: <20260105180033.GE10026@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 5 Jan 2026 19:32:35 +0100
X-Gmail-Original-Message-ID: <CANiDSCtAhrVudmAG5uzrXF-BHQf7CSK+SUV0SorVAnbjLA-qQg@mail.gmail.com>
X-Gm-Features: AQt7F2oWjeR-frtJpBOVHGmX8D9NiYOfqgYVTg0rqMMZh14YYMdAc5LkQMGpKmA
Message-ID: <CANiDSCtAhrVudmAG5uzrXF-BHQf7CSK+SUV0SorVAnbjLA-qQg@mail.gmail.com>
Subject: Re: Bug#1121718: linux-image-6.17.8+deb14-amd64: Logitech C920 HD Pro
 Webcam shows flickering artifacts (sometimes)
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Ralf Jung <post@ralfj.de>, Salvatore Bonaccorso <carnil@debian.org>, 1121718@bugs.debian.org, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	linux-media@vger.kernel.org, regressions@lists.linux.dev, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans de Goede <hansg@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 5 Jan 2026 at 19:00, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Mon, Jan 05, 2026 at 04:29:24PM +0100, Ricardo Ribalda wrote:
> > Hi Ralf
> >
> > Thanks for the bisect and the report.
> >
> >
> > The patch to remove noprod parameter has been queued for 6.20 :S so we
> > should look into a more permanent fix soon.
> >
> > When you say zoom, do you mean the desktop version of zoom (
> > https://zoom.us/download?os=linux ) or the web version
> > I would assume that it is the zoom app, that is ignoring the "error"
> > flag from the frames and showing them to the users. Can you confirm
> > that? Hopefully we can reach zoom and they can fix it.
>
> Should we revert the nodrop removal in the meantime ?

I think if we have not heard back from zoom by rc6 we should revert.
But IMO we should wait until then.

Maybe we can find more users of nodrop that way.


>
> > Now about the error flag. I have given a fast look at your usb trace
> > and have only seen 4 frames with "error bits" [1]. Can you add more
> > tracing?
> > Do something like:
> > rmmod uvcvideo
> > modprobe uvcvideo trace=0xffffffff
> >
> > Then start zoom, trigger the error and share the content of your
> > dmesg. It should contain an explanation of why the driver thinks that
> > the frames are invalid.
> >
> > Thanks!
> >
> > [1] I used this filter in wireshark: usb.iso.data[1]!=0x0d &&
> > usb.iso.data[1]!=0x0c && usb.iso.data[1]!=0x0f &&
> > usb.iso.data[1]!=0x0e && usb.addr == "3.34.1"
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
