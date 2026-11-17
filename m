Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794954441;
	b=k+bZD9VshE/xsNjOWm8IYjArnIAlYXDjFBfakLSih3hEciEsbLpbMQfpcq3QgbEOun4/
	 yaxyiQAemBafN8W+cLVMmfGpUJ8qgt+VR7c1I0oqiDTJ+m28Z+NPxM82M4oUueoqTGJZg
	 jxbf3Ayxjr+HH9ijPPIqUn5YbQxUBrW2R9044ZMXxmE0innOtvUr4aOy2c6BgE2n9/tRC
	 F2BA38t92vG+og+4V5jnvbRz9qgQ26ad15thUWUKDe5hdNwVsthxdzVrjypJuT249n4co
	 QvAMmQikisugwLb7kqDNiwEBRP7nMQ2pJmwOQpuUN+U+SGxFLcCGaHnd5aEDk1GIypg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794954441;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Qc4tF92xQdHPstDc9OOaR7th/jMxJe62KjbX9qJMUYY=;
	b=i7lrSWSpsY1SAmzWqZGRP5rv7xdZ+ehO9UFM8HmPxdatBaKyw6oJDRpJ4vPhIQ3kyKHn
	 Psa6r/ao9HsSthCEsy++e+YQtPWI9Y7OmfonmVGZ2vEvESwJR7WM4oXtbze8zvdgVAg3j
	 hDSHXULtV5qoq9Nq//s/piCE+xcoC47K7B6Qqu0ME6sSyjHQwvZMssdt2ZRnAWrv03PqS
	 G7GXIndqm+xMSc8pcZJVaKgWm7HjK1vqk1uJWPH/DGUcDgEJ82u00mY4j9ty9q8FqBFwh
	 csnmP1ycawkyZwz1wT5IeFqOXdcMrPopC4Cr4njyyBIhNNTVMwvNdKFat2kO5vl8plA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yXm3b6YG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A0B606A31C
	for <regressions@lists.linux.dev>; Tue, 17 Nov 2026 22:27:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47A0B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yXm3b6YG
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36dbde64409so741433eec.0
        for <regressions@lists.linux.dev>; Tue, 17 Nov 2026 14:27:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794954439; cv=none;
        d=google.com; s=arc-20260327;
        b=OwhvK4MZjZWYjsBu3azgPbQ0sBDhOTwuSOccFRoIGO4erQ3p/QVMqvMatC1N90GNV2
         v4ooLQc4q7Lh5yZSTA5Jas8JipIC4L3j5I+LY49T3aYAjxd2Yysq18IGXP+2BKBWhOVL
         cAZpBI9Nm+V9Il+QN/TQ3wEg2EZQ8dZywG4Zlz0H3PLPAY+qj6kKT2oXNtWxcmPM2l7X
         SxvQ9dUwHFv2Djue5OQbAvZPAusqdpvEdwpTiAT7VvIDzqC4L9b2xQeN/9Z9dRtmdW7u
         T8RC4LxqpOLtzkmcJlXiBHOrNEca2abGP8RigsTE8F6UAcc8QFMlfnk0vqJxOyH6Iy+W
         7o6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Qc4tF92xQdHPstDc9OOaR7th/jMxJe62KjbX9qJMUYY=;
        fh=jtjX4eq83XQCW9IxqymjgMHmnqRxkGnsAosuXvEJQcQ=;
        b=WmRnSGOpS24Qkge8vyL0oSsnrETOyWUCnZcOXNe2OmocoL2BRlTzGnF8i04G75o6ee
         OKErErbxqsXPDc+HAHh2smlUcVP84RhhzO/sxZqpnZ7tU3p9W/HRBkniANKr3039+3bR
         ybEgi5hFnl/VuOEp3wYK9TkJrfNYej5VJU4G7rczaWqh8Y6k4XtPWwoZRmF8ZhqpKG/k
         r2eoQA860gjS4U/bLjEvHR7d2LlUe4MqfBnJ8z+eNNgvB0xg+IkgsWAnBXTkbNA0EmRF
         0/QHSe0mtHc/foOQ30ZjueXZJOmP1i7unHHKLrXC2wVDgvznOO2DozWqCuAEHXRrBg87
         PxoA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794954439; x=1795559239; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qc4tF92xQdHPstDc9OOaR7th/jMxJe62KjbX9qJMUYY=;
        b=yXm3b6YG6CsBezQeb7jdul6mjzlcjkAZvsxt3eJ7xNDiff/qedhHhsLhyVYDbh1T9d
         ppNSU5l+cQRBGTw2ePagI2Iws3aeTvqHG/g9Tvk2DLkg97z/ru2go+uVS9bR3BTqqTl+
         ZKFvQ5YfAMEjwBKpwdFGytK5o+1hBKjIqZpM43d0qcnr21VgtgWQGgdtP0PU/reO49gL
         k8NzoHMBjr/rXB6/hQ9HPslI04zWhWh5yl7hztZ4Q6syM9N7dem4rog9nYn5xav1YYZT
         IpmFFd92WMRyyjevzb1uOFxbz/39XD0IA9+QQM2EuFKLKX1EQ6dr++p+qKWCgJVGNzQp
         wGcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794954439; x=1795559239;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qc4tF92xQdHPstDc9OOaR7th/jMxJe62KjbX9qJMUYY=;
        b=ZbaJ+lnkYDJoutbhGKnbFKtXHKcE79hWFZcDKcW/4bBdrYumHr/szDXhZV4xttb5or
         Fww+V/hRAvTcJkeDiiFFO5t62nfwoe7TDr4bB0DDX1Bn1cMNJcA8smdHX+GzZTbttV7W
         F8Ptjk/uUjtl74dG+Uxmt7RZygP5eWSdIUS+X66bK0QmGH8h9f/YmRa0h/BL4xYTjRdU
         NhxzbhS1AZiIktYGVRnrJTvYcTc2TLeL9/47xiw4ShDs3xsu2PyRAWSPwKlDQQ3oZnAU
         X27bCJbIkPVr1DPV0A4/C5sCBCw5BKUlkVpcdHxGDLH41oZZRnTxPjLH0f4I6OgyNHmx
         GUZQ==
