Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17B3431E76
	for <regressions@lists.linux.dev>; Mon, 17 Aug 2026 13:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786972590; cv=pass; b=kVpmRP2ssyJgdTJljoCmI5cCQho1um8cXE3UNvMU0TQv9lE1Rpp0FPDPtkq5bYRhxBaFmYa7znH2muG3Xeu304tv4MCpGube7pG6kxqKdUWWsYYEvRoiFntPt7/4xOkOB1IXQPcXAyX87XIKsQjbnD6r5AVEr2TIIGUNuw/YJCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786972590; c=relaxed/simple;
	bh=shZn/QdVM/HwuzkF8TqQ8kXOnlsdSL/uGpdvGQQTt0Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YrhPHq6ap0JgBNX/r/uetgkAoU1lDwmUs6Xrvkf+qpUd5GA0X2F+YHVQ/Xibe7lrobjoiuf+YYRjyvxH2De3IleUAjjbWiY54Eu7aSG27DVL7Xg8BysVMWEMV/UYD0RReQcEIoAgU5Rlpk0Vt5P1N49hf9OH0GhuMIG3f6zoFXo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fu7c8Vq+; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fu7c8Vq+"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ce7d2adef4so57129845ad.3
        for <regressions@lists.linux.dev>; Mon, 17 Aug 2026 06:16:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786972588; cv=none;
        d=google.com; s=arc-20260327;
        b=eN10Rwo24EX1oldWAtc88+gELxGjjHhaAQ50SdTaQEMB4r2oNsWIWTNWrSSZXfxYxw
         AHhzkn2sGwPYBqi7GL45FO/3/u/awB8OHEccxdd4jZgBiF/6FpPiW6Sl7zrOzz1jumuB
         XHZopVKytkI6S7KQVjPyZOZ/bMRXu4EgMeKPef8/OkXW/Bw3kWev6uf1ts3nLw6djEOL
         PXOcxSKY5kfYktRyNDckoGz6ySqk6IiE/vTcpoWWCOSS2AMaUz3d40ZnuQOz6d/uefyw
         V+Cw+xatWc56WkXQ0PNyib37DR2SCUxErAmFIPjrvDlwy2FOjNImoXCQc6ntLhNxnPXh
         cHuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=shZn/QdVM/HwuzkF8TqQ8kXOnlsdSL/uGpdvGQQTt0Q=;
        fh=9QEP8/C5dEtTGRh0fBXfM5MkqkEdBdZ4joc9jdDQxkw=;
        b=T9NJHQbs9U37FsIIXLlAFjQftaHMrBORrEhIf+FX8I03LDVy2WC7htBUvKhbJf7jtK
         s6Z6uWo4AoJ+0H37BgdNbly2uPDjmQHvi8TaF+lq/ieAH8T/9aXulhSYCJd6PXMPPjkg
         GExuOXyXhAKfmmwOUw/Tc9y9fWKz2BsTaE3KGnXrXttKfiDDMkfbrLxGAAuFHY8SSMVi
         I33beQkwMVqGzArbo1Bk7kRxqBx2m33QP0zj9aZB8xRWmO4YaaQQVkHnN2qaXeuNXgDQ
         fFjUQYYq+k/hrJBKreWD7lWnFF+hyuT+O5sklrFaYCOBcs5ZxulRdehu6+bYp2bjTPes
         N5AA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786972588; x=1787577388; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=shZn/QdVM/HwuzkF8TqQ8kXOnlsdSL/uGpdvGQQTt0Q=;
        b=Fu7c8Vq+7jkD9iocVEun0+93rfDAIxsdUycXVBwyQqofUMs7NTRM8VSw1Md7XQ1Qhq
         GzegVDFGpNjBleRi1SgZklCl20RFenrlawi3asDD+RNTGwZpk2lT6XNnHxTw5WzlO003
         Lq1RQxW2x+uhozSGADnq2M6+6f6BlXczOQ8rTyUErDJhU7IA9nC7t0YztlkflDgBMNrd
         WABLPFaX+tbxJBdM5VXcY/qEH0HYlFAQDZqPAKv7aZcRc/6Vp1bbkClFhKt1V88XvFuB
         4MI5ziZndkaONnNmQSP+j6AUXHYXCTC/HZpu8faayr2+eSUB9r3zulluXa07NtvOO+lA
         ey8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786972588; x=1787577388;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=shZn/QdVM/HwuzkF8TqQ8kXOnlsdSL/uGpdvGQQTt0Q=;
        b=d+D2q+Zo0x9rJQ0mmbq2s0yHAYnFNZgWAAlFU4WNck9okP/Y5aNz8OFQEXmTT2M47f
         6ISZ9+ZUeYYbb5WwkNavk7ZbDN6eY/qsTtSIrYFrPVrrFDG0c0BnTJYu3p+VE3iF+XVl
         52r4Cc1AnL45uxHx1iDvMcXsXt+S500PTFNKGivJsTza+ucyZB5h6L0PfEmkFNUXWr/M
         RWkfCUAjwp+uS30c9KtGDb4SP+jkSkGYpkTttcaqX+egMGDZj+ogOmw/e4CbvUiXEip0
         ajUzQ6RMRePbXaVhImqZFHC/HtXPV/6nyHSPTKT13fybZEFLcpfKsH1vPG7G6M7QMPGF
         r2fQ==
