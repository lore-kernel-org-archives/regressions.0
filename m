Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBBDB3FF1D6
	for <regressions@lists.linux.dev>; Wed, 10 Jun 2026 11:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781089674; cv=pass; b=Gm53u5Tcvp5QWE0IsalKGBBBv6gxOY/wFT8JJKvKmSpSIyuETWwJW9yU9h/1dVPvjkmakvpbJzRyBEjczLQmuQHcWWFoI1xxdNb0DjwOeuhr14whkrwN7afkr2EZbb4Xi+BLn8pASGY5SfabxFsikrXBtijkKO+DoQvDYiBO38U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781089674; c=relaxed/simple;
	bh=8mXpNYNPgECtkzr8AGdyU4Fcoy173GBePp5Ov1p4bmk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m7BxmDV1Wdvbz45d7ZuacVO3mjdL6vIZ344AEBIT0UlYuELyI2afpSIJzlRCmcptQYm7oFrhIGkNhZLV0J3y35RIy+ZxDT4NfViJLuOMrrKkLYPg/rz0f3bO5WMbKz/KNLf+ub1w2WcL2svGhnCwTsF1IWsd4a7La9STSEfkM6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=P4Zxfody; arc=pass smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="P4Zxfody"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8ce9df49c5fso89826096d6.1
        for <regressions@lists.linux.dev>; Wed, 10 Jun 2026 04:07:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781089664; cv=none;
        d=google.com; s=arc-20240605;
        b=RIFON6oSsZZUm3FqsBiuatXRHIYFQMzTwQa+9TH3rHXQ5C//A5qwHyAbAISXKro1E8
         995OPrd8VPd3oLHbKWm4H/WglvDlcwRQOJZTRaiWPvG/3hzulsornF+MCOFAl0nU0tt6
         UW7V/WrLf0kVB5VJ+X7Ae3rYV8vwrqdbvZdcWIi9htvs+NWD9uYgcv8pIBc18d5RC8Oo
         Y2k7Kamsjop8r2m1oaknNkgi51TeqSqms6lwyP1b2jy00KWpCWLVbjq6T5QTHNY2U+P9
         Yo+X7DCpSfxvWT8QK8QKKSXgi7kemn7UhhWTtuyQockbt+O3vJeDXbTi1B+WkzrkYDgo
         h2SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FfooajCCb5qkkr/DDxFEIC/q5Pcqtx/WOj5PoiifL7s=;
        fh=n/OiBYWy83mKNIc1F5OEYo4EDd4uiZjv9WRx9QmlhGE=;
        b=V3lJdolHGauxbxIuZgMSzPFBtH9FQL62PeEcqqfPa/f+S+OIiq+zGhxGKo6Q67JX2p
         H8SHDEiE7IdNfTs3ReqAwMGXnbN5A5HUSFbZlVmbAkpuXrN9/Y3lSVN2Ci7pcug9NfT+
         VMosFPnZhQ79D8vfQryF6OI4N31AriBjAPaqWC9grVJoqWxnIItAIy0APyYkjbQT82+l
         /4XsDLSjpb+5MiYNaMOOgQkWy3IrNrx/iANGx2HZd8rFvlWpGnuQN4Uf8j/amF3WyDMt
         driy4cGdetjTK5qPjzPyztmawA82NjoBHICR08S/FEkNLinL+3aFdPJA8Cqs9Q4VyKtH
         J2CA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1781089664; x=1781694464; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FfooajCCb5qkkr/DDxFEIC/q5Pcqtx/WOj5PoiifL7s=;
        b=P4ZxfodyGn+W39DAk9lxjvJclk87Oh0/nr/dpsg96/n3PHEwzp3YHj9BSdvgBwOmz1
         vt/lcMkZsEiNchXp6MwSQlRYUk666qKUKB62/k7kp0Y7SjQqNfrJWty4tATK2fs/23zz
         4aPCza5G7k5i5bVBAJh9L0KtE4U6PnA65mjWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781089664; x=1781694464;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FfooajCCb5qkkr/DDxFEIC/q5Pcqtx/WOj5PoiifL7s=;
        b=cLWjBZ45B6Q0lkN6QxPPKIvt50jg2k2MtsF1pZCkAbkquB234G9MLTfBv8qhWZmuPg
         594MHjJGqWCuMIsWT85UPWDlYSWSIIKaxx/tQ05+IDRFdfPoD/gKIfHgSnYdbT//yPGB
         c7F9SlofpV8/WSDxZAYX3oWv5YZsaLO+8IWkd+GgZRvKcLwsRCq4noMm2RmY9SHvya95
         CvXJDmrsaxrdnXKZ1C5L1kb9vTe9CPCdhj7zUud2b+F45XMflJJS9MfAKjJT2yElwKDe
         8ioDufUYlYGNi1AQBqPoffpCFJb+Y9KShzW2J4xmFtq/EQjkALnB963vM/v+gmMEk4xC
         hleA==
