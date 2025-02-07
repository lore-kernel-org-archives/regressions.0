Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35461547F8
	for <regressions@lists.linux.dev>; Fri,  7 Feb 2025 10:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738925004; cv=none; b=GsJFWPuensxNADwrlrBGnP+UQSlCb3ZPJJC2WI6tBMYSC/O5kodk/TxJkZiEqMJIUg96sJbIX8ABI3gu7gxpfRz/0zJbVJCnQ9GGda5Ck4gc53ZMPEDSP2p245FoxXrv2Wbx2gVe1Sdr2c1tQC7z6MgJQkTNoffMlHUw6lKsauI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738925004; c=relaxed/simple;
	bh=Owr0YKtHdkqN7+hjoDD8i2kaaYELxg9xOxfJ6jW9Nv4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lhteeB8KjRNuULhIzyhFaKZPNhgS3truyqbh9ZYy24waP9YqaEdh8YQm9SqWHNxDG7KrKn84YkUXDMFmwTPwpIXBnlYFtNmVGwHD7UvmMh73YvKT3arn3MMIw9/Yp3s0LixZLYVOcSQg8gi0aBp98lqG/RQfdGwnzRKnt3KAJEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=bR9Xz6fY; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="bR9Xz6fY"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-46fd4bf03cbso29009401cf.0
        for <regressions@lists.linux.dev>; Fri, 07 Feb 2025 02:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1738925001; x=1739529801; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Owr0YKtHdkqN7+hjoDD8i2kaaYELxg9xOxfJ6jW9Nv4=;
        b=bR9Xz6fY4PAu7OOLg2f0MYf8JZJkl8JZ3pJ5owNDXZ6KrpI//OYpZbQYjIgu5F1zlS
         aYPHiCnmhZEG2HH0Uapz0dBc03yXvl3YnXbL656mXPHKi3sSpj/ZBXTlKEfPd10w/e3K
         Eb3AzLSlZFLiw5syFjW2oCub/8OK0Y91JzOK0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738925001; x=1739529801;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Owr0YKtHdkqN7+hjoDD8i2kaaYELxg9xOxfJ6jW9Nv4=;
        b=h9koUz5ldkzbseR/WgB/9+ukc8yVsEzGz3sS1zxLJ+dV37hCS051S6Cl4CbydVyKty
         5k8zlLYOWPKuzztsy7Te3yLEcPYWe4EV/gt4M/WKW+pqOxSguFxosWiCxt9ztP4Antiw
         6GFvCVQO/aL65cinsoj0J9nWnlSE+b5Jpk6kNwIlEwK2CD0i1k0MKIoTcDlf+wchDSVT
         EvV7vzlMsYa/MgbAW918UBcPMxTHPDAmh0UMMseU6Zhc7f0zsgIKdFagtIhHNZR4UJQc
         BPm9H8Bnc4gHGNu0C2le2R6M8BGSehlXl7HBOrZd6yKtcgc/ww8UpnK5D8DvVDP4ySC5
         lqYg==
X-Forwarded-Encrypted: i=1; AJvYcCVX6b8lignrnEs5LEzSgdsWFX6RIxLjW7nQPUpSIN50cUp+rLwGyMFvQ4/7s48eZFybqGyw0pbSyglPeQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7LlWlUoIdv5p23GEDB0ogXqVTvZC/BVgrd/LmUngSuDwQpGXl
	uLYVG3OX5N4UrcjFdu2vcF/YPuDtlOSgWkJTYCOWZUUAZGyFqRVYvN3YsxOQ+Tag17kScOS8amA
	mD2d5wgtqa4qWvxfXju0qzdPWzskFM33exXQRsA==
X-Gm-Gg: ASbGnct8EL/0M4FqYA/E+vBPlybDHU3QT7v8sUBzSwsuD+P5EJG2KfZk8FPrZqn1HLy
	dKfJYQk2GBfgLTmRXu34DLRaGsazE1WWyLrETvdmYJrom1XZhwPGnwlD4yVxbrvJZQLsQ+Q==
X-Google-Smtp-Source: AGHT+IGkFRBaRLP1f7W9gqHW6Q2AKQLytp/hmZC95VfJ6xO6/ON3OM06vkit9Bhnsvf31fWFt29Royhe6fq1H0cZIa8=
X-Received: by 2002:a05:622a:4887:b0:467:6486:beea with SMTP id
 d75a77b69052e-47167ae4440mr41388981cf.38.1738925001678; Fri, 07 Feb 2025
 02:43:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <2f681f48-00f5-4e09-8431-2b3dbfaa881e@heusel.eu>
 <CAJfpegtaTET+R7Tc1MozTQWmYfgsRp6Bzc=HKonO=Uq1h6Nzgw@mail.gmail.com>
 <Z6XWVU6ZTCIl3jnc@casper.infradead.org> <03eb13ad-03a2-4982-9545-0a5506e043d0@suse.cz>
In-Reply-To: <03eb13ad-03a2-4982-9545-0a5506e043d0@suse.cz>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Fri, 7 Feb 2025 11:43:11 +0100
X-Gm-Features: AWEUYZlIBtfn2RHJWB88UL-DRtlyctc8WdFktH0eXJTCByl5CkmXjOsWS504hvk
Message-ID: <CAJfpegtvy0N8dNK-jY1W-LX=TyGQxQTxHkgNJjFbWADUmzb6xA@mail.gmail.com>
Subject: Re: [REGRESSION][BISECTED] Crash with Bad page state for FUSE/Flatpak
 related applications since v6.13
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Matthew Wilcox <willy@infradead.org>, Christian Heusel <christian@heusel.eu>, 
	Josef Bacik <josef@toxicpanda.com>, Miklos Szeredi <mszeredi@redhat.com>, regressions@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	Joanne Koong <joannelkoong@gmail.com>, linux-mm <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 7 Feb 2025 at 11:25, Vlastimil Babka <vbabka@suse.cz> wrote:

> Could be a use-after free of the page, which sets PG_lru again. The list
> corruptions in __rmqueue_pcplist also suggest some page manipulation after
> free. The -1 refcount suggests somebody was using the page while it was
> freed due to refcount dropping to 0 and then did a put_page()?

Can you suggest any debug options that could help pinpoint the offender?

Thanks,
Miklos