X-Forwarded-Encrypted: i=1; AHgh+RqZOOwObWE7d3fKJ9IgYJ3dcqF1wNZH73lolwi9O+B1NtM43mUl/D0W0G4hRaQiE/r9sF+7Y85XQHhqAg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8K+SMfwVHnXgxu2R0SolR9WUAZJwzGqTBD1VyejnqSaOxMFA6
	CEUj2y7wMJcd+7jYEEAPVxFscXvyjdPtBvUyqri9QOO3w/P4EXmEoxJuoK4etuGzVKxkSaMqt97
	G9vv5YeaZR6OR7CwkFCf2Q6dPXJMhLdY=
X-Gm-Gg: AR+sD13eDsfuQfOVb3EjpfHr6DAVdlTzu+x8ThlUyW3q63oUhW0tUgcFBUV+mm9FUlz
	LK3bxPLM1D2xVFTnCJ0MyFGKSbQv7nGftUlPi2TOt/2ECiiy8oaniZcY6MXnAcBal5mCQxej3hb
	OrHPyaWzWq7rLD9pNnyHg/aAxYIilx45b74nHcfjbBO+q7M9pbEHo0etYEYrb4RjNIFXYcpuWu1
	ahOXjHxfYVFGyLL2Jk9wX6j3lc3OtTaYkb4JGXdj5mb7A/aeaH+pHHK+ikeHf2kXjMV6OGcc5Q0
	VxL+ykWi+a7PN+qNEz7M7uEpTs//ZSt8CH2gLEnChCCEriVSWd8a59/TLgHgIfDKV5bcp2eYUjI
	EdXTUYdpu3aXKYJl7Hh0f4qKSGqvNSi+SHneYvB6owxzPFHK0us53/M4kgT/yey6EHX+k55nXcu
	pUEfBTEwfZuRrQW8/JIU09jt7jA1wqhbKCxrLO1jCJ1BtqNTXDko0=
X-Received: by 2002:a17:903:2303:b0:2cf:84bb:1ebc with SMTP id
 d9443c01a7336-2d3b0c5db18mr277141995ad.15.1786972588243; Mon, 17 Aug 2026
 06:16:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABHf4aQC__rWLKUJ5XgkCEdzC0dr1TGH1WP=UxOu3JmmU9VjLw@mail.gmail.com>
 <c37c2d2f7f77f488867e278e412a92cc0e7ad851@intel.com> <61d9c006-aeca-47a6-8863-eed92f15ebea@leemhuis.info>
In-Reply-To: <61d9c006-aeca-47a6-8863-eed92f15ebea@leemhuis.info>
From: Luna Jernberg <droidbittin@gmail.com>
Date: Mon, 17 Aug 2026 15:16:14 +0200
X-Gm-Features: AcwNN1UaQ-p5PZB9_ytyorEEY2UmlN496Ynqr2adHZEtLQdMz8eLOIpt9bmw4LM
Message-ID: <CADo9pHhnajqPJi+7o5MK=8_RXTrqUuGJ54cO1B14F-0m7FQ5WA@mail.gmail.com>
Subject: Re: [REGRESSION] Dell Latitude 7390 Intel UHD Graphics 620 display
 becomes extremely dim after kernel 7.x upgrade
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: nomorsukses@gmail.com, regressions@lists.linux.dev, 
	Jani Nikula <jani.nikula@linux.intel.com>, intel-gfx@lists.freedesktop.org, 
	Suraj Kandpal <suraj.kandpal@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Not sure if this is the same bug that i found a couple of weeks ago in
April, if so it should be fixed with 7.1

Den m=C3=A5n 17 aug. 2026 kl 15:14 skrev Thorsten Leemhuis
<regressions@leemhuis.info>:
>
> On 8/17/26 14:55, Jani Nikula wrote:
> > On Thu, 06 Aug 2026, "nomorsukses@gmail.com" <nomorsukses@gmail.com> wr=
ote:
> >> I would like to report a possible kernel regression affecting the
> >> internal display brightness on my Dell Latitude 7390.
> >
> > Please file a bug as described at [1].
> >
> > [1] https://drm.pages.freedesktop.org/intel-docs/how-to-file-i915-bugs.=
html
> Before doing so you might want to try 7.2 vanilla, as there was a
> backlight bug affecting that machine that was fixed long ago:
> https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16015
>
> Maybe Ubuntu just never picked up the fix. So if 7.2 works, you need to
> report it to them.
>
> Ciao, Thorsten
