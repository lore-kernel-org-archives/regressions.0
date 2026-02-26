Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B43C37B40B
	for <regressions@lists.linux.dev>; Thu, 26 Feb 2026 21:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772140602; cv=pass; b=scNMCFyerljAt2ZFix22jWtGpS0BZ1f+j5CQCdxNEcklIHD8O9DgveQ2YLS8uWNM0iKlxkLG9vKDZi9G7lbpZgW+XVCCPcbNm3UaCXyG2CbQ7pwuu8h5OzYulhHtUVsB3tufPkZd/Fr7Ts5ZjQW24F9K2p0EbNGQVsXTvZYs9Is=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772140602; c=relaxed/simple;
	bh=aQDpDBOvpi76pzP801oVxviwM5NAy4d4k0HoUewE8RA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iPv8FLIoKGbFIU12S+byD8hXI2/wQz7ZdrVBxom7dUbyBSb3Dw+qaodAZS4+3JGZXtJthKheJnvHlJVjMcCb0clHpw1JQJL8MxKOO/K1Yj+mX9KXuSTA+Jp/nS/thow9tr+pgnxbH6IRqYgT1q2qdZM8w3F7unIc+eJvpPWx+a8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dfinity.org; spf=pass smtp.mailfrom=dfinity.org; dkim=pass (2048-bit key) header.d=dfinity.org header.i=@dfinity.org header.b=RX6S79oK; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dfinity.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dfinity.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dfinity.org header.i=@dfinity.org header.b="RX6S79oK"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-65fb991d7e7so1753080a12.1
        for <regressions@lists.linux.dev>; Thu, 26 Feb 2026 13:16:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772140596; cv=none;
        d=google.com; s=arc-20240605;
        b=Hd4EAg1cmCcDfXcdNTybyUbq1AdlSgd2lLeVZOPe9fGXPP+bRT7y4ElzVNFk7uAlib
         nWo1K5XcU6IWCgOhtVcyiB2DtYSjeUQNhZUOxDUTtb8ABqF17li1j5YrUuzirh9PBeLW
         qYLNyqqs17Uyw0naSWJhab6xUwKA242DvuRxCeVYUSYciPJkqbkDrqsvFaTROiezhTys
         IZXAJUyo0BWp7tV8K1KCzGkRQ4j5o7YIMAY9jfH6qQgK5DU7ADhqW7galhS+i1IqkOC2
         eFm6pAZCMSjhNeXi6pON3iMiUntoz/N2CaStrw7ZkxdpvS8cuXIZuvxEtJLMzgf/vXEV
         G6vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6ycYPYyZx7AmOLkJ5x4ffI/sFVR72W8M1sWNLx9umW4=;
        fh=eIhm2SvgtOWM+uRk6c2gszlbmDMEgRuRvxvlIGrwGqw=;
        b=SOUCRZ5Vv0gon1COgUOWBoS94DXK/J9EoJXwTtVCUxG1QwcxRQoclnlWPYo5mE9Unm
         eVyVAY25vxeMZfNfSQ8m2mbLIKBSDtKRuyPNXkbN8rJ4Q9d5t1zAGW9wB9bbz0R2KZs5
         wOlP7GsVrZ+rTZYK277tE/UGdaG9KpRH+go7glJXrNIWdAsulDwWS9CAK/DnNY2BTPjF
         Uj4lY4AtdFLIuA2dXK3YGmDPtr0U2kPxrSmY50PCRCVczGB2wIuOlg34F6sTWxsbHkWL
         UXeP2xrIBlcceQ4w8/WQrxX/BpGmGARcPlcn6W9Ghq7bGzohKsKZSX+SKBLeFBK4+JC9
         W9wQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dfinity.org; s=google; t=1772140596; x=1772745396; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ycYPYyZx7AmOLkJ5x4ffI/sFVR72W8M1sWNLx9umW4=;
        b=RX6S79oKyJSwHeVnp/6Ybd3H+B8lHIFBSLhgEflolEsA/v7ptRCIk1v9Uf8I86kZlQ
         7qLvfMjVj7WXMYP76ZEZHsF3Sw0iIVui0fSXPLfbBQb/8DdS0uk76271IA3NPfakbyo9
         BnNDAg5ATYLrw7vSYGWLiKaNoYmobZVMIWrh1ZOGynWX59uIxtmlQIOZ35WJzLhkCmxj
         2xQuI1fWhEmfYsqoGIiWZrqbsJfnFkej5ZIcb1g1GSWKR6JA8FEAr0bhsczbu3Z7un2Z
         xOsBEv62iuIhrl2elVdbTA1iOQ4+kIO8mgq+A5tlNO0y83dPYVSD4x56H7smZI6uZvSw
         PN4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772140596; x=1772745396;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6ycYPYyZx7AmOLkJ5x4ffI/sFVR72W8M1sWNLx9umW4=;
        b=W3pBjLT9eUYj8x/VkIRNB7a03blpgwdSn126iW12W9wp8EBY1MjASKAphgdWuP7OM0
         qxTykwCINXx4mgCFyt2CT4pM0oc5FVaUPGPfsjfKMuCo5Fv+jBs/Iy27lsMUN5RiY//B
         XRuUF4z1MMqZMkUBamYWF3lRBF22PYy1t2DNNVKMGZRsyP1N2N/dujFXtJ1JCPM70dNA
         8u3cChQFnHuwhdtRnwJ5I7jDzGPACMaUXVoGYNiPl+Ag0BsRGW8+OFeqxd4ExT30vfMd
         X0V88TWIAkvmHWILhNtXuPxxV8jlw1rrAHRdJnYx/achfXihd3oYzSgCZU2/libuftry
         GyQw==
