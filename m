Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B43C50279
	for <regressions@lists.linux.dev>; Mon, 22 Apr 2024 08:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713774449; cv=none; b=Ah7NQ53i+J3x6s7ZAQZUmGSBWmPLd9zplsLyiqdwwgCxLDCKFQevoKAf8eTUcqYpjFEWNwjv1GPrGXxf4efdo2JBfj5OR7K55tRq+06NjYbtD36OkukrQ1Jb5uCY6qe5d61pxRy192WTHeIApHaqNCPIfe+TvjkaURGfPCERtIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713774449; c=relaxed/simple;
	bh=aD78rLqskgC914RCm9khoqMnLlDqno7mNTeyWzYamUo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MnaAq5huL6N99zXK4tPrGdQbaX0JVBsfyvjAnyOEgk7ZBbry2xda3bKjELcVoa/h6VBydtBTM1K7xJtOXhuuJ6M+5jNGh4t4n26U5zY488hH57eRBi+QDEqvk8VKAAeA4ZF2JBpR4g8tDwzjzrpOvhMAJ5GBn+ITTVn9O3wS/U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=m4x.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=m4x.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-de480576c3cso3309865276.2
        for <regressions@lists.linux.dev>; Mon, 22 Apr 2024 01:27:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713774446; x=1714379246;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aD78rLqskgC914RCm9khoqMnLlDqno7mNTeyWzYamUo=;
        b=oI8TckYtVErkS82qkD9Pnl0nERVbI4xeACRnP6lMuu9h91u7e7M8gYg4bRoV+bMLWL
         CIZu4h38qGvq7Fj4xyGBgFdborWGzyDwtzBwmGDaR+/F/VK7WBVq+EWRJnkZ5ZHp4B9B
         y6wEncYTHn8yVGQLie+zr6V1UId5VIPUTqR3bWoNPCUOK92lXWYvhiItvoyPV66xDhpN
         woac6zZXU3QKzhUheV+0xU9tZNHdoDgh6cgAWiogpEUKADEJyOFiCdcBXC2BjSavxMKn
         JDmPCtHnp675gfYhP2NnRFuvqdDWwc4FoI6vGy4YJhIQAPvN71HBdFMzWx2OkXQbTUgW
         v21A==
X-Gm-Message-State: AOJu0YwuGAUVGkzCAtIUDHfu3O3BP2+MB5p+UpPhoQGlve+JUTFHQGr9
	JcsU1pSYwh7bsOlzQqSSEWtR9Q3N/ldzdXXmzjC5nqhK60d1FWkQgSCdnB+8BR00nBwKgO3JD9F
	ZvrMfz+tTubXAPbkRp/q+3KOpNAsxkQzvl1AxZQ==
X-Google-Smtp-Source: AGHT+IEXbCZSWU3g4FXj1qrawUvWhPPACO+jlqdCC5sZMwpmG56BhjWMWX1FBTaRWJRoaoBVZzPomrfAdD+x5fnr/C0=
X-Received: by 2002:a25:4e86:0:b0:dc7:4ad4:c977 with SMTP id
 c128-20020a254e86000000b00dc74ad4c977mr8441742ybb.25.1713774446122; Mon, 22
 Apr 2024 01:27:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CADRbXaDqx6S+7tzdDPPEpRu9eDLrHQkqoWTTGfKJSRxY=hT5MQ@mail.gmail.com>
 <8eeb980a-f04a-4e94-8065-25566cfef4dd@molgen.mpg.de> <CADRbXaD5Fsy0dxjrVG2JAn1PA36hpoTe6=23=zbhx8NWNf_9mg@mail.gmail.com>
 <e723ec51-a1de-4d4d-870f-34c9427fffb9@leemhuis.info>
In-Reply-To: <e723ec51-a1de-4d4d-870f-34c9427fffb9@leemhuis.info>
From: =?UTF-8?Q?Jeremy_Lain=C3=A9?= <jeremy.laine@m4x.org>
Date: Mon, 22 Apr 2024 10:27:15 +0200
Message-ID: <CADRbXaA2yFjMo=_8_ZTubPbrrmWH9yx+aG5pUadnk395koonXg@mail.gmail.com>
Subject: Re: Bluetooth kernel BUG with Intel AX211 (regression in 6.1.83)
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, linux-bluetooth@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thorsten,

On Mon, Apr 22, 2024 at 7:41=E2=80=AFAM Linux regression tracking (Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
> Thx! Did you also test if mainline (e.g. 6.9-rc5) is affected? Without
> this we won't know if this is something the stable team or the regular
> bluetooth developers have to handle.

I'm now running 6.9-rc5 and have not been able to reproduce the issue,
so it does sound like it's an issue for the stable team.

Cheers,
Jeremy
