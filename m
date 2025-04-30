Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967D5225417
	for <regressions@lists.linux.dev>; Wed, 30 Apr 2025 23:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746055880; cv=none; b=OgUeJDVo5yGn5Q70fqfti0iKu9Hh0CL9syP+oE2QkheENI+szK0OeaS2j5vv9jOm7/f0bqBNbp9GPqyAqbVwwIDToX7jeebQdHTDl1Qo/0yxP5qwb6kwWBRpmMEfHk53sJ8DqwilURRjcHUjpQT5OAEs//qjxK++xtk0VCLtLM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746055880; c=relaxed/simple;
	bh=yD3qheyPyJxLQOVC87vkI+yAdZWmU4D1zU4Z3sUtGsg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Huqh3Wh4twOc0gbXUehq+GapEouISD0z91vxJ587zGyzpgFcmLxfdYfZ/bGJYzeCKSME/g7nPKHYwU51jVAfWmBRJ2fyJZYKmus+Hh9VIO4P3lkYNkZVjaTBRV7JaXeCyq059MxdbxvYoHrVpTL57wON7tOR4r3DhFaHyA7fj+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UaYBPIUD; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UaYBPIUD"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b07d607dc83so332390a12.1
        for <regressions@lists.linux.dev>; Wed, 30 Apr 2025 16:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746055876; x=1746660676; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7kkJOaWRkAsIP/ls9ASqGbXAxOgOs1WU+P/bZPko4NY=;
        b=UaYBPIUDEJ+MUMrvrfHHCW7rgLrETCAEQTqKEnNq1bOpoGwgyImCaTNH2kqbk2K4km
         VJPUCr3NTVoWKxFqy/zwWEXxxZC/5ElzuiWv5e0rT0vJod10loxOIV3/Vcc27v3gQxHP
         tGwjRtF5/DjxYVP/b0NrXP9V+R4kJwOATrVK4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746055876; x=1746660676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7kkJOaWRkAsIP/ls9ASqGbXAxOgOs1WU+P/bZPko4NY=;
        b=AXUlWaUHKc24Fe+at+kOe3kTsAhmpKaaEq9CmvLQPvNm69FZ/TyrSbLj2u17SGssgc
         zv8GoEA2AdsO957HGkoVyejsoJaN+YpHtfUrzUF8XUoSzXI3VQ3GH+BCSWIZ0Zo9vX0V
         wSQMM/aMhKK0zNtlQBy6n9ARDRYs3mdr+yZfTeSz4Mj5Bu+mQF+UIzpAgwRu837zILeS
         ec1sy3bryiEPLtv1uDDrZb8qiVzF9nJmZVnNIVbGy9ta1BTePCol6tGuvxLsV2UQYQc5
         d1DWPQ9HuBXR8AVpgnBV8Kf/DJa42OOlZr8mLzXqtZeitQQg7p7ycrW2XVIRMr0mjMcp
         wOfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXj/t1dvPKafyPloLT0LWCFGotuZFla3oRpRuz8/FvP0t9bg0D29oxLH+IrOCijLac3U1CzlekqyOyM9g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzYa/OKiiYBy3nuUVdOedlmjOCKeDIvMh4hh+/t9cXe5489nGyz
	SYtfckLLC+xev3kAEJ4AXcqURb0hFZsv289GZJX2WDvGdGFcBh+OGRQHAI5bQ2zqyr1bv7s1drE
	=
X-Gm-Gg: ASbGncu3wN8OD3CyJCLZ/CNP0CO3jC9p8ZG7py/KZqyux6Tgnd1+yGDI6PuvFbc8DDY
	6TncfvCueO7pZBYelJBxxym1Jk/+waMXMt26ypnKuKqTrInfa7Ik6RbsQVDMt8CUeZm7oPqPRE9
	RelEbhVy4TpZjC0PU+ph6Sbj6ZaxyZEsiQBgrGMhzf3pRk1Lrtsr79RlCxTaFt1PnYX8BOPk0w3
	sa+c3eZE9UB/ElergiSQgoNh7CvqkrxzS785sgss5u2x0mNr+dkwuqjm0ICTx+09bqMGND3lfjZ
	JWk6UiUT87hAt9wEHwCOtRzmR93YHKbQco/2alfIQAN2uXMdXNtLn75NjYHvv8cmSoaL1e0E9l5
	INg2LT98x
