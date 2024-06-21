Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D52E10E3
	for <regressions@lists.linux.dev>; Fri, 21 Jun 2024 10:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718966712; cv=none; b=clPoidcyLxzpdsIiyZSDjtYdqaR6HE7Ti+BlLzfrgk5LK53U08/d+oGX9vgdEArZ9CJFQIiXyeORO6htjhE1v8wyM8f84PNb6JGl+szs+HpiDCi25OOMTsUYw0uQDMOTu7b8pGCc6u97YPoRDfqntrEU77dmE509NZD1azVTnQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718966712; c=relaxed/simple;
	bh=vCzKBkI0EOlIaIsyEt1Ho+UPCJV1SGzIjta1R/xOqyo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m3Uz0HTkXgucJFvwF6UkgCF4XMU9NvKWUtG0Gtygm+pPrv/TaMBKyzzFndzhGn9DkHi6ZNOvTCMl5HCuKgzGDw6vaRok1xJizN1SANSgBmXbBjUeCQ8iUKID280Dr0an/5cGOiR/CxwQWgxYAg1nr34/rCSKpn1iDoLsoOem7x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JAcJ81XU; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JAcJ81XU"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6b50a661090so2063356d6.2
        for <regressions@lists.linux.dev>; Fri, 21 Jun 2024 03:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718966709; x=1719571509; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vCzKBkI0EOlIaIsyEt1Ho+UPCJV1SGzIjta1R/xOqyo=;
        b=JAcJ81XUvJe3tyvvLyFf9Ts4mUfdEfWQEM+iM79cHcm5RPL+Gvqw0QGKicYbIXT8y2
         5zd8APvao++5EC1lO3nayEae6xDiDVp3Jp8cTJmoTmw0hUAVUWKgkQKXO3xydEFkqwDd
         qBkmYYImxJdmin2NwbJa3MgO7X8g9b+o12aNDO9k6OoMybgMh6In2vs9vi6e4S8SWNpW
         k86Ttr69FBDF/ETHqkfnNtrCBBBksduqirHz0mUMVRz+puF9H8UIVHjSorohkIZHqjBj
         m8d7RglcBBijiqcYEoz7Dns/ZHOfle/DR4ROXmPzH863ekAz5rA/RA3d2ERNed7bqwL1
         6pug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718966709; x=1719571509;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vCzKBkI0EOlIaIsyEt1Ho+UPCJV1SGzIjta1R/xOqyo=;
        b=cnK45F7Jd5BEakpTrkr6aqKhsuHzV3gURX/DqRLBs59GmL9u7XE2GCA6P+E/7NXc7B
         t+5F9HZsouE0WP6nDGCojbhpRhafARSu2u93Emjtg+iq1S/cT1AQJtEuKq5MUqsEUC7H
         BfM0vdkvchObDr3O2GMMjit6dGcq2tZMk6htLrCw5GtiZKcEh56RN7+zMFoIE/6wFrBu
         Tmc/UKqDrog1U3/WKqVSSo/7TOY2IteZLcGs6vstP3bR+DGaY3PWtWRScGROFhTdEghS
         X2N/1ro3Iz57Pt+bdNPPPjOH4AfA2xFz23q1/mnGWZldgPqnCgH30ifT6jRfmJC6f5se
         2G+g==
X-Gm-Message-State: AOJu0YzYgVe5mvEAsmvfC/SFqv+An/W7vPDuF9oOMGcE0a15PCxE7KjU
	kwA8PlhfQUOBUn+GXgIUgi2H1YdNYSuHifzKtdmTrG3bD+bGB8RtqoEyloZyzsYhHqPEsg+T0Pz
	DcyWEl3dg3wNDfivLO9+19/cwXMVJbC8t9leVXY3Z
X-Google-Smtp-Source: AGHT+IGI1lyNp+TbE3ThRp8In7N425hvlee/0+RjTWRu6FiUFfFtrbG1ST8pJQ2n45IwF01JbVb46PDQIa50lhYgPS4=
X-Received: by 2002:a05:6214:c8b:b0:6b2:af02:28d6 with SMTP id
 6a1803df08f44-6b501d261e4mr83907056d6.0.1718966708856; Fri, 21 Jun 2024
 03:45:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABXGCsNptxsQO=5=qi-JYiFX=rX8Ok5inK80Gn0qrUFWbtBGng@mail.gmail.com>
 <CADnq5_PDxJ8O1JUQ9RBYRFB9G1WZJos05ZAM4jUKuPBwPxjNkA@mail.gmail.com>
 <CABXGCsNN9LwHc2x2AAEH=5UNwpvkWkBqRYz3OP8MZ6Woy+HDXA@mail.gmail.com> <b6c440ca-e63e-429b-af41-5f27d4b8b2a2@leemhuis.info>
In-Reply-To: <b6c440ca-e63e-429b-af41-5f27d4b8b2a2@leemhuis.info>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Fri, 21 Jun 2024 15:44:58 +0500
Message-ID: <CABXGCsNoFfMn7LaqqFgEPg-ECyUPN=f=SXVrFi=GZk6c69-Gqw@mail.gmail.com>
Subject: Re: 6.10/bisected/regression - commits bc87d666c05 and 6d4279cb99ac
 cause appearing green flashing bar on top of screen on Radeon 6900XT and 120Hz
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Alex Deucher <alexdeucher@gmail.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>, 
	Rodrigo.Siqueira@amd.com, "Deucher, Alexander" <alexander.deucher@amd.com>, 
	amd-gfx list <amd-gfx@lists.freedesktop.org>, dri-devel <dri-devel@lists.freedesktop.org>, 
	Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 21, 2024 at 12:56=E2=80=AFPM Linux regression tracking (Thorste=
n
Leemhuis) <regressions@leemhuis.info> wrote:
> Hmmm, I might have missed something, but it looks like nothing happened
> here since then. What's the status? Is the issue still happening?

Yes. Tested on e5b3efbe1ab1.

I spotted that the problem disappears after forcing the TV to sleep
(activate screensaver <Super> + <L>) and then wake it up by pressing
any button and entering a password.
Hope this information can't help figure out how to fix it.

--=20
Best Regards,
Mike Gavrilov.
