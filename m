Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503AD253F01
	for <regressions@lists.linux.dev>; Tue, 11 Feb 2025 16:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739291305; cv=none; b=AWCUVTJfMXqZIrdTUkd9L+pZLTuj87BiClR9Q0V+MgpLXSabOFMz3uE4FQ6C8UDysFQAH/+OlOYQzrSHkhHmciIVphcBBPZGNMPRWIvj3K9nA9hYLtflBPMYrGh3XgmCFTI/z/xkQMHrb+6GARg9p75wIPSOXf0pKB3lP16ouy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739291305; c=relaxed/simple;
	bh=oItqTVZbp0ANDC8mJoF9eaiOIBmVbYMHhUv1BxWeCBA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D4YIl9A15yn3WGwB3hw7av6ZLSbgxakV6hC+FV5l2b+blAQO1YVAtd5/PM4s+3t+46UIOhrrLyClIftV3l79XYXXKFKNpBzBs0O0uqrNJns4XPcFecU7Oc5PJCMJsEOUqQiaoL84o7EQJ3knAg1tDuzXLIANe+T5fUjWxCGLWXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4ba00b6821aso1614137137.2
        for <regressions@lists.linux.dev>; Tue, 11 Feb 2025 08:28:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739291300; x=1739896100;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PgA8gFOXpsj/QSSXszXpeKHHr8T/tFfcyy9+Om8hw6I=;
        b=NMnZpkBZd2Bd/n8euUE/dPa8JMDh4GauVT5S+GHvGDhQ+aSDULd8ES2C9dIOKcHVBz
         j6usyDHjrjUlLRLD/m3In2IVj1NaA/1/wqx0FBDLNtWqxtvV6qNjOqSCIrKqSkQ4O+pO
         n8w/H65c3H3iXNaN3J4BeFMMk9b2aG5eFiWdkzekjkNNALPd0ZOmp1NXweqYOEW3zR9D
         4W85f5aOmuW2XObOWz91zjz9PeBFubsa/8y7pf+0Qr0LaRxgclHDolcP+cekIKHXCbpV
         ZcDpAXj8DVif1F5YHLCXI7R6E+9PXVnuicZZWFsElzJ7EX8PZJgnLgR0/36Y9sVPos7v
         V8TA==
X-Forwarded-Encrypted: i=1; AJvYcCXK6JdCDO8hKISo4UsxBX1/Fn2lmsg8QTlgbKyozx1fLYlKs4EnmRNQZME8io00wTuV473yskXKovFgyw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwkM7S/+WZM5IuXerm8E9P8b3ZCYDAU+HVNR1R6oJ+rLf7HAARF
	Awj+xL85IC1wvsEKTWzP23YnH4Z+KxzaSC80sgBbrMjJ7FtbjqH2/hxTrVBCjIk=
X-Gm-Gg: ASbGncsXNQcrF2j9Fan35rbocJaGrzOrVWSl/CCly+lB86L/Tvqa3uwxrroaIfc+UeG
	xdJLdwAixUmCqlh46dQXa+QhmohEazWhxavYFj3rWsUn5GKReAI0K7JVYEoLg0xUkt2BXJAnrWj
	9CgZXahU0OUDxGaLAfBj46hY08/mqCI2CIJgIVdOkOH1p4H6N2yIBk24JVdPvhauy+HEptuhqZO
	FJJVHk6vO5QxbYDg3XbF8N/MS5cuVyRNdNel/vHjWSBUUhPkq+ypuoRH/2xuo2ajI7vf2c1BYgY
	7OCDclCHijRVM51cWFVa7r1uyUtgZMwL0wGsZLlCyuppUNj8UruksA==
X-Google-Smtp-Source: AGHT+IEOQLNKp5W3UJsDg+bv7CEuAah4vrcFTFV6nKjIWbfppa0tWnCyBhmE4vQavVbauGhQYFqYZA==
X-Received: by 2002:a05:6102:50aa:b0:4bb:d062:436 with SMTP id ada2fe7eead31-4bbf1fbb722mr277480137.0.1739291299554;
        Tue, 11 Feb 2025 08:28:19 -0800 (PST)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4bbc5e86acdsm855194137.30.2025.02.11.08.28.18
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 08:28:19 -0800 (PST)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4bbd554fe87so631900137.0
        for <regressions@lists.linux.dev>; Tue, 11 Feb 2025 08:28:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVNXZoNsCZjnuvpF8DzIq37RSn1pv6QAT79pbHxiF990oZtm+mS97ltN574uKRubpklqDPbBehtwcOcLw==@lists.linux.dev
