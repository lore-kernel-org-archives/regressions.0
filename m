Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71323264E9
	for <regressions@lists.linux.dev>; Tue,  4 Aug 2026 12:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785845280; cv=pass; b=X/SF7Y7US7cemyjVNwSIxKof5KRja0T+T1zmD9YNuxV27Kpzf0w4naaUtlu1tisQbj3KWo/4Ajb4ZpV5f4177pD7I5EF2lbE7hKZcZ5zobVIAYdHc2SpFBTEkvoiq4xT1pmvR2HySbRJb7iihnzQDty02QXZZjIHryI5tKqfyzU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785845280; c=relaxed/simple;
	bh=iU2JhsyQTfX5/YWs07E2PUyMLuaKOwJY5Z2TGbtlyYk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=do/ehwAi7s6qgGWSwndgv3He1CsNjVdn+7i4MGKPq/GgSOoMzT4KCdJqRsDWWjd/g1mOq8NCd8TFs0sTDL6TTSRnBvUIkXI4pOnW1DK1ekPKxlg3CZK5B+HZUj/0iPBDfDzWV48QiBq1uEOeUZWz307NHBa6NH6uCwOUfYzxV84=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q7Rt0FqG; arc=pass smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q7Rt0FqG"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7eb63dbd229so606569a34.1
        for <regressions@lists.linux.dev>; Tue, 04 Aug 2026 05:07:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785845275; cv=none;
        d=google.com; s=arc-20260327;
        b=O9YWAmNVxi2dvf90Rp6aVKRZNjcn/Lpc6w3FMeAwugwlbC6Eb33XGNV7tvzLzFjb1H
         hKibSHCFqZfdrscDO88OZNH2Wje+EvFrX3DVRoF3ms7ukJ1jSOhYlJBrw99Sjs6tpvzB
         DBXkrodJObo+zlpBQuYVmoNNvRpvXOcBuHUdemEeHI0mF+w2ZBmtSETwyL2y4om2YP1o
         b9Rc0wMrFgrlOJc9BNI5UMpW1uQXu3SGqYZpieSb5mw4Stc7CQP8XKI/QcoEeC1cgsYA
         dxxI/grNjPaNzSozIfGpDeYs/oRDUAUCCPTDV5SgzevMWTFJbfJKyC2Xxu0YxjQnh+k3
         df2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=E/WQgZK+TkIY2qLL27HpcsDojys+/2vjkSDsZKAUw3M=;
        fh=kFQjmv0m5M3OnGDtgfvN+3WcJ3Y887QCgnA2cI0BwPE=;
        b=TmEJ0g+Vgf2fIwS8QJ3MF4q0kFA3otBJRI5D21j6ezPP9R4NYwo4Xga7FNY/MToMvG
         z900s6pxTTE8JJP+nvKJACPHEuNatw4w3iRd6uGR0+5NOzJuLZWCND30gfRhtDif4vWL
         sk5/CCZYakkyoAAhbOwgCVU+qgrPdaeUyEovQU+6DlfmAPaZIkof1ghTDijb/oYkFWGV
         T8XcC3jAsejSm/hZmXUh9A22vVLYTP32dEL0m2tw6YZGBEudjRiae75ZlvbGnjYQPGQe
         Paihjr8UdD5VKkJy4BchiWej4InOYzMgPRUv1PirAyBDUKFHW+XPxvPvzcNpjhxNxvHw
         6anw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785845275; x=1786450075; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E/WQgZK+TkIY2qLL27HpcsDojys+/2vjkSDsZKAUw3M=;
        b=q7Rt0FqGIhMuCckUtHSW8Yn1cRCzkGCE27UggoS81eV1X3gJahc1X1AhWSQd8UqCS3
         mLz6yj/iffs9faqNpLn+zpRfyaoQhaucQ+CpvWwoTjOOrKHvYj/wJUqN6fscdbTb2VAL
         afle5Jr7qD88dqyQFolzsMVn4D60eDeFBzW39ZN5lojRBvXFBl6gxyvC1yTGRWa2c8QV
         CwA7AgUEcHvwsGUOtJNjdg4fL5qRDPhk3MEpyhQUAW3KuXCqDjDCVXrb8/6F+KwOhlj/
         hRpOdnSy8ro/4TookrC2MKNtqPCLKkxJefN7jRR3fm76YxYm4Sh3LBlWS50DrWSZXWE4
         2kAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785845275; x=1786450075;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E/WQgZK+TkIY2qLL27HpcsDojys+/2vjkSDsZKAUw3M=;
        b=adQnJ71GwVzcXde1Oh30NfE+27+xNNeLfSz0jfSANnFGTkfTRdj4S2VQ6j64tftuME
         0+WTMhQ/aB62g7LNOh/XVNqEbnszMoGJHtLiGaBZ6+oYkfZlPCoL2w1FkDBnn9M/kBdD
         FDDX0DKtZrGe210ytLsqYvF5zci67QLpm+xzWz6mhMOJKnzxdr4YaDrb2M65Bo4lQoeu
         aKhob3qC1BC4QDcmzoSsUtnMMBStD8VVprJPB0Q+/SwZwcv1lzqjHYjQq3zDMH+qrP8G
         xefEXX/TUdHovU7SXAt1R1+8rHe+W+US4WaKXc/Bs4eS3G5WGvpyWBFvnKktQwKNh/2R
         +O9Q==
