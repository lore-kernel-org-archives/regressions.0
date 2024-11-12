Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F56A1EBFFD
	for <regressions@lists.linux.dev>; Tue, 12 Nov 2024 06:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731393708; cv=none; b=PaFOSK9fxRWIlTN2bhygnVy16cQ32Qb9Iw7rG4andASsFszFDCEcrn+QqSR7ndGkhS7K5Hte9s5MfjTX7Qz/X3iGeeQo0BJaKVcRO4WAfK4t9zG2JsH637sGSS+c9KkFD4tEQcUQ1nDjn2pwk+kzkSt5Eilq41j3QG/HH+ZxJEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731393708; c=relaxed/simple;
	bh=b0yk5VQJKx15qg0sksuuI1hsq8uKrXNsJSOKee4NXlg=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=T+euOEOtOpdMOI9CFRiz9tCrSA2l0aiLL5HJqkj0FuTnDtOb4QrxG8sr1JmVOSd3jj8eaG0MMO8Omn2+In+05wvet5zmGqfGPbC9VbCtADQ8NLqdzd7rm9XGSj7pZtwUcM9pgLjnKfH4NKf9Ks2I6zxFfcz5XeuxA0eMCdYv/QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=MK/02P4x; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=kuDaKZQl; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="MK/02P4x";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="kuDaKZQl"
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 2DB7A1140074;
	Tue, 12 Nov 2024 01:41:44 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Tue, 12 Nov 2024 01:41:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1731393704;
	 x=1731480104; bh=/LH71Z4G81qeY7e3yM9xTU/um63mCG2PmsvtyyG8Fv8=; b=
	MK/02P4xdiycp/e/thJGUWj3FujbbIlH2flqJafEUzwJl/CAM2txKZeVV8nLzL6g
	F285clC4Jt/u5R9rTQoNGOr6HVGKeh79ZRsJIYxi7juFAatFbbMGF9CTV5zh3SZH
	AZ9unIsDv0oxL4Dj9nDLoSVZwt4zn5UZx50EBrwY6CK9xbEq404XK/CLut7SdqXW
	aQhZV2xuGNzpRLg/De/yN/aRa7EfyT7gm10qIHsltSITEQO1bHu0qIg9T9dKCr65
	GrS15S/0wun7l/8tkI2n1MWYNKGF8KKymflJfSXsrH+aX8yjc5+CgzwMoryYGhG3
	26JGaeO8E/CrmB2ByM7B6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1731393704; x=
	1731480104; bh=/LH71Z4G81qeY7e3yM9xTU/um63mCG2PmsvtyyG8Fv8=; b=k
	uDaKZQlPfEYtYNecyQZJgZR6Bid42elQVpm2xkDLrN5xQax/ZGRMDcRPVapca+sS
	Z012wMBSj0bRd6byxn+SLcVGYt28I2MFbn9+DzfQLe1sdyNk4UyvBQEH2HU5OrpJ
	mLfk2ctv/lHReMj9UKYm53taEC0IM1rp6JX6iT1lvUju5hGiLjuGbsCDQhqrq1Mb
	TxdenoD49F09pN+Z+XyTt3zCzZanLiQBEfPd8yANEPxqFldr/xdBE1p6c782gMiM
	1AApgnO1fYbcAsoc0ep5zOVuLlEqOTw2S4ZUCvTmYOpoCSKzi4TOYjwNJniZP31U
	zP0r3dj2zxHMg2SuVx67A==
X-ME-Sender: <xms:p_gyZwiiiHTUktXxxoraVmY6yjey6SGBBn8XlbkzXoAaZRKnO9f-6w>
    <xme:p_gyZ5BJFvdHyWTh5tsmsPBV2wYkJZvfaThdsmFIRDkMuObHfMyyDAk8b0YSfnI9Z
    hktVXzPKBoDu--076c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudefgdelkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeen
    ucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdrug
    gvqeenucggtffrrghtthgvrhhnpedvhfdvkeeuudevfffftefgvdevfedvleehvddvgeej
    vdefhedtgeegveehfeeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeeipdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghsse
    grrhhmrdgtohhmpdhrtghpthhtohepmhhitghhrghlrdhpvggtihhosehgmhgrihhlrdgt
    ohhmpdhrtghpthhtohepkhgvvghssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlih
    hnuhhsrdifrghllhgvihhjsehlihhnrghrohdrohhrghdprhgtphhtthhopehlihhnuhig
    qdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtph
    htthhopehrvghgrhgvshhsihhonhhssehlihhsthhsrdhlihhnuhigrdguvghv