X-Google-Smtp-Source: AGHT+IG8kwDFe9RhWjHLH/vUS8y6za8fWD4n9PavF8Gx1fAY6lkk7qc5ftsDQKCicXjPHkCoWm3BuQ==
X-Received: by 2002:a17:90b:2710:b0:30a:255c:9c89 with SMTP id 98e67ed59e1d1-30a41d44ac2mr817683a91.19.1746055876447;
        Wed, 30 Apr 2025 16:31:16 -0700 (PDT)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com. [209.85.215.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a349e3c37sm2256031a91.5.2025.04.30.16.31.15
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 16:31:15 -0700 (PDT)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-7fd581c2bf4so342188a12.3
        for <regressions@lists.linux.dev>; Wed, 30 Apr 2025 16:31:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU61SNtx8UogU3+zsvDWdZbIdWLf4ln2QG2squxQQEFnYu7H8aFa2Z9rzX7jye5006KXbWBr4kL2ebInQ==@lists.linux.dev
X-Received: by 2002:a17:90b:562d:b0:301:98fc:9b2f with SMTP id
 98e67ed59e1d1-30a41cfc2e0mr915708a91.1.1746055874808; Wed, 30 Apr 2025
 16:31:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <wpwd7rit6t4mnu6kdqbtsnk5bhftgslio6e2jgkz6kgw6cuvvr@xbfswsczfqsi>
 <CAD=FV=Xp7zOQ2iEVf896P074RW911F-e2Qa36deD0e8fWksFBA@mail.gmail.com>
 <u7ek3ccya4c3c4rteliskjjfczpmrt4vmqo5c6kjdotxdgitn7@ko24dpb35pq4>
 <CAD=FV=Wc9TnDg6vDb8r5A8dT9TvOzU2kNSKi_6TzTtb0ka=8jA@mail.gmail.com> <nchsanp7nc7nqy3kqlu7c5iwvfj6vmrkqbxyjxmoc5eq3dthjk@fusw4pm52auq>
In-Reply-To: <nchsanp7nc7nqy3kqlu7c5iwvfj6vmrkqbxyjxmoc5eq3dthjk@fusw4pm52auq>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 30 Apr 2025 16:31:02 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U4PdTgRsxJ3HVRRQEZAPHinKxhUE9FpKDOnv=nDQo3KQ@mail.gmail.com>
X-Gm-Features: ATxdqUFKrr33v60MdJ7VLJEtzDzKpshe0mGaGV2WsW8O5fvBduy-dvNn_PfNeFQ
Message-ID: <CAD=FV=U4PdTgRsxJ3HVRRQEZAPHinKxhUE9FpKDOnv=nDQo3KQ@mail.gmail.com>
Subject: Re: PROBLEM: AST2500 BMC video output disabled by reboot (regression)
To: Nick Bowler <nbowler@draconx.ca>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Apr 30, 2025 at 10:52=E2=80=AFAM Nick Bowler <nbowler@draconx.ca> w=
rote:
>
> > > To clarify, there is no boot failure.  There is just no video output
> > > after rebooting.  I can then boot Linux again by any method that work=
s
> > > without being able to see the screen, and then everything is fine onc=
e
> > > I do that.
> >
> > Super weird. So every other boot works?
>
> On a new/broken kernel, every time I run "reboot" the video turns off
> when Linux does whatever it does to make the system restart.
>
> The video comes on again if I manage to boot it up again.
>
> The problem is that I have to do that without using the screen.  So I
> can boot Linux via the serial port, or via the BMC web interface, or
> by just typing on the keyboard without seeing what is happening.

Ohhhhhh! I was assuming that your problem looked like this:

1. Boot up Linux, video works.

2. Type "reboot" and the system boots back to Linux w/ no video.

3. Log into Linux via UART or ssh and type "reboot". System boots back
to Linux and video works.

...and then if you repeat steps #2 and #3 it keeps alternating with
Linux having video and not having video.

It sounds like instead what you're saying is that you're typing
"reboot" and then booting into some other operating system / BIOS and
the video doesn't work in that other (non-Linux) environment. Is that
right?

If I (finally) got it right, then I'm not really sure what to suggest.
It would sure seem like a bug in the other OS/BIOS. We could possibly
land the revert you have. I'd imagine it's papering over the bug, but
it's no real skin off my teeth. As a test, I'd imagine that if you
turned the screen off via commandline (I never really do this, but a
search turns up [1]) and then reboot with the screen off then I'd
imagine you run into the same trouble with or without the patch. Is
that true?

FWIW: The original incentive for adding all the shutdown calls (aside
from the fact that it's documented that they should be there) was to
make sure embedded panels shutdown properly. It looks as if no
embedded panels will really be used with this driver anyway.

[1] https://www.baeldung.com/linux/cli-monitor-turn-on-off
