Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4ECED4
	for <regressions@lists.linux.dev>; Mon, 19 Sep 2022 09:15:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54247C433B5
	for <regressions@lists.linux.dev>; Mon, 19 Sep 2022 09:15:35 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="IFsPslV8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1663578930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B4GNXlutcVJv+lzFkU+fXLn2WjBirheENfIaXdm+UOc=;
	b=IFsPslV8VOM/JYzC6RpT35FR0vF4u7CXL3EhBCTCLqsBn2fqCyZ/flACrmpGIv7Rb1iebL
	GUfUoz3xKvpSXhscqXgroMK09B9gQf0DEYWBQ6fL7HHTpERVxpaNmmNGHEUK1N9IfoUOB9
	9il14Dwe1n4jABvndprBbXDdTquDey4=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4a692b7f (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <regressions@lists.linux.dev>;
	Mon, 19 Sep 2022 09:15:30 +0000 (UTC)
Received: by mail-vs1-f54.google.com with SMTP id k2so29205647vsk.8
        for <regressions@lists.linux.dev>; Mon, 19 Sep 2022 02:15:30 -0700 (PDT)
X-Gm-Message-State: ACrzQf1ZLS+fQXEU7mMmJiz+2q3yu19ktwt8kvuLLwRRbNNABp3SceN7
	Gs36wYcLqNF9F4ZLFGjWMe3KgJN5IufbEPCOpiM=
X-Google-Smtp-Source: AMsMyM66EqAG4i9aY3Rht4pK16ziCNKhRlhjbO5eGIR14yQ9uVLz95OO0NaO7s4+u32astKtFEk9SCyaSsgq4waO4C4=
X-Received: by 2002:a67:e401:0:b0:398:89f1:492f with SMTP id
 d1-20020a67e401000000b0039889f1492fmr6264056vsf.21.1663578929003; Mon, 19 Sep
 2022 02:15:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <4deaa04b-f103-9cc4-7946-9ea69afd94d0@leemhuis.info>
In-Reply-To: <4deaa04b-f103-9cc4-7946-9ea69afd94d0@leemhuis.info>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 19 Sep 2022 10:15:16 +0100
X-Gmail-Original-Message-ID: <CAHmME9pVCgY7kD9C=N77cYnwk89ryeZh+UWTUs660VgVQ0AaRQ@mail.gmail.com>
Message-ID: <CAHmME9pVCgY7kD9C=N77cYnwk89ryeZh+UWTUs660VgVQ0AaRQ@mail.gmail.com>
Subject: Re: [REGESSION] Bug 216502 - slow crng initialization on Rockchip
 3399 (Friendyarm NanoPi M4)
To: regressions@leemhuis.info
Cc: Mikhail Rudenko <mike.rudenko@gmail.com>, "Theodore Ts'o" <tytso@mit.edu>, 
	Eric Biggers <ebiggers@google.com>, LKML <linux-kernel@vger.kernel.org>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, linux-crypto@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, Sep 18, 2022 at 1:17 PM Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> Hi, this is your Linux kernel regression tracker speaking.
>
> I noticed a regression report in bugzilla.kernel.org. As many (most?)

I saw. I'll follow up there rather than splitting the thread to here.
