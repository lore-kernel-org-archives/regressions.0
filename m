Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.74
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794967046;
	b=tK7YhpWYJmcEFyoezoakpcwJLpQA2nKRyN91xUXXkwX1dBmc7ZTDvTrJ7RDVydLPlnlx
	 YQrViRhuFxuut0gG9PFnT4gSlwiC6p/RqEKgxQCxvM10RNLSwnmnrOyjSJAbrVcrKlVUF
	 3Q5MQhu8DUdR9FH96gvJUa5JTBHy251OAhIUQRt/SJSbpPwAUvcnhXbRu0mKztcIWnxeQ
	 kdh91gDUH2HGbAdBfgq6Bm9R+/2BG8iOh0wkzFCo/CiTvyplkEoLkqRuF4cCtZDlpnSRt
	 kg/v3L+chdVaLuhMo1kQ8Jg50BeTICyVoaRKq0CmG5popU7Kiloa/0j/c9nvfDzVJKg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794967046;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fPM4Z2/d+OWE/oPOGuzhHg0apTJ3Jgl1KSfNq20bq4U=;
	b=wTeK+t+41qO0/vQcuQvdzo0U7NAlEyWcSsE8N0u5qyYRJ0dHxQCPnzKH/ZkhQqT/KQjM
	 RnCbL4RVbHCorTXJlpDZCG0qul7xjZYQkUJjWG0oENit0KYiC0FxCs5RZBrGDzYh8OB3h
	 iWI6i8GaJt2OEq7eNT5vdiLQq6/7XLy1/4WYWEcwKAKYXNSFCGhF/xxMTg4fbkgQ0oopJ
	 MVceg4c04sIKAFQwQhfHkSl870xbzrdPAkquVbf79PtG23tSA14B+6JdKznkN92nZsjb1
	 O/x0zC3inVuchYKdmL/chG1BPSFfvnrlk0F02NsQj/SHHbciGiTcB9IDJtUU5E+rrUA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WBio2ibJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.74
Received: from mail-oa2-f10.google.com (mail-oa2-f10.google.com [74.125.231.74])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317CB606A32C
	for <regressions@lists.linux.dev>; Wed, 18 Nov 2026 01:57:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 317CB606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WBio2ibJ
Received: by mail-oa2-f10.google.com with SMTP id 586e51a60fabf-4b592eda75aso129533fac.0
        for <regressions@lists.linux.dev>; Tue, 17 Nov 2026 17:57:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794967045; cv=none;
        d=google.com; s=arc-20260327;
        b=YGrTEqUKTFXu10dvQ+0UP8+zoMaGsf0Un4/gxNEAaUBB4QmFtICkQwqI5sAVF4xuRE
         HECatNExZ58MDgYSIVf/JVmM99fm6NsxdJpeQjRdJ0n7pV1KakDZqc++uPUQ8fNQESR/
         TC6iPnc43MmoSxplzEKhOy8/bZETc7ahx+9Pq+jXAcp1Ptv8y2Vm6Tcc83QYno6gtA/0
         vGf/72d9ZkINejqXk3Ob/+JV90Qep8HeRxZNcoIsfiRXU5Knjc2/BLENMP8cqqfqWput
         Zmb249krQzgeEGBACGMCVqpMoObawu6p2N7FISOreS2BnIhdBNd1PWXNqsWMU+tAkxrK
         kidQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fPM4Z2/d+OWE/oPOGuzhHg0apTJ3Jgl1KSfNq20bq4U=;
        fh=ZpUuUXXY6sFFVxZpEIO/8/QURDSf5jtgSvIdKRQPg0A=;
        b=Sl6mJi7C9QRLfOXLuYBjup616HSh/Vk4bk3SR1qlWnXuv9Ac2QXSJLriru7J8qxzRF
         yzBRosePVcGf1lZ4IQGS2rJEv/w9bgJPPDkYkRZ7uURdQmdDcKLilKsnOAYNZGvx4hkF
         HiIN8pu0wfWmlewAjHv7vM0+1dsAK3v5ui8uN2O0btLReJ/PM2us9ka0OGR9+d/J1APQ
         LNTtWLTmiVbUV3WgOebgRoeXtjn93hUzeaHUbdcuc3/XfOitjTPFwD1iSmqnFca2zCoq
         bQ0jYkUPft7jsBMelu8hdUJjqcSMFFOObgqxJSZOnfxEpyx/83COT8dsKKwZmOgcGiNl
         cpvQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794967045; x=1795571845; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fPM4Z2/d+OWE/oPOGuzhHg0apTJ3Jgl1KSfNq20bq4U=;
        b=WBio2ibJsDwSphEQFEnGzniWjBvYlrxT0hHHbWGt6ztVjw17iWf3aE75Ql990bZFgU
         S+12lteENQ5mZ2lFcSw1zDp6KzfJBN6LEX0cN9iARD2XkkKRpHbdxIdofQkQ37aF8oUF
         Kr/qJAKrNlBiYVSsXASeSs4oLFZITVyFnMhoTz5YJi6l94wRCJLPDTlWBCCfu9dVxjwU
         K89lzse4oc+b/Vk+eJOckWIWYPgqD2tcNDrs14APkfJicpKjg/3uwb+vbIJPo1laKCTI
         IraNuvMFPBzMP9NN1CDj52RqP0pHwpumpYaKL9UKiJIpGIWPEvYdqJyZPBPSzDzDPuI2
         2xZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794967045; x=1795571845;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fPM4Z2/d+OWE/oPOGuzhHg0apTJ3Jgl1KSfNq20bq4U=;
        b=uWDrPTmCywadq41AXvh0IzXI5/vJlMKcR5reX/sMskh1q5F+p2rSiNUxp6L0QSLPQX
         UcYXUivp8s36kWKfEXP8Xrvtjde49FJPAHVJUFRbTC+W+HTiu5f8dUWTub0FVo/5X9Qe
         HuV8mWQqcZ0QGEfuY9Y8HWtyoyLSC77zLrUXI984WHBZ8t78jG12EM1GZKIVWQUZ2J44
         jxzipKBt0Hle1xglwHTzx6wFhQLqrhiG2E9H6CKJGBWEdpxpPJE7mxdIjSpVheemmLxS
         AHzaFYFsyzbtrGkg+0n6a2YSo7Jy9AFhcOjYog9NEKF8zobsQYgRZPz9A8M1JAkmlmvc
         nn0A==
