Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.202
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794943778;
	b=EY516+0aXaSP5nbtGsz5ZDq8488exQt1xQLBM6EuAcB3DAs0v6Spolup3XAUl1iD7cSW
	 CcfvgKirBKB3HzPHe5llJ/+wVmS63wNktzMsfpW2KBm7Z9qP5isp8XA9dpIPca1uhbwm6
	 VYdjkoA0sKHhgS2UjHA0Pbino1LIwyDh67TDnBvwBZ2GBw1wCptJjgnGSmya+xFuvqUnM
	 EwGFLmRcLvrk7Yji4f9+6eno78YZRh6i6qXchRsB58sD4pzCHvGdm4JsHL5jmxH8P6dZU
	 GMAoCHYhUegcNU6QLnKeeTS2/dV8MScV9C/f4T190jZEPkHhkT1iSd5lMhTy8Mc/I3Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794943778;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=PGjBYsfF8c+MCFmt2RtqM8D82MXv6pCt/UIwi1wWB78=;
	b=A+oMHTevhZJlELy0ikMSmJ9/q30Ffr/gPgrO2zSYlojDwLS+KkKi12uSUFH0cRUjkaQO
	 TMhW/roDYiqttflg7w9yuGO/aF6rCHDO5rxbC1tUIECIyJtgimJ2mfijUExqebsX7rhpf
	 UadLIWtoRIQFneszq1YAo7O7AQiHuY6DJNycr4ip1kmRDwtnILkkni/hy93sp6I2gPRuN
	 wVbzefOc0bwJhg8QF7vAn7b9u0ailjKppVCSQV8U7yIL1dOk5FBOeyaTpoUkfp6N8bKrA
	 /lzMzsKweXrISkV2E+ijVOGrYdVOTBIF+IT5RGyLG3aHfjOWXiBSppX/Oex0uDTrk6Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=raxo7Xvy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.202
Received: from mail-oi2-f10.google.com (mail-oi2-f10.google.com [74.125.231.202])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38886606A32A
	for <regressions@lists.linux.dev>; Tue, 17 Nov 2026 19:29:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38886606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=raxo7Xvy
Received: by mail-oi2-f10.google.com with SMTP id 5614622812f47-4b94bb43008so10405b6e.0
        for <regressions@lists.linux.dev>; Tue, 17 Nov 2026 11:29:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794943777; cv=none;
        d=google.com; s=arc-20260327;
        b=E+UotPth4P6pyTorAjQcfiGxdzcdKobxuEY85XsQL1VnRPKJyVu9Sv3KNEwBkt5Neq
         Fw6e+u+54W0rC5VLBfc+mPYIWadwOKy4D63MNHFU/IxO6nfnRSuoxwnUkdkfRL6SNEdn
         ReX/NdT9qKzUojwaUlbE3eoRoKCqBvRytCIa/WERU0k9iW4JGJR4kKA4Z4v1K6t/6Rdr
         AGmM4hXHv2p6Lw1at7k1uNrO3f+p2rSjv10/E3B5Z6juRW/OFMZMj5q+TM1LOFzCoD7N
         h6acIhHc9DL/MywdHghmuwDu3+m54WQyjquI0jKvwIPP0jRTEHkz36xbe4HgmMNpJDKT
         S80A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PGjBYsfF8c+MCFmt2RtqM8D82MXv6pCt/UIwi1wWB78=;
        fh=EQ6FwLw3GWCa4WXbLcsZpbzrbw7wkIx4r9mKlC7c6Zs=;
        b=Yo2wlSWNECHT2IYUY1ZxNvC8tp2jo85FKyrBOLJoQbVZG8Mcoz5VhjTE9rHd4El4AQ
         EWbf3RdtNwa0ab+vD1OhqGOCk0lqoTqocAXHxeQPkWw5VL44+3iun2W4ULYfqAitqDlF
         kT+AoNTF58N/1fAk/LEnHmoEeDgEYK8KhRh2C22Dp0dUFyzkPTjucorw4Jd1Ze49hfP7
         SgNpkeh1puFjmXxJRcNVeLsrHsaHU+l8XnAVaw0Rc3niqjf19sjHfwEm9rslsKGMf1Ay
         VQ5nU6icLB0LRJN0X4O8xGApzxESDijClwVuHuzHq0tho1hMEOJoEevTRxaytlnxgyqa
         j1rQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794943777; x=1795548577; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PGjBYsfF8c+MCFmt2RtqM8D82MXv6pCt/UIwi1wWB78=;
        b=raxo7XvyjWnwks15PNm1DmPs+Du/nTIp90HQt6YwrHztXk5QpU36zdlx+CzMX+txlb
         9380y81QOgQ4IQhryCVVsNn0x/ZBqsBCkQha+Np7Qxrvs2J92RTInZ7Cpcrsq9E6ex0x
         S+7uyiwoMZ324ZOmKKv6VWMnuRfEkUA/316mwJSulU8Xu7dboNdY/8c0wt6bd6Cys/9p
         vQaO3e2lb/N5J5iW+6RAHygqY1aiVrYKIQ2iSWJ4+DUiED/pcrMSaSkRT2j9UAmhY/UI
         KQNnnJjOnr0ghBoCMIUD3F8UmO81eLzWaUIvS9Y+gQHzfp96TvkS9V6WsGbLpi+FsHOV
         BwaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794943777; x=1795548577;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PGjBYsfF8c+MCFmt2RtqM8D82MXv6pCt/UIwi1wWB78=;
        b=iPBIdnFUcStkcJwROwn464sYCQgBEHNx+LCsoqn/jbdKrro59ZGPN48mHe4JAt7Jlk
         vGqEITKhyFDjGRFPFEgvhCdY13thMKq8RplFHTbiYsU1T34W1SELDU0QaBFR+b1+tDQ7
         Iw6906Z7V6zlxeNUK4YdKzxbZFWBTJJus7e73dAfsv9FyXQqSg0wrd9o5+T5RkEvPi7D
         MmsALdcaDie4Ubm8Y8TKINb1zwMmV7mNFoLakrBblInWtiBqvv0YEtfkKUnxBnQ0eM5e
         YwwqePKfIyHEaQqlMZMzTkzo5irQrFwUU3PNcAMa02/jnMlweZ5MT0V2BYD3D9P7K059
         66wA==
