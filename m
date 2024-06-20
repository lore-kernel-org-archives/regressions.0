Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D5319DF6C
	for <regressions@lists.linux.dev>; Thu, 20 Jun 2024 09:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718875131; cv=none; b=gIcvmmlFBe5Ya8wZ1iniyeaoP4RARWzIhcErGPSVvGBnXRY4HnJWDSety+AkXLjPyOqwvHHMrObSIYXFTlEOinv3vtv5nkgS6+PoLraGhmzR7o3AZ99MXxu59gVYonZsxvOfFeMqTjTLHJE0+sTsaUX9xPoX1r2tawML9+CbdPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718875131; c=relaxed/simple;
	bh=TaHCvfOFH+3vpjfZrPlNFRdLiZNVG/mJY/+EObT4Dts=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=avE6lxWWxUnCBgzc6+q0VoxciAzEp3R7zBguHZpdaipomaTi1xbKjJa2kmTSuyzIKmSS8q7y4i3rxlpGfnoKsZhNk1BgH4AirnGjgkyVkCUa8W9S/xQFsHuTQNQ2PJQEDNhLWghl4AmsaxaJxDCOuT/iSI06DKd6m5HxDtQu+HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fKQbv/X0; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fKQbv/X0"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-704313fa830so560673b3a.3
        for <regressions@lists.linux.dev>; Thu, 20 Jun 2024 02:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718875129; x=1719479929; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TaHCvfOFH+3vpjfZrPlNFRdLiZNVG/mJY/+EObT4Dts=;
        b=fKQbv/X0e6zRQRB+V3zgPPLeOPBzqATIWWcbFbE0q6eI3brU3AbeEWrjXdB19TPdvt
         TTIGWLBDvSwHAJszu8DI/FMw4of3oNnNlCCImnp2SS567/sooURYWWSB7o7ylmKUF3Oj
         RxIRAdT4BsJH6/OgTOnMSZzP1fH2lhhOyZ35DscOmS9ySv8+nHSc2FH2TcOxdOYCzD26
         idHh/0K3OjDu+YpUbJ46Qz9WZwGxbcVuMSK3Ir/yuXsiEslQM0hgPMeFFNtbEGJQ2QO5
         7+RupD5+VGykcGFBQJbhKL5L2ucbTxN2L+stDJeAvkrmstDBr0KgCnuR+T7PVeyWI6TH
         IjtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718875129; x=1719479929;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TaHCvfOFH+3vpjfZrPlNFRdLiZNVG/mJY/+EObT4Dts=;
        b=bcfHt5t0pyj+BM2zx5A/sz06mZPGBOelPzhlrE74kxH/gaIPf3Lre/E2l4WW6DrlbC
         vy+IpXAuMTiHyyMNkR8aBBarsuadOOIr1VpqRb98eu1+z/C0CifC45iKxkSxl0Lu8jqF
         t9N/QeZQvPjWpAgd8h8DR81/BX09UwaNDEm848q1nUZc6Y9L8NG9pUaGoWspirysGymB
         DN0TnQgtbNDlBI/3GgiSBLl6T2+gKhFFCu8pwsry1HhucuQBaSx/KUk69rNtcvl7wCkB
         UNu4etlt0QX5Y1X/9vUfjkDsVt4FlImfTQn221/1NQUUSzOBXHUpb3pxFobi4Ezlgz11
         U1TA==
X-Forwarded-Encrypted: i=1; AJvYcCXLml909ZGjM0eHmYXSB/aEdIN0eeX5wZxDSqk0DHqA0ZSBtIJ0uquaGQVDanbfByiRxmhQYwkClHWjXT0aAQLn4YjnXDDa/chLg2w=
X-Gm-Message-State: AOJu0YzME/trtc6EUnK71IoQDM5OXApBaGbalN2xvkKUpj5//kg6ZXjN
	UXqcrFPMf+qF0WVL1qkt823f5aWV2JaV1kepttahq4iR6zVzwCExOAcKO5z1
X-Google-Smtp-Source: AGHT+IGSszKMR6kxdDqkkw9T2kQ7mzXZt5CHH4aWTPnMWxJrPY+GZvR80YnGPSmspG2jBn8bD059uQ==
X-Received: by 2002:a05:6a20:b211:b0:1b5:69cd:87e with SMTP id adf61e73a8af0-1bcbb5915eamr4050697637.21.1718875129399;
        Thu, 20 Jun 2024 02:18:49 -0700 (PDT)
Received: from [127.0.0.1] ([49.205.38.201])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9c85f4229sm11260885ad.156.2024.06.20.02.18.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jun 2024 02:18:48 -0700 (PDT)
Date: Thu, 20 Jun 2024 14:48:45 +0530
From: Mathew George <mathewegeorge@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 Bernie Huang <phhuang@realtek.com>, "kvalo@kernel.org" <kvalo@kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: RE: [REGRESSION] Freeze on resume from S3 (bisected)
User-Agent: K-9 Mail for Android
In-Reply-To: <6970398610c546b1b62e599902c67572@realtek.com>
References: <87tthpwkqf.fsf@gmail.com> <2ce41d4129234ba9a91d5b4dcd8a40ee@realtek.com> <87sex93s63.fsf@gmail.com> <6970398610c546b1b62e599902c67572@realtek.com>
Message-ID: <E3FF7BC1-725B-40E2-AAF0-CA41A44B9DF9@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

> Please share Arch Linux image you are using=2E

Not sure what you mean by 'image'=2E As you can see in the crash log attac=
hed to my
previous mail, I built the latest mainline kernel (445e60303883 at the tim=
e) with your=20
patch applied=2E I used [this PKGBUILD](https://aur=2Earchlinux=2Eorg/pack=
ages/linux-git)=20
to build it; the file `config` contains the kernel configuration (I did no=
t apply any other=20
options), and there are no patches applied except yours=2E

> Could you please help to collect 2 or more crash log?=20
> So I can check if there are
> more than one crash cases=2E=20

When I am back at my system, I will reproduce the issue a few more times w=
ith=20
this kernel, and attach the logs=2E In the meantime, you could have a look=
 at the logs=20
linked in my first mail=2E There are logs for most of the bad commits enco=
untered in the=20
bisection=2E

On 20 June 2024 13:46:21 GMT+05:30, Ping-Ke Shih <pkshih@realtek=2Ecom> wr=
ote:
>Forty Five <mathewegeorge@gmail=2Ecom> wrote:
>> > Please try [1] that fixed "wifi: rtw89: add wait/completion for abort=
" for
>> > certain cases=2E
>> >
>> > [1] https://lore=2Ekernel=2Eorg/linux-wireless/20240517013350=2E11278=
-1-pkshih@realtek=2Ecom/
>>=20
>> Doesn't fix the issue=2E I get a freeze on the first suspend+resume=2E =
I've attached the crash log=2E
>
>I tried 4=2E10-rc4 + the patch on ubuntu=2E Never reproduce the symptom=
=2E
>Please share Arch Linux image you are using=2E
>
>Could you please help to collect 2 or more crash log? So I can check if t=
here are
>more than one crash cases=2E=20
>
>
