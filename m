Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91233364929
	for <regressions@lists.linux.dev>; Tue, 13 Oct 2026 14:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791901024; cv=pass; b=CSEMfWqyxJt4EEv8xzcFKIXpCYXmr1XxHookp7eAjMeSkzQq2Qo5yWaGAp9miqgeTeMvUrBaAghiN8tze2k/MP+nwKoYxfnUU39fbmIUmaXVZ0Nmx/285oyncrtQrwKyFDFHgDMq2u7snkUrs9jlU+WM41KTSBTJ1Bswf49lsPo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791901024; c=relaxed/simple;
	bh=wNycpsWBlfQXgs2ZLPtEBzEs04amMNcoEiI5MVrXE/Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D+5NwrmdYwtn54xms/++QTRPkf2zEYgsW1sloZbourNhdyHn91suBPXywET7opgiCF1zCwWn1FRQx2P9rRR5VTP95D7msDVTswsYLEf42cJfjFH7vs+g4XSoCJQgW09Bk8DZ3Ov5gBc3E8nF3HQsmG/Cz1rRwjf5HA3vx4x+awQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MUJlm6tN; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MUJlm6tN"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-676858d42f8so2315550d50.2
        for <regressions@lists.linux.dev>; Tue, 13 Oct 2026 07:17:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791901021; cv=none;
        d=google.com; s=arc-20260327;
        b=hnm/QVkk6FjcNfoMetYdWuUKzPPUTeX2e23WE7xRKJXZFNrkhPJJ0jpVtuytOvvZkZ
         wXTKRtYKfQRfdCj7NSt/n+QjNxSr/lyc5zpu1L6/CtYAfCJWR/Q35zsCE4faqI07C0Cv
         bmHkh2eKG1HlG180XAt00QDEBxe90OiRwgqI0zcmKzl4IVbVS4X7Je4IGDEOo+9yEop5
         GKGQIlWVQvFl3gxwa1tH/a4pQSDmNLsFWc6IOo7v+jqHWAeIc1qRYu9xpjLsNqy2to/R
         9LZ0d9BG77RPONF+xFUvBTSMBKzW9dxupGe+/UNl++BKvWPh3JAorpGoUhWa7wG45TED
         clKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wNycpsWBlfQXgs2ZLPtEBzEs04amMNcoEiI5MVrXE/Y=;
        fh=8lksEPvrUTrd/cudr2kFFLtlB9HDhvSNmJ/hrmJ0GNg=;
        b=LL8aJ/jvBQnvCJJYtuRRbpBfbPrsbCTLzLtBIyIqtF4q5rn04+j4CCEkirhgTx+0pt
         I4EXjnP6CUhLG481tUPHoEPxG4F7zUxvH9ba9MPk8w8g5SNXiiuc4WeUpeWEd/m1Jkb5
         I2zZxAFpOexIS5o6x86ZWYEi7plJQVwfsS7VvxozZtGVsVa6GV65UIH6aGfVxHlVMs97
         7cnfShdVyBAqt55tKdC4SqgBdKosYMXmSbON4hs9WDYCZzdedpj0PKpJvUkfBXpYMxVS
         pGJNsYMoD2L+XB5RVaCxk1s/t4yIl+X6SpVTOkdRkIHOPRx5VpUX1JpYt62bmLgnevxK
         t/4A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791901021; x=1792505821; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wNycpsWBlfQXgs2ZLPtEBzEs04amMNcoEiI5MVrXE/Y=;
        b=MUJlm6tNE/axxw0A/fNONp9E2BijgY3r7ylK/0KID4siffKMQz1wxGgu4Ir/wVeh4a
         3scGHfDos4kKo+Lr+FJQcCXeMKkIMwtXzlB2/uCgSdt+yUeitl+Qo7eXG1uTlf7HWJkc
         MRMmEmN/FNDJUOttebndck43j+og1XCSUbHm79x5fAY/aNBlWvdIASf7YhwvkJyO9tEH
         WUkw5Mz8bwwnHc7Ypk8OGpkE2bMwaJnWQ6KLu7AtVfxsu+MG2MiNe4DwRd9RmDWCwReQ
         TycP66gu5XBxNiMpCJlo6pCE5+UFrqfHYX9gzlMJM9IYQkiNVDyuUMmyabTpAxJNZxt5
         BK3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791901021; x=1792505821;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wNycpsWBlfQXgs2ZLPtEBzEs04amMNcoEiI5MVrXE/Y=;
        b=Bkb95QZkdT7omOqdbKvqRhpsCTbDJjotZQjS2m2v5uClF1wOf1V2LYMZzsJeTq7YTj
         qoxbdBGvfH0iLqt5UAZGK/0dzbeEVFzkXA8Q2ytRBYv09FXf1kKb+TkydytWON4DVw58
         Xh4Zk99U7xQLTKaMyWvaLDIgEuNndTWWjHzddBbRTyjAU3j8yNpjqZHLCuNlFN5TiwXt
         09fnI+tV40CsQ5so/5OiMMdBDI30hONV1YyqmYDtA+5FYnb7EtzvlIPyMFfNwp1r+FlI
         RM0Az0zEKqdUMOjKwLcygCFXUafWEiWW3lTFEiXjED+h1fTe4leyZBNT66+QvXkiPz1H
         q/2Q==
