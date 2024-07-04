Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32AC26AFA
	for <regressions@lists.linux.dev>; Thu,  4 Jul 2024 13:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720100029; cv=none; b=BplAY285gTXz59Atxbdad8F7yFE99xNtSMu2lryomteKPWYlNNiLJjk3i8/1lLWPrtTSLjBFPYApG9ObD/00baymqArIhR0DR4H8h2SIUyAwkKMef8vl/JgxLl/QPeRc1XUGmI5b7h9neSNNlcY+QE9EY9TlWsQoqlwqsj2/Ts4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720100029; c=relaxed/simple;
	bh=YTpdR8BWwbMhfLGFsScSQ+dfvCM1UcGB7JaHRWuCLtg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fDc28cwVvFems9+9f8O1kIcORmDDclOYoLA/LrunUGpskGSPCO60SNOjx37JbsEVulbn5cXhA72LmqFaPxD3pn/Zs9H5Xi/meNdIfCpFcKL6WYLMcXcnaF2KYPZMhEhSsU66MIyh/Mkzbu9TLmOHJnXw+S0hYsM1sdQHL9oZVfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IT0LM+99; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IT0LM+99"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6518f8bc182so11540857b3.0
        for <regressions@lists.linux.dev>; Thu, 04 Jul 2024 06:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720100027; x=1720704827; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YTpdR8BWwbMhfLGFsScSQ+dfvCM1UcGB7JaHRWuCLtg=;
        b=IT0LM+99grt+7gOkQbl5dyQizbtEFjX374fdKPP2QKPdEJD3uiXdcdntxBzv3GzWRo
         Z9fNa8JXfZfQumLPr5KtO3ee3WRGdNz5uLxv6fJaU5JHR4i+pBZ62Lv6Z3CLX7d+hYD0
         0XBzxOqkLfJZbp1wMSYe2F3Zkjkz2PqJCXLOlKGmTNi94M4sQPB1agD/usT+Mt5xo0KF
         sbH25NZNZa80r4xzM7g/gzqKDRscVm+o6gCBDuzoIQzExFF3E55UO99niTnHXYCQEIia
         O3CzPLJ2bTF1ZDlmiJ+hGbyuVf++0TocY3X8Qv56toYs5ArPBm1ndpAkHuums4zfZicZ
         FWVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720100027; x=1720704827;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YTpdR8BWwbMhfLGFsScSQ+dfvCM1UcGB7JaHRWuCLtg=;
        b=BQ1rq1iCyV58cEKrDrSULrAPlDEJKTZ2YmHZKF1VRZKmvTW3E8iiS2T5PNs/1dMP3R
         rVFYOtusB8JwUgWghdmiTnw5yUUB4glS4EN1ub7xKcvh76zWRYGAi4S6f3RyetuInpML
         dWm45y8jMxuH3TbubDdT7Um25cOngpWeHcZpHHi8ev26yUp8qNvKJvGnep3q0uNKnSFY
         CsmiRA5i/lxC6jXyrBahYrsxUJwbzKRwPGM92mcd9V15emNC3zkYxommEuVcGb0tsw1O
         rHHcXt9Gr01Hs+8yLRzbzzbZaMn19CzZ/IKr6kWn87vP2DzWcU4HoXc2NWTFlQIRKPzy
         cXxg==
X-Forwarded-Encrypted: i=1; AJvYcCX9AEUA2Hz9IN61/7iy5x2+p8ARvluzRssNgNtLnP3QTVwXd5qb3Bf44JWMnpebsxEIUiiYPvoBi9TJOoXgoUZG/sFZJb85O/DmXeY=
X-Gm-Message-State: AOJu0Yxt5sJTXPM0+PtZ+MJ7+qjjskZolPe5674uYAi4aZ4tXhM3Try4
	TI6xwdFCrywuDMjVXCJEgN9I0OTbFIvZJ2fRMzXqzq9wLagdsFxeOKMz37xuL7n+jWPf6f+jPkJ
	yHW7JsKyoxwbYZha2zov/LLhDNrw=
