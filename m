Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32DB92F5A15
	for <regressions@lists.linux.dev>; Tue, 16 Sep 2025 17:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758044413; cv=none; b=TYPGEzflwoN74N3voxNfskwU7OMB1psR3ABTiXQazPo41uYRH0Y82smVRMuMGmamwPe9l2PQLZzFSHmi5XMSrvVeo/PBoZRi9dpTMyaJYqhPCrYf4udXBzBpIFgDUCf9ofdEYKZKDfcR0ujkZRVHv0eXlCh1COnBH85ovdIKQZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758044413; c=relaxed/simple;
	bh=PxvetKEOhfVbyfSpwxBKJTHQyvB2pN17CD9NoGUgrms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SxMeOeVAodGIyR11IZ5YXThAojdX+0r6VSqmA0wybg3DvSFfBO5GmZ7vAZ+AtSW4qcS/2bNhbCXD32gSA/u0TYH+PlhptuqJMNNs4pOr0XQ0S+2i6VGjUZYIuzK9EB1RkNNzfFVsw0a4ePlVFyl1onhwMJjjwtZjM1SCUgd3414=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iH9VgBGB; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iH9VgBGB"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4b5f6ae99c3so57681861cf.1
        for <regressions@lists.linux.dev>; Tue, 16 Sep 2025 10:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758044411; x=1758649211; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JHjtAeALUMqVAF+B7s3r/BTz86GftVTXFBmSjBBmByk=;
        b=iH9VgBGBkBji+C4Ej1Qt/AoPZ+RJDVt2dc8s0mchgGxG7o2J63IZg4gF7sjdhr4vd6
         1MCtRxBwOfzdd24Bluiu5at4uDAs6sZ3HwLDh8jhA6w0SCA13f1yPT8jhVbvhdIPvdlF
         mWFcLRdFB/rpQGRvrPjzs8lCCXhm4J+BtibB6VKmopwLInGkGgZ3dPDKhkYVqGw527ax
         uPyWJBiObwdsFaMV2ca2obgY1rUhYwa+uVpZlpG4u1lL9NrLH9UOK2vdtamRYaYKN7+v
         1iPhc+dCZ+Bwi6nC1ti5fuqYdGU64V5YG+sQgAnnik/gjkrL0Ok0EfWGckA17YHJaFyg
         HYwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758044411; x=1758649211;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JHjtAeALUMqVAF+B7s3r/BTz86GftVTXFBmSjBBmByk=;
        b=wCotUseVMvUYTre41NzVhcl+pVc8DyUlzd5XILPffEmktEcBZ26vssMG7py+sJVrnd
         5iCQiCXKtbzuNWpu07619HuArV7UpErsPq2O58bFt3vQZK3kCmIwx7+LpNbkfBEh/nu2
         WYK8mEIKz349lvMr1F73/rL8b4WjPlYUHIOiH316ehFoWIWOkJRcdc3q915Ejq9rXJtS
         sR2s2vO9ydTM1OuTNOSiYrw71Q3vWrHlA3gzn5sp3b+kaIR8gK3uUK145BaYKeQyYiuC
         OFpf1gRVlmmsxM68prZTLrD9hOkRz7GCBlz3lQcjM/d+w7GF55MqscttMcst1cNexlBs
         DYxA==
X-Forwarded-Encrypted: i=1; AJvYcCU8H02uNgjQC2jK9Cdr+fWsD7XGSATbd4qDJqckPkB26xlWNW/xRydkpi4uJKw0SjCBEZdKKpybjMnaww==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxt2y5MhZfrYg7R4Fze3CNHQfeReJemm0Hp/Ja91YUBWqS85b2h
	GJ36ED0DbhxGn5unkHtcy4UtajcYFl/qp2ylkUwEovWXSN59QcrUIqDH
X-Gm-Gg: ASbGnctDYG2CXLSTVDbELBuprIkXZYt9CwI3JMpSpfjWKBIcm7VFyEaOOVDFd6j3h22
	QuknefMll6jeqANwcYoWEY03JGIqSVT9vc0EWyr8Xyo4V0e/QdCCCQY33is33Zh8gQTv54RP+fm
	hnOSispEpxWBaAxIJeUl5vrCA65QFa+BswI25pBLCXYPw0v4dM02maf6ZGAW5ydozwiFtOstYCB
	LmOTXjhXiEY8WQnTPex85svGLmWdbIEzwFFQlhuxSjOryJ+wUePpWKxR8isldD38W1jmxh+6AMa
	Nb0LMNF4n9+DV6+6yZMkxIgTsrp7hL+W795sERNNU++6ylZUpCKST4uZAJNSRsjFK7DQG1eMqOY
	OQ9uC39tZXf0HQVg5ufQc22IwkUmfVdaDI8w5gH8ubTRtRGN5/dHaYB6ocpuk9WgGIz9V1aWFlu
	dc01eYZfhf6GvpVwx0ZqlvkpHGMtpo1k60Ig==
