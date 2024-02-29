Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15BD460DFD
	for <regressions@lists.linux.dev>; Thu, 29 Feb 2024 09:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709199690; cv=none; b=sMxTS8pHK6sxl443dWrCQkBKgIJBSp/yCKFhlu+amKu5GbEICEu6MF7gOaJGkbCu86u8DQPb5skMSaRypNhTl8iNAWbCfNEFH+2gJh4JK+pXxseOm/EhBjm42wGz6RNbJVDOcpW1Ym3qY08Yi8rTj73p+529NADqZOFRum484Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709199690; c=relaxed/simple;
	bh=9PDCV/8fUy/F52NLTEXm+q3B0bNu13FfYnbqMHToU+M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A3N0w/R3CmSgDj5yRH/adXfgKik/OT+ywht+iBz0WPgREMMZftcvHMeTfpybbPGdFFv6T0LS5Wjw4f+JA5Sd9g3REjH4XsldPGQQBhoPPU8J0qXb7Pi0hMP0NM9XcoJHe9BFWF6axLx1JLmVLnpB0NKeFqjrvevrsc/p/F5wOrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BkM305O/; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BkM305O/"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-69015081b65so1368836d6.0
        for <regressions@lists.linux.dev>; Thu, 29 Feb 2024 01:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709199688; x=1709804488; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9PDCV/8fUy/F52NLTEXm+q3B0bNu13FfYnbqMHToU+M=;
        b=BkM305O/FBRI76aE1lpVTN5dkBiGMngtP/k5HNfLaJo1/bYw6xqjmXHYu/cUeDxpkd
         gCk+rLGHtm1AvWhI7A4k/V+24Va5uEzKc8TOtkh+vI7f873DewqspNvdTDikg4zS1H0j
         Xs5P1G0aBtmO4Ee717cZ3EK7jAEhwcwh3Au4+jSeH7yeRYMrHlFhpud2QM5LikrQmBlp
         NIJ7ZrrdR5Byr433w3U1UHu2izPs9GcGRC203ul9ssUNb0SNPvZ206aBPMdjX/Dlej/D
         Uxd8w8daQjf09z963vkjc+j5w900T17WUsiJ59SAUxncYDW+qJQU42H6PkWn5RAS3gZk
         nUOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709199688; x=1709804488;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9PDCV/8fUy/F52NLTEXm+q3B0bNu13FfYnbqMHToU+M=;
        b=vGHHntfb+Pvu8AY+7DDuBzv9HpaRKUVttQmowmdcvgk8BekA9vqHHv11LC+Lz0dskf
         WHTmMk1nlQm3iaNkxclJiCMggbNTMQYG4QlHIxqdg8ApqGWGBOJbGtZOQ3I5A/fgiij0
         FiMdRyqTUn/RJYMIKOSfU4ABIqYDAvojUOnJakmqvwjZN6EJ+qojJSyGml5au3CrKZMq
         YsxzIKciVOXaRNOWdx8T36xHWhOvpev/1oZGrqXBchYgg57b7mjVkxXonwPaMMUO3iJa
         ouIVyuf4bJ3m12Ltt9Dp1UNovtltMkxwj3z6rwy0knWBqugaSphCg/ulT8/P7mB2cxBo
         C6iA==
X-Forwarded-Encrypted: i=1; AJvYcCW0ywbMsVq4ygXtUdqkgetcw/TfacS5NfDcibcedbX3HDJhihxiyshbuNS0l/+ARg8Cr27nOFScZScyKlRjmM+rjDdAOzS6x50FKVE=
X-Gm-Message-State: AOJu0YwkEaI+HmWKO2JKwiF+7Fh0smO4OpMvgLgK4vemqkVTG4/fU92x
	nCd3171qK1SO6dRkSK20yWBu8eIHIhrjX9AbjBORVAuLCq8uMIQ4QwwOUYfvNqiZf/ryb4nm6aX
	3aJjJkR99K5cEyM/eetTUBeEd2Rw=
