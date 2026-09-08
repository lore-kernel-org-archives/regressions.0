Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F5741C6A
	for <regressions@lists.linux.dev>; Tue,  8 Sep 2026 15:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788882410; cv=pass; b=CU4MNoYuXwXqzwBjEUI4hIb4OofuX4qUyfI4mOirUW0UTHAhRqpRrKoLOuwz7Fydm8KXqH4vtjSgRAp4Rv/1eZG9/FEICVcDlT1lR2Z8AdFWqbm6AjzlsZnckvwF1ciD0RwjbPy3QOtxUhO/XNIWw9YhEHWBARX/A0DcibqQBiA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788882410; c=relaxed/simple;
	bh=WDHmQZuMHbf5qYqxvV/utcQu5YS7zXBqPLQhJFSMwks=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RCjtmD0cCt1zrVtDd8WSxVVm9ieOdn9Ipj01gjm6r+sLBXK8HvzbIUstzdxPvlS5J5YcyeZTU8Feadmkyo8+YadknRP7KC17v8E/vRIuwH7IcWTTG2b98A7/xHA+HkJ2La+FfZOaeScnp6OiJMw7+W4YuT2ybPal13rwpJEz2Xs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y2orUb41; arc=pass smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y2orUb41"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1ab17a810so188148a12.0
        for <regressions@lists.linux.dev>; Tue, 08 Sep 2026 08:46:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788882408; cv=none;
        d=google.com; s=arc-20260327;
        b=J3yZ5td9Xi9j9u8DrdswkD+Gcd8TpzWi4682nNf+ixiX++qlB5z0uKrklseYXjL1HQ
         nDalhqmMDz+aecqQ0Oua3hO8X+UqIdH6rI3R9jJ6wU1jEwWg67xTDNzUtUP2ndE1RvR4
         YUSFhu4p96rfLyZkW0YdDayFjUJ7X9rBC1AM1Um0ZZ53wm0lGITd01+R9TbfFzFNQf5e
         VF/fqb9hy+t9aypn1Ihp/qLE6HQB562Qcwzb7HepIIlfI0lFy8SN346V49j1gjpctnHU
         LWuOtg7GKoeWOUrThN9qNo+fKdBvAoQ4avNsKYyBAnaxUOutQx0ob6pf5wcXdVVXmLRs
         BkDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WDHmQZuMHbf5qYqxvV/utcQu5YS7zXBqPLQhJFSMwks=;
        fh=vS5j81weTJXfpl6YAeuq1BJrozdaMeVLp0sQiqLc3hU=;
        b=slbpyZQfqk7WEjDLgKWQDwY/dtB7340c2dEAEq4Wmlk8Kv3uqjS9C9yq6MNy0+Nvjm
         6+Nslk7A1widGUn/AzLtpLkn7HXjfCoMZP5DqU3rFk/F+42rn5SIS4LR3rjmNGZ8pyrU
         zII5jWsEYCPznwOPG3TTUvEjYvzj/asvHYc2PCfIxjc7ATHh/sCWElZ0UJ9yzRt5ZKeL
         oWFnNvgh+lSOKX7W98ZhU9Ci/m871K6+M56yDDFmBFjCuDDPsusW0yKRqM4sO2xT+u61
         9KbAfmKnlmKoCY4LLMTVndWMLzYRJp9U3gjcXEc+E4AMcGOcMgbHVUWTNveVNnZsEwZ7
         Uzbg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788882408; x=1789487208; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WDHmQZuMHbf5qYqxvV/utcQu5YS7zXBqPLQhJFSMwks=;
        b=Y2orUb41k3TH/p9QYLFTlvmrcBCWoDKLMDTUd3DhMbdBUH2yce2RlOEyCrsQ5eHkzP
         N+XsmY3evYnlCiWjvwlvau53JJpePhs4kE4N/9qEJPExyzSNB9DU6BvikglBBSkjOkLI
         YHl4m4b1MzUtSWwoz5ZhJj/y2gAD580R1kbdyXT9QILmkcWoKy7xNiAZxX0uxgyTqudV
         CGyNS61fXmEBa6VzLClNXy67OlilOpkP6B6rVEk4XcdK2c8srdvlXmECxPjSB+idQ65p
         e+S+jRI5e7wYPfnvxesUYTJkJrhW5CKGOV5gYbSjBoavIQcGiwv0DEGfT3Ck4oqJvXeK
         SuUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788882408; x=1789487208;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WDHmQZuMHbf5qYqxvV/utcQu5YS7zXBqPLQhJFSMwks=;
        b=d4PXcErK366cs9gRh8pzS4kVqkvgBju4xNsu6sM5rq1C8RIbZCZmwg6+CDkVeXftlQ
         jPPxBV357PFh6lx1YRlVB3SZK1zYSV6MQ41/aZtJGahtFoQUU0kGMqcdjNe3dXaFSJV9
         ZNXUptBvI0SsytS1SJj96DK3Hn83Oizk7E1A8cMrqDRKaZ4xTRhRWJzQqqGfrhpQ5KjU
         icpxsQaHNmVNMlhHbU9IrJ19JKUdEJ+2Ax+/id0hzox5l8U+TuZPXaLObZFtD9jdHqUM
         C5BkLr7bhaErysVU5BeEmG+pb6yoYm73xesh6bgtAAcxJBNl5xrGguJMfcvy9GWPG9MW
         ARZw==