X-Google-Smtp-Source: AGHT+IELsH96NHZ4V1/i4oKsQYgGeqITcLKs9/I1AQ/N8yOvozUhQxZYMpvNpRkJ5TJD97CuaZUFlQ==
X-Received: by 2002:a05:622a:256:b0:4b5:ecc3:694b with SMTP id d75a77b69052e-4b77d014426mr178894371cf.10.1758044410811;
        Tue, 16 Sep 2025 10:40:10 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b639decd84sm87780841cf.50.2025.09.16.10.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 10:40:10 -0700 (PDT)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id CA929F40066;
	Tue, 16 Sep 2025 13:40:09 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Tue, 16 Sep 2025 13:40:09 -0400
X-ME-Sender: <xms:-aDJaN-9Y06rbtghemJtEwjApYjwQXfGadMSyPOwxuN1CrE-iDVteQ>
    <xme:-aDJaF3UlyKibAJUrRZkx6lPGGkY2KZtqke5ygD13MB5J2ezfe9RCez85GaQJ4mvL
    G8zSRjniegfdfk3mQ>
X-ME-Received: <xmr:-aDJaIC4cdi2qF87RhsrJ487cd3nKJbmrClFmVvVw5gkxD7Gjt0nC5l_jymbko_yZU3mO8UnrOUlNxJLAsyLOuxHLCGx97GSo6sDcA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdeguddulecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeejhfeikeekffejgeegueevffdtgeefudetleegjeelvdffteeihfelfeehvdeg
    keenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgv
    rhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfh
    gvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthho
    pedujedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhhighhuvghlrdhojhgvug
    grrdhsrghnughonhhishesghhmrghilhdrtghomhdprhgtphhtthhopehnrghrvghshhdr
    khgrmhgsohhjuheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprhhushhtqdhfohhrqd
    hlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidq
    khgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhgvghhrvg
    hsshhiohhnsheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlkhhfthdq
    thhrihgrghgvsehlihhsthhsrdhlihhnrghrohdrohhrghdprhgtphhtthhopehojhgvug
    grsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhgvgidrghgrhihnohhrsehgmhgr
    ihhlrdgtohhmpdhrtghpthhtohepphgvthgvrhiisehinhhfrhgruggvrggurdhorhhg
X-ME-Proxy: <xmx:-aDJaMAqEC3lUKTN_LJI3CpkOLGxOZlDBsOzp_gnJe40i0KMGgH7-w>
    <xmx:-aDJaJOM8MF4_xwJEDkyO76VEYI_sVIvpZzwj6o8SJeoVxlKrky0gQ>
    <xmx:-aDJaGOf-8-5ZG8k0o-UXKLyPxL1UtYNwtzqzaV7Zv1IDNR6_oHsMw>
    <xmx:-aDJaNtqwgUjPsWzNHczuxJ21j4b3cRN1Z_E9GZtvXdNZDo0Tdt2ow>
    <xmx:-aDJaL9gS9abOkrDdNam2n-ylBTFpKmvor7Cznxa36tZb6immwH6ujjc>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Sep 2025 13:40:09 -0400 (EDT)
Date: Tue, 16 Sep 2025 19:40:07 +0200
From: Boqun Feng <boqun.feng@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>,
	rust-for-linux@vger.kernel.org,
	open list <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	lkft-triage@lists.linaro.org, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Alice Ryhl <aliceryhl@google.com>, Benno Lossin <lossin@kernel.org>,
	Elle Rhumsaa <elle@weathered-steel.dev>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Anders Roxell <anders.roxell@linaro.org>,
	Ben Copeland <benjamin.copeland@linaro.org>
Subject: Re: next-20250915: error[E0425]: cannot find function
 `atomic_read_acquire` in crate `bindings`
Message-ID: <aMmg97aXBLMb_4a-@tardis-2.local>
References: <CA+G9fYtT7HNBM2XBbePeZ-Fw+ig7SJ+JE_NpQ1VuHR_TvAjX2w@mail.gmail.com>
 <CA+G9fYs4JB0ngq+aryXHVQSq-f05cb4agCfyM9zN0SgprQf0_A@mail.gmail.com>
 <CANiq72==_ch0_7ZD8EEc2AOW7Yz1-b8i2ae0X6xDSkLJy=Dm6w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72==_ch0_7ZD8EEc2AOW7Yz1-b8i2ae0X6xDSkLJy=Dm6w@mail.gmail.com>

On Tue, Sep 16, 2025 at 06:40:42PM +0200, Miguel Ojeda wrote:
> On Tue, Sep 16, 2025 at 6:26 PM Naresh Kamboju
> <naresh.kamboju@linaro.org> wrote:
> >
> > Anders bisected this build regressions and found,
> >
> > # first bad commit:
> >  [eb57133305f61b612252382d0c1478bba7f57b67]
> >  rust: sync: Add basic atomic operation mapping framework
> 
> That is very useful, thanks.
> 

Yeah, if this is the bad commit, I believe the issue has been fixed.
Because that commit in linue-next indicated the problematic locking/core
branck of tip was used:

eb57133305f6 rust: sync: Add basic atomic operation mapping framework
76eeb9b8de98 (tag: v6.17-rc5) Linux 6.17-rc5

one patch was missing in that version as I mentioned here [1]

[1]: https://lore.kernel.org/lkml/aMWMVQiZxE_mv7va@tardis.local/

Regards,
Boqun

> We (Boqun and others) are in the middle of Kangrejos now, so we may
> take a bit to reply, sorry.
> 
> Cheers,
> Miguel
