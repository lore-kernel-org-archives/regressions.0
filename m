Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1EE311C16
	for <regressions@lists.linux.dev>; Thu, 11 Dec 2025 18:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765476714; cv=none; b=uOzP5NDX/P6+5XJSsfzJlODpUhjBPZagKK+iz2FkMmJoKaskuWgIXy91hkP64dmvTpoAcvdu6xChh8EqTzZKxEHjBahDq8pC9MsiCtO5Esu08tR30uhJB3ITV02im6yUzp2cFhUBVN8cutiaFjwY76iqgjMSElK9f0FmUvPYVQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765476714; c=relaxed/simple;
	bh=ohNRR8mRdaddagF55e/ewnAj0hfyCt/6ndE4X2UBo0M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DAuJrPOZyQlGhJ6gStTdyMepPwf68fgtE/K+SsN4uHXgXmbOD7+/GMQfR3Ejlt97fHkRrJ4KyXKHx1eS7QBCo7H+ypM4g3HpFmaxQsCa6poPbjv/woNX49QlABYEOYoSzIbrHV8KE/tgTf8lcY8y63GU/tGHltx4SqJMgjiuzUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qk0wEU6i; arc=none smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qk0wEU6i"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-6447743ce59so402911d50.0
        for <regressions@lists.linux.dev>; Thu, 11 Dec 2025 10:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765476712; x=1766081512; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SDp1RXcJwC2kzIqG/Erv9zF7oztqaR2rGAAgD3AO8Fk=;
        b=Qk0wEU6iu6EuHjZUCGQg38hYWWq+tuUG5tyJ3v59KMZcoAPz5SIAtrzx3DFmgcxSoE
         v8WS3YxBeOLCShr1GAcJy3gMG9rKf6FC/jrfU19n5pu+xgEXsaUQpA8ejtdXN0h8Zlfw
         1Fdz+vYrhEBZZPntoRws1KeJvj/gUZjUgHJ8fxSoVwxnh/3HL3KB5CQY/fa7LW5VT5jr
         NeMp7JC42m/WevWAeelrZMeXdSd4JffM7RPN8SRWSnZ5p1p6euW94y8XluR9Kgo3WY3U
         ZuwySX+6bkcg0Tn3AI18kFy/3F2CeBrQ2/Uj0W/WZpQwo86Usj11ihj1XgVkmVsJRG96
         QsSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765476712; x=1766081512;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SDp1RXcJwC2kzIqG/Erv9zF7oztqaR2rGAAgD3AO8Fk=;
        b=M/NM8r1/f8OEm5B7bnRW+1TuoCh+g9pyUgTigxQJLewJHL+zFqmhNMShz8QWH3WieP
         M1A3D1W6YX6weSdQQD6fuw+Z9zn1+VvmF72zikLyoaCDsEb6liUj2dt1zVUEpHpdiSQw
         NQ9D5lCvSYJNFQsZN15GG3XapC9JJ0/yIk2h7iEQICrrhdjk6qKDyXDP9gEpYi0kaahs
         8CQdc+wfTkD7USUs+P7jdr78KmWD27FZJf9YJo7gB3NJrX2RQ6Wm87jKoKNV3u0cwoG+
         kkRFexTg9jWwEe4xSvQ+DEoZreNmIwkDo+bHjJGy30D3mB6nLQwQn/2iQfErWdes7URY
         fNoA==
X-Forwarded-Encrypted: i=1; AJvYcCWRLMNZHexkgBpK7Ivw1rEFL/kWV1sVAigBK83GEITp4uGz1vQ+j64mly//rnZwQhgRlz713RklBY4WAg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxv1nkJqWEowDKqdkqHc5hIi8pckCu2w38e6GXCjeDvS1uxCEms
	JTEGXsG0vjVqaoS/gHYFhPWYDYfzEZYtZxaGYmsmfpr9kqEuZtZZKc0YPX1JBifwlDclRhSaJRb
	FaZDgBz8UOzeTJ9IxS/xBH73r1dLBdOc=
X-Gm-Gg: AY/fxX4vnv+2MoCzeryR8oY5WgVelwLGbzgEegMG0GJtqbeqYtFdED9t0todnz/p6XS
	xhobd/a/RTMJgl4mWOXJaLV1TrsDnAuT6e5bhwz94B7Wip0e0VJW4UGMFxZhmfshrZv9BofoZaK
	kNFcTcbxxaQnZYS/85qP0AbtcUAkU4EJNzPTmCyasC+o38U1gK3QKSKGAht2ILuBDMqivkble5b
	0gOetmVIoknkhScQf1rLMd34kB/aYxnp/tcZPLRle3cTXPjH2zLklRf/Qb5JNUYB3XRDrUD