X-Forwarded-Encrypted: i=1; AL+hErG+TcWUhbw5QeAt3aA40yq4ca2+Wub9+uMVhYw9CSCMC3jZgPS0+GNi4Frfmg9qZpC2+x62RyQ1ri4lBA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/753V9BE8K8lWata8O1hgAF6SsOwKV3aJPZkc2bFvFeWWqUBg8
	aXlgm3HbwREJy2NU+76uC4PN5VMnJ7/zvIifq1ykSfPOtEIzjUvdamxGAmFvI0LfvMfaZqdM5Fh
	4A+svug1/5/4lSLcDHRt8dyrxacV8tuA=
X-Gm-Gg: AYBFou0djEqnKYYmhUQQ8V3NHUhtBiNZbVH7LnSjjvR8AwOw/EUhFiDmQJuJi18lysO
	UJhskJsR0CObmmVrGWti5OcOZyjv92mK94WnELeQO75noe6SQo5XjM5Me9lbjkidXiyT08DtK+n
	BYGMfUxIzTj6r6s9DACDF3UfpbZg7OInNn80ZbbiHtP4VJDWeM1X1Fv8VBpIc4ReSByxWLzKxAa
	W/RlVIE0yMzQ6V3Cb3XK0ln+YAFLV9qEHELZWwIjLtRVNEXs9U6LIOB3OO1wJUXKulYPRwjKFrh
	dtdieoAxCM/C4vswPgRgUoZIBRrbSXoa+rgBa8jn4masQj+yMRzcu9BODYYCZTVQByWw0OKyuYs
	I49SL0tOFJQWmK1Cuxl7tL4DAr5u7W2i5/ldP70BULbiODo/n2BVggYhWmb5vgHWRzFmlj1bdm/
	M2vFsLARhzYrqP4fsDSOAgCLvBVy85E5CbPFilp0bzo7PyVrExxhsj
X-Received: by 2002:a05:6808:23ca:b0:573:2541:1804 with SMTP id
 5614622812f47-5774045c9fbmr1927983b6e.19.1794967044731; Tue, 17 Nov 2026
 17:57:24 -0800 (PST)
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
 <CAGEkeHdxaC2BBg5wWOCL0pj0r4Ks6mD_a3KpE7h+en9Aupb4zA@mail.gmail.com> <CAJ6F8CF5FF6-+Z6tOA7Gz=m_Cvxz-n7G=bqVY5H+fBCV3kbo_Q@mail.gmail.com>
In-Reply-To: <CAJ6F8CF5FF6-+Z6tOA7Gz=m_Cvxz-n7G=bqVY5H+fBCV3kbo_Q@mail.gmail.com>
From: Hungyu Lin <dennylin0707@gmail.com>
Date: Tue, 17 Nov 2026 17:57:12 -0800
X-Gm-Features: AclHuK80GibvNnDmnk1ufJQUnUWv6v5F6uZQtv2GfalFtbrM8RVlito02JIyaSw
Message-ID: <CAGEkeHfywOHr225v1tm7zjf6ui2a2NttrPBwUhts9-DHLYszcQ@mail.gmail.com>
Subject: Re: [REGRESSION] ntfs3: existing files/dirs with ':' in their name
 became inaccessible in 7.3 (ads on by default)
To: =?UTF-8?Q?Cl=C3=A9ment_Smagghe?= <cle.smagghe@gmail.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, almaz.alexandrovich@paragon-software.com, 
	ntfs3@lists.linux.dev, regressions@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 2:27 PM Cl=C3=A9ment Smagghe <cle.smagghe@gmail.com=
> wrote:
>
> Tested-by: Cl=C3=A9ment Smagghe <cle.smagghe@gmail.com>

Thanks for testing!

Hungyu
