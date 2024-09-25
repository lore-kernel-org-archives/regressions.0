Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2FB8825
	for <regressions@lists.linux.dev>; Wed, 25 Sep 2024 16:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727280399; cv=none; b=h89pf/v/JCUH0vtYuDR1UfdxcvQcfwABd4Ico4vvVEAqpTJjkU4J/S74bQkOxEH7//o7yFnuQEhVFKGQ57sHG0XJPjKhcXojq4X+79M309HdbnMKA6DJ3J9Xm5p3QaVUPNqNM2ZCc5AY4AQzBOy6s3exfQafDLyMqB10W07m8Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727280399; c=relaxed/simple;
	bh=2Wpg2PjOSk/M4D8f3ZoLXyifchNF3HCLIWirDmcvRPE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rg1xCo3kWdXEsZrXxamruv4p58X4bmBUYzmdjPJxAoG8CWR8JcL2dZz+eXnuRIila2V0AXZBpQdXZz/BFcutMqSGKqGA/QrspwXC9JUe57L3lJhp2mDCNsniaTzNNOj9aGKOcC+MDOrtupyPQGdoMy9b+nxzyyHZ3z/U71ldv8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mq3h+3qQ; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mq3h+3qQ"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2f7529203ddso11475651fa.0
        for <regressions@lists.linux.dev>; Wed, 25 Sep 2024 09:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727280395; x=1727885195; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Wpg2PjOSk/M4D8f3ZoLXyifchNF3HCLIWirDmcvRPE=;
        b=mq3h+3qQaHRSlzo6F88Xj6GP8Wjx/CnMzSXxEOC9Tcv29kcOYGQ/Z1C5bU0mpiahjw
         UVsoumA5C9gErHfXBqPfp+0rWYodH32cGfYEHvmFLEE7sysEr5SxhnfqnT4Dfxl2J361
         7ZQrtGp8vNqdpLPGkekGvmRepp0tUqpUotjJrEjWbAh6PyVEFXj2pl06xqwOZ/O/De29
         8+cf/Yn55WUgLRh/jAv9hDqqtPxzfiuoEEMaZL01AxjXgvN7b34CGP/KKPIb8QFG0NTN
         eC0kexqiotv703M56MkdcbjpYiFtBlH7H9Xk5ls1UFrAIn8S9v/m/uJTv1qa/mEnqgD9
         h9zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727280395; x=1727885195;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Wpg2PjOSk/M4D8f3ZoLXyifchNF3HCLIWirDmcvRPE=;
        b=r+TtQbSi7aqnSh1B9znB3NwD9jY0fnKlQ9ryABlR3wNbZjM4vka1gAd8qXDZkzFSQr
         1ZPaTtEhdWb5oEZz2uQ0E+59badwEB5qJVlC9eU2dR4Pema0/eZwC4ltskoS2mlAh60q
         nJULZGaC/gm5amqW0qK4+80qb02ZW+Ut4KIT4HyzR07X0vyDyNLuNViRQ7IeFkw52oyW
         uBUwIG27XO5KG0xgLhEupz2Sy05YYuQT32gisEWHiAmeXtOnv1uw6cY7Cxf1TLJ4HOMU
         YoOzqLHs3FcpFhOFxFCohZs7z6r+BxJhDbwWff9bqEAwAM6umZ0yLZ6WdNaImn06SHbD
         Vneg==
X-Forwarded-Encrypted: i=1; AJvYcCX9dyeFyKeAsU3sY1s/J4gl5ExVSknNsOePXw9A8O5ZSleCRaXmHg5PL+mf4DaFYZAe7u1ykWjM3d/AOQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyTxTiyZYFIq7GlBFNbdj5q0U4DNnO6IGFhHciv09KRVnf7pEFV
	0L7M32ULynYYjh6Iqj3C1RR0c4VXUdlKp5QYLZ/UwAyjtTi5SCaz2wb8SiYEhZYaFwE3RFtXC3e
	lS4gFhpyQh8vnzuQ0TOS2IXlu70o=
X-Google-Smtp-Source: AGHT+IFfTUuhRjGyeGP067T50/GeAjOgvxwBokvoT72wr9zTIkRSPAAxAiRwC3Lcnvamx1vFFxiaaHJQqlay4IHWcBk=
X-Received: by 2002:a2e:611a:0:b0:2ef:1f5e:92be with SMTP id
 38308e7fff4ca-2f9c6c66aa6mr392431fa.9.1727280395131; Wed, 25 Sep 2024
 09:06:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <0a3b09db-23e8-4a06-85f8-a0d7bbc3228b@meta.com> <87plotvuo1.fsf@gentoo.org>
In-Reply-To: <87plotvuo1.fsf@gentoo.org>
From: Kairui Song <ryncsn@gmail.com>
Date: Thu, 26 Sep 2024 00:06:18 +0800
Message-ID: <CAMgjq7A3uRcr5VzPYo-hvM91fT+01tB-D3HPvk6_wcx3pq+m+Q@mail.gmail.com>
Subject: Re: Known and unfixed active data loss bug in MM + XFS with large
 folios since Dec 2021 (any kernel from 6.1 upwards)
To: Sam James <sam@gentoo.org>, stable@kernel.org
Cc: clm@meta.com, Matthew Wilcox <willy@infradead.org>, axboe@kernel.dk, ct@flyingcircus.io, 
	david@fromorbit.com, dqminh@cloudflare.com, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-xfs@vger.kernel.org, 
	regressions@leemhuis.info, regressions@lists.linux.dev, 
	torvalds@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 25, 2024 at 1:16=E2=80=AFAM Sam James <sam@gentoo.org> wrote:
>
> Kairui, could you send them to the stable ML to be queued if Willy is
> fine with it?
>

Hi Sam,

Thanks for adding me to the discussion.

Yes I'd like to, just not sure if people are still testing and
checking the commits.

And I haven't sent seperate fix just for stable fix before, so can
anyone teach me, should I send only two patches for a minimal change,
or send a whole series (with some minor clean up patch as dependency)
for minimal conflicts? Or the stable team can just pick these up?
