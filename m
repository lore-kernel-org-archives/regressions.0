Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23556397E8E
	for <regressions@lists.linux.dev>; Wed, 12 Aug 2026 18:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786558130; cv=pass; b=dSKQBDMa99KfYCwZfedBGqwp33o5HAOa5c8JZWcM78T7N4xco3p1BDFZ9iovVQE1yVaoZsUhrKvbrdEN9oxDzDmNo2hQkHBeiBESkdmMvAyNxFjkYgHg3mTC4YLeGrWSb67JQsK4y9ji41J0nwX0mqbImwtSuRksxUZlxgUUeBs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786558130; c=relaxed/simple;
	bh=tDAznMRjGGoRXEXLcatNnbfYk03GES+TYl5AHVXiJEA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cNbOLRrl0SWyTBMoqWYclMnhUbHfVHvwjTOLq3zHXQI4mZ+Sf2KpYPWS1ezZAe4JydsIgAkRKGZr9qsFP3g5Rq7sQOVGN5/wi99sjEdHr3ipbgiBAuecCDBnQ81oABy9EnPjT/T112GhNsGrliwNXpn8oWJ8TJMgaclBpGyuIvU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c9FXoycp; arc=pass smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c9FXoycp"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-81eaf3709b4so17776547b3.0
        for <regressions@lists.linux.dev>; Wed, 12 Aug 2026 11:08:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786558128; cv=none;
        d=google.com; s=arc-20260327;
        b=KkdvfDXFRTI+Kd+baK50JM7LnbqxHqrspWdkhHrZhPmA3MgSU/VC8T+zeYfYLh9K0b
         WagBN4sMkEA93l3ORr7PCxAy4YrbRiKoE9x60fVMbP0tf69YiYOZ3pLyc0nu5daLY5u+
         LbHThKU1xMp2nV8Beriro67QbBJctKo0ioHU/xQsyOeit736MP6i34rQpkCCOe8CzD7N
         hvVAMJT0EbR88mEzGnfJb+l9BtYtPC+8/A34L66kHm9L3iBYZLFGyTPA1T1OBh2OTzcz
         mlYE6MVxxgUflMs9H/bCmcMb3k9zl7/FbU6rHuCnPz+GT/3GQHmVnLpNRr5ebWZbaVPf
         iQjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tDAznMRjGGoRXEXLcatNnbfYk03GES+TYl5AHVXiJEA=;
        fh=FJb0w15yvkjR6ozclqjnEl9YpaDMXC/kQt6ekfN05Lo=;
        b=DccsdPIelmv+2QjUkPWfMPNHC2B+UZDRZtoMjc7bB1xaQ8pFGsg7Q1jz2FYl7rnhUJ
         w3VF/IgrtT1IEJ710fdYjVvFBT6d9dQoWff3Nejgkc37nlmE4JnZFXYWefulUUBPk8w4
         Xs4kDKQlIYkdFR/HIkH7oagq9DBHO4LHa7ymaHiccw/RqKyKfsBxLrKl1mtlTePmpbst
         UaLF1x7gy3Wqicmy/Cfe0pOIWNig+YYsQmyj0gqK6PYxKIUrFob8H+1rFwLhocf6Ed2V
         H4yBhq2A9PoOd/BXW0tceHH5Z12/MlcDgz7ClEzUtizgA13x9SuEwNVvRm/CD09A7E9A
         wV0g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786558128; x=1787162928; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tDAznMRjGGoRXEXLcatNnbfYk03GES+TYl5AHVXiJEA=;
        b=c9FXoycpiJmCjGKHmX582Gfq2D4VZj+qbtZ5FccMzdMsLYJWdso16dK4SjrckkK47K
         Fit8cIvWa55Jbc3tAH6ivCrz/waRNyNLGsBanlWew0G6iZ/94UeaDL8J/Jvt6YUiWi8z
         W5qDeDlOj+ybL3e6tshQwt3iFFb3RxE0aOxo7rb3huah5Hurc1cx6ugP2w+aM4KyFA26
         1Ed2fLGE+QC0PL0sXkHvzT3u1pM87KnS3VTPYhusmznprfSlrdtQbrAQ8hacw172b7YD
         0KcXNMtITtc4UYxGPrzqj2wXBrm3jEIEsVh6KKJw7+RHi0hDU5CokMQsQ31tcyEGbqo3
         0rMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786558128; x=1787162928;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tDAznMRjGGoRXEXLcatNnbfYk03GES+TYl5AHVXiJEA=;
        b=sNOSqCZuZleW8Y7ffLUDhSor+F6Np0JCanz7bhuNQ4Sa/we7Ez8Act5BYBvYmJ3RBT
         0+8+mt28iR2NRVTYjlxJ2PfDqNNoHjCdVtNKtVYNm1V3YhXm6+OdCnr2537zbJ7Ys4S1
         Adb/5SFfVbghb4kopldprTRfSYcJxQxS7elyMG7J//vaAbmvTNs6jq3RYTHavzauD1lt
         x0Y8eUFuOdW5mmMbgilW4PGRM0UpGB/UNreS+L/IeTgVBIqxV1JxG/b3QseRAAU0L/9m
         TXcIyvV3I/p5YoHzpS0jXkZgvqIVouKg7PfEkaXOzuDKyk72NrAfM8wYrClZM27jmKWn
         VxqQ==
