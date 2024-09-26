Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B0A175D2C
	for <regressions@lists.linux.dev>; Thu, 26 Sep 2024 19:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727378300; cv=none; b=iP5b6eyT4N8jKStts1imruQLtwNLBO3+i4NAnXCAunM351/FjtwwPVyteANxqpfoeJU1Uo6WKInMHbkgdxvxppEQw1TbDlRbuOHNBbhFNcM8Z1Hm0h3Xa5SX6/qsf1q4PjHxSmp7wVpBjMcqdmYWE6tEinh7yyGo6XodtJKc46M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727378300; c=relaxed/simple;
	bh=v/LMChHIPdULBRffOUhtGPYw1P7XkINjKSQB0P3NvXk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PqjsxJugBkZLRvEZDoe8n/r6Yq+GMQJCLouzYaJ0MY+m4tcT/4tXKuSDUCfwzx0BUW67y/8AzNnmPbSAKVLD7d+JegozNhL7kl9WKODRyLw3JfWOkY5Vb7Zz3BfD6A3eLwz2Cl4ZZzq8BwB6qAHfCzyWh3PVcYKA8jCivGJkIdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Q9zsnwGG; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Q9zsnwGG"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5c881aa669fso531295a12.0
        for <regressions@lists.linux.dev>; Thu, 26 Sep 2024 12:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1727378296; x=1727983096; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9L9OKN5fpu686IqPoFFWg+m2KoaIpCSuh7PJeN+XmFw=;
        b=Q9zsnwGGM0VaeJMl58GRV3awjMFUWgfzj5Ae7K1SrB3ZmdxxlMQYuO5wvbnPhYjU72
         17p/eokpOULgvo7L0JYFICygQoc8UwzELyuC55jKVixwYLIbVSPQxwLEvYX9bXNV+0y2
         1x2Hl+ZL6tH+BodJUK4jbvsHhLG87HS9ni/DU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727378296; x=1727983096;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9L9OKN5fpu686IqPoFFWg+m2KoaIpCSuh7PJeN+XmFw=;
        b=Z1DmaMWsvh9i4LTDHWeR/YdWm5sDLM7AYmh6kzDq69W0WhdFV9e6YRZnRS6dQOCWoQ
         fQp/OtJ0vGjPdWo+Y4izuDp5OWVDC2SeSPLMZfZDM/ArzFlr7Eq0jvZ0tZOTno0Gve6b
         aiSCz+ErXzh+glNn5F3SaEOQT9wpzsx1i3mgpHXCkvpDrUX5TntmTHapAsthgzlrmbih
         yhOIHfESYryPzO37bn6/cttuKqx0eGub1CYjHvu5tNx2+M5vU2sLRZjmA57Ubk8t0dR6
         ZoRyKw32W/583qRIMX42P4bnA3SWmAKLi8jNnfoosqQTC4spYsDZp3BNg0F+KrTy5JU6
         5XvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlBoOSrhG3T9pPuU23VwuA1hSOvf/rnBGeN/27dxoJPHdhAXORZO5MswmkcDO5jn3y6/OxXC6vrGTEhw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzICIPjUjmHVJXUQIC9qT+I9ml7Bkda8QtuNg7PiucPF0hV7W0H
	3WVtZMaTDE6WAfRwzc6XFX2gvZt1L7L2mx6GUCckFQBL6ADN+reg1KNWZL+y1YikDvSHSzr+ahq
	gMVg9ug==
X-Google-Smtp-Source: AGHT+IGpZDlWCqNaI1yhFbOfvzzjzZcw9CUP4GzcXD4Qm6huXKtHgR9IuiWjkDjaoFLQZXWh45VeWA==
X-Received: by 2002:a17:907:3da7:b0:a90:3492:9ad8 with SMTP id a640c23a62f3a-a93c4ab1862mr56001266b.65.1727378296148;
        Thu, 26 Sep 2024 12:18:16 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27c5dfbsm30004266b.60.2024.09.26.12.18.15
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Sep 2024 12:18:15 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a8a7b1c2f2bso197254166b.0
        for <regressions@lists.linux.dev>; Thu, 26 Sep 2024 12:18:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUx75RuexFksueSCx/jafbN0DdB9Et849NChZ3tGtF6RZ5FwL9fM3rQuCUux+9CMQGV1lKhGnhpDXaXSw==@lists.linux.dev
X-Received: by 2002:a17:907:3f18:b0:a8d:2c3e:7ed3 with SMTP id
 a640c23a62f3a-a93c492a738mr48686466b.35.1727378295065; Thu, 26 Sep 2024
 12:18:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202409160138.7E27F1A55@keescook> <d122ece6-3606-49de-ae4d-8da88846bef2@oracle.com>
 <CAHk-=wiJiePHNw3Whxm9n==h3-JwXojefAN3OiDzT89BO3jDew@mail.gmail.com> <874j625j1a.fsf@email.froward.int.ebiederm.org>
In-Reply-To: <874j625j1a.fsf@email.froward.int.ebiederm.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 26 Sep 2024 12:17:58 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg==rBvM9G4kkT3q5GQN2Pq3M7Vyu1VG+QS7XWmpshGYw@mail.gmail.com>
Message-ID: <CAHk-=wg==rBvM9G4kkT3q5GQN2Pq3M7Vyu1VG+QS7XWmpshGYw@mail.gmail.com>
Subject: Re: [GIT PULL] execve updates for v6.12-rc1
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Vegard Nossum <vegard.nossum@oracle.com>, Kees Cook <kees@kernel.org>, 
	linux-kernel@vger.kernel.org, Allen Pais <apais@linux.microsoft.com>, 
	Brian Mak <makb@juniper.net>, Jeff Xu <jeffxu@chromium.org>, 
	Roman Kisel <romank@linux.microsoft.com>, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 26 Sept 2024 at 12:10, Eric W. Biederman <ebiederm@xmission.com> wrote:
>
> One of the common causes for coredump truncation is weird interactions
> between io_uring and the coredump code.  (AKA kernel bugs).
>
> That is something you can't ask your debugger to tell you.
>
> So from 10,000 feet I think the idea is sane.

What? No. Adding printk's to chase kernel bugs is certainly a
time-honored tradition. But we don't leave them in the kernel sources
for posterity.

And none of the coredumpo failure reports had anything to do with
io_uring bugs anyway. They were literally "print out when disk filled
up or core dumps weren't enabled".

If you didn't get a core dump because the kernel didn't have core
dumps configured, we shouldn't print out some babying kernel message
about that.

None of this has anything to do with io_uring or kernel bugs.

                  Linus