X-Google-Smtp-Source: AGHT+IFRzgGjcYxIbLMExA6spsMBuwax3EGl9r6dtOafMGycs0N9+jMTSH/Ac+W+oS1JYN3ndc0s25a9u/TA2UWi42U=
X-Received: by 2002:a53:d003:0:b0:63f:b1d4:f9e3 with SMTP id
 956f58d0204a3-6446e948acamr4367472d50.9.1765476711525; Thu, 11 Dec 2025
 10:11:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <87o6q8l68r.wl-tiwai@suse.de> <20251015145749.2572-1-safinaskar@gmail.com>
 <878qhckxc5.wl-tiwai@suse.de> <CAPnZJGDeCkqqUpEh0SBfwvsxfMp9ZDXqvhrC1s9zRp6jX+Fvnw@mail.gmail.com>
 <875xcgkvnw.wl-tiwai@suse.de> <CAPnZJGDmCnKPz2eygwDjQGXZWVctGyJxV+OeFSLLeZPOCEvvbA@mail.gmail.com>
 <CAPnZJGBdqPhmNOes4-BRu8C-0d3yco8H93WhdORxm7MRBSw7CQ@mail.gmail.com>
 <CAPnZJGCqY9j-33piRBpkurSDsOfAqV6+ODGtToGDsgNQd-g9cQ@mail.gmail.com>
 <87bjm78978.wl-tiwai@suse.de> <CAPnZJGAxrVJooo9CdgExd+uR+s=W9Na2dZzyjKZc=xYZv_kvmA@mail.gmail.com>
 <871plbucj3.wl-tiwai@suse.de> <CAPnZJGBq=q2iW9gMEv9U9LCKJ6f6Uu7Z3QrDCw6SdRGL0sAKVQ@mail.gmail.com>
 <875xagt7d1.wl-tiwai@suse.de> <87y0ncrons.wl-tiwai@suse.de>
 <CAPnZJGCknqB3XjNY5zhD7i84pz+uL+v4OUgw04ADxR-W=CAeGA@mail.gmail.com> <87345iebky.wl-tiwai@suse.de>
In-Reply-To: <87345iebky.wl-tiwai@suse.de>
From: Askar Safin <safinaskar@gmail.com>
Date: Thu, 11 Dec 2025 21:11:15 +0300
X-Gm-Features: AQt7F2q_yl_QsO8lNkmidwy3ZCDdGlJk7jGsZGeMqFXZskur9LDYPeAhNm2kr9w
Message-ID: <CAPnZJGANGeXuD56sfNMN4D4gVQD=4eZ4bA2bTP3yuBJhatXeow@mail.gmail.com>
Subject: Re: [REGRESSION][BISECTED] My audio broke (was: [PATCH 05/27] ALSA:
 hda: Move controller drivers into sound/hda/controllers directory)
To: Takashi Iwai <tiwai@suse.de>
Cc: Dell.Client.Kernel@dell.com, amadeuszx.slawinski@linux.intel.com, 
	baojun.xu@ti.com, bo.liu@senarytech.com, cezary.rojewski@intel.com, 
	kai.vehmanen@linux.intel.com, kailang@realtek.com, 
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
	regressions@lists.linux.dev, rf@opensource.cirrus.com, 
	Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	miguel.ojeda.sandonis@gmail.com, ojeda@kernel.org, sam@gentoo.org, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Daniel Xu <dxu@dxuuu.xyz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 10, 2025 at 4:00=E2=80=AFPM Takashi Iwai <tiwai@suse.de> wrote:
> Actually this tag isn't really right.  This commit casually surfaced
> the issue in your particular case, but the bug itself was introduced
> from the very beginning, and it could hit earlier.

Then, please, add this:
> Fixes: 82d9d54a6c0e ("ALSA: hda: add Intel DSP configuration / probe code=
")
> Cc: <stable@vger.kernel.org>

82d9d54a6c0e is commit, which introduced "intel-dsp-config.c"
(the file was renamed since then, but I think stable devs will able to
figure this out)

--=20
Askar Safin