X-Forwarded-Encrypted: i=1; AL+hErHytgsg22ReSY8uCupAoQKli1KtO3HseyjUTEccI+lTkZ3Ez/4iKNSb71LJ7WJWisVj09Che7YUZrhgnw==@lists.linux.dev
X-Gm-Message-State: APuU4Z9yc25EGgWFfer6UC4tWml0peZo+TevZDTlIuy7rhTkYL0xTM8c
	+wdKBZfxkF+TwS0qyoDnSuOkjazurCFEMqPx/rDyEPal20lURN2Wfah8y25aKw9LSzDQ0d5acQU
	lYtMg0XQ40hSeg+91Llh7RXJinGoq7Wg=
X-Gm-Gg: AZFdTZe9pb7MACYlwjXTIevaY5eZf0wBuzO0TXLw116jGlt7N0c/hO0LZWYhXSUAMzy
	T6BMzN+l4Ycf4UXXiLTPTA28BOoTlcaWOr3alI8uT8VWVPbG/wd09RlA0JfMlMIoZgKFlRsy+Pr
	uUryqSlNif89WbW7GMVdA0K0rkKvzXy+NIbZlTv9QQ1cUBIZZ0/eMH2Q9P2kJO4qD4QSaZT53dZ
	W4KtiOO0K7TTz1SGJCtmyHNCtGiT30eLAGvMCOwovNrNjpMuk5wL7KviSOdtSW8QlmeG8gevevJ
	Q5jxd+H+swok05CFUKdYBZGqe2/ULjtCAxe5G0HTGN7ti2sVh2BcFOuYGq8stMFF9Ioa7zfbCJk
	rabatOzOhc51lrI5bMn/CWL9kytFixqQfWyN5P/mg5MJ6nwrdLlgBixAsI+7sns3BRSKEepKBKw
	EaXryfPADJ1YXeOuMczsKJpaNdLMv/cFikenbNVnI=
X-Received: by 2002:a05:7300:7314:b0:375:c5e1:931d with SMTP id
 5a478bee46e88-38280c2e5fbmr1001348eec.25.1794954439224; Tue, 17 Nov 2026
 14:27:19 -0800 (PST)
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
 <CAGEkeHdxaC2BBg5wWOCL0pj0r4Ks6mD_a3KpE7h+en9Aupb4zA@mail.gmail.com>
In-Reply-To: <CAGEkeHdxaC2BBg5wWOCL0pj0r4Ks6mD_a3KpE7h+en9Aupb4zA@mail.gmail.com>
From: =?UTF-8?Q?Cl=C3=A9ment_Smagghe?= <cle.smagghe@gmail.com>
Date: Tue, 17 Nov 2026 23:27:07 +0100
X-Gm-Features: Aa3M54pO67MCZLcmJlYCwS3g7jZlLsxu4gjlyt9JHnihscax6mlfWNEjuiM6Vfo
Message-ID: <CAJ6F8CF5FF6-+Z6tOA7Gz=m_Cvxz-n7G=bqVY5H+fBCV3kbo_Q@mail.gmail.com>
Subject: Re: [REGRESSION] ntfs3: existing files/dirs with ':' in their name
 became inaccessible in 7.3 (ads on by default)
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, almaz.alexandrovich@paragon-software.com, 
	ntfs3@lists.linux.dev, regressions@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tuesday, Nov 17, 2026 at 8:29 PM, Hungyu Lin <dennylin0707@gmail.com> wr=
ote :
>
> On Sat, Nov 14, 2026 at 7:43 AM Cl=C3=A9ment Smagghe <cle.smagghe@gmail.c=
om> wrote:
>
> I sent a fix that makes 'ads' opt-in again:
> https://lore.kernel.org/all/20261115103845.56074-1-dennylin0707@gmail.com=
/
>
> Could you reply with your Tested-by if it works for you?

Hi Hungyu,

Thanks a lot for the quick fix. Your patch doesn't apply as-is to
v7.3.4 (the context line 'opts->ugm =3D 1;' only exists in 7.4), so I
applied the same one-line removal on top of v7.3.4, rebuilt the ntfs3
module with the Arch config and tested on the affected volume:

- mounted without any 'ads' option: 'ads' no longer shows up in the
  mount options, both existing directories with ':' in their name can
  be stat'ed again, and a new directory with ':' in its name can be
  created, stat'ed, renamed and removed;
- mounted with an explicit 'ads' option: ADS mode is enabled and
  shown in the mount options as before.

Tested-by: Cl=C3=A9ment Smagghe <cle.smagghe@gmail.com>

A minor, non-blocking suggestion: Documentation/filesystems/ntfs3.rst
says every option can be negated with a "no" prefix, but 'noads' is
rejected (only 'ads' / 'ads=3D<bool>' are registered). Accepting
'noads', or at least documenting 'ads=3D0', would avoid confusion. Not
a blocker for this fix, though.

Thanks again,
Cl=C3=A9ment