X-Google-Smtp-Source: AGHT+IEnPiXYKGoZAEcWbV0vplxMesyCar7SVTa8AM31q8atEL/J3INWycW/KyiHzI5JnUxFQ7SXn4y6RT/9fhMRiCM=
X-Received: by 2002:a05:690c:ec4:b0:651:4b29:403c with SMTP id
 00721157ae682-652f5778b8dmr10432037b3.2.1720100026775; Thu, 04 Jul 2024
 06:33:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABXGCsMmmb36ym8hVNGTiU8yfUS_cGvoUmGCcBrGWq9OxTrs+A@mail.gmail.com>
 <CAL3q7H4yBx7EAwTWWRboK78nhCbzy1YnXGYVsazWs+VxNYDBmA@mail.gmail.com>
 <CABXGCsMWYaxZry+VDCgP=UM7c9do+JYSKdHAbCcx5=xEwXjE6Q@mail.gmail.com>
 <CAL3q7H7Xb9FQx-5PMQtK_-reMq-cbfysCx6s-ZOWL1FUPSm8sA@mail.gmail.com>
 <CABXGCsP9tSwgR4dN-k97maqHB1KOtykakmHNz78SYbAuHydUTQ@mail.gmail.com>
 <CAL3q7H6vG6PEKjcsXtSuq=yks_g-MczAz_-V96QSZCs9ezRZpg@mail.gmail.com>
 <CAL3q7H5RC6dinsA2KLtus07jxDuY1PecPXbhYOWtW+nVyzXwuA@mail.gmail.com>
 <CAL3q7H4MiarsqxSMc0OzY2TNRk8J7Lg+89MaPHY2+NPO-EcDgQ@mail.gmail.com>
 <CAK-xaQYYx6SPQaOVwL+ardB0y5LzYJw9a_hfWWtVEZ=y1rXq5w@mail.gmail.com>
 <CAL3q7H74jpSoMvvkSvmrtB_VGiscz8zN5aHnApWuYU+hpKe+rA@mail.gmail.com> <CAL3q7H6V9M0B4jmW79keUtTdjWsabyWZeU5g4KEN5_-a+wEHVQ@mail.gmail.com>
In-Reply-To: <CAL3q7H6V9M0B4jmW79keUtTdjWsabyWZeU5g4KEN5_-a+wEHVQ@mail.gmail.com>
From: Andrea Gelmini <andrea.gelmini@gmail.com>
Date: Thu, 4 Jul 2024 15:33:30 +0200
Message-ID: <CAK-xaQZ=c7aociwZ5YQreTmT+sBLGdH0rkTKmFzt4i_mrXBmgg@mail.gmail.com>
Subject: Re: 6.10/regression/bisected - after f1d97e769152 I spotted increased
 execution time of the kswapd0 process and symptoms as if there is not enough memory
To: Filipe Manana <fdmanana@kernel.org>
Cc: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>, 
	Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, Btrfs BTRFS <linux-btrfs@vger.kernel.org>, 
	dsterba@suse.com, josef@toxicpanda.com
Content-Type: text/plain; charset="UTF-8"

Il giorno gio 4 lug 2024 alle ore 11:57 Filipe Manana
<fdmanana@kernel.org> ha scritto:
> I wonder if you have bpftrace installed and can run the following
> script while doing the test:

Yeap, no problem. It worked. I mean, recorded on external usb stick... But...
On my laptop I have kernel 6.6.36 and rc6+branch...
Uhm... Yesterday I switched back to 6.6.36 after wrote the email,
well, not exactly, I usually work with 6.6.36 and yesterday rebooted
with rc6 to test the branch patches (so the sluggish issue weeks ago,
so I didn't move from 6.6.36).
Anyway, after wrote you the report while watching the "live action", I
rebooted 6.6.36.

Anyway, tried right now with bpftrace and I can't replicate it. Kernel
exactly the same. No recompilo or so on...

I just can think about a few LibreOffice git subvolume deleted
(~215000 files), and a few created.
A few tens of giga deleted of files (mp4 and mkv). Uhm... dunno if it
could be related or something changed on BTRFS layout.

Well, I have the nighlty snapshot (well, it's not on every subvolume
of the fs). I ran tar on that, and we see.

I tell you in a few hours. In the meanwhile I keep running rc6+ and
see if something happens.
