Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7573B2DBF47
	for <regressions@lists.linux.dev>; Fri,  6 Feb 2026 16:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770397133; cv=pass; b=HrOSpLkupqc4LSYj/F5sGZ8xx5x43mxPIOYwSD8f2+JEHHlUXRldsUD2YZ3SqH3vWrZLvfgMEykET1Bom/1Lh7+Jyca7uKY6ej0o2sgWd7bvIHOx4bgWvSSwpPlOm1uGE4zdC1LHMPPSiwl7gjA8gXfoprfGAbTXqFQLwS7SbVc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770397133; c=relaxed/simple;
	bh=b11BpwXCsu+WwRGAGk/MgZ1A/dCg+C3eIJfNjLM98nc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jd2Q3ctHskYHOJco9sf6JKYbiUjAernOGdAyF1ASyAbvEoe2l4Kt1gb2v4ntL9wk5LOyw4DnWbi81zfDrD05yPtC3Lj6Sg5VDwJ8fF9vv7BXZcSnZXuy3Pi63zSIAw7Eal9l/7eebmgaBBHHPZvkEAuV2Yw54zDiTw0cqUkh7kI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fjhdH8s7; arc=pass smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fjhdH8s7"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48329eb96a7so2270095e9.3
        for <regressions@lists.linux.dev>; Fri, 06 Feb 2026 08:58:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770397132; cv=none;
        d=google.com; s=arc-20240605;
        b=b8n6IJfQspBnCV3eHId+JZnk+OF4ZMG/weTb8kuJ2uQ0xhhCBpOFgTPwyEn81XW++A
         B8WNjRPhWN5gS+5m+11DMLRytkH9LS33nYCmYPbNl8L5Tc6yHFJjphx3fqJFLpsklz1u
         cVkPi90x1dAeqy6q8tjNObGUsIltVSbg0LfwZVtRvvCdbahixnuUAKRekShzTj8nMW+p
         3PvvBIfBtIOqziEjfDLL9RRxqOThItM8JGu41m2f8nJZLio6kBgc2y0xtPw5iU+8CLI0
         YLs6cl5M0zywFGk9csLeK0FSBnjjZIhTZ/k+V+TBddBbVqpT0drkXxMJYzZXK5qOW+h0
         J9kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SINkWacze5S98GIhSSbJIYdPhJkcW6UFPLcuajb3eHY=;
        fh=YYuidP0YAF5yhTQCc4sWc9+RGNo30nXgrHOJltgoDzw=;
        b=hRlSOB5m4rvpC0QxLg1kGwcwApZDH42Ya1g30JBhOitlOc/R8vgdeGXj/7Fsl+rxcu
         eCTVFSRAArgYqGD/3tjhVCd4uYoK30HobAM5BOyxhQtPOMBU9XgVRXej2zoYHSWIUlWy
         pn52n1PqOgt3nMpYJ27NpYcQDkA33q7/1/kj40lCDu1IpZ8s/xqMHqdMSmkbu/O6cQDe
         yoswNozGyOQObMesTfMk02r4vP3pTDklDK6CwvtOl5Fr3su5fIh7foY/EmA3G/76fHlO
         tJlfH09khSGb4fH580oZ5FB1WsuHqw2mLjVf0O1SsSToRyB2hrIEv/1TwDtzmhKBk8xT
         /h5w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770397132; x=1771001932; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SINkWacze5S98GIhSSbJIYdPhJkcW6UFPLcuajb3eHY=;
        b=fjhdH8s77fJ+y4Zyo280H/lEnn2PwX+6O3152UV30CUstpyKhEdZYWIUaRXx8M5duu
         nBlEb2G/neOBOAuxlOcIys8rBlRcXHXEuKpk5U6TBiMfkEeIkk7HfXAbEDIRdrAlaWjT
         eXsBQ0PR3vSAexmeTq9ChaTrBra611cBbFen8DcwPiQiasq6IQFYhK5oqXbfOwLeyKKy
         Pt62YILIHKBXHyPJB/N6jcmCAVaZd11h+h2Z1xOuACx6/5pGVH3p6/YQyEnp77bJE2Rh
         ZQ4vvXCRUTA6BaU/DpFzd2e5ncTggJaHwyw/atzLpkC76SpkuO8vftpN9GL3NuPMmSYe
         667w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770397132; x=1771001932;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SINkWacze5S98GIhSSbJIYdPhJkcW6UFPLcuajb3eHY=;
        b=NBi5LbBMHC/LeUJOfWPpcZ+4stFkyH3qN297nZzqlIgV61i9aXdpQfv/YoV49t4iKr
         Kp9PRovNEzXvaGoADPi8D5Cka45If1X/RgjJkASOPeV/Z2QYDBdzeX6K6Em1mXmqzvIX
         SSR5Fp+iATs31qnH0uv5h/TiDsAhTklxDDVQ1zW5eGebOG4gwsClK0VvDDbIvghcfMAj
         br9mPaBKDBAbZCOzz6+/fszSZlfxFH86UTvyDXeJLVGfX+hurQjkyoCbpW2HpSYJ2I//
         20OH7t75ke9koc0jw8bPp3KzRxDXeDCL0hEpsMlqtOhL1/evQa8i3CW0VgL+FUYEhZwn
         dZsw==
