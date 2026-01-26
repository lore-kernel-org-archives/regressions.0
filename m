Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35F125487B
	for <regressions@lists.linux.dev>; Mon, 26 Jan 2026 18:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769453852; cv=pass; b=K+KoCfGY52QPylSWAE1SpCwbugxf3Gcbq1y+zgdbYQOTKpfrXzR59oJ8UGFCmNHeJv6cx04Lml7zmaOMKYuZzZx6JzfBapt2LfebOa+ClXfiRsIZRtYXg1wZJU4DJXBKO0FCXi03ZdS9zVfZcdyeWMg+EItkp5MBkvOwdsBW6mU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769453852; c=relaxed/simple;
	bh=hz+RGTXkAy1aPQVsKS3hIYer5EZOTSqKLFdI1ON5/I0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VXYncsG+vUQYyQXcdW3KkArLVamb9dXPhNjZ9A5SldIJ+fAKcrch0HpdLUF1l2J0p4bUwqoHTTa5iU3j+fiE9bzm1jtBX1fhgF7mC6ohUQsrPlSXIidPLjisgFcjYSMYuzUyDhgdrLpnOaiYXP6TCYJ92F2hG9zWJriMRl8pJyw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ezpI9v9W; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ezpI9v9W"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b886a249da3so49547166b.0
        for <regressions@lists.linux.dev>; Mon, 26 Jan 2026 10:57:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769453849; cv=none;
        d=google.com; s=arc-20240605;
        b=lRub5+2YzM+f3d757L/YhzcF9kXpiHQCNn0KC1NEDXT4ESsbe2hhTQKaFI5hJWVAwp
         sPE0yXdDKTYL3Jy9uM4A6oQ/1gfo5T1hfRBM4UG2SRcCAxyrjZEl3cFsY8y2GAhAiFjD
         o3n6Q2vj9X8s6Jt3158YDqZPQX5AsQoWBIF8/8rJl8nixKZXSN3YDOl8tXJoXGY4yFck
         ipK3xeuhe/bd5T8N1QL0vfv7psMd9HK62Wuh7RdueKYl1FFrDTznrqblbOaCqE3JpD4y
         vOjh6FK8leNOqWR/lIftjE/kYkJUi14iREx0ZktqGU3DkMMVrplzG35KmlAtV0vHNth9
         DSNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=X2Nt6k2L4eZl/SWEw98vmqFsh/LJST5rQhrTBW6429k=;
        fh=0yGoOcaIsKuzP3Et5hOI2m48/BEN8LsmTu7oRDakEz4=;
        b=ITg+7uOns0/KNIB6nf9F3EkNm6Fn2aXTS3YsxNoSxgm06p89oSPjGPqBu8z/14xFBR
         Knk0zW021vivHJA/23PL8RcdxXZ7z54tk9TXQGstnrDQZ+vfiOfAt8nATLprCMrn6imE
         KDIkymVJ2d+8Xsmm2CGyUqQ7I2zMNGBBfUhehnmqdlzFonPaiNitSCIO9dxwxJfqY/eV
         TdMvyK/gONAxL2Gwm1U8bM7Lfmi+oL5CEdyT8ITjNiI6Zg8wj/WsJIE9aniZhsxzmFc0
         jvjvm1cIGl1OKar+Wh6TK3N/QWnB1kUQqkUS6zhqrNYj8hR3I5DIu7ZDwTU7Cbqgcmdw
         s8+g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769453849; x=1770058649; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X2Nt6k2L4eZl/SWEw98vmqFsh/LJST5rQhrTBW6429k=;
        b=ezpI9v9WGfyC3UttCg+95hthK6z7uI0SUWgET7xcVGYkB4o250kso/tpZeTskaEPhO
         1/4Pqo6XMgA2xtQFKEiVGGibg8eNXFJp0sykJO7SFoYDVuGyNu+gQkVRNzY0ZaArwor8
         u+JJmrTp4k+QEkw2YTqQ5xtY7H5+jtLYe58fi14C3MrKTxk8muS5kn2ir6y9WquYuk1u
         PhWPrf3KWcgJ1OLVAudXJL+8uTvf4+2Q7RuWGomHXfxe/7z9+o8ORVhoYhPb6iXGFZZj
         eeG9zX+mFaMrELsfIvwgkSsWH3Jk4CA7pTulU378uuGISuwxxQd8DbmL1wrKLUp0LbK1
         K6Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769453849; x=1770058649;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X2Nt6k2L4eZl/SWEw98vmqFsh/LJST5rQhrTBW6429k=;
        b=nACjdF73hKxl7Yx45TFlWn/G0o/f7j/y6Vs9kt4gLiM7fwl3oIMtk/1V7leWkB7g7A
         L+cHQ7l0nYqmUTDbvqSIdKmP8dXkwcQiWeAx6bsrqpexi4eKIJwlcstSsXzf5YHh07n9
         Iarj8sFomRmVBgvtERt4zkI4T31ou9SZO10Qmuj0vibOFwgLyFZ/0g0yB4t3N1UUFpmK
         2VZGGXGCYza7hlFwZb/+qNvTnkvyvAbSoWma5wV6vZWVlndDOf4Hcb7pltnpXiqWcFK/
         Huz6Xrq4CZNdO+w71FFXc8JSsAgKDA+O+i5c5Ccp74NvAQFu7Mc+Kzb3UPu9Y2pCPTW1
         6kTA==
