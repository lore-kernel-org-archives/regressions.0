Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D87384A22
	for <regressions@lists.linux.dev>; Tue,  2 Apr 2024 13:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712066092; cv=none; b=HNYd3EGuafhkN/ExSGm6iy2R7dJs2wqgM1kEJKCjFFDKuNkENpNODZR8aUlrPFbfjpNf85tHwrxg2eiAGYoRmcbE86popG/Wm0IHrfifOm4R/eNhsNvLM/breypk+rp2NlyC4mMo9pcGN61vcm6k5BLgdsAg2OIXgqf7KYHmsNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712066092; c=relaxed/simple;
	bh=OhezKoMk0ZpyNgIu9VoaSTemJc67M5kb5EmMZp2QqP8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tm3aYB8FwWFcdcZoz3xI7xp/A+QvBCXhRUE/hXja7w5wv1KGvDjp6cFOcD6/TzadvGnwbHaJRFdi4Wu3z5Zvz07x6TsYYb6BUsMIBf0/gwzPhwnvB3c9s1x5qm+cDvlFDXsI/T+PaGFuRzESsHrnDJJaorzjHzQ1bII2D8/0Z08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UWMNQK3B; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UWMNQK3B"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-56bde8ea904so63117a12.0
        for <regressions@lists.linux.dev>; Tue, 02 Apr 2024 06:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712066089; x=1712670889; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OhezKoMk0ZpyNgIu9VoaSTemJc67M5kb5EmMZp2QqP8=;
        b=UWMNQK3B7YMiMPKo1Nh6k5cdTOpUqvJ+zSN8JFRwM3MfUYxxQwf84zs8THlH4mumhq
         Pii3Blu6MP+4J20H9tY5LLEe8V3CHNHQk3ehCm2YXdVFnBcnLdxOhC6RtPRTuV9KtpUm
         8yxq3unEnvMap6DdQD/raEFUsgQPuduLtUeVUwPtQyfQtW+NtiHxHUYpQRzOvAjdW7j4
         MZ4ZO8VhVcVlc3XsYY2NdlNouH1cto9qmMFQVMzK5dNUNywXiDYQqArzwGPQ59xQhcHh
         zN3E3fPnvLN98KLVBIvZEkli7QID81+/72RZ0qYIY9RaKFGTz5/bRx3ZTltbzwx3IuR1
         +meg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712066089; x=1712670889;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OhezKoMk0ZpyNgIu9VoaSTemJc67M5kb5EmMZp2QqP8=;
        b=qeKID94euTHjl8IUmLudmxGQr17yXqGC+4MSq8y8oG+Vj4bn4W+I4bn8BkXPj8mD5v
         ZgSAv1TJDszT+8u+IvCzbXv6OzjYc49M7RUnQ8hZ8+DRmg33dyqGVrJDuV9j9REYqBJy
         7wzMhjPYTlXstxLFwhPwM0uo1J4SGKBvTBahVxR37do5F/RQq0PG8iHxHgPBxuVSm6ze
         kN0CXlCIhJfVuU2IULLnhaBbF/oFaOsMgzin3juAWeNu+IuBvm0MkPVoWLZ7YuLP+Ww5
         /HKcbATSmIu7pIu8PPwEHeZdcdmRpYESeioIfo8NUmtLhAa/Q9JagVQVWhoc5RzX0PhS
         tZgg==
X-Gm-Message-State: AOJu0YywVDve3ALfP+h4R14qoQArCfZSI1FYt/+Lgnabwv4sETndQat9
	8o5G5hMqxZzL2Y+kLP9zAbJqRQFBHzrR8M8N4Hh8cWOrmLdAmsfmUWr0mj6rZog5QtJk5/LCKpN
	SsrdvJ7nxnPgXzCfNEl28LGksdaSj0/Nkd2pm1jNbKdjZ8ftyyA==
X-Google-Smtp-Source: AGHT+IFkFummJ8EVqYQbMMRY/DoS7KDISq3fii/tRJEgKUeKeL7aK3elsQSlRTCe7QYCweZPOWt3PdPoUpKnCcbikVs=
X-Received: by 2002:a05:6402:5256:b0:56d:e27:369c with SMTP id
 t22-20020a056402525600b0056d0e27369cmr668695edd.3.1712066089193; Tue, 02 Apr
 2024 06:54:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240306111157.29327-1-petr@tesarici.cz> <20240311182516.1e2eebd8@meshulam.tesarici.cz>
 <CANn89iKQpSaF5KG5=dT_o=WBeZtCiLcN768eUdYvUew-dLbKaA@mail.gmail.com>
 <20240311192118.31cfc1fb@meshulam.tesarici.cz> <764f2b10-9791-4861-9bef-7160fdb8f3ae@leemhuis.info>
 <72e39571-7122-4f6a-9252-83e663e4b703@leemhuis.info> <CANn89iKfMTGyyMB-x74J5bgzhM1RxSvuNhvXyWWv4DO8MZakSQ@mail.gmail.com>
In-Reply-To: <CANn89iKfMTGyyMB-x74J5bgzhM1RxSvuNhvXyWWv4DO8MZakSQ@mail.gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 2 Apr 2024 15:54:38 +0200
Message-ID: <CANn89iKPh0uR2mq4ThokwaF5iJA-N=9sXawi2H=-vLDn5Xfmug@mail.gmail.com>
Subject: Re: [PATCH 1/1] u64_stats: fix u64_stats_init() for lockdep when used
 repeatedly in one file
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: =?UTF-8?B?UGV0ciBUZXNhxZnDrWs=?= <petr@tesarici.cz>, 
	"David S. Miller" <davem@davemloft.net>, open list <linux-kernel@vger.kernel.org>, stable@kernel.org, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 2, 2024 at 3:42=E2=80=AFPM Eric Dumazet <edumazet@google.com> w=
rote:
>
> On Tue, Apr 2, 2024 at 3:40=E2=80=AFPM Linux regression tracking (Thorste=
n
> Leemhuis) <regressions@leemhuis.info> wrote:
> >
> > Hi. Top-posting for once, to make this easily accessible to everyone.
> >
> > Hmmm, looks like Petr's patch for a (minor) 6.8 regression didn't make
> > any progress in the past two weeks.
> >
> > Does nobody care? Did nobody merge it because no tree feels really
> > appropriate? Or am I missing something obvious and making a fool out of
> > myself by asking these questions? :D
>
> It happens, please resend the patch.

By 'resend' the patch, I meant : sending it to netdev@ mailing list so
that netdev patchwork can see it.
