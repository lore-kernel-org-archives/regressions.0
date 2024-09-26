Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E9B170A3E
	for <regressions@lists.linux.dev>; Thu, 26 Sep 2024 18:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727376224; cv=none; b=BlqNcEOWunbB2InTKYGdLXL9MkxDMgjtohEfkky1q8dmoEPqXsoNoBzTTT4HfXljfl9R79bUD7ip2+tMdN7ZBkXoKR1f8xGfdz00N6APySsOC5OxARZMNvmCqcjSTCrxFwHoUG4wdGLMXaExis8rmVDBuEK7nCmM7ojDIyzNKL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727376224; c=relaxed/simple;
	bh=N47sLM2gPDK8H/UH6Urqt+sRxN8GMBO7RiuFRUvVp90=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wlmh49/gQ97dL2pbbx6k6Q4++KcQnAdAw3iD/FdX5PZktkua9KaQ7n620ZpRSW21chUDBm34TzqSBJhf/No/uwlHM3KRyrOmpVLYikV1P1rdcZeUmpGC53VfSizip6lk6x9gPw/CnPHvG8fTCPUGdnwKmdKIFMEJGZSGYDO78W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=AaEV//Tn; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="AaEV//Tn"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53653682246so1673031e87.1
        for <regressions@lists.linux.dev>; Thu, 26 Sep 2024 11:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1727376220; x=1727981020; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=t0PzEVEemf5GnI1QTvkx4SdyCDccmGN2z7Xse9jYZ3Y=;
        b=AaEV//Tn5RDfhPNkj3f2kLnNnbqlX5O63/rh3PHdU3t4D7Rlb+5qjHKZj821w2UL3a
         QwGhbFcKfT2xSvO2EiJWDVjlbrUHtK4IB9lwBy/XBVyHoWnP8IrSzaeIw5pg98ats/Xv
         kIW4JzuV+ShH3iHM8MYOaW72VoY/5z6pVNNzM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727376220; x=1727981020;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t0PzEVEemf5GnI1QTvkx4SdyCDccmGN2z7Xse9jYZ3Y=;
        b=bj3MWMWv2kEu19rDTbqs+RezhfNAvxMBk2Ihqu8C6xAjH9DzttmPW8PURySjE0NfBT
         PFg0jQsEjrzXIhIqA4U3q9EgQunOvL2Pwl8Jz5i7uzXbIFtl9ZYfNCFRjMuVXi1m64Yk
         YI7wmPvjlJPlz4J43DLR9lhGsbMnnzLWmApUEOmT/fMgd3xaDsDQgyrel9O4L9A9LpHM
         cwGpRBukxItmNztTmaTUi7FnAKyqtYSmP5x4SANGu2Umr7ek6XPiUmHwXzQ5nMxh+gCc
         tAokJSkMSvlPkxcwitsglFjDEsuuTI0A13GickxzjQfkz9YDjT2zZ7aY6h3UrCn4j5PS
         sV8g==
X-Forwarded-Encrypted: i=1; AJvYcCUbFzlHlyLpgTnDjyLF3C/yX8g6icqnPKMQWvvYIswSSTdgAGrjrQnlmHnVH+Wq14T3un7q4eSQzxBTqA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1iijCb2q5dtVDsxaR6UGIyb2Myb0dUuP/WqNdP7+R6odOgnJT
	MJ6usBhyjQlyxdJzCaoV+e8h5tq23LbihW9RWFHFi66IWzk1YrDlBAimjTI0Y6RN2faQcQNZfPz
	8f0aRdg==
X-Google-Smtp-Source: AGHT+IFO1qR5bL4xjMO5lY4s25Onl4j9rUXvdH6o8o8ol2Nt8+a/JTQbqr6SOkPQYbolTQkXH1OveA==
X-Received: by 2002:a05:6512:1046:b0:52c:a5cb:69e4 with SMTP id 2adb3069b0e04-5389fc810c6mr455649e87.54.1727376220459;
        Thu, 26 Sep 2024 11:43:40 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c299e9cfsm26127866b.211.2024.09.26.11.43.39
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Sep 2024 11:43:39 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a86e9db75b9so206726166b.1
        for <regressions@lists.linux.dev>; Thu, 26 Sep 2024 11:43:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWg6wzJPGeKl4wVPL0cdLbcYAdmoP8Y2ujaPsU1YxwvqlX8h/j6d7vWL55AjCKacV9u1Y0+b0Pls/haGQ==@lists.linux.dev
X-Received: by 2002:a17:907:e89:b0:a7a:a960:99ee with SMTP id
 a640c23a62f3a-a93c492a589mr41084466b.32.1727376218897; Thu, 26 Sep 2024
 11:43:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202409160138.7E27F1A55@keescook> <d122ece6-3606-49de-ae4d-8da88846bef2@oracle.com>
In-Reply-To: <d122ece6-3606-49de-ae4d-8da88846bef2@oracle.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 26 Sep 2024 11:43:22 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiJiePHNw3Whxm9n==h3-JwXojefAN3OiDzT89BO3jDew@mail.gmail.com>
Message-ID: <CAHk-=wiJiePHNw3Whxm9n==h3-JwXojefAN3OiDzT89BO3jDew@mail.gmail.com>
Subject: Re: [GIT PULL] execve updates for v6.12-rc1
To: Vegard Nossum <vegard.nossum@oracle.com>
Cc: Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org, 
	Allen Pais <apais@linux.microsoft.com>, Brian Mak <makb@juniper.net>, 
	"Eric W. Biederman" <ebiederm@xmission.com>, Jeff Xu <jeffxu@chromium.org>, 
	Roman Kisel <romank@linux.microsoft.com>, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 26 Sept 2024 at 11:29, Vegard Nossum <vegard.nossum@oracle.com> wrote:
>
> # first bad commit: [fb97d2eb542faf19a8725afbd75cbc2518903210]
> binfmt_elf, coredump: Log the reason of the failed core dumps
>
> I have to admit I don't immediately see what's wrong with the patch.

That commit looks entirely broken.

I *suspect* that the problem is the crazy "get_task_comm()" in that
takes the task lock inside coredump_report_failure().

But honestly, I'm not going to bother even trying to debug this. The
whole notion was broken. People who have problems with truncated
core-files should be looking at their debuggers, not asking the kernel
for help.

               Linus
