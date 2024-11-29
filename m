Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FCE1E489
	for <regressions@lists.linux.dev>; Fri, 29 Nov 2024 19:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732909878; cv=none; b=L0lPGdexq8Pm9F+fb4l1ao/yE2qi9H+5UJhk0LKm83zyxId7zthqd/5mBZqegFI3r6l1IcmbJsM19TjPeXD5qrvZkYpj0R3W6GDSg+s8tRFQqjvNfUzPxVArXPhlhn9b3bFPdexuqzVlehj1+r8Ofmc33LUjKnd/TAiQ2BpB+IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732909878; c=relaxed/simple;
	bh=iTaxrum4RWbRMxEoY8krvugViqTvIJqlx4xVF8pjTSY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n9njk8hOAH2ekaLGECpZcrAxhoh3U3lJ/HNDk3AY6/G4UYo4by9mCiejSvbGqwn5i2gWl7oWk5wY4WbGp4jOcRRyvQtlj11TuaJdDjARLvvtGy1gc9YsDWyMVRzYMftjk/ymUdlGIwmvLFGFbozAScJav98Tb71HDH6F0O4yHO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rtPQRD5E; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rtPQRD5E"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5cfc18d5259so18393a12.1
        for <regressions@lists.linux.dev>; Fri, 29 Nov 2024 11:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732909875; x=1733514675; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DakFNAdlgvG9kZOIFDKFoMmE+nLP/gOLaXT7j6tD6Ds=;
        b=rtPQRD5EbxBpZGowFMZJMo7Cu8sEsh5h0SLlGY957t9GeP1YLlPErbxVHuIaFrjdia
         VEy3EMvq+6zgfkdc7iEufGuji1HYAEtJEPt0TPwVSr4+tKod8UZbxi1JOuU8UnuE484n
         MrrSsB7jDvbWzRvaTIAgJSrNgZxGzCetYsaS7KIFx/G4liZfkrcdLMEnbEBe6CYtu2JM
         SHlT6BX3P4ZyLI47V4EpOwY8qSk/OMKHFMJRvd/QdoEa9zo7pggeg7tE7YXA891gznAK
         6sI3+g5KN24rfSX2BNRLLDt9NmTXJGHaFYvhf92YFjuTyZXpiRVfic96JXoK4dV9OwS6
         OIvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732909875; x=1733514675;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DakFNAdlgvG9kZOIFDKFoMmE+nLP/gOLaXT7j6tD6Ds=;
        b=Uc39vgepRP2p2sVyfjBYX1kWlKL/YkVu1OfS71yvGThdQdu6TYhX7m5S0UNfcO2VZ8
         jabZx5ih0EFvu7KzsGqrqFIgv3fABWylKdLfazxako6uLKL0MLrUcAHZnECMOf4ffnKz
         rgaUoGFcZmiO4d23MNsWnXAVrUK4+/nB8Lec0h6gUJzSI8Lh0KhS23773/z6fBaBeBXt
         pvlfsX+yfXNFmXnO3zQpEuM44wt7uXlpAbDfTGdjNm4UF/Z++9S230wbNlnm3KtdLixq
         d87bbmo+YQrjDRZ6EMXm+iMZAruI1oVTgtk/P9VXCCTJXU0/73k0Sban4jBj8rqud/W6
         ET/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUoBvLYkuXhfDiyX9BZ3eaoVYgN/Q4Z/8g/5hHx612+N9HuO/C3cdjVf/jUz/EmLDRfoAwmQffHCK+L0Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzypMdvaeFqR06mqr2j1cXp3utRlvh3Wjj7DLJu5io6pgYxiGes
	IG/jWAkOxgp42jcQXVGaOydAGU/gcp7R6ip+h+BtqvPifA21g0cBMtNhfR10bUtZT4crJKoGDwj
	Xkox7bASJcKEd9yQMCbJafqDYwPzEgG19vySj
X-Gm-Gg: ASbGncsNgPr0/nMISFiGERiBzEZ34WQjscTeYzdb0l5UF3HqVuH2WXqHbB0snMyhDEF
	rSizJ3c7hY1EwLBWMduO5FNxe4A88r0+yRquezvQ2zCG+52SaNq5QpERsbVc=
X-Google-Smtp-Source: AGHT+IGlaSsjv6kt+38Zjk6dLy2h4xxAeTLK604DNvrzBYzm9ozC/f76QckgvNB7y/dBp8gVjL8EAn6TLInXBILZe3U=
X-Received: by 2002:a05:6402:35c2:b0:5d0:a982:91a7 with SMTP id
 4fb4d7f45d1cf-5d0a982a46bmr75993a12.6.1732909874361; Fri, 29 Nov 2024
 11:51:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ee3ec63269b43b34e1c90dd8c9743bf8@finder.org>
In-Reply-To: <ee3ec63269b43b34e1c90dd8c9743bf8@finder.org>
From: Jann Horn <jannh@google.com>
Date: Fri, 29 Nov 2024 20:50:38 +0100
Message-ID: <CAG48ez0vg9W=oatvEqxvTSYNUx7htY23LxPrYCiuLZhZQuaGjg@mail.gmail.com>
Subject: Re: GPM & Emacs broken in Linux 6.7 -- ok to relax check?
To: Jared Finder <jared@finder.org>, =?UTF-8?Q?Hanno_B=C3=B6ck?= <hanno@hboeck.de>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>
Cc: linux-hardening@vger.kernel.org, regressions@lists.linux.dev, 
	kernel list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

+regression list, LKML, maintainers, patch authors

On Fri, Nov 29, 2024 at 8:38=E2=80=AFPM Jared Finder <jared@finder.org> wro=
te:
> The change to restrict access to TIOCLINUX that was added in Linux 6.7
> breaks Emacs rendering of the mouse pointer. This change was previous
> discussed in
> https://lwn.net/ml/kernel-hardening/20230402160815.74760f87.hanno@hboeck.=
de/.

This landed as commit 8d1b43f6a6df ("tty: Restrict access to
TIOCLINUX' copy-and-paste subcommands").

#regzbot introduced: 8d1b43f6a6df

> An associated Emacs bug report, bug #74220, is discussed at
> https://lists.gnu.org/archive/html/bug-gnu-emacs/2024-11/msg00275.html.
>
> I wanted to ask if it made sense for the restriction to not apply to the
> following three selection modes for TIOCL_SETSEL:
>
> TIOCL_SELPOINTER   3 /* show the pointer */
> TIOCL_SELCLEAR   4 /* clear visibility of selection */
> TIOCL_SELMOUSEREPORT   16 /* report beginning of selection */
>
> On a glance over the selection code, none of these interact with
> vc_sel.buffer and therefore are unrelated to the exploit linked in the
> original report. Only SELPOINTER is necessary to be available to fix
> Emacs bug #74220. I imagine such a change would involve moving the
> capability check from tioclinux(), case TIOCL_SETSEL to inside
> vc_do_selection().
>
> Note: This is my first time emailing a Linux kernel mailing list, so
> please let me know if there's any additional conventions I should be
> following here.

FYI, for next time: There is some documentation at
https://docs.kernel.org/admin-guide/reporting-regressions.html
specifically for reporting regressions (with a focus on what to do so
that your regression report doesn't get lost).

> Thank you for your time.
>
>    -- MJF
>