X-ME-Proxy: <xmx:p_gyZ4EKteK-_Juguh-381HHtYcfVqnqJhPCLhoOeeTYPgXnNcbBAw>
    <xmx:p_gyZxTLVAC_nJY_pvzsRdzTx6aPgFjsrrjPQl_bmrkxRJ2bzoLJmg>
    <xmx:p_gyZ9wzQh1kdxD3FHSV6ry_OPDczP2HP9mUXcnJfOGys5p8N9x67Q>
    <xmx:p_gyZ_5Yfgd5WGBG0g9frMKugDgvb5uSUt3AdR-8s0LhjqO7m-H3Hw>
    <xmx:qPgyZwqQMrun3yE2El5hnpisMo3eQero0ykaGGHCtcctNmJMZhPrdfoI>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 357A32220073; Tue, 12 Nov 2024 01:41:43 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Tue, 12 Nov 2024 07:41:12 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Walleij" <linus.walleij@linaro.org>,
 =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Linux kernel regressions list" <regressions@lists.linux.dev>,
 "Kees Cook" <kees@kernel.org>
Message-Id: <014edf04-a5ac-4a02-af76-ca2616c3c4ab@app.fastmail.com>
In-Reply-To: 
 <CACRpkdYsgnBFsyF9upr=xoLdMJ25DCXMEJ-co7rJTnRanJncug@mail.gmail.com>
References: <20241111233817.2f824c19@foxbook>
 <CACRpkdYsgnBFsyF9upr=xoLdMJ25DCXMEJ-co7rJTnRanJncug@mail.gmail.com>
Subject: Re: cacheflush completely broken, suspecting PAN+LPAE
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 12, 2024, at 02:15, Linus Walleij wrote:
> On Mon, Nov 11, 2024 at 11:38=E2=80=AFPM Micha=C5=82 Pecio <michal.pec=
io@gmail.com> wrote:

>> cacheflush(0xb374a000, 0xb374b000, 0)   =3D -1 EFAULT (Bad address)
...
>> So I guess it looks like there is a problem with this feature, perhaps
>> a missing "permit user accesss" somewhere?

>
> static inline int
> do_cache_op(unsigned long start, unsigned long end, int flags)
> {
>         if (end < start || flags)
>                 return -EINVAL;
>
>         if (!access_ok((void __user *)start, end - start))
>                 return -EFAULT;
>
>         return __do_cache_op(start, end);
> }

I would guess that the problem is not the access_ok() but
the actual access in v7_coherent_user_range() that does
not appear to call uaccess_save_and_enable() or its assembler
equivalent around the lines

      USER(  mcr     p15, 0, r12, c7, c11, 1 )
...
      USER(  mcr     p15, 0, r12, c7, c5, 1  )

> diff --git a/arch/arm/kernel/traps.c b/arch/arm/kernel/traps.c
> index 480e307501bb..400650519bd1 100644
> --- a/arch/arm/kernel/traps.c
> +++ b/arch/arm/kernel/traps.c
> @@ -592,11 +592,14 @@ __do_cache_op(unsigned long start, unsigned long=
 end)
>  static inline int
>  do_cache_op(unsigned long start, unsigned long end, int flags)
>  {
> +       pr_info("%s(%08lx-%08lx)\n", __func__, start, end);
>         if (end < start || flags)
>                 return -EINVAL;
>
> -       if (!access_ok((void __user *)start, end - start))
> +       if (!access_ok((void __user *)start, end - start)) {
> +               pr_err("ACCESS NOT OK\n");
>                 return -EFAULT;
> +       }
>
>         return __do_cache_op(start, end);
>  }

This does not catch -EFAULT being returned from the USER()
trap in __do_cache_op(), so I would expect it to trigger but
also not to flush the caches.

It's unclear to me if this problem is specific to the TTBR0
PAN variant, or if it can also happen on any variant of the
CPU_SW_DOMAIN_PAN. It seems unlikely that CPU_SW_DOMAIN_PAN
has been broken for this long without anyone noticing, but
I also don't see why it doesn't trap in the cache flush
when the TTBR0 version does.

       Arnd
