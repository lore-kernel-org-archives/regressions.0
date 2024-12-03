Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5499D1F12E3
	for <regressions@lists.linux.dev>; Tue,  3 Dec 2024 14:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733234884; cv=none; b=aRamc+NSdDcljRU4zOT3HyHUHBaF8+i7R6Ke3uXZ1AolxElRr1rdWvcwgu8xaYdhYxDhhbvWOK0g19neoPUYPpSLAmBmIreCjCIWebms06Np6NDCrHgPVizBOBxjTHTYllnWHQJ5BzAPA971tsxlgSP6t0JQqQnoo87TjNdpVv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733234884; c=relaxed/simple;
	bh=dkRPz5hCP91YP+K/ZzeXcVdSbccaZFfQZLPNFXn+Ooc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oVjXeEU1XcLhvFkLKRjFXCTHjvNVEzmMhHuR3BMdqntT50OVRJ0HKtPx7i3x1QIMRclypWEyf9aawE5UsGlAD/jhBq0MjeK1tX9KBEiS+/vPrXbX0kS0lQOg9zoplsZWe0zShQmi7oBuiMaR6YWlM3XUQtQtqUP/ec7xnj3oMEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--gnoack.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Dc4hzatD; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--gnoack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Dc4hzatD"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-5d0ea1226edso1881384a12.0
        for <regressions@lists.linux.dev>; Tue, 03 Dec 2024 06:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733234881; x=1733839681; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kgJ5Ld604A5Q3ZbtbqRhmhZWPfDB0owJn+W381THr6w=;
        b=Dc4hzatDKoMYRB+3dAfdvShMZLXx/U5JZAG/dDXr+iaD5kehtYpEsV9WDw8YzYA4MT
         zy1QG8wCtWeZC+kxfa3pVw+YiM4jZhAVfctDK8tYVkt0lTF32cx9A/1ja/FZT8FDE2/5
         Z7iKhgvZDHCiLMh62CXO+H1IOZmP64rMT6zW5jd/UEjfjxu7QGMSULclHXCKEhf3MjnO
         BQl1TVH7Fmhc8+nQbN1tr/djGXrxBwKtDgK87QVTMEs9zPs+pl75w9XkRavMHNcf5mnh
         pZ39Dw5Ugja6S2nUe4/hfIMkRvvZDto7KzsibT5PKjL4YgfzWDrsLqdpj/eUryaJKxRr
         QBpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733234881; x=1733839681;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kgJ5Ld604A5Q3ZbtbqRhmhZWPfDB0owJn+W381THr6w=;
        b=OSb9gwyhm1zP4jScPEIl2Uy1yHTb21kjAhPImM429DAf58dHlqNoZ0HKtWTsAXEQc7
         d7jVLfKpWWM3RAB0276Die3kbmn5S7GvE6UxV4pSWVK7kvYbtVh+vGNqiswMGaRJB7zG
         GiarSxHj9ksN0ap/RxMIOp6OwxFoaP/SSFHLfmmLApo10t3qq7TuvGDr04i+8wiWLSOa
         QmgPyC1V984XCtht7aTgIp3rCXNIZE+qW/mbkyRusR8QJUfWd2d1SLe3VfEoCaRQ0uyM
         zWVMmc+RjlSo0bfc6Xu6QrYqYGfl8Luap/tXpIepEkAS6Y0YumlEKdZy86KKjYCL0JX1
         U4OQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5/fOmSZBXXzPt6ajV+1aCcbGraAajWUgHWyX7wqd7aE4jw48yOxmG6LfvZNurY9iO4i23gAj2KmazHA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9wU5sRPS1fSCaF+mliv4FW7jpxWJ/i6pFWNewXEz+ifNj0Y0i
	n4J94eUzV+mFMb5q8O9+HY8xoLG5/Yl4VVSQvvALbfn+hlx8kDoYujNG2tpDwN2Dzud11nxh7sx
	Qhw==
X-Google-Smtp-Source: AGHT+IEaY8KyMwf/CJRU3fMSCPPQTKC0ZN/MBI985OtghEJefG+CwM21x0l4ouja8k3Nx433ZCD451zKp0s=
X-Received: from edxi12.prod.google.com ([2002:a05:6402:54c:b0:5cf:d3d9:308])
 (user=gnoack job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:13d1:b0:5d0:b2c8:8d04
 with SMTP id 4fb4d7f45d1cf-5d10cb5cc5amr2112502a12.18.1733234880753; Tue, 03
 Dec 2024 06:08:00 -0800 (PST)
Date: Tue, 3 Dec 2024 15:07:58 +0100
In-Reply-To: <Z08NV4Z-L0anDxGk@google.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <ee3ec63269b43b34e1c90dd8c9743bf8@finder.org> <CAG48ez0vg9W=oatvEqxvTSYNUx7htY23LxPrYCiuLZhZQuaGjg@mail.gmail.com>
 <Z08NV4Z-L0anDxGk@google.com>
Message-ID: <Z08QvvfLSWGIDfBD@google.com>
Subject: Re: GPM & Emacs broken in Linux 6.7 -- ok to relax check?
From: "=?utf-8?Q?G=C3=BCnther?= Noack" <gnoack@google.com>
To: Jann Horn <jannh@google.com>
Cc: Jared Finder <jared@finder.org>, "Hanno =?utf-8?B?QsO2Y2s=?=" <hanno@hboeck.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	linux-hardening@vger.kernel.org, regressions@lists.linux.dev, 
	kernel list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 03, 2024 at 02:53:27PM +0100, G=C3=BCnther Noack wrote:
> Hanno, you are the original author of this patch and you have done a more
> detailed analysis on the TIOCLINUX problems than me -- do you agree that =
this
> weakened check would still be sufficient to protect against the TIOCLINUX
> problems?  (Or in other words, if we permitted TIOCL_SELPOINTER, TIOCL_SE=
LCLEAR
> and TIOCL_SELMOUSEREPORT for non-CAP_SYS_ADMIN processes, would you still=
 see a
> way to misuse that functionality?)

P.S.: For reference, some more detailed reasoning why I think that that pro=
posal
would be OK:

It would protect at least against the "minittyjack.c" example that was atta=
ched
to https://www.openwall.com/lists/oss-security/2023/03/14/3

The trick used there was:

* ioctl() with TIOCLINUX with TIOCL_SETSEL with TIOCL_SELLINE,
  to make a selection (a.k.a. changing the contents of vc_sel)
* ioctl() with TIOCLINUX and TIOCL_PASTESEL to paste the selection.
  (The implementation for that is in selection.c/paste_selection()
  and is just copying from vc_sel.)

So as long as we are protecting the change to vc_sel, that should be OK in =
my
mind.

=E2=80=94G=C3=BCnther
