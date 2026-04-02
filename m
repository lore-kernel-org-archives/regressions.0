Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A994D29B216
	for <regressions@lists.linux.dev>; Thu,  2 Apr 2026 18:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775154475; cv=pass; b=VBljbmbDqHQUKU5xWyizkTXuxt6O67S5wroG3IEY21dQC4fhvAmIJAeGYhyIJP+QUFdEEh8Iv+U6ciHHao6wxRH/z76K9xFFyV99RrVqQIgyv623Ta1ZdwvmV1/Dv1tIpKqaINFKj+9IzwTqkWd/FfERfBMDxVGiLGhTl/+abL0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775154475; c=relaxed/simple;
	bh=iudOPzLSlC8H7io1upCOkXjod2nGAYdcw06s+W1Ndz4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XLs3ko/Cidhs/vTZUZOo8+auha4cfG7YT9BZDsgUAZWi8WRIFxJSf2yiZXSaR2rJvljpPgKWW5htEtTEkVBeeiRZb1amHbefbAJ1pTuqRGo1rwOD7nwFv6MrpFcwLQ8Wx63Zqb3gGc84JWYjZll4qDMjBbfgmm2OCQRzUDAZo/I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IIXagPGk; arc=pass smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IIXagPGk"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1273c690e5bso36330c88.2
        for <regressions@lists.linux.dev>; Thu, 02 Apr 2026 11:27:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775154474; cv=none;
        d=google.com; s=arc-20240605;
        b=jf9jri/mQheGy+Ca1aeAoB+HAt5OkDHvpvinvUKbQuqgOngcoq2wuNLThkEa2catPa
         lbDtbK00d9ezRvOL5UB/V3LhWnOO8SdHV0HVBIfJKYr2oYsFPQtTleVlddnCla3FDPP/
         ia2Eur8a5IudQgk9gBeKxtTw2keUdyu2Dy+nZ/Akd9zqJM22/Q1wpZqNnC4rBnwH08Sn
         uJjAZ+FQH4ixC/5eDz6E7x3muDFVgI922iTrWvzS662iH+53ozWsiiG0htQEEIj58DsX
         FLxtlEbZPuwAUNUfhbKHMp87GwsOAL+2rj6gfitlF99E/sNZ4mfvyiNW29wFR/8ot2L+
         YLWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3nz78P8JwO8WYCJwneSwFruPF9nag3r5N/7yHGc7wHg=;
        fh=rzF3HOM/TDk0CbNy4RGavbq2y0ES6rGxrcmCwGsbR/Q=;
        b=F/zf118K1InF+bT1QMY2N1xs0lYQDtsBqxiEAvjzY+VUySYebfy60DZl0MsifVxBSu
         kI2TQjRNYpd0XwvxwHwHt5GoI1KYTmbs4QugKEUpp6vmswEuPIhrbQ5SXspVvnmf2KhD
         4abKsNh/HKaibz5EC59qNwRYJhmsxcYn2UJTMWEehfnsQf0/VkgYXjHpTe/Egc6UHNXX
         fqMZizjo2z2GA/lgzZAtKakzEO2rZyXGXLS+Teop9W9e0MjRH/7b7qhqCTHlgv+C77KL
         HHfx0Zbzw4Jt8v92dYRu/W1yT5fu2FzH3fhGlKAjOZ953ZDojqoJm8rEqLh98YQDeCvz
         7jSg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775154474; x=1775759274; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3nz78P8JwO8WYCJwneSwFruPF9nag3r5N/7yHGc7wHg=;
        b=IIXagPGka8FDQKeL5o0db1MZRp4Zic9Ul6rk4/wT+DtW7zMWtnPs/DRVmO4e9aZYnN
         IWJ3lClR7CdgJoEJA7bHZwhs7opfbNqS5hsUPUwKWO0t7/Yu6C/PMDz67ruFe0DJ8W/e
         lZgenF8T8LRuFaXuKUXOWEUgcRVUK8ys/eLyo2hTXbs2mMJU4IPz6dm0e4vZAvnTHjR/
         LCFSbu0GCYCzygYcqxHr567Y+ymsrEpAuvWKoTWvxepFw3qb6YRfh9NsrIszGicw3zo6
         cbm+nOVJKxJfZZgfkISmRajTFjrl0L874EBUBs3IyfclN7QhZI8M/FW2Avp5ZPAJZuH3
         ChdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775154474; x=1775759274;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3nz78P8JwO8WYCJwneSwFruPF9nag3r5N/7yHGc7wHg=;
        b=rCAKVV/7Jpfy/Umvtb+wxyTw2d4rUuQPtnWFFoxyWfXhOYGcQtNKnjx7adDcdNcEJq
         68ZwSM1TDwIqBeqPIgpK+x1ikvfIzpzYvI0aZpHxbQlOgeJrftQOo6oZSuanW/gH+Nyg
         EvECgniBqhOw91MiMgiQ1Sp3m5T3HMkM0qcnb9aAsUpq7F1TkPPe88CoIoLxr1B5PUDv
         Jq3n7IpYT02KEL5leE5tJQ17h+7gEldC1EXT1d8fYNW2Y5nshW3y/wmiU0IaCdMlwtp1
         huYrnspYwLH9uwdzKw+AGPA5qGnNL0Z8Jr72WbR4L1+DVWgxeumrGkmW3suZ6w4rljS4
         nWZA==
