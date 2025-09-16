Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4877D125A0
	for <regressions@lists.linux.dev>; Tue, 16 Sep 2025 16:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758040858; cv=none; b=pZvoISuvkjjvuA068TYSodoS3eI/gZDI0dMqBD+jRT7mGlmoFtbYZTVtgAw/0/CNgAs3jsPNBqyK1keG9w8BjXRsWtrEepx35GHaJ1IyM4nse/q7FLg8UcY+a7wPajAXMw8PDXw67tonL1VwFn7etLbNzhun7WZeqg6tZDT9fyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758040858; c=relaxed/simple;
	bh=g60Tzjs4O5LCL0qg3eeCW1cmWOXfWP3kS/U69raDg1A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r/LWRvbuBwp7hkRxQsad1HmQ2UWutGwCc3BUaJJ95NboYUT/wHWYU59IYQChbYiAsA8EaURbjyNdhUbPTM5oMohjz/5Bms/xyPH0rZEPdgEXUpX1TjHSWQZj/1VaZGflQkCTr/ZZpVClukM0mAmWX6mCNXDjjQFTPA94zskIkaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DPCTNxH0; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DPCTNxH0"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-32da2bd7044so633488a91.0
        for <regressions@lists.linux.dev>; Tue, 16 Sep 2025 09:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758040856; x=1758645656; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qT6xFwbttKqsz3xIF+BEqzCBG7ZO/EJyLZpLfjCbqc4=;
        b=DPCTNxH07+oE7K6AdlCfoSCUXbUGeriCCTt+3myKWJRf0mF/YBP/KSGuTj9ON9uWc9
         5y0nqnHNS12vaBp6m903K9MTwrlMDaeZlW0y9wtwuFK+E8Myzui9T1Dc4VJR2hbiDjID
         MojaFUg9DE8JWOrJIvtrAp8YQdSZfcJNycWl00Pgg5eEL9TRTEBeFJYBXKY2dOF+yzPH
         5rCNXHGKooQfJZPQVveFf6H+3QGBR/BKDZFdBG3cweFWZwGvrgmQUKw3AQZh4SBDDxTd
         DLEsQ9tso0wvgwYKuvZhGopx0VSijuMYUy5Ew7Ks6qsnbDNRcycA9w2yVDz4Kup7euEd
         rlRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758040856; x=1758645656;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qT6xFwbttKqsz3xIF+BEqzCBG7ZO/EJyLZpLfjCbqc4=;
        b=qNckrc1erL+Y6dBdDvpslJXn6XLg8PLQ2uD79lNYdgVLBBUMWUjXh+G2Oi5SQ4MhgP
         CdfBeuJMki0zPm6USubwbhcdgiaY/m4Nvy3GMAP1/2gJhpwD/ON8AiqTtjYBnbAdt+Ul
         EZLvFO93iOIYX9tynTHrMnGlPxnmRvkP3OS9eTf4KGeU7NEWyEzoqjoIYe3nMs0Oq8Nf
         ys2T3zZECh3v9WZZDXbu3Wf4uN0tCGHaAVa66Xd0AwNwzZh93JsCD1rCZhBYVv5P081t
         bhQ4Gc+NU139TXXmDf/FeuxOaYKYzwbUeiw21D1RM/reY0ZCdXr/MzJuNyTnIjruB2Sk
         rd4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVwQDv/XRk+HcX8YnNalcaknOvM+J3iXfDRDoFx4pwiKK2GI9Jxbyx7EUlM0SClSTJNyAGc5ALttEu1JQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzNKLcoKITw5mfWOiRUpvUNW+PD15ndMU3CzxFpRHRYFcqkx6hG
	MRd3MhqX6+jxHGvkyOSHgyx6GmoV0eeRKdOetJWcD4CTC6Y81Mi0PziT084p8WOCBmcmXiwyt5q
	0lkXVHOe2VsO+GsA6Y4dH+iTlBvi1WCU=
X-Gm-Gg: ASbGncu5rY/apQxob8dFrGNQQjUc8AVfejYGeOOeGDKzCv+wMKhbHIplUo0yvaFwtRG
	ioaE3U8CmY6Seez9bzhuPnpZMjWyck9GBoyiIptdgerEWZuHXTtHi5Q+qP3kz0/khl5VVKkxaqC
	QUBsl2z9jgFrTp8/I/6vrTtl5NVcQTrfu1WlbdGMIJzGqcgMISd5KTuVuGkeOkBawfPuDFSvM5P
	XFTYhF04QCj9wTwOfk8mz4nUbR8yhNe+3O4jOvmzeYpufNqPus6jc6uNcA264eznjuXNXQpRh+e
	0IOs0UxBCc6oKELLtP0n8jtucQ==
X-Google-Smtp-Source: AGHT+IGBabsxkqsMdP6Mj42hWfXp0yd/NwdNGOjJPOcIz1HAPNEo2Rfj6PVd+Epk4FzX4D+qrBYZPf2vtsY7bgWpScc=
X-Received: by 2002:a17:90b:3902:b0:32e:731c:4136 with SMTP id
 98e67ed59e1d1-32e731c435amr4683218a91.8.1758040856362; Tue, 16 Sep 2025
 09:40:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYtT7HNBM2XBbePeZ-Fw+ig7SJ+JE_NpQ1VuHR_TvAjX2w@mail.gmail.com>
 <CA+G9fYs4JB0ngq+aryXHVQSq-f05cb4agCfyM9zN0SgprQf0_A@mail.gmail.com>
In-Reply-To: <CA+G9fYs4JB0ngq+aryXHVQSq-f05cb4agCfyM9zN0SgprQf0_A@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 16 Sep 2025 18:40:42 +0200
X-Gm-Features: AS18NWDpgJqn2it9JPJgJZvek4xILevkaOGq8NT3omdX_EFldQlgE0iGcw_8yjk
Message-ID: <CANiq72==_ch0_7ZD8EEc2AOW7Yz1-b8i2ae0X6xDSkLJy=Dm6w@mail.gmail.com>
Subject: Re: next-20250915: error[E0425]: cannot find function
 `atomic_read_acquire` in crate `bindings`
To: Naresh Kamboju <naresh.kamboju@linaro.org>, Boqun Feng <boqun.feng@gmail.com>
Cc: rust-for-linux@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, lkft-triage@lists.linaro.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, Alice Ryhl <aliceryhl@google.com>, 
	Benno Lossin <lossin@kernel.org>, Elle Rhumsaa <elle@weathered-steel.dev>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Anders Roxell <anders.roxell@linaro.org>, Ben Copeland <benjamin.copeland@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 16, 2025 at 6:26=E2=80=AFPM Naresh Kamboju
<naresh.kamboju@linaro.org> wrote:
>
> Anders bisected this build regressions and found,
>
> # first bad commit:
>  [eb57133305f61b612252382d0c1478bba7f57b67]
>  rust: sync: Add basic atomic operation mapping framework

That is very useful, thanks.

We (Boqun and others) are in the middle of Kangrejos now, so we may
take a bit to reply, sorry.

Cheers,
Miguel