X-Forwarded-Encrypted: i=1; AFNElJ+GDYMdI0Rnv7+Gc7KQlqzkQ34avzBauEb+wpm2Nu3ICSEU1jl1rfjBPOcJf5ImBz0S8lQsM04rSn0pDw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8M7hh88fL3rCIVr2T7DAga5Fo+0qzRsWxgkjIPvSNo634m2ON
	9rGU7FsI6JOX6plBpY0BrhBlfMH9Joyp08kervIG7UHwxfJh5a8gUMJ061Q6MeMIaMTzSKbs5Ca
	OBBB8bZ4kFIQrW4x/62ehy3FvhOashSWmvNJfeYfdsw==
X-Gm-Gg: Acq92OEkjJGhACvL3WgUDQMtqUIk/C4u1mo7QP071nqCDclcM1ZEiWkqL5dSanRwwss
	ZDgfsQR+9VyUHTXR/Qp8/Bbpc0E2ALkaDM7qu4Ib0jLbKm1+nLktEnhofg7M8u+NRIsqvOiYypa
	Lk8eVm0jx7vUvRMWHFRjVLk+orRUEtm3zNbfYri+fyLD7fyJdmx4sQ25KUzNHzABatRK59SYPGP
	ZNQw1WqlfXdMCz1M2EXk+6BSS/FmujkGh91b0cNLqRBoI/gndcRToCn3qzT/1/DPT49HRxpSe3/
	NdbLAfV5vCJu0HEDJKD6PtJSrVhtmVecPiTGaPT9L+L7XjGj70U=
X-Received: by 2002:a05:622a:47ce:b0:514:5d67:7a30 with SMTP id
 d75a77b69052e-51795c74e62mr337766041cf.43.1781089664278; Wed, 10 Jun 2026
 04:07:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAFbF8N7++zopZuEcsKRxBV_sgOGCbzCY0hOyMw1SiGAtuzGhyQ@mail.gmail.com>
 <CAJfpegsCJnMfn_BzzTK7m9ndCGVsnPit8ZsT0fzAhYoY+yOsKQ@mail.gmail.com>
 <178035740095.2923901.5908691318688917347@noble.neil.brown.name>
 <CAJfpegswAZv8OmDAcK-5u8kssAF1vZKe4gdDB2XPErAnoGFSYg@mail.gmail.com>
 <178056619459.3392745.3091041855723132411@noble.neil.brown.name> <CAJfpeguDUS_3X-AFZD6XCJB1SjVkFGu2aJ+p1BK574Scu-ASdA@mail.gmail.com>
In-Reply-To: <CAJfpeguDUS_3X-AFZD6XCJB1SjVkFGu2aJ+p1BK574Scu-ASdA@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 10 Jun 2026 13:07:33 +0200
X-Gm-Features: AVVi8CcPOrZk3LFY7g50zlOcX2XYfioeMe0IQAA6vK7TOfH2w2RnMqNOAT5Kh5Q
Message-ID: <CAJfpegt4mAXDFOr47XaYPgeN1LFm_BNC_8SX-2A8kHEztWdNHw@mail.gmail.com>
Subject: Re: PROBLEM: FUSE_NOTIFY_INVAL_ENTRY leaves stale negative dentry
 after c9ba789dad15
To: NeilBrown <neil@brown.name>
Cc: =?UTF-8?B?0JDRgNGC0LXQvCDQm9Cw0LHQsNC30L7Qsg==?= <123321artyom@gmail.com>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 4 Jun 2026 at 15:59, Miklos Szeredi <miklos@szeredi.hu> wrote:

> Okay, so this is about making VFS more scalable?  Can't we just leave
> filesystem code alone in that case?

Unless there are strong objections I'm going to revert commit
cab012375122 ("fuse: fix conversion of fuse_reverse_inval_entry() to
start_removing()") and revert the fuse part of commit c9ba789dad15
("VFS: introduce start_creating_noperm() and
start_removing_noperm()").

Thanks,
Miklos