X-Forwarded-Encrypted: i=1; AHgh+RopO1cOcdgOZ4SLryFmYjBL7s60/l+ngK51DA7uq0gZx37dxx1LqUHgqGR/dssfNJbM8DfOZpvcVP9Rkw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxO/3MYxQfIGT+W7ysAw8lW2uUYA4SgyOcaM+pIVe3MQYE4l+Yj
	/H+QPSw0eVinBrGo6/KAH5+x7NJDcqkMthSZVLOKnVmc/SUeCgCsVAE47K4zP64A2xH4SWlTbaC
	OyZm+xlOxTHXgR5k07WoTrLbqZ1ggGFs=
X-Gm-Gg: AR+sD12uY4iBhz8TMYF3OvR3UerkJ4CgkboF4ljRxmnOjnJo0T1WUIGGRtPaM6tKxZd
	pxzBpBCsjAZVYsVe3RhRc4CA0ztxFPr9uHi4qdVeZ1wnEAipIwGAdGlKaCCEzP5i0lScDwF0oEv
	KbQpJkuRdqPP3zDivJtE5iIjjuwyGv/eQ9YIl4slOpZwMzZ2LAAPVHSLxhuolwnBcR776E0XKZO
	DmitYZpewcbwtQ6CXFrvRym/c4LWj15tAMDZWGA5bAJyhjZksBFXt6R2tbXp/jPD3gB79Mf4NIl
	eMZIA9BFq/3pz1gB3jYasmd2aapaofpq4MaivcYs4MVqO7ixAf1Lp/+l9J44YWpITYpaNotAVce
	g
X-Received: by 2002:a05:690c:f08:b0:80d:c24f:b790 with SMTP id
 00721157ae682-83103c1b43amr32915937b3.5.1786558127896; Wed, 12 Aug 2026
 11:08:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAJOGg3z6LJPDsdPNBxajgy8_wQxfhYBRxe4EiurZf3kPU5A5Bw@mail.gmail.com>
 <annvXXwcLfD2NQDU@kernel.org>
In-Reply-To: <annvXXwcLfD2NQDU@kernel.org>
From: Julien <julien82453@gmail.com>
Date: Wed, 12 Aug 2026 20:08:35 +0200
X-Gm-Features: AUfX_mwsjbdH1Tfa1xTcWeM-qjIO-NMhf6HDOGI-dyH3wm8OSe-uzSuRj50grMw
Message-ID: <CAJOGg3yt-0NxFtD1JHEuVwKhuMDBVDc3wyV-p+ZGkk_C_WU=Fw@mail.gmail.com>
Subject: Re: [REGRESSION] no TPM device after "tpm_crb: Convert ACPI driver to
 a platform one"
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: linux-integrity@vger.kernel.org, regressions@lists.linux.dev, 
	rafael.j.wysocki@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2026 at 5:33=E2=80=AFPM Jarkko Sakkinen <jarkko@kernel.org>=
 wrote:
>
> I'm coming from holidays and catching up with matters.
>
> Is the issue still valid?
>
> And don't worry about be first timer if you have actual problems.
>
> BR, Jarkko

Yes it was still in the mainline kernel I tested a week ago.
