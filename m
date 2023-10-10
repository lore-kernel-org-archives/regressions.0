Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099B028F4
	for <regressions@lists.linux.dev>; Tue, 10 Oct 2023 15:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mojatatu-com.20230601.gappssmtp.com header.i=@mojatatu-com.20230601.gappssmtp.com header.b="e27O2o+q"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-d865685f515so5924403276.1
        for <regressions@lists.linux.dev>; Tue, 10 Oct 2023 08:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu-com.20230601.gappssmtp.com; s=20230601; t=1696950158; x=1697554958; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m1yWK5hjBQ0wjkXfSMeS0ZutGUHPxAuWdRVh9wYUYN0=;
        b=e27O2o+qv3O71wDmaEUJ+FurE6lJ3A7HWv9DFvavVEQ5e4mkDjTm4EYuX62tOq8EwP
         +eOUQP1/AwAc/49heeNJ3u/z3RNr9vgNYQrxyDjCzk9TFiN8Fm6/+wKKKrtKvYfV0ZsA
         PKSrFIK6TZBZk8fFrPXfj5CIZyff3RX110y5PycKpVh5P62MtO4yMmpgZ0N3jowcNqLX
         pt8OXs9Okbem4MWT0wZp4+YjfhwresVNKbvEzYCXrvX90a+2UFsAUtDKFKAfM+imO+bo
         AstDILfjXpCqBS+grNGWfcJOIoqjoXUYRsk8FNIcd0lVlLnD5pucOJHsEhTQKbIUGfyC
         krVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696950158; x=1697554958;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m1yWK5hjBQ0wjkXfSMeS0ZutGUHPxAuWdRVh9wYUYN0=;
        b=oolEWEZAv12RH7HJVOFedFU5leCxTaisvQ5l63jBI9qpaSEmR73ZHPT57Q4MON5q0n
         Au9Cc7PuEhXWPO79DQNLy0+juxNfUo+RC5U7b3SMVtyTphbSusBpl0H5n1GaaKrAYRoq
         YSI3jd1hNHzekt9jidHWxMvBjB/IDZ2xBZfb2dXMFiL2vmx3u6AVK7ArGMnxQmmsIRsV
         52CSkil44W+S5SzjYEt911rYIYuxJprDLNy8k4gw6pQtnn5b6KHEwuPalwrGK4TlmgNk
         hY5j+zngCPMdZot5wvVATyedXJ+RETr8oNgwjjN39izOEARhzzcAgd/evT2O8xIZbnRO
         GEkw==
X-Gm-Message-State: AOJu0Yw0wtLwYILJRN+dRee3n++gOan3AeSAnw2RYg00+4xzf/5iO79j
	BQT6mFjhh1Q8M8bvhMPCz5/rMfi73oBHfJcPzadE0g==
X-Google-Smtp-Source: AGHT+IHYBpK+4fI/9nFvpGF+AWon1DhPZtC+/skjso/3+I7vMWj+ecsz05uAzVg4IRIY+AFlCmcCo7MX7O6oMEWIIdU=
X-Received: by 2002:a25:8503:0:b0:d9a:4cc0:a90c with SMTP id
 w3-20020a258503000000b00d9a4cc0a90cmr2065065ybk.15.1696950156384; Tue, 10 Oct
 2023 08:02:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <297D84E3-736E-4AB4-B825-264279E2043C@flyingcircus.io>
 <065a0dac-499f-7375-ddb4-1800e8ef61d1@mojatatu.com> <0BC2C22C-F9AA-4B13-905D-FE32F41BDA8A@flyingcircus.io>
 <20231009080646.60ce9920@kernel.org> <da08ba06-e24c-d2c3-b9a0-8415a83ae791@mojatatu.com>
 <20231009172849.00f4a6c5@kernel.org>
In-Reply-To: <20231009172849.00f4a6c5@kernel.org>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Tue, 10 Oct 2023 11:02:25 -0400
Message-ID: <CAM0EoM=mnOdEgHPzbPxCAotoy4C54XyGiisrjwnO_raqVWPryw@mail.gmail.com>
Subject: Re: [REGRESSION] Userland interface breaks due to hard HFSC_FSC requirement
To: Jakub Kicinski <kuba@kernel.org>
Cc: Pedro Tammela <pctammela@mojatatu.com>, markovicbudimir@gmail.com, 
	Christian Theune <ct@flyingcircus.io>, stable@vger.kernel.org, netdev@vger.kernel.org, 
	Linux regressions mailing list <regressions@lists.linux.dev>, davem@davemloft.net, edumazet@google.com, 
	pabeni@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 9, 2023 at 8:28=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wro=
te:
>
> On Mon, 9 Oct 2023 12:31:57 -0300 Pedro Tammela wrote:
> > > Herm, how did we get this far without CCing the author of the patch.
> > > Adding Budimir.
> > >
> > > Pedro, Budimir, any idea what the original bug was? There isn't much
> > > info in the commit message.
> >
> > We had a UAF with a very straight forward way to trigger it.
>
> Any details?

As in you want the sequence of commands that caused the fault posted?
Budimir, lets wait for Jakub's response before you do that. I have
those details as well of course.

> > Setting 'rt' as a parent is incorrect and the man page is explicit abou=
t
> > it as it doesn't make sense 'qdisc wise'. Being able to set it has
> > always been wrong unfortunately...
>
> Sure but unfortunately "we don't break backward compat" means
> we can't really argue. It will take us more time to debate this
> than to fix it (assuming we understand the initial problem).
>
> Frankly one can even argue whether "exploitable by root / userns"
> is more important than single user's init scripts breaking.
> The "security" issues for root are dime a dozen.

This is a tough one - as it stands right now we dont see a good way
out. It's either "exploitable by root / userns" or break uapi.
Christian - can you send your "working" scripts, simplified if
possible, and we'll take a look.

cheers,
jamal
