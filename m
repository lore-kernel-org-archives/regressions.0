Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A821D128807
	for <regressions@lists.linux.dev>; Mon, 29 Apr 2024 18:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714415309; cv=none; b=pNrDgUzXyDt4AX+AquOX1RXqZG01OInabDLXUFhXTM30cQCktFQ90kJFSUEj+vrGK2X69VPxMJsfKCs+v/qS86cL9EBk77+sv73MO6Yd4NH4y1lU1YDZnEAykHP6BN0EqxSQVx1St+9wOuSAAaGNMzmxw1SGbJd2GlXniYUXq9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714415309; c=relaxed/simple;
	bh=8gKah3ghORwSGGK/lLqzKUstmtlsU0Ko8BP6JJhYCX8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DCqTqz+uwBwqPcuohxWEMRerG6tHMv6F5DAs0TflESFo6OJfZLgatlxIF6t/GbXhpC/RTa9EGYAh4JpqvwGhPOxLh7/B2Prh/25lPyN7w957HjEZ1r8jkXGQLP6YiIktgUTB40Uzt+iddT/UvLa7wwcC/8/HGFZoOTQGJhfUQ2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=m4x.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=m4x.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-de5e74939fdso1224437276.0
        for <regressions@lists.linux.dev>; Mon, 29 Apr 2024 11:28:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714415306; x=1715020106;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8gKah3ghORwSGGK/lLqzKUstmtlsU0Ko8BP6JJhYCX8=;
        b=diVp5T9PhZ1BJPXM9Vkk/0VYPYGYCaoOvaI1v+Izr5WLyByn3gbN/VhACZpm3dyid2
         T+D+HZEaGpqigqyVnPAlW6pUC6xNpMwkhV8oZawe51mtOeU8eI+knDpEQ5pv39Zjcd8c
         tr1Q8tKMI3mG8t34/dJMpZnKZkVtQn4JQtwHsH460Jw5ipeHEgnFUYo54rLInFVjVFUI
         I9w63KdidKSy8krPNkaxMVTVJNZj0u3VKlrSBdLjs0ANtGXPXsuIPg6B05qsA6QCsAyp
         Gj0g6fVHL2Dhb9QojUUKiBtoYVGrDX6NesCBwxra5M7Brh83Q+RnEOZoAva0fGQLsQB+
         1rDg==
X-Gm-Message-State: AOJu0YzwLXSdW6dJTQuRpG65WFhQEWmVpJCrJYpYR/dkyJVOlxKiADqx
	2maN6BSp6P/qhaZ8fbGqmwc5wtkJvOxJjDIUp+1PSU/I9RYNlfjgRXd4u4rP9DddCmVnmgw2QWE
	mPdIY2CKYShYR8NyibAjLJZmxgDYJH+Ch
X-Google-Smtp-Source: AGHT+IHOyBFS0F26owaRkYzjeQ6P7JZp13vcQ6OpfgJfXqxeemEwewCnezmmd/d2OHC+eX+zxX0/6o4drbJoo9aPPc8=
X-Received: by 2002:a05:6902:1b8d:b0:de5:d1cd:b580 with SMTP id
 ei13-20020a0569021b8d00b00de5d1cdb580mr443367ybb.36.1714415306415; Mon, 29
 Apr 2024 11:28:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CADRbXaDqx6S+7tzdDPPEpRu9eDLrHQkqoWTTGfKJSRxY=hT5MQ@mail.gmail.com>
 <1de62bb7-93bb-478e-8af4-ba9abf5ae330@leemhuis.info> <4bf3497d-0ede-4e05-a432-e88e9cbc10b4@leemhuis.info>
In-Reply-To: <4bf3497d-0ede-4e05-a432-e88e9cbc10b4@leemhuis.info>
From: =?UTF-8?Q?Jeremy_Lain=C3=A9?= <jeremy.laine@m4x.org>
Date: Mon, 29 Apr 2024 20:28:15 +0200
Message-ID: <CADRbXaBkkGmqnibGvcAF2YH5CjLRJ2bnnix1xKozKdw_Hv3qNg@mail.gmail.com>
Subject: Re: Bluetooth kernel BUG with Intel AX211 (regression in 6.1.83)
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Johan Hedberg <johan.hedberg@gmail.com>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	linux-bluetooth@vger.kernel.org, Paul Menzel <pmenzel@molgen.mpg.de>, 
	Greg KH <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thorsten,

On Mon, Apr 29, 2024 at 12:24=E2=80=AFPM Linux regression tracking (Thorste=
n
Leemhuis) <regressions@leemhuis.info> wrote:
>
> So we either need to find the cause (likely a missing backport) through
> some other way or maybe revert the culprit in the 6.1.y series. Jeremy,
> did you try if the latter is an option? If not: could you do that
> please? And could you also try cherry-pikcing c7eaf80bfb0c8c
> ("Bluetooth: Fix hci_link_tx_to RCU lock usage") [v6.6-rc5] into 6.1.y
> helps? It's just a wild guess, but it contains a Fixes: tag for the
> commit in question.

I gave it a try, and sadly I'm still hitting the exact same bug when I
cherry-pick the patch you mentioned on top of 6.1.y (at tag v6.1.87).

Thanks for trying, is there any other patch that looks like a good candidat=
e?

Jeremy
