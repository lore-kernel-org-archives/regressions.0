Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA7E1FF605
	for <regressions@lists.linux.dev>; Fri, 14 Mar 2025 13:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741957935; cv=none; b=n8lM9HHyaLVljnk34t5rNJl4nSqG71etDnKSfo/waSJs+kZyiAbxlxy+NWGDzIicraHH/8X1Gmu6MBF5XGzxktTzGS83mIPcSlhHH+yH0VVGbQ2UKxKlXuaeI5ORxq7vazyyBiarxLzMBTtW/WVMP5Q01QlXyPCM06ogpLe8hPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741957935; c=relaxed/simple;
	bh=igWsFZqIoBBrRjWxo9HQX6XTBffLUEnusGMY9Vx19IQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SdTz5odgOb2abx9HWn19yqYweInsT7jGr3YfwcVJmpwQsQkOND4IL9OzzLT16zs7h6wuSCq54nEq3FjhRCj4eScO/1cGYHp8hRMcH/uZpq5fDtgU1J6/ia1wbEm3FRLU8C7hKSumMSq4KIGwyFjYhV/yl3+6Jf6Jot6LYiL2ca4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cu6X/65i; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cu6X/65i"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2240b4de10eso5746635ad.1
        for <regressions@lists.linux.dev>; Fri, 14 Mar 2025 06:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741957933; x=1742562733; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=us71VI8rB0Legg4D3O1G/8ku8Dl+rOdqgBnf5AamEhA=;
        b=Cu6X/65itSvgKfyzDVKWRENClArE/IlGV6OmvvjziQ97RxEruM2IpRqqlUEGlCP/DO
         5ubKjKmw7J9lPohS1HfSczlJQO33LJgWBo1bBE5/Z1netSB8obBL8z6wGID/NQ+78RQ0
         V2gpswPpaM63RA+U813yWX1aZXYbdUVzLeIcRqLjSQobdelf4a3Jz7vB8JauhyonklWy
         /HU8v/HHIRGE/e1k5WOWFRVThpuARQo6qUmZ+mcJhPZ7XsGBJNUbYvD26hPnwEWhl+5s
         Pj6wNMechInX0i3Y8uai303AsrrBVsEx/iS8Dcw4GuEkkycFafW/bIc0VizswAP5mRsA
         qF5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741957933; x=1742562733;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=us71VI8rB0Legg4D3O1G/8ku8Dl+rOdqgBnf5AamEhA=;
        b=oRrnZ6GHQvMFPaL2b7qJiTR3GcCmhtGT3tzeRbl76t7R79YeuH4hGnQ65Zo67OYGh/
         XGmDdb39ITuE8lleQHNj8PP4OTImkqf+VxSTwns+2myoRrJmm97QWT76S13gDNm2tSlx
         khPoItUCXtn1Jdp97DNzNqWSQNaQkS3Mz+rE2kIreU4KfD5/vugcIZPWn6pYlNHXC/xA
         mxfk9TWYbLPIc56lqOLxVHpkvUCLAtedxrTAS2PagGE4Pdgxf8qS+VEwPIHfGph9nKQI
         jF1fPjqimY2lnlFDefuX+1ROaOt6QO8CAF4AV6r0564ICGQOjihE099cvsg9z4X8rVcH
         HDhg==
X-Forwarded-Encrypted: i=1; AJvYcCWmuBabmI2wcXEBf3SjnVJ1UswH9TKKFjuVysoQkxMXKKrTApnqvNKvuAodyeNCFpQgs8PnY/wsWNP8jw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwnzbD0TR0joi/1UZsq1M0NPQGIFmwt2IXLbSLHavPcB/0beDdT
	jK3CITOLx7b8K++3YlG93BnlhJjVe4hNRF2CEkuKP5WeB7lkPhQ7TvYAo29WkyO7VSzSAYVb+qD
	9ruOaJpB89I3rmCjik1q6Xmf+knk=