X-Forwarded-Encrypted: i=1; AHgh+RrtRK00yDN9otZLW8tiKRb7kDj8KpIwKN2Ko18LrRb2KFsQIjtQ0UmsSm0B5fH2GrvKbkrwbyiOnjIVAg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+gMIw+lqbvB4H+Yp5CvWgF19uhsEzbK1SSWj0w66angG04gGK
	4+njHgclkOsPGn9B5kmDgJRCZbMojBOXyd9DQE2GbNsVm0aqv9+bprf0cD6GiQEVRXeiQsqe44I
	fLhzTOQJdQbViASGZOuzRhqQ8VxOs5tM=
X-Gm-Gg: AR+sD12hY8snME6HxqOf04b+YLErfoQkXVx6Ncj4bxQeJ2zVODvJOPR/w7Ie5jb4Yik
	RdS2Zf7q0/cLV8ZNiiv+e+pydgBFM11Otx+wd2WydDJZM2vOnzRZVWR9BL3nR+BOpigf6BkPI6P
	RYiw8t7NsCWwzaknPkF7gImtkx+PKNg/BUOW6lHUcZhR0eBpo/AECeA1MDLRio2YrD4xZZWLUSX
	J4sGZEDsjA9jcMdV5JMNmWxgEanaVO0rHlaqXCetAa6i6PWyFpTGXVoY9hncY7PZsjMBLmL4ISz
	hsztrv2LVGOA23wWoYiA5bhW1t57aCF51VBP9VYSKm0LQTA=
X-Received: by 2002:a9d:7095:0:b0:7e9:e288:5d45 with SMTP id
 46e09a7af769-7f1d23a7770mr1609087a34.18.1785845275576; Tue, 04 Aug 2026
 05:07:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260728002048.19351-1-mikhail.v.gavrilov@gmail.com>
 <013a295e-faf4-4930-a101-27cfbf252178@leemhuis.info> <CABXGCsOAK92WxxLyYVfVrdEdLwvZh0JK5RJHn7J0X0mtCD3bkQ@mail.gmail.com>
In-Reply-To: <CABXGCsOAK92WxxLyYVfVrdEdLwvZh0JK5RJHn7J0X0mtCD3bkQ@mail.gmail.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Tue, 4 Aug 2026 17:07:43 +0500
X-Gm-Features: AUfX_mzQRqwCX4ylsuL4wr6Nrj0aAhuzJnGtFoWZRvfm-XsaLbyT0PmqT8LLCF0
Message-ID: <CABXGCsMmee3nK2Uxty1SGxLjFNgXf_dhANfkbz-Z5V7E5sbPfQ@mail.gmail.com>
Subject: Re: [PATCH mt76] wifi: mt76: mt792x: drop redundant napi_disable() in
 unregister path
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: linux-wireless@vger.kernel.org, Felix Fietkau <nbd@nbd.name>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Nicolas Cavallari <nicolas.cavallari@green-communications.fr>, 
	Bert Karwatzki <spasswolf@web.de>, linux-kernel@vger.kernel.org, 
	Linux kernel regressions list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 4, 2026 at 3:46=E2=80=AFPM Mikhail Gavrilov
<mikhail.v.gavrilov@gmail.com> wrote:
>
> For the bugzilla reporter: the revert should apply cleanly on top of
> current mainline, and I will follow up with the lore link once it is out.
>

On Tue, Aug 4, 2026 at 3:46 PM Mikhail Gavrilov wrote:
> For the bugzilla reporter: the revert should apply cleanly on top of
> current mainline, and I will follow up with the lore link once it is out.

Here it is:

  https://lore.kernel.org/all/20260804120004.523934-1-mikhail.v.gavrilov@gm=
ail.com/

Felix, could you mark the withdrawn patch as superseded in patchwork?
It is still sitting at "new" in your queue:

  old, do not apply:
https://patchwork.kernel.org/project/linux-wireless/patch/20260728002048.19=
351-1-mikhail.v.gavrilov@gmail.com/
  the revert:
https://patchwork.kernel.org/project/linux-wireless/patch/20260804120004.52=
3934-1-mikhail.v.gavrilov@gmail.com/

--=20
Thanks,
Mikhail
