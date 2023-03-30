Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962176FB1
	for <regressions@lists.linux.dev>; Thu, 30 Mar 2023 14:39:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23283C4339C
	for <regressions@lists.linux.dev>; Thu, 30 Mar 2023 14:39:21 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="kaMd4Plw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1680187158;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ay2zwlz3DTkBGmbYX0afOIkpNwyv8Ms2Z8LFn9fSDYk=;
	b=kaMd4PlwRe7GAGaCLLUq/J6RCOJ6aY3R5k4W4nrDioMwcRnSqECWkNklw+Emoq1yIuBVmO
	0xzabgYZaE1uxmz3hP0ujGhNIWoEO8gpTQ7sVWiPnEyp6JtJtiqshOauou7Sw1EL+O1VXE
	vS4rVNVGEr9ZuiCLfd6MwW+x/hxnkKU=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b9bee01f (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <regressions@lists.linux.dev>;
	Thu, 30 Mar 2023 14:39:18 +0000 (UTC)
Received: by mail-vs1-f49.google.com with SMTP id cu36so16421072vsb.7
        for <regressions@lists.linux.dev>; Thu, 30 Mar 2023 07:39:18 -0700 (PDT)
X-Gm-Message-State: AAQBX9cvAtSrftr8iC1S15Q5MZkcPQuReZiHsFooMyVdWULcoztYpfWw
	0WhMzwKQJNDFR8Dv1O4SAkUJihkV1TF2BPSBNSI=
X-Google-Smtp-Source: AKy350ZYFYLgBJitIkT69kIPy8rdMO4raIXi6bXUVJ9CFzfKxZXNmmd7qo0exZmSwsLX9Yw6cKfU+jHEm3N9r6eDdsY=
X-Received: by 2002:a67:e18e:0:b0:425:bbc6:aa64 with SMTP id
 e14-20020a67e18e000000b00425bbc6aa64mr12813599vsl.5.1680187157665; Thu, 30
 Mar 2023 07:39:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CQZ7HWJCK18F.1AUR9FMHKPOXB@crawfs>
In-Reply-To: <CQZ7HWJCK18F.1AUR9FMHKPOXB@crawfs>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 30 Mar 2023 16:39:06 +0200
X-Gmail-Original-Message-ID: <CAHmME9qi=26zP-A14pLVxtL86Zj1P-+i93t=_BnSd0t1Dj_U8A@mail.gmail.com>
Message-ID: <CAHmME9qi=26zP-A14pLVxtL86Zj1P-+i93t=_BnSd0t1Dj_U8A@mail.gmail.com>
Subject: Re: Possible regression between 5.18.2 and 6.2.1
To: Dan Crawford <dnlcrwfrd@gmail.com>
Cc: wireguard@lists.zx2c4.com, 
	Linux regressions mailing list <regressions@lists.linux.dev>, Thorsten Leemhuis <regressions@leemhuis.info>
Content-Type: text/plain; charset="UTF-8"

Hi Dan,

Hard to imagine that this is a WireGuard bug, but more likely
something having to do with SNAT or something.

What is the unallowed src IP when you get that error? Can you debug
further? Maybe bisect a bit? Otherwise, not much I can do.

The diff between those versions you listed is pretty minimal, so I
suspect your bug is elsewhere.

Jason
