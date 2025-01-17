Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC19146013
	for <regressions@lists.linux.dev>; Fri, 17 Jan 2025 14:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737125379; cv=none; b=hvdeKgOcU/UfomHx0mW6QuTJxgQutERdVAdToYXsLH5DIaQffUlTbNh04EFcTSh2pFajqjDixMQA3SIcj2NwduASCbk7BSA48MifJmR36KH/4kxQWGusuBrq+VE9ZJA0ZSse10571Yl9MKPglOaric3XFH1PNUl6yjwK9IGIFNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737125379; c=relaxed/simple;
	bh=J7NtJ/2CGnRPUrqXAzSrynFAm0A1v3zdhB9kY4SE/QQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hHrCzB7YdBaGG4OxldbUkkPqQ+U+ln8MO+TYB2iOkoAB9858KAbzwdijSqEDwO6mPSFlr37vKsqwufBx6z/nhG0W4Rn8Vk9XAeoL6Bs9ISMyd4MrUI+VMPcg+wNpmLMiKy/ztbs+VSx8FDF5c4ObxJjPt1SJR5RktR4jSWvVvjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D5+KbfJZ; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D5+KbfJZ"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5d3dce16a3dso1188029a12.1
        for <regressions@lists.linux.dev>; Fri, 17 Jan 2025 06:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737125377; x=1737730177; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J7NtJ/2CGnRPUrqXAzSrynFAm0A1v3zdhB9kY4SE/QQ=;
        b=D5+KbfJZ9gpqMjb3RGdmi9Xj0Nqv1kPSJuaRTaYj5W5CsWTkEfMuYvIVxGAGrBnZ8R
         Ueik4/67tQPkEYjjRBKHeVvQd6ACwRxc/cLiGdYNGpihylRq1FfTm/7rxynoZPQN57sD
         ocyOZSINUR2Ibsa7R1EmsTtyOcrt5wsd0LiWKhRHCCvoykgWLZs0KmVMkFSwYYAPRNuU
         WNR5AfwYrOIKl7tkqtrcFaQJyc33OEEq6aUxpNFQar50KEocIP61aCWAOEJIunZPEtFX
         4XhDySOJlZn4v4zrzl4f4jS4ucBieq2vlcwBXzFWlCL0sI8IT442sU1G/WAmfhvhagZw
         rgwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737125377; x=1737730177;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J7NtJ/2CGnRPUrqXAzSrynFAm0A1v3zdhB9kY4SE/QQ=;
        b=UKYhcOiXaZNdCZmTi+fxmVcAj8SVcjvm2iNk/vUCW2CsjnWeSTRUWPnhNnpqRLsSbN
         MjQpUEQ9KmhjRpfH4omo59zxQdFq5iZ844SP70Sn3ymJvezOq+IXrV+b/KtaxnEMsqyA
         7zaeIKbfyXtxf21ogw4p05JX3q9vILwHadAxodXE0Fv0kQDOUTqVnagZd/9x5ajCtOmX
         XRsHCURQ/ocKpF1cuwLnTsvlhOk4opc9q5ruPSqsEvHHKEfTASRUJqfkeItT6RP1bCFa
         UkKAEYU6simFslrA0BFr+UochuQ7p8gDrho7n9+7Vb9hO4I6LNmIgJ1F+PCW6qt7RyEc
         9zSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQZX2xsaie0fo0ZbVZAyRdSTmGBeURjPTIzWQZE5U+MBYdEcgw419E3ITxZIf3MhLNtC/Hu/ia/ouwKA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzbBFyJNv1voJbBvgNMhHm4cvLkh60zEyxspjLDrn+0uMZ3hrjO
	nhcujdxiy3vxZMafRxpebMZfEW0jdXRFw1HxSBAeS4VoBxssBovOAoKLsNVaXGpuVoU0Yg5853e
	25g2cGLVAIngFwozmXRdKDW0Pmf8=
X-Gm-Gg: ASbGncuzScA08HaSMGEH4woioYpb19pSYENsOygzZ77f3m37BvvnseLpalZujCEmtL4
	9SU6U+x9RZB3gyLHtdFeKYGubafIUHXb90+zlekAiWNMmCclAplg=
X-Google-Smtp-Source: AGHT+IGpEcOBlkQvfFQwR1IfdaH3ql+5HBvL7fnpTjZQnIXw+y5aVXFA9OTwVbCl4BUwqlz7q2N78jpEoIqUI049McU=
X-Received: by 2002:a05:6402:3514:b0:5d0:e9a8:4c96 with SMTP id
 4fb4d7f45d1cf-5db7dc6a1d7mr2569157a12.9.1737125376429; Fri, 17 Jan 2025
 06:49:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKd8=GsoKj5eG6VAMkrxMbzNyoBX=JiwafrfXman8xMNK+XU_w@mail.gmail.com>
 <2025011703-erupt-oblivion-82a0@gregkh>
In-Reply-To: <2025011703-erupt-oblivion-82a0@gregkh>
From: Lars Pedersen <lapeddk@gmail.com>
Date: Fri, 17 Jan 2025 15:49:25 +0100
X-Gm-Features: AbW1kvavePghQR7w76HiBZJJQWzrG1w3Qh6lfSk_xp_TBweAsK6Fg0BTdYxCGGM
Message-ID: <CAKd8=GtrnvEgZv4y-UYNTJWt0oU9zLxZUYGnm9__H2yXKwyOGg@mail.gmail.com>
Subject: Re: SPI regression seen on ARM am335x in kernel 6.12.8 and 6.6.71
To: Greg KH <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev, broonie@kernel.org, 
	linux-spi@vger.kernel.org, psiddaiah@mvista.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 17 Jan 2025 at 13:32, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Thu, Jan 16, 2025 at 03:21:13PM +0100, Lars Pedersen wrote:
> > Hi. We have discovered an SPI regression when upgrading from 6.1.99 to
> > a newer LTS version. Same error on kernel 6.6.71 and 6.12.8.
> >
> > I think we have identified the problem down to the reference clock
> > calculation that seems to end up to zero in the spi-omap2-mcspi
> > driver.
> >
> > Also we think it relates to commit
> > 4c6ac5446d060f0bf435ccc8bc3aa7b7b5f718ad, where OMAP2_MCSPI_MAX_FREQ
> > is used as fallback on error. In our case it seems to hit the else
> > case.
> >
> > Snippets for device tree, spi-omap2-mcspi driver and kernel divide by
> > zero error log with dynamic debug enabled.
>
> If you revert the offending commit, does that solve the issue?
>
> thanks,
>
> greg k-h

Hi Greg.

No it doesn't solve the issue by reverting the commit. The commit
isn't the regression, but it attempts to handle it in the if/else
statement. Everything starts to work again if we hard code it to
"mcspi->ref_clk_hz = OMAP2_MCSPI_MAX_FREQ;", so it seems like the if
else statement isn't 100% foolproof (or we have missed a setting in
the device tree).

Thanks

/Lars Pedersen