X-Forwarded-Encrypted: i=1; AJvYcCWXedUGUaVTgEURR0eQ2fb7ZTJ/QKYBu64jSZfGNKucOM6lUuYK3BHQey9ylvHkl7crnPyfTDFLoPlmEQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzWfJ5bQO1hPkOwSVVLXCDoTnJdu35C/lBd0t7Sef2z60ATFp2e
	FLEDWTmuMdPyN7UU2/JVmzXxwjoaF/OV93XGZ/KsL9adfSAwWAKDqhJUGa37fn+BM3YkNkSMg0R
	rbPe/AuKhtnYpJ2kOQWWAn1wlY8TtIGk=
X-Gm-Gg: ATEYQzxMEYPIjOa1q9T6mdEqFk5RJgTDyOgkm30qHXaFKhr96syqUjF4wLCEp3UwsoH
	Ff7boCAeLfpw6L5OsP7TORt29Q8IKsFj6oXi/aptjtA6ppr7J0QFK6xGdXiQGYHS/pueu4RGMUK
	gFrWU/i3SXJtghmY/lkuz46ZJdy9Qop+7ZE17JF5QxnqgElRZT/LsJTUO0AR9AM+IpZ8azl1Sfp
	cVNA5n9mYfZLPclOLWbQobG+9/1sDpZikj5Ua9hIXHmy3zPLGOwypBkeP5knr/FTmPRlfx5Hqor
	BBrsrwaXW1d3WY2pbH3s9GPj6nYA9kYz3EMe+fYOjG8KDb0DY25fyUbIhZNgUY27NXo5sQ==
X-Received: by 2002:a05:7022:226:b0:12b:f9aa:a13d with SMTP id
 a92af1059eb24-12bfb6ed5ccmr22345c88.1.1775154473621; Thu, 02 Apr 2026
 11:27:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260401184456.3576660-1-alexander.deucher@amd.com> <47c508c3-3424-4e8a-a63c-1f29d13b6ebe@leemhuis.info>
In-Reply-To: <47c508c3-3424-4e8a-a63c-1f29d13b6ebe@leemhuis.info>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 2 Apr 2026 14:27:41 -0400
X-Gm-Features: AQROBzBC6IbXZRo0MtyoO7uYGz-yAUxbl3iCRexA4WI6UV1jaB5oEu9t-_ooXNY
Message-ID: <CADnq5_MiFOYLP9aUnYw4HFb-xWLZdq245ZB3e6iGn09ywOsY2w@mail.gmail.com>
Subject: Re: Regression fix for audio issues with pre-DCN401 chips (was: Re:
 [pull] amdgpu, amdkfd drm-next-7.1)
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org, 
	airlied@gmail.com, simona.vetter@ffwll.ch, 
	Linus Torvalds <torvalds@linux-foundation.org>, 
	Linux kernel regressions list <regressions@lists.linux.dev>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 2, 2026 at 4:59=E2=80=AFAM Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> Lo! Me again, sorry for pestering you folks about workflow issues again
> after doing so just a few weeks ago. :-/
>
> On 4/1/26 20:44, Alex Deucher wrote:
> >
> > More stuff for 7.1.
> >
> > The following changes since commit a51973c5dff8a0f01cc7d1b2007306ea0004=
fa16:
> >
> >   Merge tag 'drm-xe-next-2026-03-26-1' of https://gitlab.freedesktop.or=
g/drm/xe/kernel into drm-next (2026-03-30 06:04:59 +1000)
> >
> > are available in the Git repository at:
> >
> >   https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-7.1-=
2026-04-01
> > [...]
>
> I noticed that this lacks "drm/amd/display: Wire up
> dcn10_dio_construct() for all pre-DCN401 generations", which is a fix
> that was posted 10 days ago[1] for a 7.0-rc1 regression that at least
> three people hit[2]; a fix that now seems to be in "this week's display
> driver promotion cycle before merging"[3] at AMD.
>
> Is this delay really needed / worth it for a regression fix at this
> point of the our devel cycle?
>
> And yes, I understand that this might be shared code that AMD wants to
> test internally first. Still asking, because at the same time it would
> be nice to (a) fix the regressions rather sooner than later and (b) not
> fix in the last minute.
>
> Are "pre-DCN401" chips even tested in this "driver promotion cycle"? And
> how often does it find problems anyway? Can't we just apply the fix and
> revert it quickly later in case AMD find problems (yes, I understand
> that this complicates things, but I wonder if that might be worth it if
> this is rare)?
>

There are always new fixes.  Worse case it ends up in 7.0.1.  If it
causes other regressions, then we end up introducing a new regression
in rc7. Pick your poison I guess.

Alex

> Ciao, Thorsten
>
> [1]
> https://lore.kernel.org/all/20260323211343.263909-1-sunlightlinux@gmail.c=
om/
>
> [2]
> https://lore.kernel.org/all/CAOKSTBs1VNBdjRZe3M2v-nC%2BpLZZ0-KQtRUZUj6ACq=
b4Xe7LDg@mail.gmail.com/
> https://gitlab.freedesktop.org/drm/amd/-/work_items/5052
>
> [3]
> https://lore.kernel.org/all/22eb66d8-b74a-4e0a-9851-7e39c7f950cd@amd.com/
