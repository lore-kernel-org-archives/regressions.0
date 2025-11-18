Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB9D2E0902
	for <regressions@lists.linux.dev>; Tue, 18 Nov 2025 18:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763492125; cv=none; b=RZqy+ygrJk0U340hIXZe4zLPhKnHk+zN0fnhsZGO5k/85xNTsGN9okY52vYvpEWu/qAutFH7iXwXfmd0/LyoxMsh3mV5sb8CUC2iGGsXBDTX1vzeiIq6mbaG+oWNoFLz+u7wQ0qktYUmBVqCT9xYiEN7JfxsDSRvJweRwsqUiZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763492125; c=relaxed/simple;
	bh=swc+u65AxmeylOSbwlHhzh74lz0gJSgdT3+WrROhmSw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IId+VGd+4y2Qq1qqFqRr6TzkjrneEOdcD+zjCYSY1XEYOZCWervdvSFRK1H2+Uv7jm9+davzNdr1tSceErvhjVBMSDJAI7NyfpCqFpXbEE0qhUeu4PiS2AXDx+NMgRD1atCDncjIv5604Wkzxsbcl8aGksGmmdL2gBGC7o9T8XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PAmRST15; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PAmRST15"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4ee04609ffaso15358341cf.3
        for <regressions@lists.linux.dev>; Tue, 18 Nov 2025 10:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763492123; x=1764096923; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cpPzcKSViMmBsZGl5AdFLD4CH7+zRq/ooWlhgXCBZRU=;
        b=PAmRST15Tl7Q117g1nRJWwrYV1PbbapFj9RrlXaoKorIeRz3PhVyOdfg+Z793Q5aIW
         +LGJMkoRDg2w1pJa7nsTIgza6Cid2xDWcS/tXA0gmZo94svf6OMaZR57CJWdRCSqkWA6
         JTHOctC3e3Ovva3F1znE+CBYLzBSEHD9nJuo0mKrxpCeHZ0e0J+GcdohwuQ84iBarqL5
         Gj8PDMuH7+PbWrWcICxYLQGvi2pEpr+ZGVUVZxJW5aiGzHiMwZHV9PzSx55UyQtUNuTR
         KT9pICRHRPwvYqoYWStgdpi5R27Atga6u9Mm0KMeQhvRT+uw/OOqkTt7WIH61LLMXZ+L
         8AAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763492123; x=1764096923;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cpPzcKSViMmBsZGl5AdFLD4CH7+zRq/ooWlhgXCBZRU=;
        b=R1vqN/3gtiT3Tg7AwgFcy3lND++DphK2SsaGbbLzrPYM7ZHfpDg61SzSLcqoWV+h5o
         ec6QaPcqv25ASzQW3bceKDVskz+hLmq5dkilY8lpwdmDLPqUx/Ug148+9oQYgMCd9nqL
         KMk7q6qSqxD0FH9k2lo4M74hd3dfVGLaCEYU456oA8iL9TZXtLXw6QZkhu6U/e3sYCvp
         l7ySvfPl5M1xwDLsJMfiu8haQIroMfXbQ3W7p2DntGOGSgkr9WjPQnhnlVtZx/mPU++5
         CWU09fLNBNJkGhQefBY8voPrboCyZ+oxbSMNlQEoGzHHWuUCdfMDLTdUhr1lNZr6dXGL
         QRPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBSXfLzPxSxd7sd2IKXAJPpE/ASzUl1uC2GVs2R/8EYfsH/zOhPuzGBocKPc/i8DSx036ifr3DdYP6sg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwpxzOHgHb6ZsOgJYTeLPSjFUz74amAyqtZ1c0Ttd7sG0DRU2vx
	GM27J9v8Kdhv0Qhz6VdBznfH4f86ovW/aC9A4tFNdi3ToOoQUjxPaZpPKQWVmG78A0lEpqYfvvK
	y8gg30dBchQFaL/vrZx6/K35hcWQq9QjdYPZ9cEk=