X-Forwarded-Encrypted: i=1; AKwUvByrWz9dKYipVfR9PjdGbfH9Tu4lfovxrBHx1goBrYejUl8SI45+Y9sEfkuNqq3qq5U20oepQo1RDRlWMA==@lists.linux.dev
X-Gm-Message-State: AFuF++mMIZMJmSpa4LMrrrKvs6DmSION93Da68nH3XtOP6GYpFQ5cKYE
	+RAjcGKj/GQYB9Q0mQN4Tbf8WercVV9FfKxxovXWOMuJX51VkIFre7Or3lQ6NHYaNQHe/6hKg5Y
	laj4u1g6YC6dsn8zH4J0rtIql3pQz4ac=
X-Gm-Gg: AYBFou1a7zavsbe6A3FHXDa8ZB4Lp6GEP6lqlIvyb2kPtDmxxYCHhGXOvyOBT41iMaW
	heqSRCZc0WW4LhIeyE+KRdhodze8zqDdTkxteCgqYUiQajMYlT1pBttQ+g/p/6XqmmVw5IoMYUF
	PdH7LiJ9mTd8cWQ1gVonYLGJ0HQJ1bj/xEQu89OCRMsRZa9uT6Tl1qrgjsuPUVxJF9D4KsJTs0L
	/kiSRDr+pZhMkQFu0iG5+r+y7Qbjs3oD3vosBYF0yPu3AOvD1FYbB08e7IZqXAVVyYyHG38umZr
	NW1Y4GLc7jNNjOncN+zjN3hfmlp8BnrKNzmaLVKAc+Ehf/0C/C/v+ORnsXZZmfb2YLpb3+W0yon
	YvM1nxebGl3dQiHlsN4nVIYKSsebZIU56wjuWI5Sya1nGH4Tcza19KOH+Uf4d
X-Received: by 2002:a17:90b:498c:b0:398:a2e4:c784 with SMTP id
 98e67ed59e1d1-39b3d5c4449mr20100311a91.1.1788882408145; Tue, 08 Sep 2026
 08:46:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <4da62a4b-c4ef-492a-9a27-b56bd4784acf@suse.de> <1b3d0eb2-9e9a-4d4e-b8c0-ff966033ef03@leemhuis.info>
In-Reply-To: <1b3d0eb2-9e9a-4d4e-b8c0-ff966033ef03@leemhuis.info>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 8 Sep 2026 17:46:30 +0200
X-Gm-Features: AcwNN1UZy9klDHYXIQdjFGVCMKJTy69JyKumGJIN9nRq9tK-al_paSfA5ZANsw8
Message-ID: <CANiq72mUW5d1dOQDgpYjuKoUaZAi-im7j3v30Wd4KTDznmM9zw@mail.gmail.com>
Subject: Re: rust: Build error in DRM bindings
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel <dri-devel@lists.freedesktop.org>, 
	"open list:RUST:Keyword:b(?i:rust)b" <rust-for-linux@vger.kernel.org>, Mukul Joshi <mukul.joshi@amd.com>, 
	Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Felix Kuehling <Felix.Kuehling@amd.com>, 
	Linux kernel regressions list <regressions@lists.linux.dev>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 5:35=E2=80=AFPM Thorsten Leemhuis <linux@leemhuis.in=
fo> wrote:
>
> And I already wondered if I'm the only one that is running into this, as
> I reported this a few days ago already. Pseudo-patch to work around this
> can be found here:

You are definitely not the only one! I have been seen it in my CI too
-- I didn't reply here or there because I had already seen the other
replies in the other thread and I expected it to be folded or dropped
the next day or so.

But, yeah, it is painful to have it in linux-next.

Cheers,
Miguel
