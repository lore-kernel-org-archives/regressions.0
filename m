Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F06A39FD9
	for <regressions@lists.linux.dev>; Mon, 10 Jun 2024 22:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718057117; cv=none; b=T08/VEkBdJSQiVAthCRXuzXMY6ZKEzM+GEGDlRZxinmUAPl1T2VE26ev/wCxvHkBefA27ALFLpBiqQQfl22uHTFOY7q+ubMEUKAd7FADAtKwdXWk2pIzdiDq6FCCcFtZZQi2gENnoj1Mh3wwas+Rpq9JOiWg82ZDrODWls6RqaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718057117; c=relaxed/simple;
	bh=rP+ricIK5YBlNx+/fEIyVLa5KkTZrxTMhtE1WPEqf4M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gYNDISl07tdBeK1QnibeokAr+ZB9g0zxcFPri8qvBGkYaX/c6vyNUO1x4+fU3rxLgNu6DDnLFD1iXTBUjTFeraXDS8ItRHGobmLQiOpt7luFtoZXoF2+OT6udtlTJrqr1G1UCxsTW1N0i1BLzZBlvDOh/AUpjltP9PD2DqNKz3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A+hmGIgg; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A+hmGIgg"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6b089f3d201so499896d6.1
        for <regressions@lists.linux.dev>; Mon, 10 Jun 2024 15:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718057114; x=1718661914; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rP+ricIK5YBlNx+/fEIyVLa5KkTZrxTMhtE1WPEqf4M=;
        b=A+hmGIggYLsh14L+5DePF9PIxMwQgsQzmwmP48q/A56C2NL4n6dj2WnOcpGkreyfM0
         6VPqOYsz9ohYUSNCU2Z2mu6Yiw/WQHcA1FeAYZFwpEMyCBco5OLKBB3Wvw8aEbmkFRmk
         iNx9Wb8byzo4TsjoXBe8rDxhmmTSwVQVDe3hjY1/MgI+wq1Baw1wJwMBsmmVJhZ7KGRx
         XVHwmtq3zAkBXDQ/IDfFHqyZjVwmkaWBCqRyhbll/zylRUKNFKFuhQMzs5Xd00glgLB4
         5DHmlaRgO1Bmrw6jBDAoFpG2z7X+IHoOkahJL/PIeLW31g4ypyeq1+SYI7KE5P0O6Gaw
         STrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718057114; x=1718661914;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rP+ricIK5YBlNx+/fEIyVLa5KkTZrxTMhtE1WPEqf4M=;
        b=jCkQ196i9gHaIdenGOyfxpblNKO42QKLezvv70TuN19KOX0YwHk4HQB+l/10k6nW6V
         TwsInm85Cg8+fP+9htovHZjz3b8qd09LOx2rxDOGu+wUdHOa6ViOqEX5k9VlDNuNruKq
         YvsWPukEeBQqWpiN9h5PiPt+BRfO4h4MvcbwBCbm9m65HNGXahIPs5mQdSNHDUdSp/cy
         2hVwbisIeQtInCOPIzyRM9Jolpx9YCkCv/YF6nGc9q6L87UBXFIn9b8mBQAJDw20qiJ4
         hyHAi/Ru6U/g2qQW4+ncR6dpg7GBarwkbjbO+xAVBdbnlknX5oz8YOCk4zovrFDyBiwM
         ZZdg==
X-Gm-Message-State: AOJu0Yyv1TgSj70ox0Iw+NZ+EDsvrotgyLJCIP9RZkSkGfzdvD2AN3Fz
	WirziiP/Um5Ptvlt/p65+TWqsl7X6cklEKRmqsLvuRXbmK2VYdCywyxe+29a0vEO0/YhMnMgaAA
	6wIrzVkLwj9HQ9AkNMrOu5Uj0pKN/rqXG+bbeFCAUR4A=
X-Google-Smtp-Source: AGHT+IGQ20EsaNML79UmilV2KhIHb9TaWTviOWcBxEXXPuuWWdBV50/ZYy5/0HVkaRbg9Sl0MYe/UbHQP7ro8jTYxgU=
X-Received: by 2002:ad4:4b30:0:b0:6b0:6370:28d4 with SMTP id
 6a1803df08f44-6b063702b48mr99825636d6.6.1718057114072; Mon, 10 Jun 2024
 15:05:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABXGCsNptxsQO=5=qi-JYiFX=rX8Ok5inK80Gn0qrUFWbtBGng@mail.gmail.com>
 <CABXGCsN=9UFvGgKztzkkAM1c8cVN-h=TKLLxWhKgTm11h+H-eg@mail.gmail.com> <907df295-61b2-4cb4-9bcc-608d1ff2cf18@leemhuis.info>
In-Reply-To: <907df295-61b2-4cb4-9bcc-608d1ff2cf18@leemhuis.info>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Tue, 11 Jun 2024 03:05:02 +0500
Message-ID: <CABXGCsMRb3Lx=twRyi75MqgTEfMwxsEwTQg-MR0GNconhDt0pA@mail.gmail.com>
Subject: Re: 6.10/bisected/regression - commits bc87d666c05 and 6d4279cb99ac
 cause appearing green flashing bar on top of screen on Radeon 6900XT and 120Hz
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	"Pan, Xinhui" <Xinhui.Pan@amd.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>, Rodrigo.Siqueira@amd.com, 
	amd-gfx list <amd-gfx@lists.freedesktop.org>, dri-devel <dri-devel@lists.freedesktop.org>, 
	Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 7, 2024 at 5:29=E2=80=AFPM Linux regression tracking (Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
> [CCing the other amd drm maintainers]
>
> Mikhail: are those details in any way relevant? Then in the future best
> leave them out (or make things easier to follow), they make the bug
> report confusing and sounds like this is just a bug, when it fact from
> your bisection is sounds like this is a regression.

Apologies if my pre-story is confused. I just wanna say I completely
moved to the 7900XTX more than a year ago and I was surprised to see
this regression on the old 6900XT. An accident helped me find this
issue because I didn't plan to use old hardware.

--=20
Best Regards,
Mike Gavrilov.
