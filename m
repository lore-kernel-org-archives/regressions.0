Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820E61A0719
	for <regressions@lists.linux.dev>; Thu,  3 Oct 2024 15:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727969444; cv=none; b=YSkP5r6CPeOyuwnOPiVaffEkCrxGsNArRNnV9rMXNk4GS5pP69XjBOIQX/TUCU3hbyPXxUjx1xsnN9gxh0feZCY6Uc0sTJXfZonW9V4IEn/mGBG6zFbJ7mlDo79NPX9R32i0S2t0XuzSqXrm3yzmG36cGNGAWtHWV9aECHlM5DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727969444; c=relaxed/simple;
	bh=Cx4Y4EIPbRLGBZOJ2U9uswU7XGSHhz+L/e8UGfY1ngs=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=g3Vih5lw3C9mmZFxAcYx6jxuy/5+UQiM5wZyFoTkzPTB/G60oNouOP0bf11ekybXJ755ujcaDDJDyS1kIBQESz/hks1b6yPBLep9wsYN7mngQ59QpJpNbukDnM/HPeOtgoYBw2xWYnT30QZNgk+N6SfMBDUAuaJJW98gH7SXaV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com; spf=none smtp.mailfrom=toblux.com; dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b=I4UvE8C8; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=toblux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b="I4UvE8C8"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42ee66c2c49so1629085e9.0
        for <regressions@lists.linux.dev>; Thu, 03 Oct 2024 08:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1727969441; x=1728574241; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cx4Y4EIPbRLGBZOJ2U9uswU7XGSHhz+L/e8UGfY1ngs=;
        b=I4UvE8C8pbfXeR3a5nxCeo58+1TCM/T9ms1LPgnCkOalMLSxtWutrQ+w0L9iSdWCya
         l79O/iucmRc4b3McEn4vnBHcYWUzQRjixGD+M4iSMNUPO/DvkO0Aamk8Mj+zcwoouiAR
         SggIy7w1XuJ9/dyIvopK9ognU+w5uRcXFuQpYx9v6Llo5PhZfCmLJMTKcA+jCLwmk3qD
         85OULRF35teI07cP+p+Vc81z8L1rPOXcgVRgOyUTjXWKcDl2KEJezdfPt49zQ8unzuJ9
         HXKZyRvUodMfx4ykonFL2BAXmyryQTZCK0zvty5R98x0vO7uh11aHby0NuQ142oZN62g
         vBVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727969441; x=1728574241;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cx4Y4EIPbRLGBZOJ2U9uswU7XGSHhz+L/e8UGfY1ngs=;
        b=lTlldo7X+rfM08o7jh8kUTOoPJk08XfmdyuLYvdl6UMBshIoJpl+VPLKFwsWttcK21
         8XeG7Sjo0mhK4/MNZ4xizc70AYDN81xaWuvR+hX7onwuNzfNc2wMydjnUTCB9lKl2THp
         6CvBSo9umYdWVLqODpI+ptfjpObG48dJq5UGr3LZpGo0cWR8jdiz9b8T6p+/3NOFQRL4
         LAapz3A65uckCN3cLtfaT57+H1sE5ipC0InzOvn9mGTslMZowQxg5zr/2IcrqTspn1gj
         hS/HwD3LqimIHd0xzTW/qH2MqmLzwt7njYU58WlPxQfuXpG2OV3yhhDvaoqpsiXot8Hl
         HoFw==
X-Forwarded-Encrypted: i=1; AJvYcCX6N6swNGPEnYgkhGXGfflRJOqYetUCeXl17+qrLsG1XJ6c9+vM0mnA07uDNqiuSn+a3j/2+oqCfq3HJQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxRqZtH4D6j5aRClnid2quA+o9BMPWaKxIT24Z7i+3MtnPdbg0X
	lgvqAM3M7fZPjyB2xP7kkkgz/OGsYCvCZIM2U5+IdobzWz/OcvInEdMNYEHSLXMbmSCDqf4y0JV
	U
