Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD14320C476
	for <regressions@lists.linux.dev>; Tue, 25 Feb 2025 21:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740518715; cv=none; b=gLyQfSIy+0AziC3EXhfitlOp2d/JRO5PO6vT//uGrqP916xW/Mu157kggprc4OlZiNlBvmYGA3bMPfEAqGvGEZElaGsnx0kfedPo8WnHORhRCJDelvGso+goAZoZ125rUdLeGiAAiZSlOJDxQ0mFRsi/C3lj1i0zZsp4Tz9IK/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740518715; c=relaxed/simple;
	bh=/vRSuHy/MB9RlaMV0AzRys+6Fkmzrnt3K/gEdJxjiII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JFWLPKoyzqbHalvJBLtMa6ZP9ybX/NnDGnts+X1DDx0MtWGhH2mhnADP/YX/jfkzsnzB+BCYxTokrkvmiBAACoja3f6I+8/DYbH04x0hUk4f+FQRN8hjuyBMCTUOa1w0RITUWO/na4nls8beHTyoDXAHSEkXyaCbV1nAmF/rv2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wgw1o2kH; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wgw1o2kH"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-543e4bbcd86so6971900e87.1
        for <regressions@lists.linux.dev>; Tue, 25 Feb 2025 13:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740518712; x=1741123512; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/vRSuHy/MB9RlaMV0AzRys+6Fkmzrnt3K/gEdJxjiII=;
        b=wgw1o2kHIyTS5y1CWvFq+Q+d4qjcsu4N2jFRRJhLVONVHNOHZ1Ukp6CQ8/mJOgBPYq
         t8Ybz6KRsT9l0I6IMAhzErmYgRsKpbBHshrBYJluqzP3TlZVpnc8nkQ0WK1EjPK9Sq5X
         HHJmFhnPwZQPYA0SiViF/CcHzFtPEp5FcAl2kgZ3Unb4gExA2LZxxhMuZagrl8T33YNo
         2XEzpzj5o+BK40V8YwmA/xhrIwrAkkBMPcQdfJ1QQN70qJSUDbBspD8ftx8GsfHWtUJ0
         qcSGJogzsDJDtV1UEvwNbYmhac1z4h8F2azCnFzFVPt5k1Y1mQGfrqtrlNLORyBBXpT4
         hv6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740518712; x=1741123512;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/vRSuHy/MB9RlaMV0AzRys+6Fkmzrnt3K/gEdJxjiII=;
        b=r72dPB+9GlD+1KP+1ljRuTdPn15cC8wqHuAXCSim/TuZNE0sG9FlfzLfgs1AUkbx2p
         UyBnrjNwZyxf8H64BpTE8LCGgaHHpJsnXKVQlVpWV7X6DNI0AoLPvphK6vfN5nwqmEZM
         M3Y7h4AObVdPugJqBctSEBIMonP+YvIZRvuseZlfSYj6A2zeTrKrrbmpDe+RoZCR19Jb
         njdvCPzvZKLnq/qgbXQACxHk8TAZq62aEeh7shOthpBNE26wOdiUvS0mV3LDx3Y3BEnr
         YqtgPR3ejdUeobI8gI5Vm9h82TTjiaOGW7+jK7j0oKcLQdIt9ne11FX2T2dRp7+9agTB
         nopQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYuzlVNIFXOnsAvw6Ag4tHF9TCBi7bvT5E95OcQAQ7w6d9LMSrckUoSncJMDQaAC5utm8SF4+Ba/vVkQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7sJCnb9VgSg+j48RIDg6jZrGncCjax3KSL3uG9S9ZmWKhEYHO
	XcmtUxJxGcPWn7YfdIgKEow7DISfskkTj1I4mfQ2pVZ5aZ9iRwahUA4SHzM61B1WcU+6lbU1pCE
	Yo9uj56AoiuO7S88UKjPs6nzOWHYdRrvt2KrzHA==
X-Gm-Gg: ASbGncv3yoIf9/PQ1a0K6DvYHmDdZjfuroEnuW+VsqnpoWmUVPHIZfmGkI7LwUPafwr
	ZE0+RFjwsSiWv9URY2jsVJJG1LAvWpvxmqWW/3P1RuoZmJe40CwRTVtDOUH+6y43Lwt1o2boODl
	6bRDSbhGg=
X-Google-Smtp-Source: AGHT+IF3ruZ628pBl6inkD8sS/QNk1YiGKVIu9y3PQfjbqSfBuCZZhhr7tnwuzfKq3rBfnyExymhHSh/RSe22mil/wk=
X-Received: by 2002:a05:6512:3e17:b0:545:5d:a5cd with SMTP id
 2adb3069b0e04-5493c570908mr788055e87.6.1740518711634; Tue, 25 Feb 2025
 13:25:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <9ded85ef-46f1-4682-aabd-531401b511e5@molgen.mpg.de>
 <CAMRc=McJpGMgaUDM2fHZUD7YMi2PBMcWhDWN8dU0MAr911BvXw@mail.gmail.com>
 <36cace3b-7419-409d-95a9-e7c45d335bef@molgen.mpg.de> <CAMRc=Mf-ObnFzau9OO1RvsdJ-pj4Tq2BSjVvCXkHgkK2t5DECQ@mail.gmail.com>
 <a8c9b81c-bc0d-4ed5-845e-ecbf5e341064@molgen.mpg.de> <CAMRc=MdNnJZBd=eCa5ggATmqH4EwsGW3K6OgcF=oQrkEj_5S_g@mail.gmail.com>
In-Reply-To: <CAMRc=MdNnJZBd=eCa5ggATmqH4EwsGW3K6OgcF=oQrkEj_5S_g@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 25 Feb 2025 22:25:00 +0100
X-Gm-Features: AWEUYZnAhHxOSjeQsA9Hvi6qL2kbj-epkwY6Lo47qumj0GmjgfH9AG5WnY1exP8
Message-ID: <CACRpkdZbu=ii_Aq1rdNN_z+T0SBRpLEm-aoc-QnWW9OnA83+Vw@mail.gmail.com>
Subject: Re: Linux logs new warning `gpio gpiochip0: gpiochip_add_data_with_key:
 get_direction failed: -22`
To: brgl@bgdev.pl, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, linux-pci@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 24, 2025 at 9:51=E2=80=AFAM <brgl@bgdev.pl> wrote:

> In any case: Linus: what should be our policy here? There are some pinctr=
l
> drivers which return EINVAL if the pin in question is not in GPIO mode. I=
 don't
> think this is an error. Returning errors should be reserved for read fail=
ures
> and so on. Are you fine with changing the logic here to explicitly defaul=
t to
> INPUT as until recently all errors would be interpreted as such anyway?

Oh hm I guess. There was no defined semantic until now anyway. Maybe
Andy has something to say about it though, it's very much his pin controlle=
r.

Yours,
Linus Walleij
