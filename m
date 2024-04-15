Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4C878C88
	for <regressions@lists.linux.dev>; Mon, 15 Apr 2024 15:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713194648; cv=none; b=K+phq9houtfmBSaT3ZMNnAnB++o5F8TsWqgTfMDZbCUe74b6RyV0ipaWmgqv5MMOU6TqQaq61XfbQIiv89W0yWlnuEYVrBeCY6GJsMl5NyTtrBe+bf27A5OfacjZoUymgFWhVJ/K5U8LQmsjQ67m1Oe4WadDC9aPeoMBBGlNfbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713194648; c=relaxed/simple;
	bh=0K4dQJV+mfWZQNpGK/vITATfXVgyY0RZsCg7Qbj7+NE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VjuiL2ivcEvkYLn0ZPaRmZI8MI07ZV8OdDOGSPnsF+5XOwoipJv/ibrXAzOLd577reNH/xZ913AzXeMQzkAZeDqSBYP1TaNB7TXpvphGTSSxPyx+LPfXwd45zI16Iwbs2xzZdBOAR1K2uC88YEcGIKV7Unv0Od/jsXa1ESLYTFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=O05/LACN; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="O05/LACN"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-56e477db7fbso5289231a12.3
        for <regressions@lists.linux.dev>; Mon, 15 Apr 2024 08:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1713194645; x=1713799445; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WYfOEsGC0slx6ThijhpmfrIi/hp4YLF9aD3FqVog84w=;
        b=O05/LACNxhfc3YuiUzcocVtIqsmyn0YSWufIppbqNCO8GDwcmnCROHVEczovxHDClC
         taGp99D3pubWfMJneDqzqJwmv0RCbIFPgEcmrJM0PMdyIUMKjreehrRhyDBDCpWWkg9L
         Z8KdYcKpHK7Y7cggQU+Y9Xzz22d36OSx2A2Fs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713194645; x=1713799445;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WYfOEsGC0slx6ThijhpmfrIi/hp4YLF9aD3FqVog84w=;
        b=RRlinTKUCRY8TOdmN8eFWmRQn4e+sf2OXfvAGSZeFqdaJG6nl/CtQ3sclUG8VFgVro
         rA7Nz5UR+loYxi9YlXbJ82KOt2MnLvCm4R6thKWRYe2ffiJKCvwCtxZPZO8jbIAV7oJd
         2+4oNsSvsBrhY2T1QYnK1cq/qyHMPX5NQtIoVXIL/pvG/2AdGzlf8lRydBK4xVw5Xr5H
         6gQUAE9NCGtZ9JBHXg8fg0r6lsqf7UzFXH0IwdIujqSRuBNRvr3bPPAvIEdAYHrmhm9J
         0P2BC5RV3wFBAtWvB9wYQrCXXVO3gPFIlyuDleVyZPEVYrRgLovR/dvPJzKnVdsF9XCp
         0iKA==
X-Forwarded-Encrypted: i=1; AJvYcCWyRZg+9QpYl0qtAb1Rzd75HK+8KvdQ0w77P+HY7VLxZWm6uqKWV4TG6+mkdXrsVOevcOvqfuxkm7D1lzVkt9b+LcSFILVEXILXr7Y=
X-Gm-Message-State: AOJu0Yw59Fc7TWJ0k0TEroU3AcwS6OHrFTG4cBFn6FccoGMs3a4Z3NPM
	V1YW5ekhqZ7XBrAYUG+QCKfJV4AyEDKMTJE+pUHdyTnjQLySo6yoRwBb66WSuAd6qiOzYrCjDTE
	VmA+Llg==
X-Google-Smtp-Source: AGHT+IGgZVCVSQ58OeuhT6ZFAg/O8GPN0udHE6PhgjK2LyDTcY6uybJDPY6bFUuOm1ypyr+49dUsMA==
X-Received: by 2002:a17:907:bb95:b0:a54:4f0c:936e with SMTP id xo21-20020a170907bb9500b00a544f0c936emr1255410ejc.6.1713194644215;
        Mon, 15 Apr 2024 08:24:04 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id s15-20020a170906354f00b00a5195ee5d62sm5572524eja.164.2024.04.15.08.24.03
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Apr 2024 08:24:03 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-56e346224bdso2643585a12.1
        for <regressions@lists.linux.dev>; Mon, 15 Apr 2024 08:24:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXc7nGhZF2AVZwz8V/bFd1Phs4/weiPCWkZ5T9Li0g94B18ORwxp4zzR5N4PucCFfTKMsCxSCIqyzX6uYR2Kb/qAzmUmHpvFpCmFxg=
X-Received: by 2002:a17:906:e0da:b0:a52:5c9a:1c8b with SMTP id
 gl26-20020a170906e0da00b00a525c9a1c8bmr2466375ejb.5.1713194642825; Mon, 15
 Apr 2024 08:24:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Zf2zPf5TO5oYt3I3@hovoldconsulting.com> <20240325-faucht-kiesel-82c6c35504b3@brauner>
 <ZgFN8LMYPZzp6vLy@hovoldconsulting.com> <20240325-shrimps-ballverlust-dc44fa157138@brauner>
 <a417b52b-d1c0-4b7d-9d8f-f1b2cd5145f6@leemhuis.info> <b0fa3c40-443b-4b89-99e9-678cbb89a67e@paragon-software.com>
 <Zhz5S3TA-Nd_8LY8@hovoldconsulting.com> <Zhz_axTjkJ6Aqeys@hovoldconsulting.com>
 <8FE8DF1E-C216-4A56-A16E-450D2AED7F5E@tuxera.com> <Zh0SicjFHCkMaOc0@hovoldconsulting.com>
 <20240415-warzen-rundgang-ce78bedb5f19@brauner>
In-Reply-To: <20240415-warzen-rundgang-ce78bedb5f19@brauner>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 15 Apr 2024 08:23:46 -0700
X-Gmail-Original-Message-ID: <CAHk-=whPTEYv3F9tgvJf-OakOxyGw2jzRVD0BMkXmC5ANPj0YA@mail.gmail.com>
Message-ID: <CAHk-=whPTEYv3F9tgvJf-OakOxyGw2jzRVD0BMkXmC5ANPj0YA@mail.gmail.com>
Subject: Re: [PATCH 2/2] ntfs3: remove warning
To: Christian Brauner <brauner@kernel.org>
Cc: Anton Altaparmakov <anton@tuxera.com>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Namjae Jeon <linkinjeon@kernel.org>, 
	"ntfs3@lists.linux.dev" <ntfs3@lists.linux.dev>, 
	Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>, 
	"linux-ntfs-dev@lists.sourceforge.net" <linux-ntfs-dev@lists.sourceforge.net>, Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Apr 2024 at 07:16, Christian Brauner <brauner@kernel.org> wrote:
>
> (1) Since the ntfs3 driver is supposed to serve as a drop-in replacement
>     for the legacy ntfs driver we should to it the same way we did it
>     for ext3 and ext4 where ext4 registers itself also for the ext3
>     driver. In other words, we would register ntfs3 as ntfs3 filesystem
>     type and as legacy ntfs filesystem type.

I think that if just registering it under the same name solves the
immediate issue, that's the one we should just go for.

>     To make it fully compatible
>     we also need to make sure it's persistently mounted read-only.

My reaction to that is "only if it turns out we really need to".

It sounds unlikely that somebody has an old ntfs setup and then tries
to mount things rw which didn't use to work and things go sideways if
that then suddenly works.

But "unlikely" isn't "impossible", of course - it's just that I'd
suggest we actually wait for that report to happen and ask what the
heck they were doing and why they were doing that...

              Linus
