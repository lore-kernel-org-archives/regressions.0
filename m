Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2129139D05
	for <regressions@lists.linux.dev>; Mon,  9 Dec 2024 16:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733760035; cv=none; b=nxSczPLO4ca7UbDy5pcXr+37bHM/1QdfQ5ETNJuc38QdHA5K/Sz5F/m/mt4RU2Y9LxHfNHxmXouwzndqkiWIUHFLK9A9GJBvrjszxUWXLcJ/uxw+FteoO82W5pvz28ZMna6EYJYDuFFnw1X/qx/y1Uzs9Qt4whrq8CA3z4w24BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733760035; c=relaxed/simple;
	bh=+XrSxkJiYVwip/7h/15X2p1fvHKqGqNK5AfKn5ODPPQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kmp+zPQwSE2c9DV+OCetFo91cNIqCrvdx9TYdjpjDGS0pPH7AzGEnFdWyGQxMFDE/pf7PSvxaLcGR2b2pazBwXyVT3SwVFsXaySxt7LHlcjXD4MdsBE9klagV3bBSqlwXElThsykuer4jZfV8wgJj/e2i2s9NPHMJ7vMxErctpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qaPbD4p9; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qaPbD4p9"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e398273d6ffso3508917276.0
        for <regressions@lists.linux.dev>; Mon, 09 Dec 2024 08:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733760033; x=1734364833; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aiUSjuMsBxtwBF92JKugclqDOyqNzANQlkYa4tpiQ0I=;
        b=qaPbD4p9FG8CuXnfHsfTbwSHw9EijsNdUzfDrpfnOdcee93BV4QdT2BEJ2NtVcPqOv
         kevXkDo4Q9ckAkEWXHdw50GXOzzSzt3iC6e/q8ceo69OaFhGR8JhUWMHZRLiOkQ/Z5dI
         KVVSYbnibXpXjAJZVlHS6Oeu2jNPEgmYLczDNC2vokTGvqwW6da0OJofqZJCjMAABzAG
         1RqLLj2SW3KsVFQOKX2BKxYPAT0FCu4ONFsOjQCtU35pYukyXhUdyD0jsplTzfnBMnnn
         jugEBLFJPhkSXkwZKC0Rv1LQR6mZcHCK9iPTYIRpfKZ4m+TZQvbDTHJ34XqurYAffRn/
         E0VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733760033; x=1734364833;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aiUSjuMsBxtwBF92JKugclqDOyqNzANQlkYa4tpiQ0I=;
        b=DbtxhlVmHI1sMygpAT+ls+lQcLnQpSCW8mkzdXBiwUQxp99tT50ixzAtl+w7tlflVR
         A9Dls9V0KSc0yRhWUF9mtqNmsZilIdhNPkOnVa3jmGYQGwOSFaPjItz0wJLsc2f/tywS
         5e1VqThVQrduT6LGpj1DAQBQFWpiQI2lybry16YqVxTfsXtpBmTaqeRuGBAsVW9Rz77i
         SEGZ1YszwLtt83jCHnDl90Pvs+uj+evaYd2hIDOckoTZsqH40KKiRrqjeNks0sz/EchF
         If6At/sOil+xWfarIuU3fujIo4OaPnZfAf+sdf/MY2S60BKGSp8Piv7HbG4lcIPxSe95
         0U+w==
X-Forwarded-Encrypted: i=1; AJvYcCUQyjdVztFzrHgkTW79mMD7UGpd1YT0TKPSxHabdOxgseIUWY2D89erAHMAfIuhl6AXqcSG5ADiVcXFcw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0UMJOZWJ+3ggVS50j7GioAHFU/tAmoWcV+4n62nVtKinwMSJr
	J3QbMgenV5z9iowAkNMC3jAeNDLeq401equ/WFT6RwzoxsimTKg44WhPma2iczFKF0Z/5k53INN
	tWBATS4OJN8+j1tpFJ22D6CgTvu1fqONH+jkjeg==