X-Forwarded-Encrypted: i=1; AJvYcCWVL65aGNwDQd/sGJxHonENWEp/isI8+F1Bx/qR3U4ScLSoRLes69AY73xk3i+nR9OiDEv8zhp5HyEymQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwPtsRcyFKMs67HKw0GjKJfSoRxy6mHkMVNSTCKCoM5BWBY13mf
	auqAzxgIqIq/j9LiUHMIIBnR+N99aqH91XTbP1WtRMQORJXzfXne/3sBUcS+2P137RjZjNA/Qxk
	ndDUReSD4lxmmMHk0hAglxzzMsbvO7jxiQg2zWHAfgA==
X-Gm-Gg: ATEYQzxLYXYEjSGqqfJW3QTbwdjrKUhTZFWWgJILdt8BZnyDZtxRCgZtnIrE7mzBpLJ
	aTiNBdZt4hTWKyG/h1msn3vkZm8d640GKaxv9HXJgI+JwaeWEdusxHUJC8T5xHFSW7YPWpJ6Tde
	FPkx7u+qSuGdVG+IViM7gRKVSpE20bxaDs2+z56N68fZfPTu0/XuCBtPYLX2MKLVT6B+7SAwjQV
	YlStmSd0304cIZVZDTEpqlsmaHHY/R2/dl7+ji1rdLWHMNIjfY3xYMdmML323hkuWVCU/nw3raO
	DIT/gvA=
X-Received: by 2002:a05:6402:3889:b0:65c:209e:32c4 with SMTP id
 4fb4d7f45d1cf-65fdddeecfamr459737a12.20.1772140596428; Thu, 26 Feb 2026
 13:16:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKNNEtw5_kZomhkugedKMPOG-sxs5Q5OLumWJdiWXv+C9Yct0w@mail.gmail.com>
 <CB5EF1C4-6285-4EEC-ABD0-A8870E7241E8@nvidia.com> <D4BD80F5-6CA2-42E1-B826-92EACD77A3F3@nvidia.com>
In-Reply-To: <D4BD80F5-6CA2-42E1-B826-92EACD77A3F3@nvidia.com>
From: Bas van Dijk <bas@dfinity.org>
Date: Thu, 26 Feb 2026 22:16:25 +0100
X-Gm-Features: AaiRm503vB6PlOzpF1Ah8vvKRhyYi5KSR9A57eyUrg2LZOnrpgEX8RHLQIcMuBg
Message-ID: <CAKNNEtwZzt3xWh_b1pn4X4FG+cq6FLOP5rR4+G=WUsjHsJRjaA@mail.gmail.com>
Subject: Re: [External Sender] Re: [REGRESSION] madvise(MADV_REMOVE) corrupts
 pages in THP-backed MAP_SHARED memfd (bisected to 7460b470a131)
To: Zi Yan <ziy@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, regressions@lists.linux.dev, linux-mm@kvack.org, 
	linux-fsdevel@vger.kernel.org, Eero Kelly <eero.kelly@dfinity.org>, 
	Andrew Battat <andrew.battat@dfinity.org>, 
	Adam Bratschi-Kaye <adam.bratschikaye@dfinity.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 26, 2026 at 10:06=E2=80=AFPM Zi Yan <ziy@nvidia.com> wrote:
>
> On 26 Feb 2026, at 15:49, Zi Yan wrote:
>
> > On 26 Feb 2026, at 15:34, Bas van Dijk wrote:
> >
> >> #regzbot introduced: 7460b470a131f985a70302a322617121efdd7caa
> >>
> >> Hey folks,
> >>
> >> We discovered madvise(MADV_REMOVE) on a 4KiB range within a
> >> huge-page-backed MAP_SHARED memfd region corrupts nearby pages.
> >>
> >> Using the reproducible test in
> >> https://github.com/dfinity/thp-madv-remove-test this was bisected to t=
he
> >> first bad commit:
> >>
> >> commit 7460b470a131f985a70302a322617121efdd7caa
> >> Author: Zi Yan <ziy@nvidia.com>
> >> Date:   Fri Mar 7 12:40:00 2025 -0500
> >>
> >>     mm/truncate: use folio_split() in truncate operation
> >>
> >> v7.0-rc1 still has the regression.
> >>
> >> The repo mentioned above explains how to reproduce the regression and
> >> contains the necessary logs of failed runs on 7460b470a131 and v7.0-rc=
1, as
> >> well as a successful run on its parent 4b94c18d1519.
> >
> > Thanks for the report. I will look into it.
>
> Can you also share your kernel config file? I just ran the reproducer and
> could not trigger the corruption.

Sure, I just ran `nix build
.#linux_6_14_first_bad_7460b470a131.configfile -o kernel.config` which
produced:

https://github.com/dfinity/thp-madv-remove-test/blob/master/kernel.config
