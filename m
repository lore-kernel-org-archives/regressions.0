Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87B93DAC13
	for <regressions@lists.linux.dev>; Wed,  6 May 2026 09:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778060885; cv=pass; b=GU3fDQTtRDY/ES+YUZPdwYWeOaUGyeF0Rvp29fM5+KiNHoQxrf7+Fw9kBZyvkAnaEZplqzTRMN75UErIhCOwnwQNN0fa8LueTqYo5Wi3+iKnAYTEdkbHrCONUmcHeo5tkCq/KqCn0Kfdt+b7nAME4NYTCnz3X1j1VVCwD40t5po=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778060885; c=relaxed/simple;
	bh=yuVmWGMWhN3ZNWUjk6uvrYwBImF5e0LOXhUj/6CqfC8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=b461T7sVcYZ1A4wZZM8OYgMFslvUkJJeor4dgxTb7dGy/zdvsyKS5+eaiHWguob4gmhOhyR88rKZaUe627zvQVLXby8kWaJKYtsAYE0u/G5AgwC0t7cPuDjBShYeNYuVv/mIaoRV3RUjG3GWZWAxkqKSX/rSTc6vfoi4sQ6vcq4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shopee.com; spf=pass smtp.mailfrom=shopee.com; dkim=pass (2048-bit key) header.d=shopee.com header.i=@shopee.com header.b=PLzkOfwg; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shopee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shopee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shopee.com header.i=@shopee.com header.b="PLzkOfwg"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2ecf9e398f4so14916275eec.1
        for <regressions@lists.linux.dev>; Wed, 06 May 2026 02:48:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778060883; cv=none;
        d=google.com; s=arc-20240605;
        b=WCoG6oIMFQ+zjLkMdUwSw0oO4NRlMe7QTp2gbQ7JdHm3Szj7CD7Cy6fYUpVtWcGxfO
         qX60Dy9NpdsGvJs1qakORSDKoQzrPfcsGgHddATBy+IG2K/++kkkIES7Jgn5Zcw6L7mj
         fUVAadaVUHLs2Rq6Z7JnZP34G/qMoe/EbKxft1WqT86KxLJ+9jlvbw5nUs+XLwbrOi9g
         D98UlyVYaBUHKXOgvAXGE0ezaeqvDIrvB4i1WQ0yHuk45bHzjesGllnIJMcfGkunzYah
         c5daQ4NqKjYnwdGvh9G5+K0Ev2fn9o+eMOvnO9I1Acb0ISkAzT8+PAhA6EpZYU9GYIr4
         UYJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ygCZSnbBwDX3CST5NT0ABYrZxpQum0y60fD/0E3MDrI=;
        fh=7FKEUNXEFtspooLNWCLC/dCfZbCDDyCLW9Y/63m+9tM=;
        b=OsH77hF6kVR9OUQofT6XlDhV57AGOU2GVBG1YthmS8aAg9qwRiMePwbAxuh0uH8ELa
         aMQ5IUeG6hMzA0R5rvxnAAsCuhND0NNSZuThlZea137mWxoqBLlkSe7KmE1e++ldM/Gk
         213V+Tym8q8aqUns6mawD/NoHscIDEZkHaz+x0OYp96692aw08sN/ggGDt+7a+IZF9bu
         C3LmzOPXxsUmomUfWWFGwQzJuU2JYoCi92ZX6dW4xkofgsjAOKpUFTgTCljNScowpL4I
         u/9Xir2QdWdzXIPxpuS6lEAWBtRnaxEWD0GnOJT0gZGOqse/QNJwdS9xKCvwPA9JpWeQ
         BMVg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shopee.com; s=shopee.com; t=1778060883; x=1778665683; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ygCZSnbBwDX3CST5NT0ABYrZxpQum0y60fD/0E3MDrI=;
        b=PLzkOfwgVzoVG0HQWPkQuUfRznduSs94wDBtIWRj3HSvGErgzcAFYIpPvbSVetFemW
         nNTWg8XRtY/jN4BfyVhUqfhhr324jFNWAj5Y/6m5JyNxNsJsjLfkTyk1G79+FTYYHrqJ
         8HCV68CrBkfiO8PjNwh1xUY4XnfzhopISb7xtfeE//MiBkhOP03HHvdR+UdjB1vGN5c5
         cgw97h9DjitFjkk5bf3CG+wks6eciC1Im+h8f3TMfWdAdhaZUuWAKmnyCxsXrSWuROhN
         iQMHDQXvowk5G18MICVTqvCxQcgzPS11agkAUP9Cx3El8jZQAaaziUd2M08Y4SxUyHmg
         8oNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778060883; x=1778665683;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ygCZSnbBwDX3CST5NT0ABYrZxpQum0y60fD/0E3MDrI=;
        b=JaNeW4ELt0wzHHV33atWrxqcH6Jm21oFOrfhKAF9R6BGy5wHHZdp91A0CGW0lXo4Am
         r7xniMwh4Haf+FhudrBuqNoeV9G0hi3iUW+4/PBT/DHa/ZM87fbRm6gm9db3gB9ac6gH
         360FnsMSb7hLvIN7AMEIPN9ezKDLkc4GXPaOQ8yEWaPg3wS71GUK/ENqliOvho/zp8rs
         vDdLmV+KxwVz+YIxpWd8lVh9cj90GuBHUIx5sNz7wwDPEHnFCXjMuhlY28I/hyRiFV00
         vfXybXXG0w+LFtbqXZtjcANlXk8cTEI7Jgn4qaPbEU3iV5gIKoJFLZf1Zk5d0/CX1TgI
         JEJw==