X-Gm-Gg: ASbGncvBF9cgXyIdlE1/JeZh571FxUwQ99O/DP2Mxm7483jXdOjBlqydnJYrwGU947c
	7vcv+NMVa5iwINrjA6S0wKhhrteSxoO7j
X-Google-Smtp-Source: AGHT+IFgKCTASVGhuRkk7fgCBN66ESQ6+aXeXlUzLv8tl8DoC0dwlZWyfOK453pZ6S12UOf+JkQoe7zxwbety074Onk=
X-Received: by 2002:a05:6902:841:b0:e39:9633:fc15 with SMTP id
 3f1490d57ef6-e3a59b27115mr959168276.27.1733760032634; Mon, 09 Dec 2024
 08:00:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241209111905.31017-1-johan+linaro@kernel.org>
 <iw2c4fceyppf2w2gueevsqsz2z7hatbqo33vufx3veatprczu5@u4k3j2igy6ee> <Z1cNHOqlRk2Cxwvd@hovoldconsulting.com>
In-Reply-To: <Z1cNHOqlRk2Cxwvd@hovoldconsulting.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 9 Dec 2024 18:00:21 +0200
Message-ID: <CAA8EJppcQrJkZe1ft_PLaB1C5d6vTke6BOSDZXJuNwrxy3kJKQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] arm64: dts: qcom: x1e80100: fix USB OTG regressions
To: Johan Hovold <johan@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Marek <jonathan@marek.ca>, Stephan Gerhold <stephan.gerhold@linaro.org>, 
	Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Dec 2024 at 17:30, Johan Hovold <johan@kernel.org> wrote:
>
> On Mon, Dec 09, 2024 at 03:23:05PM +0200, Dmitry Baryshkov wrote:
> > On Mon, Dec 09, 2024 at 12:19:03PM +0100, Johan Hovold wrote:
> > > A recent change enabling OTG mode on the Lenovo ThinkPad T14s USB-C
> > > ports can break SuperSpeed device hotplugging.
> > >
> > > Abel noticed that the corresponding commit for the CRD also triggers a
> > > hard reset during resume from suspend.
> > >
> > > With retimer (and orientation detection) support not even merged yet,
> > > let's revert at least until we have stable host mode in mainline.
> > >
> > > Note that Stephan and Dmitry have already identified other problems with
> > > the offending commits here:
> > >
> > >     https://lore.kernel.org/all/ZxZO6Prrm2ITUZMQ@linaro.org/
> > >     https://lore.kernel.org/all/hw2pdof4ajadjsjrb44f2q4cz4yh5qcqz5d3l7gjt2koycqs3k@xx5xvd26uyef
>
> > > Changes in v2
> > >  - revert also the corresponding patch for the CRD which breaks suspend
> >
> > As you are reverting two commits, please revert the third one too, it
> > breaks pmic-glink.
>
> Can you be more specific?
>
> I was gonna say that pmic_glink works since hotplug and orientation
> detection still works, but I tested now with DP altmode and that is
> indeed broken unless I revert the third commit (f042bc234c2e ("arm64:
> dts: qcom: x1e80100: enable OTG on USB-C controllers")).
>
> Was that what you had in mind? Can you explain why that breaks?

See https://linux-regtracking.leemhuis.info/regzbot/regression/lore/hw2pdof4ajadjsjrb44f2q4cz4yh5qcqz5d3l7gjt2koycqs3k@xx5xvd26uyef/

For some reason commit f042bc234c2e ("arm64: dts: qcom: x1e80100: enable
OTG on USB-C controllers") seems to break UCSI on X1E80100 CRD:

[   34.479352] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: PPM init
failed, stop trying

>
> I'll respin with a v3, but please answer the above first.
>
> > > Johan Hovold (2):
> > >   Revert "arm64: dts: qcom: x1e78100-t14s: enable otg on usb-c ports"
> > >   Revert "arm64: dts: qcom: x1e80100-crd: enable otg on usb ports"
>
> Johan



-- 
With best wishes
Dmitry
