Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347583093DF
	for <regressions@lists.linux.dev>; Tue, 28 Oct 2025 13:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761656651; cv=none; b=AQW2bn1FdfHL5iDsRgFWocCQDP0RXvYS0FVsZ01m+5D28zHmM6dnZ64k73W3xfdtGw/bO2SFx2kvtfAzwNoysgd5xML/vSlDKiwn53ls70DuBvqOc5gsyAb/tcCHRMRVrrZt+xWBDfojnkBwnaRBIbizlslUPXRFgXk8Z0WAiKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761656651; c=relaxed/simple;
	bh=o+gsxF2a+s+BG+ImH/NesDa5oejSxzi1zOrUT1zQ8HM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ommd4jHJOGTpz5H1bGxb0ftvmGyQUXp5DpbyhFR//digRPdaq3+rbk7WuVsssrDm58mnhaW2Oh64cxndfDe2aD5noIpxEKmlch9rcuXHkBiVlidYhEKDYVLQUPdXUltKFEcNAogiM5PlQbArLd3DEY0+bHLxBPvGhr3S5buyUjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XxFqbi6x; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XxFqbi6x"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-71d71bcac45so61641787b3.0
        for <regressions@lists.linux.dev>; Tue, 28 Oct 2025 06:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761656649; x=1762261449; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G/0OtKa0fwpsGbbWHnbV4jMYc8LFQ8mSjlnSp1wdWyE=;
        b=XxFqbi6xIfBORnET7qn0PmVqS+l5P1fck+olppnEN6EZ52UxK+tztevW9BHURZMFL1
         FCay/YC21rLvDN7Rq4lvqI4Xbs0L3O2MZ3dgtFq9R5ujduuaXFuuKRc8lwpZhguiBYcH
         xuf+jQfcx48yT89K9Wxr4Evdy4+mgPRtOsNJQ86M6ZDgK3WUjl6EeYLwBcLrGBHEt2XJ
         Y7UnuxIUIChLUoev+v/Q42VxqQwfb0PeWCpgeMckK432uBUHFZqs2iCb6lNPinLlD+Aq
         q00y9tBB8VpN0Oq9swkqMyrmSwr1Yp5UQ/5e7n0KlL3reHaw7yyNIQ3n3DFZPM/wTvXl
         mJ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761656649; x=1762261449;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G/0OtKa0fwpsGbbWHnbV4jMYc8LFQ8mSjlnSp1wdWyE=;
        b=TP8W1KXdZQycnQg3xmY7svV/4kqP/ItdAYOemZPvIQ/wNinxMir2OrKnHc7vwKmg1y
         wKsSJVm8akPR69clgBqI1Z3N+nmMD/bYEQSiplcbhA7g0JdCoUqR8A6w5kKB0g00ld0j
         WW75IKDQs0uESqqBaQmNN7nn7McyKcwvL6A3u4+03hzQnkCGlXngbjG/OJq2hqpzmBwq
         +54WSTV5+tA3XO7yo6Yxewz4eC5MDAvAwvXVvAztZfOhUAKlsdgaFR67SQSbFQ8NVrGo
         LIgfQLTd0ccsShCOdu1N680ga30ySU7DLnehfdFpoaUrSvtXll9w3znlE5tRvhXZvD01
         tq7g==
X-Forwarded-Encrypted: i=1; AJvYcCXNtJL/Xe2dccePk3s2vtWWEdNXehzCj/zEQyDFxvoNyO1DHydw0o2kVsajALD7En8vbRpKeIOChAxqDw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2Fu41m+sk7MJvViEzJ4lgPuxKVa5kr1DxNNaswgjCy7NGPj7D
	KlxK+2ty/cmHIl9t6EvqqZXIGd2s4xxSZFmG4Q8NGaTmAaP8f57WJvODru//qihQCOg/ftxaY5e
	RGD9CW6IE3i+NCP5C1mPm2X6zpWGZn0U=
X-Gm-Gg: ASbGncuuS1pZYI9rAP+Z/g2U+LMYmwBrQ0C5ouW38eH52qKdHUbRj8JVJozgwp5R4m2
	MXZneuVK1oFoRa0K8jevGSOq1ZTZgO0QnAQzHkipj2xsa1T0OcBGljcqSG/QQ86GuN4cj7uuvTi
	9nXU4rlCOmZkmZHRwE8QVxkqPY7w1elxvMt3xdSF50OfKTEA1OJnRmRqPFtM6r/0x1fABVCxCF/
	7jq6CCOBiQCXdrxaSUs4Ws6FnNX6RXPOU/UqO2tGbPEQQwJe61MSRLPBJWDwfC7
X-Google-Smtp-Source: AGHT+IGl+GnLITy+almrkll6qV+UR1AjovGvr5jvY5xg5QHKzNmw/ZHW9q9+b73du1ozFlDeRGPiDs8Hs7aOvINNsAc=
X-Received: by 2002:a05:690c:630e:b0:784:9883:5fa8 with SMTP id
 00721157ae682-786181cafb0mr31790047b3.68.1761656647431; Tue, 28 Oct 2025
 06:04:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <87o6q8l68r.wl-tiwai@suse.de> <20251015145749.2572-1-safinaskar@gmail.com>
 <878qhckxc5.wl-tiwai@suse.de> <CAPnZJGDeCkqqUpEh0SBfwvsxfMp9ZDXqvhrC1s9zRp6jX+Fvnw@mail.gmail.com>
 <875xcgkvnw.wl-tiwai@suse.de> <CAPnZJGDmCnKPz2eygwDjQGXZWVctGyJxV+OeFSLLeZPOCEvvbA@mail.gmail.com>
 <CAPnZJGBdqPhmNOes4-BRu8C-0d3yco8H93WhdORxm7MRBSw7CQ@mail.gmail.com>
 <CAPnZJGCqY9j-33piRBpkurSDsOfAqV6+ODGtToGDsgNQd-g9cQ@mail.gmail.com>
 <87bjm78978.wl-tiwai@suse.de> <878qgvgrk0.wl-tiwai@suse.de>
In-Reply-To: <878qgvgrk0.wl-tiwai@suse.de>
From: Askar Safin <safinaskar@gmail.com>
Date: Tue, 28 Oct 2025 16:03:31 +0300
X-Gm-Features: AWmQ_bkosASxL-kMiGEUK0uLtyvvSN2aJsJnCBmaxZOZLhuSFph6rGxsUC3ATkM
Message-ID: <CAPnZJGD9DM6Rk9NwdJZtZRKp_8wBtS0z47v0oRmKyNxdUzvLmg@mail.gmail.com>
Subject: Re: [REGRESSION][BISECTED] My audio broke (was: [PATCH 05/27] ALSA:
 hda: Move controller drivers into sound/hda/controllers directory)
To: Takashi Iwai <tiwai@suse.de>
Cc: Dell.Client.Kernel@dell.com, amadeuszx.slawinski@linux.intel.com, 
	baojun.xu@ti.com, bo.liu@senarytech.com, cezary.rojewski@intel.com, 
	kai.vehmanen@linux.intel.com, kailang@realtek.com, 
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
	regressions@lists.linux.dev, rf@opensource.cirrus.com, 
	Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	miguel.ojeda.sandonis@gmail.com, ojeda@kernel.org, sam@gentoo.org, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Daniel Xu <dxu@dxuuu.xyz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 28, 2025 at 3:05=E2=80=AFPM Takashi Iwai <tiwai@suse.de> wrote:
> Askar, have you tried the above?  I was off in the last week, so

I will try later. Possibly after two weeks.

--=20
Askar Safin
