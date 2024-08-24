Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4011C148311
	for <regressions@lists.linux.dev>; Sat, 24 Aug 2024 10:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724496640; cv=none; b=HQhgWG038BcYmRm+2n3j7mmfdhl3e1j8DUuEVUMsN/OmW1eu/k0YO9q4oWTR2u+WlxxVVyPduK26LBuckHgEmy51C4qifJ1e5QJZtNsKKoTMYrZNRehpyuW07TVw+bUWUPUSc4GZHprWg4wX8i8I9JYeZKUv4Qpa4cUqOKQOmIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724496640; c=relaxed/simple;
	bh=MyT6pHbI74MEsYBsc27CNATHZS7slYAB1sweCEtW72c=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=bRByOh2KcWAzZeqYSlT0sm6FabR6vihcuysacTILBj0w29+0Wx0PiLFh5GNZyfghhOdahdmdiJHgHKojW5uhBojEveBZ67KM9ibSOKGqc5W3MMisilOT3awNy4g2XJDxuxI4qLkehxA+TBaa1GPNIc+zYINb+U40MTMdK1Cygx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GxkocAwm; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GxkocAwm"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2f3f68dd44bso32565981fa.3
        for <regressions@lists.linux.dev>; Sat, 24 Aug 2024 03:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724496637; x=1725101437; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MyT6pHbI74MEsYBsc27CNATHZS7slYAB1sweCEtW72c=;
        b=GxkocAwmwfvuMZ3okU95dtJtNLJ+4Qh76mPsCmz2MdCG4GlrQqSRRtRZF8W9QyTY60
         f0xX/oZjqlA0L5J9gXChQT8SBmMTLHPIgu8GQORbt3Vol6h+ooxWt8V0K/5W0I16D+9f
         BJZatJC5vPzs4Fl5U7jfFjVBDLiDxPdg/ZWXEmm3yXKkwd0zHk+cG4atDnqxBwyCLpU2
         yVNnqLJR8+vmODSX5QB+aZFcUJp9hoWM0T7+/RBVBHuvoB0DJm4spvAVBYyhQroY52s1
         Xpw554sMkLpF5VA13v5FW0V5+4We5vDoqWUTdKwYkaGozy4Iu+d6DAk693JKAB7trRZL
         PqRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724496637; x=1725101437;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MyT6pHbI74MEsYBsc27CNATHZS7slYAB1sweCEtW72c=;
        b=I/z2S5IZJ2JA9zdiMNVuF9IiFzCX9hKL6+iIBhKjRxTUFGyGt9X1Ce3hnpodxHGs8g
         69mTNWjRFLucIM0beQZVT8C6guOr9yiHH720a9BjmYUSJzUddpZ+EqJG4tYej0i4KJkX
         UoASdvpdiR1cHvKV5/0y/CDPIcmV6RFu5/bdIqtjV/7hNLDC08RWsJ0/F2YSBv/tebU4
         f3UF7K2XlLGQwCrMqME8RCHmKryHwucXqZD8BDucBFC8Utin/4QE0R7Jd+gY20bxxnk0
         1XroSh9EB3j1A0MvR4TuUVtwl2Fla0fXjwwGF5SFD6iW5No8LOwZ6P5LKTuW34dEwBAQ
         8IWg==
X-Forwarded-Encrypted: i=1; AJvYcCW4iRYxER+SBBdM8/luMq/c9ezynKopZ1e2lIVnTaPL9VEf1uK7cxAp6qakjpvL9zkz0iYW/LqhCFTr6w==@lists.linux.dev
X-Gm-Message-State: AOJu0YyR29fTfANJ19qXjHB6bK4R0VW0blGGUszb4PXzBNXcNE0e4JGu
	MAs/2QalhVZqyNXnoc8SeaUmwDFlNBxtNMKid4E6GtlL74XM6okm
X-Google-Smtp-Source: AGHT+IH7z27af9e+erBfe62AtTcmU6xp64p/FyaP8ui7mikZRWAtcmsm6CH+WS21XHaf83asK1oWEw==
X-Received: by 2002:a2e:7c08:0:b0:2f3:f1cf:5313 with SMTP id 38308e7fff4ca-2f4f490f115mr28736991fa.24.1724496636817;
        Sat, 24 Aug 2024 03:50:36 -0700 (PDT)
Received: from smtpclient.apple (89-73-96-21.dynamic.chello.pl. [89.73.96.21])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f40487fc23sm7101391fa.122.2024.08.24.03.50.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 24 Aug 2024 03:50:36 -0700 (PDT)
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
In-Reply-To: <CAKEwX=MZo4qTED6gtQYSGxgY6CBJYREhgbhTOqvsjhnFt7YwdA@mail.gmail.com>
Date: Sat, 24 Aug 2024 12:50:24 +0200
Cc: Matthew Wilcox <willy@infradead.org>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 LKML <linux-kernel@vger.kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Yosry Ahmed <yosryahmed@google.com>,
 Linux-MM <linux-mm@kvack.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <ED949A5F-1CBC-48DA-9377-48B2B2ADF9EF@gmail.com>
References: <BD22A15A-9216-4FA0-82DF-C7BBF8EE642E@gmail.com>
 <6f65e3a6-5f1a-4fda-b406-17598f4a72d5@leemhuis.info>
 <ZsiLElTykamcYZ6J@casper.infradead.org>
 <02D2DA66-4A91-4033-8B98-ED25FC2E0CD6@gmail.com>
 <CAKEwX=N-10A=C_Cp_m8yxfeTigvmZp1v7TrphcrHuRkHJ8837g@mail.gmail.com>
 <9793DBCA-13F4-4B47-AD57-12A62F7DD8DD@gmail.com>
 <CAKEwX=MZo4qTED6gtQYSGxgY6CBJYREhgbhTOqvsjhnFt7YwdA@mail.gmail.com>
To: Nhat Pham <nphamcs@gmail.com>
X-Mailer: Apple Mail (2.3776.700.51)



> Wiadomo=C5=9B=C4=87 napisana przez Nhat Pham <nphamcs@gmail.com> w =
dniu 23.08.2024, o godz. 20:06:
>=20
> Could you do:
>=20
> grep . /sys/module/zswap/parameters/*


Here it is:

/sys/module/zswap/parameters/accept_threshold_percent:90
/sys/module/zswap/parameters/compressor:lz4
/sys/module/zswap/parameters/enabled:Y
/sys/module/zswap/parameters/max_pool_percent:20
/sys/module/zswap/parameters/non_same_filled_pages_enabled:Y
/sys/module/zswap/parameters/same_filled_pages_enabled:Y
/sys/module/zswap/parameters/shrinker_enabled:N
/sys/module/zswap/parameters/zpool:z3fold


