Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3DA1531F2
	for <regressions@lists.linux.dev>; Sat, 31 Aug 2024 09:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725097281; cv=none; b=FkU6KmMHLrc4mzXACmu5uPx7gObT8uXk3j8nuoFV2Ua2gTIwowy3kAJaonIieLu4Xz0boeMUaDBKhdcZmRLWgKa6SMq9/bWJwHmCvXQS0wgGIDgp26pzhsOBR2KeeCBm0+R1qMZalkKCqNsFKB2RymQkOFdRWknjn9RyLQyi23Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725097281; c=relaxed/simple;
	bh=P7Ay73iPkGu0MmbyS4ClIVJhfFRmCWoeq0yYnn8GQ5k=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=g2N55XGgGci3sG++9DMnwK63WAXe8xVtBHBmtKC+upEqzoRxj0uV9mitkxL6arqzEDHD49d6/zWJ/94vHWBJL2nSERcRj6Blo0RmC73ZqOoZLAXZMY5UiKY7PV7oia7knIJ2iL72jFA89aRSlFyzF8xA6Mp5lx1Q+eVeOaZj91U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AaWeAAV+; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AaWeAAV+"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2f4f8742138so28662281fa.0
        for <regressions@lists.linux.dev>; Sat, 31 Aug 2024 02:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725097278; x=1725702078; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P7Ay73iPkGu0MmbyS4ClIVJhfFRmCWoeq0yYnn8GQ5k=;
        b=AaWeAAV++AUrX0yMirvDZ+6r9RlE8fopp7888H64BWJXOysbFDoj6l+rWv1IsO9Ntk
         d1q7Ct//isS0grz4LUlP0+ax25S2dQukjIbRVpetOBGYKiatCjnDbuHiR2Ar1DmxjLaD
         VQDhlC0AC0hDqgrtUzfs2bqz7WhDgDwD/rA01CADzf8pu3ldTijEL9zKEa3JnljKxaHf
         oOW/QzBZ9K2J9Zj12rRqUZBUBcYOD4X4//nV39Y9HR6o6PwYQdsrBh8UG9CWoTgx9hke
         g+7sb636LLzZx4kqlZtD18MU63MjqOZTRU3wh/bbDoPdriUvpdmaY6VAU6Y3Bmylr+eB
         pSFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725097278; x=1725702078;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P7Ay73iPkGu0MmbyS4ClIVJhfFRmCWoeq0yYnn8GQ5k=;
        b=sPwp/S+ZVhKRP6caRqp8xDeVl0WUGMjOAfkmvT22rgvrPDS+kVOc0EM8ygSDz45RjB
         ApB4sNzlDdwPeDnUPLhAQAWC0bcb4socaGo3hem168ok5q1Nk0jJot20Ux7fl0Ohll84
         Vg6mo6l3yxEap1OrCISD+Tml9zIz3a09+JbpoaFSmHLYPQdjIx/OHxlAgDAEk4HLbL08
         3eMyDWkHfU56w3OiByg1xy6dj/i0F6vQVCThmXv6EAy6zDj+aGpaE5LrLSnXEVauPfAh
         UYXLJ9jMBuZqyKk0/JkScx4iGHL/st4pAVxC/Hf2tdws4IdxQasf3PQf52IS724Tf3tI
         I6lQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNtT5njPvL5SR/TM48+qjTSy6PfHtSTRtj85XR8KMV05Fd18KgyBdI5P8mFCsuG3a2DgkvJcy/qQxisw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzeOAbfZ4N2T2naWA2RiEOCeP4NTk8npji3QVuSf8zPGIkuUwYg
	LwaUvTMYd7n0B+FsWGWYx4p46KmQzQ43jS+v0dtkUVyJa1czdvvJ
X-Google-Smtp-Source: AGHT+IH3fkry8a2MdNWwGeiNc3HZ2o5AuoOQ6W2Q7EimLQjOCU+/sdxJFuoHIQfJ0l3SALypmKxrxg==
X-Received: by 2002:a05:651c:548:b0:2f3:b078:84bc with SMTP id 38308e7fff4ca-2f6105b5d9amr69678851fa.4.1725097277549;
        Sat, 31 Aug 2024 02:41:17 -0700 (PDT)
Received: from smtpclient.apple (89-73-96-21.dynamic.chello.pl. [89.73.96.21])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f615171d68sm10033141fa.84.2024.08.31.02.41.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 31 Aug 2024 02:41:17 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51\))
Subject: Re: [regression] oops on heavy compilations ("kernel BUG at
 mm/zswap.c:1005!" and "Oops: invalid opcode: 0000")
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <CAJD7tkZ01PPYMzcTyX_cwr836jGonJT=fwT3ovc4ixW44keRgg@mail.gmail.com>
Date: Sat, 31 Aug 2024 11:41:05 +0200
Cc: Pedro Falcato <pedro.falcato@gmail.com>,
 Nhat Pham <nphamcs@gmail.com>,
 Matthew Wilcox <willy@infradead.org>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 LKML <linux-kernel@vger.kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Linux-MM <linux-mm@kvack.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <277CDE7C-7ED8-4840-9C30-533C9327B028@gmail.com>
References: <BD22A15A-9216-4FA0-82DF-C7BBF8EE642E@gmail.com>
 <6f65e3a6-5f1a-4fda-b406-17598f4a72d5@leemhuis.info>
 <ZsiLElTykamcYZ6J@casper.infradead.org>
 <02D2DA66-4A91-4033-8B98-ED25FC2E0CD6@gmail.com>
 <CAKEwX=N-10A=C_Cp_m8yxfeTigvmZp1v7TrphcrHuRkHJ8837g@mail.gmail.com>
 <A512FD59-63DF-48D3-BCB3-83DF8505E7E0@gmail.com>
 <oophwj3aj2fnfi57ebzjuc536iltilmcpoucyms6nfk2alwvtr@pdj4cn4rvpdn>
 <3D1B8F1F-2C41-4CCD-A5D7-41CF412F99DE@gmail.com>
 <CAJD7tkbF2Cx4uRCJAN=EKDLkVC=CApiLAsYt4ZN9YcVUJZp_5g@mail.gmail.com>
 <EE83D424-A546-410D-B5ED-6E9631746ACF@gmail.com>
 <CAJD7tkZ01PPYMzcTyX_cwr836jGonJT=fwT3ovc4ixW44keRgg@mail.gmail.com>
To: Yosry Ahmed <yosryahmed@google.com>
X-Mailer: Apple Mail (2.3776.700.51)



> Wiadomo=C5=9B=C4=87 napisana przez Yosry Ahmed <yosryahmed@google.com> =
w dniu 29.08.2024, o godz. 23:54:
>=20
> I also noticed that you are using z3fold as the zpool. Is the problem
> reproducible with zsmalloc? I wouldn't be surprised if there's a
> z3fold bug somewhere.
>=20

Hmm - yesterday i recompiled 6.9.12 with zsmalloc and =E2=80=A6. after =
16h of continuous tests I can=E2=80=99t reproduce issue.
With zsmalloc 6.9.12 looks to me like stable.

With this - what will be your advice to move forward?
Is there any possibility/way to avoid bisecting? (due limited time from =
my side)