X-Forwarded-Encrypted: i=1; AL+hErEpoMhBHXbcz823EqO+CjMKQ3NxLb4/EHhyQuxmv3+Iq6xbrU2YebmLcsaXPVzV85sRVfSr6eNd8O4WaA==@lists.linux.dev
X-Gm-Message-State: APuU4Z8YYaBF6QJ33sbpyJDvp/tEU3heM4w6K9YGL3TGJdmcDL4civdK
	2OU2OnEODESYwYzQ0sd0v+g7z6MKyUy+TRyKCvZNvAJPTjY4o3KCXfUP8XDw4oPtbnThmuuj8D1
	3ikRrs+B0KDP5JZ6xfflK8zsxkReTBIg=
X-Gm-Gg: AYBFou2Xxj0jLXStYpkFW9QWChMsPszy85YP9yw3UYre5TzsMsbVoKw3Jo+Tu2Lg4b9
	QbVr/5MFa9C2hBHm8p2W5M6pXrUXVOjbFRD0LxB5lTYB9iXzfhjHKyAhctZ4GSbgubigGAUmoLX
	eUzB4OKhH0axUZRh/nyJ88pbOrb+3fdn86JoFEmzOK7ABaOxbRnwZl3VDNnKmD1rnwcG6xPZ2Vg
	IBJ652H1ujjwFzkKIiCulhQ+X9nrBa0KrTy5z65ZgRSEu32b8aWRtXMi93cdXcIp2EMSIzKgO5V
	YzxUsxUdXx7pYZLZ+fHjGnSPusfzxGzYx/P1by8UF95+QCX83cK1zyqRv8eIxkI4ZeGdEWjHgC8
	U71rMk01UL4BRDX26UE5G/Kr/5bzFrYgqCsJrgjc/vwVJ5wM20KEB/ywpPjIpSI0gkI+Ry2oz/n
	3YhAtZGQyEiZePfuV3Q1TGO8ac0Xolij7Su54aWtBU27qtC3XeQu+U
X-Received: by 2002:a05:6808:30a9:b0:53a:e153:e8e7 with SMTP id
 5614622812f47-57741d17630mr920531b6e.44.1794943777052; Tue, 17 Nov 2026
 11:29:37 -0800 (PST)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <CAJ6F8CFSfgdZqaKMndGZtbaww32Xr_KVL3gA_2Jemgv9i9vskg@mail.gmail.com>
 <CAJ6F8CFgkgksyk6YM3NdMkQNhSFWV4depC4c-mHvpDHpnjhM-Q@mail.gmail.com>
 <6ab4a114-57b2-40c7-99d4-55a4ac4c9a9c@leemhuis.info> <CAJ6F8CHzm4=ryY+j3ao6doR=-67Lq=3-w-kbhk1wdvtYDhyNeA@mail.gmail.com>
In-Reply-To: <CAJ6F8CHzm4=ryY+j3ao6doR=-67Lq=3-w-kbhk1wdvtYDhyNeA@mail.gmail.com>
From: Hungyu Lin <dennylin0707@gmail.com>
Date: Tue, 17 Nov 2026 11:29:25 -0800
X-Gm-Features: AclHuK-EvuFT3sTbDUuzVCeVohToLo20JL-jPaY9zCV6KfEdKeWy3NzN4uK5qVs
Message-ID: <CAGEkeHdxaC2BBg5wWOCL0pj0r4Ks6mD_a3KpE7h+en9Aupb4zA@mail.gmail.com>
Subject: Re: [REGRESSION] ntfs3: existing files/dirs with ':' in their name
 became inaccessible in 7.3 (ads on by default)
To: =?UTF-8?Q?Cl=C3=A9ment_Smagghe?= <cle.smagghe@gmail.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, almaz.alexandrovich@paragon-software.com, 
	ntfs3@lists.linux.dev, regressions@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 7:43 AM Cl=C3=A9ment Smagghe <cle.smagghe@gmail.com=
> wrote:
>
> I'm happy to test patches.

Hi Cl=C3=A9ment,

I sent a fix that makes 'ads' opt-in again:
https://lore.kernel.org/all/20261115103845.56074-1-dennylin0707@gmail.com/

Could you reply with your Tested-by if it works for you?

Thanks,
Hungyu