X-Received: by 2002:a05:6102:32c6:b0:4b2:adfb:4f91 with SMTP id
 ada2fe7eead31-4bbf2312e79mr203543137.21.1739291297935; Tue, 11 Feb 2025
 08:28:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250203-b4-get_maintainer-v2-0-83ba008b491f@suse.cz>
 <20250203-b4-get_maintainer-v2-1-83ba008b491f@suse.cz> <7aodxv46lj6rthjo4i5zhhx2lybrhb4uknpej2dyz3e7im5w3w@w23bz6fx3jnn>
 <CAMuHMdVeMe++0_hOx7ug0eRXD2cOWMRZsuHUee3KPjBE5FxjNQ@mail.gmail.com>
 <6ff32b12-7113-41dc-80d3-e729cc15a5ce@suse.cz> <CAMuHMdXNaNPiVXMrqf4YqM-PRC6ZrTgmHtOP1S9PPCP2HqvGWA@mail.gmail.com>
 <68bb307a-26ad-46ac-a9de-bec9b808506a@suse.cz>
In-Reply-To: <68bb307a-26ad-46ac-a9de-bec9b808506a@suse.cz>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Feb 2025 17:28:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXNNSCrad=wZW_q7OX_-4D8gSbj4Qv-S6Y5Ro+qqRYkRA@mail.gmail.com>
X-Gm-Features: AWEUYZlgtGLaioPAuMDynZKouzsATihTrlXxV6Qg2aUP7AeD66fgnTsBa_nAJZU
Message-ID: <CAMuHMdXNNSCrad=wZW_q7OX_-4D8gSbj4Qv-S6Y5Ro+qqRYkRA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] get_maintainer: add --substatus for reporting
 subsystem status
To: Vlastimil Babka <vbabka@suse.cz>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>, workflows@vger.kernel.org, 
	"Theodore Ts'o" <tytso@mit.edu>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Thorsten Leemhuis <linux@leemhuis.info>, Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Vlastimil,

On Tue, 11 Feb 2025 at 17:09, Vlastimil Babka <vbabka@suse.cz> wrote:
> On 2/11/25 16:19, Geert Uytterhoeven wrote:
> > On Tue, 11 Feb 2025 at 15:58, Vlastimil Babka <vbabka@suse.cz> wrote:
> >> On 2/11/25 11:48, Geert Uytterhoeven wrote:
> >> I've tried to do that in v1 in the form of reporting e.g. as
> >> John Doe <jd@example.com> (maintainer:SUBSYSTEM [supported])
> >>
> >> But it seemed noisy to repeat that on every line involving the subsystem.
> >
> > Yeah, it could be considered noisy... (more below)
> >
> >> When you say comment, what kind of separation for the comment would work
> >> regardless of what's used for postprocessing?
> >
> > I don't mind much. Perhaps just a comma?
>
> Hm comma where exactly? Sorry I might not get it, could you provide a full
> example? Thanks.

I was thinking something like:

    John Doe <jd@example.com> (maintainer:SUBSYSTEM, supported)

But I guess your example above

    John Doe <jd@example.com> (maintainer:SUBSYSTEM [supported])

would be fine, too.

> >> > Now, as both Uwe and I edit our generated scripts before running them,
> >> > we can delete the unwanted lines, but it's more work...
> >> > Thanks!
> >>
> >> I guess technically your scripts could detect first if --no-substatus is
> >> supported by grepping --help or testing if passing the option results in an
> >> error? But yeah it's not ideal, looks like I've hit the limits of automagic
> >> heuristics here.
> >> Or we make it fully opt-in but then most non-scripting users will not learn
> >> the status at all because it won't occur to them to enable it...
> >
> > I still seem to miss the real story behind this patch (so perhaps
> > that's why I would consider all of it noisy ;-). When I create a patch,
>
> The cover letter tells the story. It comes back to the way the script
> reports maintainers as "supporter"s (or other roles according to the status,
> however some status means there is most likely no maintainer). Joe objected
> to that status reporting would be simply removed in [1]. I also think it's
> useful information for the submitters, so I try to provide it differently.
>
> > what am I gonna do with this extra information?
> > E.g. decide not to send the patch, because the driver is orphaned?
>
> Well for example you can know that you might not get a timely reply, or
> might need to step up as a maintainer. Or you're trying to add a feature and
> the driver is "odd fixes". I think we do document the status in MAINTAINERS
> for a reason, and one could expect the tool to provide it and not require
> you to go look into MAINTAINERS yourself.

As the "S" field is separate from the (possibly multiple) "M" and "R"
fields, it still doesn't tell you e.g. who of them "is actually paid
to look after this" and who "actually looks after it"...

To me it looks overly complex. I send patches, and resend them, and
invoke e.g. akpm if all else fails...

> [1]
> https://lore.kernel.org/all/30776fe75061951777da8fa6618ae89bea7a8ce4.camel@perches.com/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