X-Forwarded-Encrypted: i=1; AJvYcCUiCI1tl0iZzyg31CFfnHb9d8wqUuEAtVrnhYqtdNyflNrBfZMWijgA5ji45gqa/uXxkrv4RHkjINR4MA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzbzUy2egwtRMTq/RGO4877ZEMMXpOH4JMCdSI0H+lHnyNFxvJW
	lIC88FIoWtz5/UAgkynQJ1jqwrAf8hmgvwH77RTEx4TiZOct9rqMZNDOo04PELDZTfL4vjFf+K6
	H8TCVMaDwcqi1Gc2gNsJy5GX+frrtE7E=
X-Gm-Gg: AZuq6aJPraB1xDozqqQ+jCoJG+dqh4jVoCJ+aNV6dAT8PBCvykKV290WGdobpUqw5zs
	Ra3BcIXvc453ppBuJC7ncNUhG1xdz82Zv1JNTAPJlkeUOZyEWauR2DuRWC4BAP7kUcTOUxMDgKj
	/F2nRY7eUX4NqP6WpnM67PkVmSxw1wYTzEWnQ//zLVIJnzpW2s2crUtzq8CjpqCsD538RPNSMl+
	ACxQguza54ouLIYlerSHdB/gepMxycLLMw3dvSjyHkvVB7Y/dRkhGfKsdkQpFZcmDk+iyQ=
X-Received: by 2002:a17:907:7fa6:b0:b8a:f365:f2f4 with SMTP id
 a640c23a62f3a-b8d20b42330mr228465366b.0.1769453849055; Mon, 26 Jan 2026
 10:57:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <6ba903ad-9897-42bb-8c2d-337385cc3746@molgen.mpg.de>
 <db387081-345f-423a-a0ff-e13f3bec2d51@molgen.mpg.de> <CADVatmM_mRnkDX=hpUjbyKkZnGynxJfRSujGxm2LaWWMEL_2ew@mail.gmail.com>
 <ef9223ee-0a4e-468c-bfd0-0cf190d262f1@molgen.mpg.de> <aVgjpWaIRkerdgCa@eldamar.lan>
 <49cdd663-bcbd-48b4-ac38-77ce94ef0c8d@molgen.mpg.de> <aVj-mz8vaw53TWtX@debian>
 <aXHeLGr1n-W-Ay44@eldamar.lan>
In-Reply-To: <aXHeLGr1n-W-Ay44@eldamar.lan>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Mon, 26 Jan 2026 18:56:52 +0000
X-Gm-Features: AZwV_QhUnyzIrspUJHMl5wxPaQZIKc2UPXxov3UABxIDoJiLKH6ZmgxeZIssq8Y
Message-ID: <CADVatmNzTyUAr8UBvm6pHFsKz8xZpqUXh5NQR641JXsCWaPg8g@mail.gmail.com>
Subject: Re: BUG: kernel NULL pointer dereference, address: 0000000000000000
To: Salvatore Bonaccorso <carnil@debian.org>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, 
	Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, regressions@lists.linux.dev, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Giuseppe Sacco <eppesuig@debian.org>
Content-Type: text/plain; charset="UTF-8"

Hi Salvatore,

On Thu, 22 Jan 2026 at 09:59, Salvatore Bonaccorso <carnil@debian.org> wrote:
>
> Hi Sudip,
>
> On Sat, Jan 03, 2026 at 11:33:47AM +0000, Sudip Mukherjee wrote:
> > On Sat, Jan 03, 2026 at 12:01:19PM +0600, Paul Menzel wrote:
> > > Dear Salvatore,
> > >
> > >
> > > Thank you for the follow-up.
> > >
<snip>
>
> We had another report (https://bugs.debian.org/1126128_ but the
> problem remains here as well the reproducibilty. Uppon several reboots
> only the first one so far showed the problem and was not reproducible
> afterwards.

I was going to post the patch today but since you have asked the
reporter of the last bug to test it so lets wait for few more days.

About the problem showing on the first boot, does that mean that its
only seen on a cold boot ? and not seen on reboots (reboots without
power cycle) ?
Can it be reproduced if the system is powered-off and then powering it on ?


-- 
Regards
Sudip