X-Forwarded-Encrypted: i=1; AKwUvByBWI+477KdFXHV/1EjfybTmApKRpuekg/zsyhAm2v7N5Upiaa9fTtEejTbr+Sqbb0vQ0LnC+6KnGxrHw==@lists.linux.dev
X-Gm-Message-State: AFq9FYKCLD2PumsHLNM8GnOHWBm0MMchEE4Lk6PwKbGVpvd2J+PUgJCe
	Ok+76sWum1Y06DXZG7NTh17potwAsOo2zOm7hEvlt5d5ZzocwRJ/bLMbqFP9FihnNuxv8qkN6J6
	UJRYKadTJO/tpq4jVHtUUQc7cTougwwJhi2XOWRny3g==
X-Gm-Gg: AYBFou1aQXN6FRbTbcpwqPvlpZZkMs3tWMy+BbcdobvKdHPR20hwqjsCmGV9FYqNohV
	rPmQ31gv8Dhe0N1JDG1We62celQ/lybnTvTwJ4W3efDxLQbsINSL21il9ycG6ZEeaDpL2mS+d6d
	HvS55pStCmf4XCCq4PKTzdXF7CXRxlV1DWbf13BZOS/jZ60KIH84sSgGEG6UiUL+rEN8es3KVJz
	Dm2lQONC/+NExygwOhYHY8Tb7azcNelNMvw+m3JHE+k+JKcRh5BfOfUJKGlFbQ04eVMSsdGkH8j
	GbpzXlFgqeTsOOlll54YHgHsWtaKoSvh5x+da2B9NOr5XJFdQ3h2Y5BgKiaaq8ImJAHZdk7O8ia
	QkvqilyJu1jr0jfokijdRmIM=
X-Received: by 2002:a53:e313:0:b0:677:b7cc:210c with SMTP id
 956f58d0204a3-679362ede62mr2859896d50.163.1791901021395; Tue, 13 Oct 2026
 07:17:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261005064133.7305-1-kmehltretter@gmail.com> <d1ef135e-1b5d-4656-9229-348c7029efbb@leemhuis.info>
 <as0r7Q4dHt9gQm_8@gmail.com>
In-Reply-To: <as0r7Q4dHt9gQm_8@gmail.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Tue, 13 Oct 2026 19:46:43 +0530
X-Gm-Features: AclHuK9yOH0W7FJ5IkLpKJOcXHUnKCWcM6_hFWllx6ZiiWF7Douv1aRrjUDfUxs
Message-ID: <CAO_48GGTHcs5M0WyY6dcJLxy1kUJq6uNLh_s+221t3HcGoMxSw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] dma-buf: warn-only mode for DMABUF_DEBUG
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Jason Gunthorpe <jgg@nvidia.com>, 
	Rob Clark <rob.clark@oss.qualcomm.com>, Jianfeng Liu <liujianfeng1994@gmail.com>, 
	Diederik de Haas <diederik@cknow-tech.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Vinod Koul <vkoul@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, 
	Linux kernel regressions list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hi Karl,

On Tue, 13 Oct 2026 at 00:21, Karl Mehltretter <kmehltretter@gmail.com> wrote:
>
> On Mon, Oct 12, 2026 at 10:12:02AM +0100, Thorsten Leemhuis wrote:
> >
> > What's the status here given that 7.3 will likely be released in a few
> > days? Note, I can see from the discussion that this is a complex problem
> > that can't be quickly solved. That's how it is sometimes. But I wonder
> > if the current state of things is the best compromise for now or if
> > Rob's revert or some other option would be better.
> >
>
> I think reverting my commit 143755bdabaa ("dma-buf: Make DMABUF_DEBUG
> default to y on DEBUG_KERNEL kernels") is the best interim solution for
> v7.3.
>
> Christian, Sumit, could one of you apply Jianfeng's revert before the
> final release?
>
> https://lore.kernel.org/r/20260926022026.10539-1-liujianfeng1994@gmail.com/
>
> Thanks,
> Karl

I have pushed the revert to drm-misc-fixes; I'll request Dave to push
it out to Linus along with drm-fixes.

We should revisit this for the next cycle in a couple of weeks for sure.

Best,
Sumit.
