Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B93207A01
	for <regressions@lists.linux.dev>; Sat, 22 Feb 2025 12:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740226873; cv=none; b=P88HKYJ62TXQx1n7Z62C0yZvZupBoMKPEGDSSS9Gw1J3WlZOxA06QZgcKLCU9lw5DlYk+9gkcrOlptJaVomuo8Lz5vnL0f2t7FgobWdxY7nJzJUoJoGE7pmIQhBUaMQaKwhHVTxwdJ1J8bOHL1W1eThCAUr5NZI2LsuwQJrlTWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740226873; c=relaxed/simple;
	bh=il6Qqd5eRhA+wprknB+USCHIJ++iO5SknhOmx3UPBNA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OD2sRmbGFFPnKzJsXtIs51FYKhNlt1IY8ItofZR8o+UehMnHu6n4AnDQpVY4SO8k763exvdR/lYOfgbbp7DmNyBDXVUQOZDURIr4TEgkeNz0KmO7DZRPLuUuMQ0WPvYkRauQHSsuDfv57yJomabrmKs3ItpGqQMmhcdoL3zZjG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E0tegdKs; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E0tegdKs"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2fc317ea4b3so771214a91.3
        for <regressions@lists.linux.dev>; Sat, 22 Feb 2025 04:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740226871; x=1740831671; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=il6Qqd5eRhA+wprknB+USCHIJ++iO5SknhOmx3UPBNA=;
        b=E0tegdKsA1vMdXYNq+nPoz0qLgpb44RuWRI3I/Y6LQj1FhNVx0N4a1ZZbw0ZAtsr99
         43QBEkhY2oieqP7jr7cNEOUn+5SXr05prlE3oGWvcp2rmxhPDs0FDhrv7Sdyc6KANOHI
         gk+6qZn5dl7S++ny3dZ8kOhv/updl9AYBYi5FJrMI0GuDY8vxESDnYwDaVlzEp9L4EL6
         qy75id1ajJz8Vk3Mx4QjxRrJEnjhEGqrxfSTpJ+XIcigFZ8i2cPKYDR1aiulkzCtwc4u
         dxK3ZdxEYSXDpLGGuaaTRs7eTaAh+Sm3qEArJAQ5fW4mlA8AZriPb4HfrL1GyrsjUFcD
         C6Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740226871; x=1740831671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=il6Qqd5eRhA+wprknB+USCHIJ++iO5SknhOmx3UPBNA=;
        b=wuOuNA7CDc06VOEpeMKcsRB+6D7OkiOzh0ATbIO9BOgO5mN+NHv8Rpjv8MRqWYmDxP
         THUhN7OFFDKHVVN1gJjqlgsSuhkBDHYZA8Zz6HaxiZ/xiIGNhSqBOkRPW8YvAoSLHTAH
         U8xx566CBfoELPQs8iu2cpxdjTjeeYGU/Ds/H8MKebd6t6qw/nh1AqaXsgHc8Mla+1Zb
         z6eL/8v5l17DZlJTx0mXpPG14/gcZwHvRy4nBBN1cPxss6LPuxJ+YQtS13IWSjer2bk9
         fO5OD+fIdrBsAymOdm24DmRuS94XIVktgPjESPlA2DIBb7q/L+0r5w5968J193SGxTmz
         Mv6A==
X-Forwarded-Encrypted: i=1; AJvYcCV2E7/VjJbUewyXwP38QTMVg1KQ31O2YPZfXA9CAui/zfua4WMe4NVco5H1fxsdQTrFRNSgDRwMsWhV/g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxth6CjSgFpEl6MMcTYmJe73gF3OAne50yIT8m6W5kkQeBwOhzY
	NL4pzJREDvCwZ6kH0MSLObkDAZDd/gsb9ncOhJi3hG2BC5VFm5OjAmlnD1Sho3mfrk1pgwMy6P3
	nEQEau5XO7R8RLieboKnk0P5W314=
X-Gm-Gg: ASbGncsJvlLFxr79e8U8K27itHd0ztY1YnzChjTgam3VT5Ob1JLBxPzBDtp7ObiGwuz
	fttR4J2E4vePcPsOUkwUrzxk2bqfGeX56eAZWTbQGOm0bwv5DhBfB6NQuGjg363LuFbiCFbBCXx
	afnCydOFA=
X-Google-Smtp-Source: AGHT+IE3qKPs7mbXALLEginuUPiswX1VxZibcwmSUbSEIvidpst8iLIyZckHqIY7J450gCzzrBZn2sazu08NQJeZq7o=
X-Received: by 2002:a17:90b:4c92:b0:2ea:853a:99e0 with SMTP id
 98e67ed59e1d1-2fce7b389f6mr4371506a91.5.1740226871449; Sat, 22 Feb 2025
 04:21:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ef950304-0e98-4c91-8fa1-d236cbb782b8@disroot.org>
In-Reply-To: <ef950304-0e98-4c91-8fa1-d236cbb782b8@disroot.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 22 Feb 2025 13:20:59 +0100
X-Gm-Features: AWEUYZmRBNJTBxN0xkGm_LxZipJHN9QJR0d5yx5U9-67EfskObL1eNFnt-yVeJs
Message-ID: <CANiq72=WyQdQfoOeb_mK=J_5GtiWBenqzA+mOr=8mN8OTWPB-g@mail.gmail.com>
Subject: Re: FTBFS: Rust firmware abstractions in current stable (6.13.4) on
 arm64 with rustc 1.85.0
To: NoisyCoil <noisycoil@disroot.org>, Danilo Krummrich <dakr@kernel.org>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev, ojeda@kernel.org, 
	alex.gaynor@gmail.com, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 22, 2025 at 1:09=E2=80=AFPM NoisyCoil <noisycoil@disroot.org> w=
rote:
>
> The Rust firmware abstractions FTBFS on arm64 and current stable
> (6.13.4) when compiled with rustc 1.85.0:

Thanks for the report! Yeah, I noticed in my builds too but didn't get
to it yet (there are also a couple Clippy warnings in the QR code too,
in case you see them).

Cc'ing Danilo in case he wants to send the fix, otherwise I will.

Cheers,
Miguel
