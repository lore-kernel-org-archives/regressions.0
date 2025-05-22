Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6FF23507D
	for <regressions@lists.linux.dev>; Thu, 22 May 2025 08:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747903580; cv=none; b=U9TcHjNRtL2yHMPRF7/VKqCoMN74wii7JREVOB1MHuCT4e0dXkcyXWthyj+EQ+krsFKRNNsJuZl+P2P4aYSZGkLfhfelPZ7J3Kk5zAOdIXHULAxQfliJCFUGWOAEO0km5MOY32JDPTRzNgnmbzphMrXAQlIjS2QeUbVAh3btvgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747903580; c=relaxed/simple;
	bh=bBxJ2jI2C//1oSmc8MnMiFtY8i7Qaz8dXwp/CgG/dTA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OqHHnnlrScxJ60iH/4K+D9DmiynyBPvVJS/FhbpAsjRlAiu7ttUcFQVGgRs4EWsX21Oje2/qDFUNFWpJgk7/OSwEEsPvMqrvyHxmdRdsqBFVEMQYcFAT1R3xPhAYlHTiD0Yq1STJOapkWKjOp53ag1/HDlMrayP3MnEp0mLkdVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fvk+OqI0; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fvk+OqI0"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-30e7ee5fe74so1244784a91.3
        for <regressions@lists.linux.dev>; Thu, 22 May 2025 01:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747903577; x=1748508377; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bBxJ2jI2C//1oSmc8MnMiFtY8i7Qaz8dXwp/CgG/dTA=;
        b=Fvk+OqI00Nmh116+CcPuRS4+GgxvDwIGziDEPhuDxMhLi9CP/WqSOkmZuOgDKKbO/H
         jpnUCC3K4XtpKU4vo1whL38vTousw02AV+v3Rq4ryngsotqfFFDTMaKOPDw9XYNAhdK1
         sScm9iNgZ8e+Wlae/U2hBTjj+we5ea0ygZHUFZja5Rp5h8b9Y6nLmanAwLQTm6975Tj6
         J2RPNdh3Nsms8kjo2PlaOzweWfPVQmi94DnojZFyM1bkunl3ljj3As6R+RjMP6iAdouv
         +A7IpWIm9BYRym7pXv5Qn+9K6vdSIxorezwjQkOZBl7VKueCC7p9Y/3IFHCOTOMPeMH6
         jAqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747903577; x=1748508377;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bBxJ2jI2C//1oSmc8MnMiFtY8i7Qaz8dXwp/CgG/dTA=;
        b=VbVGTikuJ9AtBWPwycvCCHS6lAMNyULCE+X1tezPWyyiDsYdniZ9c/LOXcx4e0z+rM
         rm6+ha4KF4vNwu8t6oeb+skTu8VB95zLs7CCcf+vf544tMBMQNC8HzqZ6NKCqUWkrnIw
         1YlcSzKlHputiuq08GhRvq83Waq46oNLwLx5FOxpB1qtYCMTBUB3IzlRi9+olqOyLb6M
         n37RVukcIidcDFMczeBD9g/tKiOhhy+oILjetd2gBtQxf2F0KUoMMeINv18/Khishnto
         TC+xFtC8POIp6aZf+4XzlLGCV1uGrcBXQ2Xmf8YyE/iXTa5CUKnaJHs9FzOCfBZduwjM
         sxqw==
X-Forwarded-Encrypted: i=1; AJvYcCVzvHfgHeXIa2z3YSoau+WWIJC2rvrc664Oc3pcDXSXPXf3rfHGkOa0lMsptCB2VhEvEzb+4hmhqQWxMQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyIYkiHMFz+0VAFD9yS4dkNvwIAemGoyZGEHNOgE8pPba2OqO/b
	dYS3ECUt+bUsRRiclCRWFjou/uRdmAJ2k2JzS4bTjgQF5KtXXyCOQpwwLGQdK364Uqv6W9L36vZ
	BtNpMZ1rb3otCGcDiJ3Y9c9h/COTuh+k=
X-Gm-Gg: ASbGncv65ot0UW6V26R281mNtmnCbol+hmY+BqWulP3ngIQRBZKkF+vkl4wZH3gA8IG
	WVstxTnPYA+eB3FOwEUE/B4MMO+x7CEOvwxyPnUybgqtEPQpcbxyQu0vaVi4PMIZBH2E5pcfAMS
	AV5hl9Z8nsSeNd27FBaW6/gnvsNtKoGfUdvbyMAYNPDEk=
X-Google-Smtp-Source: AGHT+IFEUErAXQrqjBBPl5uNIbn+/slSrj+fuj4AS1Y2QFurbevf52b9yENWRIYvRaV5fLdSL2wU0HUdEbeZghGIoAU=
X-Received: by 2002:a17:903:41d0:b0:224:1005:7281 with SMTP id
 d9443c01a7336-231d43c3d88mr121249505ad.7.1747903576940; Thu, 22 May 2025
 01:46:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250520-rust-mno-fdpic-arm-fix-v1-1-44e77fe6b2a1@gmail.com>
 <CANiq72nUFqM7mnpSGZF65n3Aak37KVVSa0d830o31EuZyh+OfA@mail.gmail.com>
 <d6515a2d-7986-4b53-a655-869d568d4081@gmail.com> <CANiq72nDCfoy2v-VbMR9ntNbTt=3JoYsVhz_gqX=Q=4iWN1YCw@mail.gmail.com>
 <CA+G9fYtM-s0cgS39wX9Go_OAXxYa4nME6h8CbhyK_-QrRvQk5w@mail.gmail.com>
In-Reply-To: <CA+G9fYtM-s0cgS39wX9Go_OAXxYa4nME6h8CbhyK_-QrRvQk5w@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 22 May 2025 10:46:04 +0200
X-Gm-Features: AX0GCFvUWLoHcftNnHHcnXk02qKWEmZlVswhSl88DhaF-XC_13tHObndO2efYGw
Message-ID: <CANiq72=bdckmehoqoEfpTespZPaTCVDsGSwkEd2fgd5kT70S4w@mail.gmail.com>
Subject: Re: [PATCH] arm: Fix rustgcc unknown argument '-mno-fdpic'
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: Rudraksha Gupta <guptarud@gmail.com>, torvalds@linux-foundation.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Ben Wolsieffer <ben.wolsieffer@hefring.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Christian Schrrefl <chrisi.schrefl@gmail.com>, 
	Russell King <rmk+kernel@armlinux.org.uk>, Ard Biesheuvel <ardb@kernel.org>, anders.roxell@linaro.org, 
	arnd@arndb.de, dan.carpenter@linaro.org, laura.nao@collabora.com, 
	lkft-triage@lists.linaro.org, regressions@lists.linux.dev, 
	Nick Clifton <nickc@redhat.com>, Richard Earnshaw <richard.earnshaw@arm.com>, 
	Ramana Radhakrishnan <ramanara@nvidia.com>, Linux Kernel Functional Testing <lkft@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 10:35=E2=80=AFAM Naresh Kamboju
<naresh.kamboju@linaro.org> wrote:
>
> [I was off and travelling]
>
> Hi Miguel,
>
> Please accept this patch from Rudraksha.
>
> Acked-by: Naresh Kamboju <naresh.kamboju@linaro.org>

Thanks Naresh! Will do.

Cheers,
Miguel