X-Google-Smtp-Source: AGHT+IG1CWXzgBWSp2zEqk/fVKLo93dcFsrO6YxiqkpAdkLG0XAdvAg7Dxpmf46BKl4Jop2PrKfgqw==
X-Received: by 2002:a05:600c:3b02:b0:42c:ba6c:d9a7 with SMTP id 5b1f17b1804b1-42f7d0a09a9mr18086265e9.4.1727969440783;
        Thu, 03 Oct 2024 08:30:40 -0700 (PDT)
Received: from smtpclient.apple ([2001:a61:a4f:301:1558:85f1:4dd0:3ea9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d0822b94fsm1504884f8f.46.2024.10.03.08.30.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Oct 2024 08:30:40 -0700 (PDT)
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
In-Reply-To: <Zv62pi1VVbpkvoDM@archlinux>
Date: Thu, 3 Oct 2024 17:30:28 +0200
Cc: Kees Cook <kees@kernel.org>,
 kent.overstreet@linux.dev,
 regressions@lists.linux.dev,
 linux-bcachefs@vger.kernel.org,
 linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 ardb@kernel.org,
 morbo@google.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <83834AC8-0109-40C5-A80C-8BFFA8F16B19@toblux.com>
References: <ZvV6X5FPBBW7CO1f@archlinux>
 <3E304FB2-799D-478F-889A-CDFC1A52DCD8@toblux.com>
 <A499F119-5F0C-43FC-9058-7AB92057F9B3@toblux.com>
 <Zvg-mDsvvOueGpzs@archlinux> <202409281331.1F04259@keescook>
 <21D2A2BB-F442-480D-8B66-229E8C4A63D3@toblux.com>
 <Zv6BEO-1Y0oJ3krr@archlinux>
 <E8E64A72-3C1C-40D2-9F07-415F6B8F476E@toblux.com>
 <Zv6YInHiwjLeBC3D@archlinux>
 <63D4756D-31B7-4EA9-A92F-181A680206EF@toblux.com>
 <Zv62pi1VVbpkvoDM@archlinux>
To: Jan Hendrik Farr <kernel@jfarr.cc>
X-Mailer: Apple Mail (2.3776.700.51)

On 3. Oct 2024, at 17:22, Jan Hendrik Farr <kernel@jfarr.cc> wrote:
> On 03 17:02:07, Thorsten Blum wrote:
>> On 3. Oct 2024, at 15:12, Jan Hendrik Farr <kernel@jfarr.cc> wrote:
>>> On 03 15:07:52, Thorsten Blum wrote:
>>>> On 3. Oct 2024, at 13:33, Jan Hendrik Farr <kernel@jfarr.cc> wrote:
>>>>>> [...]
>>>>>=20
>>>>> This issue is now fixed on the llvm main branch:
>>>>> =
https://github.com/llvm/llvm-project/commit/882457a2eedbe6d53161b2f78fcf76=
9fc9a93e8a
>>>>=20
>>>> Thanks!
>>>>=20
>>>> Do you know if it also fixes the different sizes here:
>>>> https://godbolt.org/z/vvK9PE1Yq
>>>=20
>>> Unfortunately this still prints 36.
>>=20
>> I just realized that the counted_by attribute itself causes the 4 =
bytes
>> difference. When you remove the attribute, the sizes are equal again.
>=20
> But we want these attributes to be in the kernel, so that
> bounds-checking can be done in more scenarios, right?

Yes

> This changes clang to print 40, right? gcc prints 40 in the example
> whether the attribute is there or not.

Yes, clang prints 36 with and 40 without the attribute; gcc always 40.

>>>> I ran out of disk space when compiling llvm :0
>>>>=20
>>>>> So presumably this will go into 19.1.2, not sure what this means =
for
>>>>> distros that ship clang 18. Will they have to be notified to =
backport
>>>>> this?
>>>>>=20
>>>>> Best Regards
>>>>> Jan
