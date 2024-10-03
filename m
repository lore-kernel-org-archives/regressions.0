Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296F81A01B0
	for <regressions@lists.linux.dev>; Thu,  3 Oct 2024 15:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727967743; cv=none; b=O2qx49DR+Kj2dVcRDHTE1Hbase/bTOiBMfoPUUDnM8B2NEpb225SQk/stCnER3mmLAtVEMS8O2kFCugUdDhrV3j0X8IZukIgtB1szNIuCsJsdHSbT7JvU8hjIy1n0IjGbaFDST+JW64Fjn3D/2m38BglOsbl8yH/zNYpBLBTO4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727967743; c=relaxed/simple;
	bh=0o4zGq1l8dC78VSp0hLET3Oej+NTqvrr3gSjrM5DOQA=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=sLXPK6kVCES2FsRaZNNuLukD8sUI2K4+DIx/WEPHxiTSQlO7ia4fZxusfquxSDNhtWK/L4NjFXAQlOjKZK0Com5IkwtoOE1Va8q2/OiBnFDuHRrYEd8crhSYIolZzleBDMJVo+TWPmKLygXBs+aXgLvdLAU/NT46lIXX68PVJZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com; spf=none smtp.mailfrom=toblux.com; dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b=ADPtjCbk; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=toblux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b="ADPtjCbk"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42cacd90ee4so1558855e9.3
        for <regressions@lists.linux.dev>; Thu, 03 Oct 2024 08:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1727967740; x=1728572540; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0o4zGq1l8dC78VSp0hLET3Oej+NTqvrr3gSjrM5DOQA=;
        b=ADPtjCbk0oClbmNGIwL3Bh5Tts99qLSkReg4jsrFNQr00+9GBdAdN4Foq+ewelyqx6
         /P6Erf1iKtULRXfGVs3jsZNtJM1Vqa2c1AVdxQwlv5ZlF7ci2xEaDDjDhO87RarCtZro
         QZ2b3arcUcTGtcvAv3/sXU69qqhCwer1VLXec2REfxkclol4Wsc8pNmobzA2OXNTnnz3
         YNf4JmULr3e4w/XB1k7gjCgSfzhkCod3DIqMpksclIcqZNmSIewKeOuyxjKn2cvYAVyd
         QI75YQ0ibiCdLN7oeCF/Jul1CRKbUAzf+lzGbgujiHc5c0wC0YeTZsuGNx+f/VYVAgM+
         32qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727967740; x=1728572540;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0o4zGq1l8dC78VSp0hLET3Oej+NTqvrr3gSjrM5DOQA=;
        b=djpmLRH/HslZBzX8pAaekGrvz6xYwrUrlRkrxpMv1Rm1F0DHzTFfTgrmO5fXSUPbhf
         2D42dHq577shHbIWWqlThV1p5xjfzwqqTcyrbCIXUE9f6PuBzx6wJy24eh/OLVQR71sv
         vRLc1gav4zcHcgSqnSYe8bw6mAwfuZidu/S5Or51mQtlPbiOgu78zluZkOvVlRSgkfIF
         3iWTggb+wAqwdOTWlzYjTubxK6YDdcM4D0moYzO5iaTkDD/RUTKyFsuz0admy96OYkA9
         i14YjYjD8tXgZZKdxVwDHcPaMKeToOD4G6oRtzsPuxZuNL5bXQMMf4L/v1JNFWGkEpA8
         sUkQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2n5LVaB76qXpt8V3/YNhWUEC35XME/HCpAV9Z+EUwxgquQAfhLMhY2DUk165KLbcZIyLy0KbXsJWk7Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxG3bh6zNte5H7pdQCp0CRs6rzQalJqrqRv+TVbLX1ToF7GggoN
	53KuMvuNl999Kothn9EgsirA3FUCGy8+OXkGfEjUdP4tVIXnzml66M1I6q9+AfA=
X-Google-Smtp-Source: AGHT+IFkImjjIUquq+gA7uxKoSKuU17rdWrRxPkQdJ+pAAJ+j4djTiCNVLXTTtRJsnFkETuOUvqxoA==
X-Received: by 2002:a05:600c:358f:b0:425:6dfa:c005 with SMTP id 5b1f17b1804b1-42f777af26amr26043395e9.2.1727967740138;
        Thu, 03 Oct 2024 08:02:20 -0700 (PDT)
Received: from smtpclient.apple ([2001:a61:a4f:301:1558:85f1:4dd0:3ea9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f79ead1absm46665475e9.17.2024.10.03.08.02.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Oct 2024 08:02:18 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51\))
Subject: Re: [REGRESSION][BISECTED] erroneous buffer overflow detected in
 bch2_xattr_validate
From: Thorsten Blum <thorsten.blum@toblux.com>
In-Reply-To: <Zv6YInHiwjLeBC3D@archlinux>
Date: Thu, 3 Oct 2024 17:02:07 +0200
Cc: Kees Cook <kees@kernel.org>,
 kent.overstreet@linux.dev,
 regressions@lists.linux.dev,
 linux-bcachefs@vger.kernel.org,
 linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 ardb@kernel.org,
 morbo@google.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <63D4756D-31B7-4EA9-A92F-181A680206EF@toblux.com>
References: <ZvV6X5FPBBW7CO1f@archlinux>
 <3E304FB2-799D-478F-889A-CDFC1A52DCD8@toblux.com>
 <A499F119-5F0C-43FC-9058-7AB92057F9B3@toblux.com>
 <Zvg-mDsvvOueGpzs@archlinux> <202409281331.1F04259@keescook>
 <21D2A2BB-F442-480D-8B66-229E8C4A63D3@toblux.com>
 <Zv6BEO-1Y0oJ3krr@archlinux>
 <E8E64A72-3C1C-40D2-9F07-415F6B8F476E@toblux.com>
 <Zv6YInHiwjLeBC3D@archlinux>
To: Jan Hendrik Farr <kernel@jfarr.cc>
X-Mailer: Apple Mail (2.3776.700.51)

On 3. Oct 2024, at 15:12, Jan Hendrik Farr <kernel@jfarr.cc> wrote:
> On 03 15:07:52, Thorsten Blum wrote:
>> On 3. Oct 2024, at 13:33, Jan Hendrik Farr <kernel@jfarr.cc> wrote:
>>>> [...]
>>>=20
>>> This issue is now fixed on the llvm main branch:
>>> =
https://github.com/llvm/llvm-project/commit/882457a2eedbe6d53161b2f78fcf76=
9fc9a93e8a
>>=20
>> Thanks!
>>=20
>> Do you know if it also fixes the different sizes here:
>> https://godbolt.org/z/vvK9PE1Yq
>=20
> Unfortunately this still prints 36.

I just realized that the counted_by attribute itself causes the 4 bytes
difference. When you remove the attribute, the sizes are equal again.

>> I ran out of disk space when compiling llvm :0
>>=20
>>> So presumably this will go into 19.1.2, not sure what this means for
>>> distros that ship clang 18. Will they have to be notified to =
backport
>>> this?
>>>=20
>>> Best Regards
>>> Jan
