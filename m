Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951414C89
	for <regressions@lists.linux.dev>; Wed, 22 May 2024 01:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716342792; cv=none; b=R7vGjPMXy57uM0Gnf/4i3qZj4l0CwxMP9MJsJi5S9raMYDJpGyDp0DdJiXHakISRmOSydAuxG4033IO1ryqKROPS7jpu7i+31PjKxAMlHJ9EWXox70U1lhv7wki8kseVXa2W89+T3FsAh1kvvLbO8vISVWIUXlqOdoWsrWWLlec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716342792; c=relaxed/simple;
	bh=QzOuKU9c0vwtW/Ze84nja4TaK9d5djDTqJ5gKBV6pYE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TNzzLhgHDOHYQc59KX2/gPpygusgNw9khmIcesN/KPe840YrBxwlAyZaQJt8wrr2D9HdKuGllVJ3YTc5/ouH0qANLhrtM/eaE8wxAcxt+z+TEV4qhPhYNXcJNYOoBuYqd29Mbyq4TBfs1MzdxoWa5SFjemN0GfI7BjjrGHnKluU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-240cb6ed477so3004904fac.1
        for <regressions@lists.linux.dev>; Tue, 21 May 2024 18:53:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716342791; x=1716947591;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bt27wWUkwaxGWYZV4sI8tjk/fi7z2Y6g09AK4Fz8+fE=;
        b=Gck6M2LTlayzBs5787FIaOnYjchc9+yeu26un8ZZvOOtMirn1DEUjFNvw4LH1yGqXD
         cmpChnvyuwqUbfB3rqXvH2u0La3CpEYOiPsbc5heHz0jKe7D+lHlwQAbBZm91QA9CGsh
         UrQRuAT9uBrOL5pJg4zjFVp9kAGOrPbiwRc1v2GuOODnasGyjDJUiElmBGwRRkPWvsgF
         lWMNU5ZNF6q2FiwVxXyWzqcEtwHAv/JuMPNAsF1WdLJWaxXUqItbVOjANGf6U1cLXO6m
         GE54C+vykeIYWcTvF3rZCp6iNX5zem+iS7KMZ3kR/V4R+Xb4JTUsVA5nPuslgmm3L6Dj
         EL2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXAwVk9AxF1zcZVfcf1O5DLthhAMl9AN0mwVIcI6I/3DFWwVk/JPjK0jMOktI/7LGujoMEpd+gR39oBnkLflOfhRuARJscNz3wyXI0=
X-Gm-Message-State: AOJu0Yw/tx5EuOB0Iov4DsSkYZvugnBY/KBaUgAFDKBse53XvlDOJGFU
	mQ8BfPbFNh6hN6Y0y8+bSINwGu27J4gAuceQ5bJ0591uHALJDqAG6F/s2++GjmYeAj0iNSkXDtN
	C/iXFCexTG5PppT5f+ueweTCb7as=
X-Google-Smtp-Source: AGHT+IFLPPilD8pOX77mCzYXmqAPEniDSoE51Dy0+JK+Jl8X4dJbi8em/Dj4jvKF/wF/djjnPMRM9wEBWBapzTKsvEw=
X-Received: by 2002:a05:6870:1605:b0:22e:9e53:3fd2 with SMTP id
 586e51a60fabf-24c68ba6e36mr870443fac.28.1716342790655; Tue, 21 May 2024
 18:53:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <87o79cjjik.fsf@kernel.org> <20240511184847.GCZj-9j2sh1Akpt9iS@fat_crate.local>
 <20240511184945.GDZj-9yaOEWqf1ng8u@fat_crate.local> <87h6f4jdrq.fsf@kernel.org>
 <878r0djxgc.fsf@kernel.org> <874jb0jzx5.fsf@kernel.org> <20240514160555.GCZkOL41oB3hBt45eO@fat_crate.local>
 <87msoofjg1.fsf@kernel.org> <35086bb6-ee11-4ac6-b8ba-5fab20065b54@intel.com>
 <871q60ffnr.fsf@kernel.org> <CAJZ5v0iHoU7dHxzL5ryehZT7unZiapoiBzPo1d=wsffNGqcS7Q@mail.gmail.com>
In-Reply-To: <CAJZ5v0iHoU7dHxzL5ryehZT7unZiapoiBzPo1d=wsffNGqcS7Q@mail.gmail.com>
From: Len Brown <lenb@kernel.org>
Date: Tue, 21 May 2024 21:52:59 -0400
Message-ID: <CAJvTdKkR2HarKaU6rnS281=HYNuOpsyBFBdUSNNLzKpWDZ7Lyg@mail.gmail.com>
Subject: Re: [regression] suspend stress test stalls within 30 minutes
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Kalle Valo <kvalo@kernel.org>, Dave Hansen <dave.hansen@intel.com>, 
	Borislav Petkov <bp@alien8.de>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev, 
	Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 17, 2024 at 3:00=E2=80=AFPM Rafael J. Wysocki <rafael@kernel.or=
g> wrote:
> > [  449.061525] rtcwake test 31
> > [  449.176854] PM: suspend entry (deep)
> > [  449.179072] Filesystems sync: 0.002 seconds
>
> This means that ksys_sync_helper() has run, so it blocks somewhere in
> enter_state() around suspend_prepare().
>
> Can please echo 1 (as root) to /sys/power/pm_debug_messages and retest?
>
> This should allow us to see more in the log.

also, it would be interesting if you can reproduce with "rtcwake -m
freeze" rather than "-m mem".

For we have a NUC8 like this in our lab, and we gave up on running
ACPI S3 on it a few years ago
because the BIOS just was never that good at ACPI S3.  However, it has
been running freeze/s2idle
like a champ, thousands of cycles per week, for years.

Len Brown, Intel