X-Google-Smtp-Source: AGHT+IEpCqJchuzt4ZrrtkL5VqWHMo2IqI4G008f5KoIJLRebFaws+E4nICSMPOejPHN06gVklGvoH9c8XrDbS+T8NU=
X-Received: by 2002:a05:6214:27c6:b0:68f:6000:6ac5 with SMTP id
 ge6-20020a05621427c600b0068f60006ac5mr1570280qvb.4.1709199687911; Thu, 29 Feb
 2024 01:41:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABXGCsNnUfCCYVSb_-j-a-cAdONu1r6Fe8p2OtQ5op_wskOfpw@mail.gmail.com>
 <e7b96819-edf7-1f9f-7b01-e2e805c99b33@linux.intel.com> <CABXGCsPjW_Gr4fGBzYSkr_4tsn0fvuT72G-YJYXcb1a4kX=CQw@mail.gmail.com>
 <2d87509a-1515-520c-4b9e-bba4cd4fa2c6@linux.intel.com> <CABXGCsPdXqRG6v97KDGy+o59xc3ayaq3rLj267veC7YcKVp8ww@mail.gmail.com>
 <1126ed0a-bfc1-a752-1b5e-f1339d7a8aa5@linux.intel.com> <CABXGCsN5_O3iKDOyYxtsGTGDA6fw4962CjzXLSnOK3rscELq+Q@mail.gmail.com>
 <a026ecd8-6fba-017d-d673-0d0759a37ed8@linux.intel.com> <CABXGCsOgy8H4GGcNU1jRE+SzRqwnPeNuy_3xBukjwB-bPxeZrQ@mail.gmail.com>
 <CABXGCsOd=E428ixUOw+msRpnaubgx5-cVU7TDXwRUCdrM5Oicw@mail.gmail.com>
 <34d7ab1b-ab12-489d-a480-5e6ccc41bfc3@infradead.org> <10487018-49b8-4b27-98a1-07cee732290d@infradead.org>
 <4f34b6a8-4415-6ea4-8090-262847d606c6@linux.intel.com> <3ea25443-1275-4c67-90e0-b637212d32b5@leemhuis.info>
 <1e719367-01ae-565a-2199-0ff7e260422b@linux.intel.com> <410817b8-1cf9-4285-b20b-f1fa0513cee8@leemhuis.info>
 <acc2b877-4b42-fd4d-867b-603dae95d09d@linux.intel.com> <87r0gz9jxp.ffs@tglx>
 <098670097a6fd59f3e254c5294882f3fa12e3c65.camel@gmail.com>
 <87y1b595y0.ffs@tglx> <960fd112b294a902e1bea1fdd8e04a708a05cf45.camel@gmail.com>
In-Reply-To: <960fd112b294a902e1bea1fdd8e04a708a05cf45.camel@gmail.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Thu, 29 Feb 2024 14:41:16 +0500
Message-ID: <CABXGCsOUzbgrTHVDHkepcxK15HBRXYLq2S0ohkCXRF347fUuJA@mail.gmail.com>
Subject: Re: This is the fourth time I've tried to find what led to the
 regression of outgoing network speed and each time I find the merge commit 8c94ccc7cd691472461448f98e2372c75849406c
To: Thomas Gleixner <tglx@linutronix.de>, Mathias Nyman <mathias.nyman@linux.intel.com>, 
	Linux regressions mailing list <regressions@lists.linux.dev>
Cc: "Christian A. Ehrhardt" <lk@c--e.de>, niklas.neronin@linux.intel.com, 
	Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>, 
	linux-usb@vger.kernel.org, x86@kernel.org, netdev@vger.kernel.org, 
	Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2024 at 11:03=E2=80=AFPM <mikhail.v.gavrilov@gmail.com> wro=
te:
>
> On Tue, 2024-02-27 at 18:23 +0100, Thomas Gleixner wrote:
> > If we want to understand why CPU0 is problematic, then you need to
> > use tracing to capture what's going on on CPU0 vs. other CPUs.
>
> I am not hear what kind of profiler software you prefer.
> I famous with sysprof and attach here captures for both cases CPU0 vs
> CPU23. I hope this helps clear things up.
>

Sorry for the noise.
Because I am unsure whether you received or not my previous message
with captures.
I upload them to the mega file exchange server and share links below.
capture CPU0: https://mega.nz/file/Ik5XiZAS#Hra7Xtzplp8xcHYFj4JXnpp8T-0UA0n=
hNSIJJLEcSBk
capture CPU23: https://mega.nz/file/swg0CQ4C#PvGv_WXmtnATD7tNun5xz-lfA5GGqA=
-KOv1ZbVRJ_lI

--=20
Best Regards,
Mike Gavrilov.
