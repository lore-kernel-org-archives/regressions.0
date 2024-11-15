Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5143B537FF
	for <regressions@lists.linux.dev>; Fri, 15 Nov 2024 03:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731640453; cv=none; b=bDuJtegCa7Yo6lLUYTjvw7RjgHTmWWXP31vcyTBcAzHjE+RrbosLOZQviRn381/fHS7Ff+Fhx8HFQn/KOsyFEKpR+HOh9o3NT7xaX2LC0O/SgGJuxa3p65TdJDVglTvpTnbvDBreGrdAE4DDJxgZ/xkML4n2LshChUqOSCM4+KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731640453; c=relaxed/simple;
	bh=/l6IdxviicpZLYmAeqefRSiwgN5K0poQeDlPVgsCJis=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YxNHxTp1Gi6C5MEcZrIOK7BmLl2IGNo0rT99X9foMiS9xhHzqbYjLZgecbx6DaD1ymNhbJonxBs7QmOeehW2IVX7NnM8ycbS6UCGFZcIJfVpSbULP4w5icwImrG6NfUgnvrnObkxVNkJUhVIk6MJT8AK1/6u7Z2GiGMAXZekFiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HNwmfVDv; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HNwmfVDv"
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-83dfab49655so41988939f.1
        for <regressions@lists.linux.dev>; Thu, 14 Nov 2024 19:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731640450; x=1732245250; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xCro3fmqeDuWdpLH9M0YZh3SiFmqpG56moMEi9XJsQM=;
        b=HNwmfVDvk9calRiYOtoPTNbd7SUZUKhB29jL31JZwVmhMXjlzCSdU2ZV0f7Vs1zOOT
         UmOirX+DiMG7gCthQZcXl0goj3GPYzRu/Bbc2e4UBjI1d/JIgKXQX/nWFIx/AYDXPNjH
         ibxqmmaUtetiZOQG+UnAU9Yv9e8yEPAqq72NUFlAzKPpx64mNkHmihJeiq16NhwemhVE
         oOY28SO3Uv67cIjC9qLyfnTdC4lu1zyw9a+E+fM7HdpQH+K7AWuxkb7mHlKLGe4qKFUR
         6MwS2YzzeXxJWwBYPf4q5uCqchxpBMsP+2UfDbsOvoOlhwuhyoco8zUJd3ryCDIoJ3Fj
         iL6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731640450; x=1732245250;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xCro3fmqeDuWdpLH9M0YZh3SiFmqpG56moMEi9XJsQM=;
        b=dcDXWomhf8ha+4SsMYsC0ZzxxyXnuXCLrn5QnPsMGaRB29Z8yz4/CZ6W37DHNFPsij
         eHO6WVqG2QhrzRsu4ldCDyD2o89tFJzOIeDrSTpZmx0PJ913Cj5uQI+1zHoQ5+GNmEmm
         TcZzCUpySDotdzsn1cFWg8oIWBOIGRLfFivYx458dLtBpg7Ky+m6mkonVdBZ8/yD4HKf
         9rL3x58iS4eDyK4llkhE+j/GE7LF8wvUZvcnLwL0FwE/vtdChiw4xUCimHHPuqyxbRBV
         Jd77QbrQWA3bcU3AgOaaIN3H5OQHZk78Jt0OsRqU1Ax1cc0LedCuMvf/yyWW6EMGJJeq
         DR9g==
X-Forwarded-Encrypted: i=1; AJvYcCVpGmjWKU96ZnxBkcP0403vGQLhymJMp60WUyK6t3D0Y7tZsucW0R+g3yrkNQdKQ+Hx7trdTEpJl/ZZdA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxmmSuf1nqclA0PeVCog4eVn4hA9jjGxJzlKks9qP/cCZYBLUB/
	JoBKOJASkNFPgNnSSv/7pDxQtGrIgmSgnLoEs7JmUeq/Er11wQcRril7+sscR3k3Vqye7DXlh7A
	sFFAB8bkDfyFUaOEKo+EQJzbhahg=
X-Google-Smtp-Source: AGHT+IGakNHerU2OxullmdN7ZvD8921ch3v64i1UwmySjiuo3QMqELJFXW71OGYOz/AjpdHrTb2E49J9y4Mvui7ae/k=
X-Received: by 2002:a05:6602:1686:b0:83a:b645:c902 with SMTP id
 ca18e2360f4ac-83e6c0c9d09mr170610539f.6.1731640450207; Thu, 14 Nov 2024
 19:14:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241007132555.GA53279@francesco-nb> <20241112075958.GA8092@francesco-nb>
 <20241112092054.GA18139@francesco-nb>
In-Reply-To: <20241112092054.GA18139@francesco-nb>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 15 Nov 2024 11:13:58 +0800
Message-ID: <CAA+D8AO3a5WsZ4=V-9CDifDZYjJjwQmQQDDQM7ZKgZ6_-CNDPA@mail.gmail.com>
Subject: Re: clk_imx8mp_audiomix_runtime_resume Kernel panic regression on v6.12
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <frank.li@nxp.com>, abelvesa@kernel.org, 
	peng.fan@nxp.com, mturquette@baylibre.com, sboyd@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, linux-imx@nxp.com, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev, Adam Ford <aford173@gmail.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, Mark Brown <broonie@kernel.org>, 
	ulf.hansson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 12, 2024 at 5:20=E2=80=AFPM Francesco Dolcini <francesco@dolcin=
i.it> wrote:
>
> On Tue, Nov 12, 2024 at 08:59:58AM +0100, Francesco Dolcini wrote:
> > On Mon, Oct 07, 2024 at 03:25:55PM +0200, Francesco Dolcini wrote:
> > > it seems that an old regression is back on v6.12, reproduced on -rc2
> > > (not sure about rc1).
> > >
> > > The original report is from https://lore.kernel.org/all/2024042416472=
5.GA18760@francesco-nb/
> > > and it was fixed with https://lore.kernel.org/all/1715396125-3724-1-g=
it-send-email-shengjiu.wang@nxp.com/.
> > >
> > > Is it now back?
> >
> > I was able to reproduce this issue once more, this time with 6.11.7.
> > As I wrote in another email the issue is not systematic as it used to
> > be.
> >
> > Any idea?
>
> Frank, Shengjiu, could it be that the udelay(5) in imx_pgc_power_up() is
> too short and therefore we have such non-systematic failures?
>

Francesco,  it seems hard to reproduce it on my i.MX8MP-EVK board.

If it is easy to reproduce on your side, you can try to enlarge the delay
time to see if there is any improvement.

Thanks.

Best regards
Shengjiu Wang
