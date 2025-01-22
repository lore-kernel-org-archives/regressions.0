Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37448215196
	for <regressions@lists.linux.dev>; Wed, 22 Jan 2025 18:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737571692; cv=none; b=gr+RLEkv1DqwexUabPnaj10oVMyB5p2AMwjGYpSFBXCif4UQjIu9fwVCja64yV8Hc7isZLNHj5SxQGUmzgu3Eo3+7WlewSvAFVWk/Zm7pLUok2S8nn1v5XDajXlIY6BH4GtSzxUIim6TADTWI2QfHvZY78i8EMwThLngsnJIhz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737571692; c=relaxed/simple;
	bh=l3nganunuTO0I8caZ29KPDKWn49joghDgA/HwxSNAhI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S6icUW+VMMB3ggjVJ6yyXTOT7nTn9FrRGZG4/0rzGau//nEBZOMaayS6YT6h+QVDHM5hI0M8kMySxV1DS4bSryQrFil3r/K5K/vyaMpxCR/uwEbPWAn9xE5UncFUmReeik16/ZZa5mynAqhz9OtLlyYm9j/qMKY0cEg8kRg5pPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3+5zqzWu; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3+5zqzWu"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4678c9310afso29551cf.1
        for <regressions@lists.linux.dev>; Wed, 22 Jan 2025 10:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737571690; x=1738176490; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KKydrizajiZyiDzpM90s5csJ2UY4C/EjmVPrhqEURc8=;
        b=3+5zqzWuZzqB+LhockD+8KLYKedlQYIll/XJiPqRZyxvuc8YrJ5cLhlpjBAC7tgOrD
         8y5AmkRdMlJUc+50DXwqn/OUEsp1QwT/9bVzdBkh73BKfQoo4jyiScuYrrBOiyJShaks
         kb2uQJ0G6xCQHi2FPWOid38kWScqnM/FtEJQS9os3GXlu3bER8c8hRu6dYFeG6qc5IRM
         b+KM1jATHkfOblpoQdg757FDWny/W3unbVBVHEjrgGggVfIJIPL9PdUuOvtK/2WocN2U
         kYt265H8dSfcQEgg5zuYEK1gJKu7G2PWP2q84o+ZEbM5JJdDFpQjT24u5peL3QPyxtBZ
         HAZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737571690; x=1738176490;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KKydrizajiZyiDzpM90s5csJ2UY4C/EjmVPrhqEURc8=;
        b=sHU+scWys76ZuWiNacGs6noi8m23yitGoXFbbl4NVSvYOQZQgsBOA5rtU8QizYHUbr
         CZJS7upA7EvxVXQEBI1BtP7lih6BuNAhZ6RnPeqGd3RSe0Eotn6uf7KIJ/OJioBmBjCW
         kBh95i6kYMtE/ejVtIB6G5twcK9LLGSBEQY4PBctLanBpsAsW0ABhZ5q6UXaFmMdVs2Q
         fA4RpE6otprP76TRtq2dhLooMw3XNc1oX96ssTtZ6GGME/7y0so9+BqBL3EMwe6Yd6rJ
         ustbQ6yPN5FyXOpPn5NmAWr2YT+wuU/PSt+jvqgW7jpM5rGE3wopeJdWU0bHxOQsjp9L
         vyvw==
X-Forwarded-Encrypted: i=1; AJvYcCVA3HkP475uY/Z7SF1OBSnsJ4zP8k6wswjQ7EqfkS5cj6rQykOe0I+V5mXcfdTW5BZEAFVyI3O4iRtk5A==@lists.linux.dev
X-Gm-Message-State: AOJu0YwhGpCbrjiW7Oj2AXeCdUcjENRWQLVTnPX8EUSznY+/BtkTWPbQ
	ftPlZc5Fi693M2dasOlxJfmcjy/T2Mjd/sdiRsrdLHwB6Qm0M7j416CtPIH24Uecx54qzUA4dGS
	Fctltxbps8gp3hlbfw8H2g0ycNE3ChZIQ9YIe
X-Gm-Gg: ASbGncvbL7oy7IY8L464RHmdYMcyP0vxfYvpE8kVQoBLKNupBuQ5iLn/DS8AITvIyYS
	c/U6iHA46DrY5iLtQ8GBnLbj5wWglnagPcRGKcQXBVJCg78ktFjU933aHKj19FbpUx92OYX6WzB
	RbOMwemuVxt3RRGiGJ
X-Google-Smtp-Source: AGHT+IHcSKNZCGpPW7UbU8PKxihWgjo1H8ZK9FqkFOttjj+ZTAxgYbApIiufTqEle+NmXwKtaJOVCFj2ZCwtoALKiUE=
X-Received: by 2002:ac8:7f0d:0:b0:46e:2561:e8a9 with SMTP id
 d75a77b69052e-46e5c0fc91bmr118661cf.2.1737571689712; Wed, 22 Jan 2025
 10:48:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250120212839.1675696-1-arnd@kernel.org> <CAF1bQ=QFxE8AvnpOeSjSeL1buxDDACKVNufLjw99cQir0pyS_Q@mail.gmail.com>
 <c5855908-df1f-46be-a8cf-aba066b52585@app.fastmail.com>
In-Reply-To: <c5855908-df1f-46be-a8cf-aba066b52585@app.fastmail.com>
From: Rong Xu <xur@google.com>
Date: Wed, 22 Jan 2025 10:47:54 -0800
X-Gm-Features: AbW1kvbLk69MQRckuu9UcPreOF9jS0FZVYh5fU54olNNQd-dqqvtjn73DZA4fRA
Message-ID: <CAF1bQ=SEybO_+UMDqspA+9OecYqJhE56D-zJyxEUiPcj+Af_fA@mail.gmail.com>
Subject: Re: [PATCH] [RFC, DO NOT APPLY] vmlinux.lds: revert link speed regression
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>, linux-kbuild@vger.kernel.org, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev, Han Shen <shenhan@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Kees Cook <kees@kernel.org>, Jann Horn <jannh@google.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Linux-Arch <linux-arch@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 21, 2025 at 1:18=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Tue, Jan 21, 2025, at 18:45, Rong Xu wrote:
> > On Mon, Jan 20, 2025 at 1:29=E2=80=AFPM Arnd Bergmann <arnd@kernel.org>=
 wrote:
> >
> > Yes. The order could be conditional. As a matter of fact, the first
> > version was conditional.
> > I changed it based on the reviewer comments to reduce conditions for
> > more maintainable code.
> > I would like to work from the ld.bfd side to see if we can fix the prob=
lem.
>
> Makes sense. At least once we understand what makes the linker so slow
> and fix future versions, it should also be possible to come up with
> a more effective workaround for the existing linkers that suffer from it.

@Arnd: Can you send me the instructions to reproduce this regression?

I tried my x86-64 machine in v6.13 kernel with the following ld.bfd:
(1) GNU ld (GNU Binutils) 2.36.90.20210703
(2) GNU ld (GNU Binutils) 2.39.90.20221231
(3) GNU ld (GNU Binutils for Debian) 2.42.50.20240625
They all used about ~2s to link vmlinux.o.

The config I used was "make randconfig".

Thanks,

-Rong

>
>      Arnd