X-Forwarded-Encrypted: i=1; AJvYcCVQN01k7gxrgRvwT250Au3eVf5+zwcDejzs8cyi06JdMkPnV+iKHeeYWquNtpUnqnRJjFQbhp0w2/IaEg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwJ1RHhqxfK8Ff+/CmkTJydtXUlUc10jEMFUrVlPWCyV/UCX5kk
	/T0v9p+NYYDZ5Qdrtvs458eeDqLMzaruy0UfkK9Gt3q5qjd/WkEBIGvUCqZ11essM+AggPyJ/MR
	CAXkhShmWTeuB9fpxBmMatAOWce+bNfc=
X-Gm-Gg: AZuq6aIWfX4kMlOk22DDrlXapNfeuicoQdMWKwhrNpK+10g/6oUlZti7TVJ39zq10hH
	VU+q+yaI3ShjHLTpYUjmoyBvv1uKZF53HiVkzX8aV68lqBa5dIYfK5ChyPm3dr3vMSXL9rMXJsc
	49iH9GphVwfZAQIQa7+2jFIEjTjQO9PETBABkjKIplWnc7Lk3rHTUOAC1o1MvrImUI2tiesTohA
	pxYtO/x66Gh7Fp4jROSl/YViKuMac66AIwVz39+CSOEsAU+Jb9bpiIHaxzlNPT1qPkTvdnH
X-Received: by 2002:a05:600c:19d1:b0:477:9a28:b09a with SMTP id
 5b1f17b1804b1-483208b9470mr43758935e9.0.1770397131636; Fri, 06 Feb 2026
 08:58:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAFLVeg9hwH3PbKu5rPWZWqq6yz5mRRoB9oqxDkxNRdEDLGbVBw@mail.gmail.com>
 <CAFLVeg_soeYV4tOYKMo6TMYOtuWWU4TFCjUTxUrVEyGcRwMz7A@mail.gmail.com> <df6fcd73-fe0a-42fc-97ce-7e458c340553@leemhuis.info>
In-Reply-To: <df6fcd73-fe0a-42fc-97ce-7e458c340553@leemhuis.info>
From: Denis Gessert <denisgessert@gmail.com>
Date: Fri, 6 Feb 2026 17:58:39 +0100
X-Gm-Features: AZwV_QgNCppAnl3lb89V9TBwVA6S5u-NVBJN7ILzPpKGv0R-o4J6O7rbHQT_tuA
Message-ID: <CAFLVeg-qeWu4ntgyqotsgjogPEyhqrMGG=UDWuZe+-D3K8YPTA@mail.gmail.com>
Subject: Re: [REGRESSION] mt8183-kukui: dts: changes in dts caused display to
 no longer initialize - Was: Re: mt8183-kukui: drm/mediatek: dts: Invalid
 display hw pipeline when probing mediatek-drm
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: "angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>, 
	Evans Jahja <evansjahja13@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev, =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Content-Type: text/plain; charset="UTF-8"

Thanks for the quick response. I compiled 6.18.9 with this patch
(without reverting the previous commit) and it boots successfully.

Cheers,
Denis

Am Fr., 6. Feb. 2026 um 15:55 Uhr schrieb Thorsten Leemhuis
<regressions@leemhuis.info>:
>
> On 2/6/26 12:33, Denis Gessert wrote:
> >
> > I found this email chain while troubleshooting why my Levovo Duet
> > (with the MT8183 chip) would not boot using any 6.18.* kernel.
> >
> > I can confirm that on my device the current stable 6.18.8 does not
> > boot unless I revert the commit
> >
> > commit e72d63fa0563f8a6e98c10fed3a9ce74dc0536e6 (HEAD)
> > Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > Date:   Thu Jul 24 10:39:08 2025 +0200
> >
> >     arm64: dts: mediatek: mt8183: Migrate to display controller OF graph
> >
> > mentioned below. With the reverted commit the device boots as intended.
>
> There is a fix for it from Otto here that I guess should help
> https://lore.kernel.org/lkml/20260106-mt8183-display-graph-v2-1-e7e56054eef5@abscue.de/
>
> Side note: lacks a stable tag and maybe should have been merged this
> cycle instead of the next. But given that 6.19 is immanent it might be
> good if this could be backported to 6.19.y once it landed in mainline.
>
> > PS: Apologies for the potential double-mail.
> No worries, happens.
>
> Ciao, Thortsten