X-Gm-Gg: ASbGnctxFGLrC1wGyfmWo29C9t5TSmibOHYmqVp8E17m+oKmYj3APaO5AOWoKANSu6t
	Xt5RwcjxYSp+TLcdhHhqGs9WoZtArhkfm+/RFh5Z+LOhgDEB1Ra4lp46jh9hI8lc72by5v8Qbtl
	KKLKihDx83GNTuHg9FEmbHH1qwPw==
X-Google-Smtp-Source: AGHT+IGn7iFBbjLVbF5uD1Bl+O+ELfJWqW5/gdbzYIvLmDPZkKiCZ0MqhutzzC6HNNXL1d+rOgfnTivubYL5pcSU8LQ=
X-Received: by 2002:a17:902:cec3:b0:215:435d:b41a with SMTP id
 d9443c01a7336-225e0a1d656mr12644975ad.1.1741957932906; Fri, 14 Mar 2025
 06:12:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240718210558.26340-1-Philip.Yang@amd.com> <20240718210558.26340-5-Philip.Yang@amd.com>
 <zpzehsckjz2bee6w5bsnfpmkvtlxf6jywijz7iroausghoh43i@nxr644rwjsb3>
 <315e27ab-f1d1-a681-a32f-1fc28cd81193@amd.com> <rie1puzeus5.fsf@faulbaum.in-berlin.de>
In-Reply-To: <rie1puzeus5.fsf@faulbaum.in-berlin.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 14 Mar 2025 09:12:01 -0400
X-Gm-Features: AQ5f1JpvRZFPmApVishFeHO_TGlueDyNSqN_p6gXt_cZSBDpsiMuq0wh-u93KBI
Message-ID: <CADnq5_OE75bJvDwZvGo2BhFCm4TzuarQkv9ypGf80O2M9inXYA@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] drm/amdkfd: Validate user queue buffers
To: Dieter Faulbaum <dieter@faulbaum.in-berlin.de>
Cc: Philip Yang <yangp@amd.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Philip Yang <Philip.Yang@amd.com>, amd-gfx@lists.freedesktop.org, Felix.Kuehling@amd.com, 
	Alexander.Deucher@amd.com, christian.koenig@amd.com, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 14, 2025 at 8:55=E2=80=AFAM Dieter Faulbaum
<dieter@faulbaum.in-berlin.de> wrote:
>
>
> Hello Philip,
>
> Philip Yang <yangp@amd.com> writes:
>
> > On 2025-02-12 17:42, Uwe Kleine-K=C3=B6nig wrote:
> >
> >  #regzbot introduced: 68e599db7a549f010a329515f3508d8a8c3467a4
> > #regzbot monitor: https://bugs.debian.org/1093124
> >
> > Hello,
> >
> > On Thu, Jul 18, 2024 at 05:05:53PM -0400, Philip Yang wrote:
> >
> >  Find user queue rptr, ring buf, eop buffer and cwsr area BOs,
> >  and
> > check BOs are mapped on the GPU with correct size and take the
> > BO
> > reference.
> >
> > Signed-off-by: Philip Yang <Philip.Yang@amd.com>
> > Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
> >
> >
> > This change made it into v6.12-rc1 as 68e599db7a54 ("drm/amdkfd:
> > Validate user queue buffers"). A Debian user (Dieter Faulbaum,
> > on Cc)
> > reported that this change introduced a regression using a gfx803
> > device
> > resulting in a HSA exception when e.g. darktable is used. I
> > didn't even
> > try to understand the problem, but maybe one of you have an idea
> > about
> > the issue?!
> >
> > Try this patch
> >
> > https://lore.kernel.org/all/20250130000412.29812-1-Philip.Yang@amd.com/=
T/
>
> It seems for me, that your patch isn't applied in the mainline
> kernel.
> What do you think, will it once happen?-)
> Is it falling through cracks?

It's in drm-next:
https://gitlab.freedesktop.org/drm/kernel/-/commit/e7a477735f1771b9a9346a5f=
bd09d7ff0641723a

I'll cherry-pick it for stable next week.

Alex

>
>
>
> With regards
> Dieter
