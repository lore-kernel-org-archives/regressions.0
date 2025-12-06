Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36B02DF15C
	for <regressions@lists.linux.dev>; Sat,  6 Dec 2025 21:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765057231; cv=none; b=r70cvzfxK8nYpqEeawfRjYUryyNK6puusUymlVq/Yyw8ZswrJDk9dxvWdzdhXXRLODDvnhTJFu1oEXZo04WytMgIL8FoHcJ/edcHbkgRk+9x4JqzMxJqqq7jHQ035vri4aLyyr1YxP1dqVId+JXijXWBKtHOodBVFcV7AVY1EqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765057231; c=relaxed/simple;
	bh=NtKxi7YsFujc1I7HbuzJSsN573ytnARDXoaQUKiX+cw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d8a1oImbMJLckaMHVFvsTf5evKWIOCfTsZ6znxM9uh7H3bKQSuPgAmi8E562EwKM2Q2Q6fWE2XHeBhJShSkEbM3Kyghfb+ZibnneM46zuY+tIDqMuZIdNW0JjV0kTGoeegv+15jULIwBNHuXauIhduw3nNyMdJ2BwmWpb9jnWqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b0VFl9vS; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b0VFl9vS"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-6430834244aso2675737d50.2
        for <regressions@lists.linux.dev>; Sat, 06 Dec 2025 13:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765057229; x=1765662029; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BmZLch+tsUFf8GGxDj+inr14eUW0ua38vm6RI6oO3pE=;
        b=b0VFl9vSVZr0PrfVzA+b0ftY26duj+s3Ol2fz7jzQXH4FFZa6yaBg8i6msOvOO61pl
         L9qhh5SUQunb1+OuP8qaxV8sUZao+UrexvYhu+1xZuMvyRo6WKQcibpi9ZkCSWXVCeJB
         P5ctYrfzroiibKyh7e8oqrYi0qVIE+t+m+taxUKYSXbDN5UWR2PTVNeCL1zAvljimyQO
         9mo4fbNJbLQVC8nE4fq33Oajz0zYI2gCCqnikw/QrHOfan0uMWhjFDPA2wuMmn/ta1dd
         HEASBlmxtjzYBnR602mrZ6BcakMsfZ0bqgs3k+DbQ3DJIKKC5Q1ipT5VAQ6/3nihxXBV
         Wu3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765057229; x=1765662029;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BmZLch+tsUFf8GGxDj+inr14eUW0ua38vm6RI6oO3pE=;
        b=Qw2QozIMGzFTKD0e3rKWcdQO3PASgCyu1XQ2EQGU4jlUhNRjLSiM12y4feaPq+gQwv
         BAq/J10wvP88oAdZHe60A1cDCFwq8LPhs2i6BRbT75KDd2ed1czQlzCzgQKErjviWoVq
         WktHTP61qsTfPyAI95TsJ53z9YNZEVJNv835+Fd3RgyZT9FFjHgPb5CFkzxx79aPfRyr
         FS/L8MeTcCQv+kQihSpe4RJcWYMlqa2WyH78OBSJSlfmElLJKHYtgoD59RHupvsuDiMg
         e/Letr2U0tWaqUyQ1iAaK966YtejzjHUkT2f+8ye62yb0W5TJwz8un+qugFo9H8lmSLZ
         V67Q==
X-Forwarded-Encrypted: i=1; AJvYcCUEnfKfcOjG68N3F/omP0KnhIZZNc3w3XdyC+cly+5Xr6jhk8VHqjyHHJfcgZ0ZYtU3t+9itHZsK2Kwcw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyTCgbs9oZbS7dInDJGQzg51OZFI4PaOvpsQOQA5Dj/nsYpoBxi
	TO1zEP39rn7Vt2cukQKyNYNiqrVpY874wRYYRuwzPyV0lGkct/tiRhe9175468oekpbO4W1qHr1
	9OjUNQy5jk+W+LMTAGwdKSSCQRb5DhZA=
X-Gm-Gg: ASbGncu97eTumOA5VY2Y/Me4dRoTT0PawNf6fVLAZUcf1ivnKGVEKS0a1LcFEXiUQfm
	urJuyCyhphWmfLczgriyEjMD8TG+7MfBiwpjRLVWthIhQ8P0c98uJ+ecoxomyeg5i1xWmhFxmbk
	+9bwcfo7xS11oGcwdVFrM9YxD876uOPqJY4E/ErkB3BrDNCMWhzvl0ctpsx1CJFeROc5LB5JOgE
	UHVGqbSefU4WHQH2AWDPkkkVLdCuNmu2RMeSKOZtKgnIHnZ1tDmsO1XEzgPV9WS4xIWs9eG
X-Google-Smtp-Source: AGHT+IHqbqmEJ2vaB5W4uwBXmi2AqqrA+VzbtYcWwJiGGaH0O5ufb0McVeuzgrEaiVyROG/3JlGg1/jbdyFP2FsqpvQ=
X-Received: by 2002:a05:690c:f06:b0:78c:28b7:88e4 with SMTP id
 00721157ae682-78c33cd4cfbmr30764857b3.69.1765057228766; Sat, 06 Dec 2025
 13:40:28 -0800 (PST)
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
 <871plbucj3.wl-tiwai@suse.de>
In-Reply-To: <871plbucj3.wl-tiwai@suse.de>
From: Askar Safin <safinaskar@gmail.com>
Date: Sun, 7 Dec 2025 00:39:52 +0300
X-Gm-Features: AQt7F2oxKkU3ePgE3Z0z9BFc8gUWWy2Y-S8sruhwpHi2W7JaGHpQyHor_1Jl-cs
Message-ID: <CAPnZJGBq=q2iW9gMEv9U9LCKJ6f6Uu7Z3QrDCw6SdRGL0sAKVQ@mail.gmail.com>
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

On Wed, Dec 3, 2025 at 12:42=E2=80=AFPM Takashi Iwai <tiwai@suse.de> wrote:
> A rather hackish fix would be something like below.  Instead of

I tested. This patch works. Thank you!
Tested-by: Askar Safin <safinaskar@gmail.com>

--=20
Askar Safin
