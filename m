Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571FE244671
	for <regressions@lists.linux.dev>; Wed, 10 Dec 2025 01:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765331194; cv=none; b=K22Fu2TfnTqUQyABGaDaJnjD3dsP2huwE7jqSBNz8VDVMw5FJn8HBvP/xL5ePsGw3sfTjXYKFLC9veWjnmbpMG7Kuf6RutuoNr3rJ1RF9KYsb1x37cvImB8Nbfa6YgZvfk2+H30zSQuTVMyxQLGlhdB6AZSbPAlT2kHIY0cad1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765331194; c=relaxed/simple;
	bh=+/APqOnN84rXLQeXUydTcFlZtrcqSjMaTX9Y+xK4YE4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hi8ZA+I2pqyP4ythWGjgbn/iyzgKt/SY5iYKnB7hETMfwIwUGGoY6PMUrTWzefrjndJrMeWReNvHY9gNqiNFOF7U+qsGryxuGtg/H5jbg7BHEiQQaaJElCeZDLXmPc+XJNAEe9wRhBXK+cMK3vu69PJSr3gpiRDgGBtj0+0c9Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O1936seI; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O1936seI"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-78c686aa4f9so5751797b3.3
        for <regressions@lists.linux.dev>; Tue, 09 Dec 2025 17:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765331191; x=1765935991; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EFP+SwCgoD6NbY96JnNDOX6vBcbdvYJju9zn+wNt47g=;
        b=O1936seIsqDcO0CQv03reWrYz3FGnNUHcUvp4dzCrzTtlXX1KssxW674Nvb67Ka/a/
         stWTNHT4jppP+iPi9t0+ne25kRrMxO+oqv/A6PLOKyWSbnYdrfem/cmJBbq+6wOFK7gw
         mhkqce4D0NmVGZJatdmnY/eOcmj1unHVrvrKPV73hMUgO/gxZaqOh4SDWI+VEJwzKkvb
         om8rZ7xIZdrlyF+aY1Ibx+s4dZ6CuVf82C92Q4xInnwSH/0oYHZa0KcUjnazqdLRC1UT
         LVIYdFyiVEJ2yyzSgWil46BN9RLvekESM5/yB02c+MA1J4oAB2uTyC5ptLG3x/7HAiqb
         tflA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765331191; x=1765935991;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EFP+SwCgoD6NbY96JnNDOX6vBcbdvYJju9zn+wNt47g=;
        b=OWqp41PAlmSHdBdPtGbNjbIRmHOJJB63Z/H8wWQosnrXuXVNcG7m8nzBzxQu6NKc7t
         jgWGQn6mX7s8T230VCU2rSPOYhyZTHgeElqgES6TXal+wfE4SvJJnTgBExjBBHGbzngX
         R5CqQTd5FdO1yI93bZ3s2Iv1fUR7hnyRhIMFS3rYN04wfbgGa+gmHR/7U7EDnYvw2ZSb
         sHVFWAzNU23NsRQFuyY8XL1SMAYcJhK+arcrnaK6Y67L7c9KNiZc9KBzjK78gX45vdq2
         fWldu7uQcP7wNF5Sw6pbwa7+vn6JqOlO+zfDXQLoa1RqzpZkESqYso19Yuvkf+f2xcVu
         Hshw==
X-Forwarded-Encrypted: i=1; AJvYcCX2TIXYc7FbonBa3Dfg79i+5p25Sn90kNJDAlhe0ZQLajqu0Tzr2ZfAniG92s1XWYdqPiMmwaiY+tVAGg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwbFwcUw6wSrIzHccX4gqAbyZqrvuRStzdTn/h0FMwHYPYELfp3
	+oH++fVND9DeWIw4bth2oGaZNlJ4ztPRZ6EUYSRQjaqEVTF4ohBxD/mURXdkyx/bIvOyI+Uagqz
	2pr66eq624WwGewbiBATRDKrEEGpyHNo=
X-Gm-Gg: AY/fxX7XEPBIpjQdMh1AetgK4a7ndu17UC6fbhxWZq4c1uvonnEVIB+WLoNmUXgfaY+
	mEzlZS0s0fr7aBmp3buGa7YSjIXpGEDL+LZaKl2AOFoj0l4e/NPt85jwKEkE5wsBQ0x3N7qATLG
	8TDUm/O+Rh4CImAFo9mkxFQ0n5gLMy7J2qCe8+/NMN7tLG9YRZk1RZBqtjFa2c1bZPGsxYkN3RO
	aRlq28DthwDRIhwbYGlTd34oY3Ac/Qn70N/u084ChB+GNMpS9wr1Qn9u/XuSyVsHsPWJkw+
X-Google-Smtp-Source: AGHT+IE85Xv0u/sx6VfPNzN3g4Tl7u3d0ImAA0DZGLPPhQUIIiFLjZzVvS+WAuRYWIBQ7d8QfLpIaV6TgcnURt8BOek=
X-Received: by 2002:a05:690c:4a0c:b0:787:e3c1:8c with SMTP id
 00721157ae682-78c9d7cdacfmr5671147b3.64.1765331191298; Tue, 09 Dec 2025
 17:46:31 -0800 (PST)
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
In-Reply-To: <87y0ncrons.wl-tiwai@suse.de>
From: Askar Safin <safinaskar@gmail.com>
Date: Wed, 10 Dec 2025 04:45:55 +0300
X-Gm-Features: AQt7F2rd32LSsdqWLpP58mgpRDLCWij5Xhm4_fvW6LhI8L_uc3Zw-8pHnicMoVI
Message-ID: <CAPnZJGCknqB3XjNY5zhD7i84pz+uL+v4OUgw04ADxR-W=CAeGA@mail.gmail.com>
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

On Tue, Dec 9, 2025 at 12:27=E2=80=AFPM Takashi Iwai <tiwai@suse.de> wrote:
> The below one is a revised fix, just to be safer in case the legacy
> driver is disabled, too.  Give it a try.

I just tested both patches (this and previous). Both work.

Also, please, add this for regzbot:
> Fixes: 2d9223d2d64c ("ALSA: hda: Move controller drivers into sound/hda/c=
ontrollers directory")
> Reported-by: Askar Safin <safinaskar@gmail.com>

--=20
Askar Safin