X-Forwarded-Encrypted: i=1; AFNElJ/WGzQeQxT/GWW9RhobzpC+eqrPMVE6R5+gohi1cBB1nJLr3IThnrwJQC0w9InVOvL68vx/cz0faKEx0Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwzTi6Qi8cbyq8vYcHbgr5ThoNUaxFmIUOSMpB6oNFDCf3Amnsj
	hvJBjDMTdqXdvm+/9TYRZvYn1/PjSpJJuL8x1fFGuM5iJ1JdIUXMVGy+hMABgINj66sODpJuD+q
	xoN5exvGdASI7fLVTqdj9o+h39dMi/ztNZXbXyhBtCg==
X-Gm-Gg: AeBDiesJ7+Mi+z1+OWeZjNUvf2+KjzIfsdKr1CCbTUzHGNN/cee1N1e3dKYJ4wH53tm
	cJN48/BVtfLJtm5Nyo6GwTbSiaoT3Pj7pzRW/uYdPbbXJDp0sl3w/hAOPAnlz9IsbfPzy/wUfP2
	jWkbjb1HnIwQMBAubzsnixfL9qUloHX7RpX4Kl1CtbkHN3Oa+WrrB1pgAT9X8KWJsjISdgRSMLO
	SHti25ZWieG+Y5FQLbGqy3tTT7UURODhHHd6Ei+NYaDGcy3f7omXHbD+1J8kDd+WU1SnTOYbbvE
	wZBS8Cnqt9btL02Z2Eo=
X-Received: by 2002:a05:7300:dc92:b0:2f5:301f:64b4 with SMTP id
 5a478bee46e88-2f54b362e6bmr1463290eec.12.1778060882926; Wed, 06 May 2026
 02:48:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <177771348699.1898023.16904466444228860838@eldamar.lan>
 <177768508393.32886.13183514325428485879.reportbug@pjp3.podorski.net>
 <CAL3Ev5070_=K9F9+03GrE2+4tgr=j_CO19=m4ZPTd17YSwmokQ@mail.gmail.com> <afsMUZa99G_gsve1@eldamar.lan>
In-Reply-To: <afsMUZa99G_gsve1@eldamar.lan>
From: Jiayuan Chen <jiayuan.chen@shopee.com>
Date: Wed, 6 May 2026 17:47:52 +0800
X-Gm-Features: AVHnY4JRr4dMAOCRYrbHzgHiTFh9CHKATaGLdQcQmiR2HXRECFWVHXqMtcFo5uE
Message-ID: <CAL3Ev50kzBn41s2twKjKAv=98sPHwPVCp5nmgmA8XGJA3FdVmg@mail.gmail.com>
Subject: Re: Bug#1135514: [6.1.y regresssion] 9a95ec9144ee ("xfrm: fix
 ip_rt_bug race in icmp_route_lookup reverse path") causes log spam on ping to
 unreachable host
To: Jiayuan Chen <jiayuan.chen@shopee.com>, 1135514@bugs.debian.org, 
	Paolo Abeni <pabeni@redhat.com>, Sasha Levin <sashal@kernel.org>, regressions@lists.linux.dev, 
	stable@vger.kernel.org, podorski <podorski@gmail.com>, 
	Brad Barnett <debian-bugs5@l8r.net>, "David S. Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 6, 2026 at 5:39=E2=80=AFPM Salvatore Bonaccorso <carnil@debian.=
org> wrote:
>
> Hi Jiayuan,
>
> On Wed, May 06, 2026 at 09:04:24AM +0800, Jiayuan Chen wrote:
> > I think it because we failed to backport  this patch before:
> > https://lore.kernel.org/stable/20250207161555-b1a8749027831a1a@stable.k=
ernel.org/T/#m0c880c1f04f7211aea9b7f6b4de0b64aa1726417
>
> Which won't apply cleanly, I assume this was the reason it got not
> backported to 6.1.y. Do you have a backport of that, or should the
> original commit introducing the issue be reverted from 6.1.y?
>
> Regards,
> Salvtore

I tried to backport this patch to stable. Hope these patches apply successf=
ully.

https://lore.kernel.org/stable/20260506012057.285743-1-jiayuan.chen@linux.d=
ev/T/#u
https://lore.kernel.org/stable/20260506012115.286204-1-jiayuan.chen@linux.d=
ev/T/#u
