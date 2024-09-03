Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E90B18DF6F
	for <regressions@lists.linux.dev>; Tue,  3 Sep 2024 17:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725385989; cv=none; b=Vnk6Y/EnoE7i3vb/jaAHQnQk8oxJ5kA4CSijmHcxjPqN0rXTpghvGVnAKcw/PGKJ73f7/A/WHXsizEJaYDNRI6r4I0I3HGSyIQrNDd+krnHTaxnhRwejOwpVfSRAbXj2VX7k/3cSRSdvK1nTVguW0rLWSJMolZu2OEX/NyD6/Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725385989; c=relaxed/simple;
	bh=qsklfgnd5UqEXIqfQQCBwtoJQ4EBSLZoYc9fW2DMEyY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MdkJtHW84+zO5iXSKYiHFeNQaysxM5r9/zjwaAmTtk1OmC1Q1RbbI1+zAE1bFvFQLEHDpGlCMAhpsYNP8N31ULr43bWQ0xPHWIpKE7Qlv0tIx11CDjXG8Vs71kNqMQ+9QEopkxBbJUQ9Lj2SUReoowtcWzU5rD0Djqicba/RH/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gH5by2jg; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gH5by2jg"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a86acbaddb4so675223166b.1
        for <regressions@lists.linux.dev>; Tue, 03 Sep 2024 10:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725385986; x=1725990786; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qsklfgnd5UqEXIqfQQCBwtoJQ4EBSLZoYc9fW2DMEyY=;
        b=gH5by2jgM0X8KR4LZSrhKNQfrNhS2+IpD2ZjY1Ura67R1SqEXTWfnA3UmYOpW81htU
         DCIUSBbG8J1OGS5KZRJ3/IB3LKmjOUBP4EdDENtkeSgOKA+mQK63z0FTi1z/MhSlfmZM
         QVEhhB2/Rwq8Fo4iA64Ebhj0+xEJKPD3eXzaN2elakrQdmgwn5c8FiCgBvKpzLTom2r6
         aXUvnK2BUfeVnOCfn44DWSsDwHqI2BrP0r/jW+cES6pKCnJKIO/wxeJyO8pgI+dM/3qC
         FCAuJH2tac8G3eko4CT6bsrkg5g0AivHkXgKSPXvOjy+E4A1zaU5GFUJjdjC6cPgkgkh
         kSdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725385986; x=1725990786;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qsklfgnd5UqEXIqfQQCBwtoJQ4EBSLZoYc9fW2DMEyY=;
        b=eENHUjiOWnyYwSzoqCMuyKHu+Xt54ifUiAuaFZJiRj2cP9qOttHDAVWHhwLxTotrIA
         g8X7l9toIlGJ5dn9rdRzzg713yUEKGCOOK8uLak1q6QbZgMCCBKNtmH1h1/Deqm0KBec
         rUsdl4jsD6JY9xOreQJsgqbHKzwkZO4VILn3JnoNtWwez2LJ5Z3i/85SKguYyDBGwQEn
         G7OMTJTxlwOaQURDqMlVZVcLemYKML3OnBl37oWSuInNJiATi3tuhA+CW+wVpTBsXE6A
         8lA7faT+UMejIbgv02S0NEluAsG5RZHPMUCYqFz1ZL5q+13E2VrjTTqKqhQZ1iABmt9F
         ZPzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXH0vDEbpuwGguTZCXG3Ju5y1L6nCQZBUSpFFFSRf5hXIfZUdW6DM5AvpkzkjepCTk9y8A2qzTFM/DkSg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxJYSugV/NQvqtjMiI9O7mXAUq+FAtJzlBcS1lMAmZzOF5+mxWe
	mFFd/bktPGDSBHKzQOMJGOEZ5mvsXuNuDs7AyoJgddRpte3e9LLa+iKGOWN+i0fcj8/RWF5zyWs
	+mn+u5T5/3dLoNG0quuUH9744tnzT/5TnOVFJ
X-Google-Smtp-Source: AGHT+IHvumS/WZFiMMvTc4vCSVDsRaX79qV4ow/vMV/gQtuqKssFxn5rlH+WDp6OH5yqrFkTK6AYR0DyHlPMNFDvDys=
X-Received: by 2002:a17:907:7251:b0:a86:7c5d:1856 with SMTP id
 a640c23a62f3a-a897fa744a8mr1602475166b.46.1725385985198; Tue, 03 Sep 2024
 10:53:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <BD22A15A-9216-4FA0-82DF-C7BBF8EE642E@gmail.com>
 <6f65e3a6-5f1a-4fda-b406-17598f4a72d5@leemhuis.info> <ZsiLElTykamcYZ6J@casper.infradead.org>
 <02D2DA66-4A91-4033-8B98-ED25FC2E0CD6@gmail.com> <CAKEwX=N-10A=C_Cp_m8yxfeTigvmZp1v7TrphcrHuRkHJ8837g@mail.gmail.com>
 <A512FD59-63DF-48D3-BCB3-83DF8505E7E0@gmail.com> <27594ee6-41dd-4951-b4cc-31577c9466db@amd.com>
In-Reply-To: <27594ee6-41dd-4951-b4cc-31577c9466db@amd.com>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Tue, 3 Sep 2024 10:52:29 -0700
Message-ID: <CAJD7tkbO8J+2KfRnCPPoxmPzDHnpnbWfjHx9YJe_PtJ9S_yLPw@mail.gmail.com>
Subject: Re: [regression] oops on heavy compilations ("kernel BUG at
 mm/zswap.c:1005!" and "Oops: invalid opcode: 0000")
To: "Aithal, Srikanth" <sraithal@amd.com>
Cc: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>, Nhat Pham <nphamcs@gmail.com>, 
	Matthew Wilcox <willy@infradead.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Linux-MM <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 3, 2024 at 1:31=E2=80=AFAM Aithal, Srikanth <sraithal@amd.com> =
wrote:
>
> On 8/25/2024 11:25 AM, Piotr Oniszczuk wrote:
> >
> >
> >> Wiadomo=C5=9B=C4=87 napisana przez Nhat Pham <nphamcs@gmail.com> w dni=
u 23.08.2024, o godz. 18:16:
> >>
> >>
> >> Have you tried with 6.9 yet? IIRC, there are two major changes to
> >> zswap architecture in recent versions.
> >>
> >> 1. In 6.9, we range-partition zswap's rbtrees to reduce lock contentio=
n.
> >>
> >
> > Ok - after 32h of continuous compilation also on 6.9.12 I got series of=
 oops (see below).
> >
> I hit similar soft lockup with linuxnext-20240902 build, but I was not
> running anything for that long. Once I hit it while kexecing on
> linuxnext-20240902 and other time was during linuxnext-20240902 boot up.
> I have attached the logs here, I am trying to see if I can recreate it
> on todays linux-next build.

This doesn't look like the same problem to me. I do not see any zswap
functions in the backtrace, I see fuse stuff. Please send a separate
bug report to the relevant mailing lists (probably
linux-fsdevel@vger.kernel.org).
