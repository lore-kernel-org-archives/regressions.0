Received: from mail-lj1-f202.google.com (mail-lj1-f202.google.com [209.85.208.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482E31F130D
	for <regressions@lists.linux.dev>; Tue,  3 Dec 2024 13:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733234014; cv=none; b=GL8LSfK71rEoX2JmX33WXaEUSYRWU4CfN7WZ6Zp0OIRP7V0DS4OD4u/5M7XMI4yDfdDQoIYgq9w6n3YEPE2s8aUwooWTvvj1SULgk4Z5fmlcbBG4lazPZILh01dCEz3qMmhsCVQFQP5qe1FsfLORVyVmxqQPv3Uf5Ic30EmqYdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733234014; c=relaxed/simple;
	bh=TXAqVY8KWWJBZQ6CwZv+j5Cey4kS2P9bKaxvIbGTRW8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Iv3u/0r4OAU8mxiruvMBO8gEd76bOXy2jZea+gncAoxBG6+hPbsPhdVS6nh+oOSRCjpfG1PGZIMUEiuMZsThRUtc74vFsD8IAFajvdH/9lwxjPc/1Emd8eICpLJNmGjmP85n8LfDxMjotUTnMzMi00G/1t4er4BtnC62jmCBCjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--gnoack.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=c2uCBIQc; arc=none smtp.client-ip=209.85.208.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--gnoack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="c2uCBIQc"
Received: by mail-lj1-f202.google.com with SMTP id 38308e7fff4ca-2ffe1ddca04so45597921fa.1
        for <regressions@lists.linux.dev>; Tue, 03 Dec 2024 05:53:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733234010; x=1733838810; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AemqQ9vAGuX9F0C6FlnaawUPQzUVE3YTdDtlmLWXAww=;
        b=c2uCBIQcFkgvvCmcyVHV7xvVsMcBfc27N4Wzb1j1wwVOg3UT6qOiCx+gpfJ/2JSbNK
         PJsNORZbplMo5jCppUcMkiROKc8FxKmG+phD9tCzz2lzqKWYLvPoHker3e3XqWOyvmP7
         3G+jkUOyz3hvaSyehrjtWl9+ack6DHcqYARjapGDER99PAvHti5vw4KW8AeJSr+avO0A
         AWrKSaK79Ncr2B2bmq+NKsFkZ33wgF5ASa0COL4kHxrcF1ZItUpcvti8sn1xdW167c9W
         quZrGmiQtn0Tn2Wlgkd/qVVKy7k+IUVuKxPYxbS1DcgzthqKq8yRbL3PzxPqe3KSHpH/
         EXPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733234010; x=1733838810;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AemqQ9vAGuX9F0C6FlnaawUPQzUVE3YTdDtlmLWXAww=;
        b=byOimpGXO5A3PILcwj9PSklmazIubzRO15+tZEbIGoOt8LvfHlHhtPmUezhd1JAEzW
         006f3SSDEtwCYVFjF6YvC7rREaBvl6gBt69qDpg/VT7MamvtQBQKtG9XCNCKgzV9Q/43
         nFX7uVeczteNRxc8QaH26FDwEwRTNK41pA2fep+Goskxf7IP4CP/ZqBKQwWwLHqCeVa3
         VTIHIA7Svcz+UIuzMaxhmcL737lpJnrox9CU6vysvW5NY3W99A1aBJf/KxaYNdgTdsja
         qn8d+3PsBbmVApMeyaLjl+jD3nGtwMvzT9dqG4FBgMF4/By+8ruD+KO7LI1jIqnU1eyl
         IuEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJvCZCoSEMmw9esOkKBIuHAvCMdjGfNWmXStRrOG60PqpsrzvAda2TFdUIVHxupf03TNqD7IrsVTO0XA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwVWVF1pZW/T0M7USVk2mtIG+xZItvg2aW7O7W6Xebx2R0Rt4Fr
	MA4StwBUBV0oTluqsNTGspRiKgdox8S39GcV6MiwNBltT+11JlM/saazammOE0qPq3qNYilXO62
	EIg==
X-Google-Smtp-Source: AGHT+IFCzJOllkW4D5c3mTj1w+OFc+7lwZc+dvcg9StCItki84tsAp5HAkY8UOhehLFLcQlMW28Y3LqEwco=
X-Received: from edbu25.prod.google.com ([2002:a50:a419:0:b0:5cf:dfe3:2bd7])
 (user=gnoack job=prod-delivery.src-stubby-dispatcher) by 2002:a05:651c:2117:b0:2ff:d801:4aed
 with SMTP id 38308e7fff4ca-30009d07e8bmr20937821fa.28.1733234010358; Tue, 03
 Dec 2024 05:53:30 -0800 (PST)
Date: Tue, 3 Dec 2024 14:53:27 +0100
In-Reply-To: <CAG48ez0vg9W=oatvEqxvTSYNUx7htY23LxPrYCiuLZhZQuaGjg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <ee3ec63269b43b34e1c90dd8c9743bf8@finder.org> <CAG48ez0vg9W=oatvEqxvTSYNUx7htY23LxPrYCiuLZhZQuaGjg@mail.gmail.com>
Message-ID: <Z08NV4Z-L0anDxGk@google.com>
Subject: Re: GPM & Emacs broken in Linux 6.7 -- ok to relax check?
From: "=?utf-8?Q?G=C3=BCnther?= Noack" <gnoack@google.com>
To: Jann Horn <jannh@google.com>
Cc: Jared Finder <jared@finder.org>, "Hanno =?utf-8?B?QsO2Y2s=?=" <hanno@hboeck.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	linux-hardening@vger.kernel.org, regressions@lists.linux.dev, 
	kernel list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello!

On Fri, Nov 29, 2024 at 08:50:38PM +0100, Jann Horn wrote:
> +regression list, LKML, maintainers, patch authors
>=20
> On Fri, Nov 29, 2024 at 8:38=E2=80=AFPM Jared Finder <jared@finder.org> w=
rote:
> > The change to restrict access to TIOCLINUX that was added in Linux 6.7
> > breaks Emacs rendering of the mouse pointer. This change was previous
> > discussed in
> > https://lwn.net/ml/kernel-hardening/20230402160815.74760f87.hanno@hboec=
k.de/.
>=20
> This landed as commit 8d1b43f6a6df ("tty: Restrict access to
> TIOCLINUX' copy-and-paste subcommands").
>=20
> #regzbot introduced: 8d1b43f6a6df

Thank you for reporting the bug, and thanks for forwarding, Jann!

> > An associated Emacs bug report, bug #74220, is discussed at
> > https://lists.gnu.org/archive/html/bug-gnu-emacs/2024-11/msg00275.html.
> >
> > I wanted to ask if it made sense for the restriction to not apply to th=
e
> > following three selection modes for TIOCL_SETSEL:
> >
> > TIOCL_SELPOINTER   3 /* show the pointer */
> > TIOCL_SELCLEAR   4 /* clear visibility of selection */
> > TIOCL_SELMOUSEREPORT   16 /* report beginning of selection */
> >
> > On a glance over the selection code, none of these interact with
> > vc_sel.buffer and therefore are unrelated to the exploit linked in the
> > original report. Only SELPOINTER is necessary to be available to fix
> > Emacs bug #74220. I imagine such a change would involve moving the
> > capability check from tioclinux(), case TIOCL_SETSEL to inside
> > vc_do_selection().

We did indeed miss that Emacs is using these IOCTLs directly.

To paraphrase what is happening, so that we are on the same page:

* Emacs includes the GPM header gpm.h and calls Gpm_DrawPointer(x, y, fd).
* Gpm_DrawPointer is implemented as a macro, which hardcodes all IOCTL cons=
tants
  (as it is the case in the entire GPM codebase), and it invokes ioctl(2)
  directly from the macro.

The Gpm_DrawPointer also gets called from other packages, including mc (Mid=
night
Commander), elinks and libt3widget (which supports the Tilde text editor).

https://codesearch.debian.net/search?q=3DGpm_DrawPointer&literal=3D1&perpkg=
=3D1

* Midnight Commander and the Tilde text editor display the mouse cursor fin=
e,
  also as a regular user.

* Elinks does not display the mouse cursor at all, independent of whether i=
t is
  being run as root or not.  (Which makes me suspect that it might be an
  independent bug.)

* Emacs does not display the mouse cursor when run as normal user,
  but it works as root.

I can see how the three selection modes TIOCL_SELPOINTER, TIOCL_SELCLEAR an=
d
TIOCL_SELMOUSEREPORT are related - TIOCL_SELPOINTER is the one that we need=
, but
TIOCL_SELPOINTER and TIOCL_SELCLEAR are the other two which can happen lead=
ing
up to that at the top of vc_selection()?

I also believe that what we *actually* want to guard here is the change to
vc_sel, so to propose a (somewhat simple-minded) patch, I guess we could pu=
t the
CAP_SYS_ADMIN check in vc_do_selection() right before the place where
vc_sel.start and vc_sel.end are being assigned?

Hanno, you are the original author of this patch and you have done a more
detailed analysis on the TIOCLINUX problems than me -- do you agree that th=
is
weakened check would still be sufficient to protect against the TIOCLINUX
problems?  (Or in other words, if we permitted TIOCL_SELPOINTER, TIOCL_SELC=
LEAR
and TIOCL_SELMOUSEREPORT for non-CAP_SYS_ADMIN processes, would you still s=
ee a
way to misuse that functionality?)

Thanks,
=E2=80=94G=C3=BCnther