X-Gm-Gg: ASbGncs7vJOEXaO3KAaWDdOslbFPSQ1Vrlzx2MhhDHPeo53CA1kbZHot5EgzyklS9+Z
	ppIuQlnONQ8az8M1qU0jZGAlXABFkVllrOvdKwkQzW5HF/70SWKB+K8OeNPhlaXe4JBFqnrqWes
	DP+jKquMw6hOnyKCiZES6FdwQxf11on3VHRla/43UMHk8Bv5+QmQkSc4fY7mI0QIdTCpjVsPzcO
	le1UiCxcUS8P4iw4HD2daSfw/z8MPCCN0oorqp4MlFCJxEUHi9AQ1RvwyTNUYYdqsPOYRkGd08E
	F+qt
X-Google-Smtp-Source: AGHT+IE/KIWXtXnTqa03JqSEPf0aonmEUWdZ6XIWlR4bKGRRdCOYlp6jyEWCs0t2SNsniodNAcLCoiwjzD4Spp5KtLU=
X-Received: by 2002:ac8:5e06:0:b0:4ed:8264:91ba with SMTP id
 d75a77b69052e-4edf2117c72mr211327301cf.58.1763492122654; Tue, 18 Nov 2025
 10:55:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <mwBOip3XK77dn-UJtlk-uQ1N6i3nwsKticZyQdPYzQcsk0dsjXl4oOAh-Neoxv-0TlpKnt_FEJwx8ses5VJglGLJUW-bIG8KWchtoDwCnnA=@protonmail.com>
 <CAJnrk1ZDEszGbyP4cRh7+mEPu9BLmPrY9Xb-Q3HZnxXZOV7Eag@mail.gmail.com>
 <CAJnrk1aepU0y55FNG3zDHhK4iPo80MtD+tE_PT+ExhD9SDUS_Q@mail.gmail.com>
 <_Gt41eQ_dnFbfGcMH4LkwSqmCYBdQGfnPdQfBlAWwkohIUfDUwtdvpQa61Pk2FMD4B-ov2uVIG9FUCJu_GT67Qkde7e2oZdnnRMopuglZHA=@protonmail.com>
 <CAJnrk1YhZN9=M92dK6EtTTkuhQW_qco_ikwFHmVE0cgiiUnF8g@mail.gmail.com> <CAJfpegtzmMFtrg4G5N+M+0GG6QdBrSZStWN2RNO8ut-Uz7LdiA@mail.gmail.com>
In-Reply-To: <CAJfpegtzmMFtrg4G5N+M+0GG6QdBrSZStWN2RNO8ut-Uz7LdiA@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Tue, 18 Nov 2025 10:55:11 -0800
X-Gm-Features: AWmQ_bmhY6rB358nuNNCp6RiYfQHoKXOYq4oIUagyf7E8td6bmg6jEQDzeXDqCs
Message-ID: <CAJnrk1ZjQ8W8NzojsvJPRXiv9TuYPNdj8Ye7=Cgkj=iV_i8EaA@mail.gmail.com>
Subject: Re: [REGRESSION] System hangs on suspend after using distrobox container
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Athul Krishna <athul.krishna.kr@protonmail.com>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2025 at 3:14=E2=80=AFAM Miklos Szeredi <miklos@szeredi.hu> =
wrote:
>
> On Mon, 17 Nov 2025 at 20:00, Joanne Koong <joannelkoong@gmail.com> wrote=
:
>
> > Ok, then that means there is a buggy/stuck fuse server somewhere on
> > the system that is not completing a writeback request. If we look at
> > /sys/fs/fuse/connections/*/waiting  and see "waiting" stuck at a
> > non-zero value, then that should tell us which server is stuck.
>
> SysRq-t might also tell us where the server got stuck.
>
> > Hmm, I don't think this is a regression because the bug is in
> > userspace and for a functioning fuse server, the new behavior is more
>
> Userspace acting strangely is not an excuse for counting something as
> a regression.   The rule is:  if a practical use case  worked on
> kernel version X and didn't work on X + 1, then it's a regression and
> must be fixed.   And the report does look like a real life use case,
> not something made up.

Okay, I'll resuscitate that patch in [1] and get that sent out
sometime this week.

Thanks,
Joanne

[1] https://lore.kernel.org/linux-fsdevel/20241122232359.429647-4-joannelko=
ong@gmail.com/
>
> Thanks,
> Miklos
