Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644781A00F2
	for <regressions@lists.linux.dev>; Sat,  8 Mar 2025 09:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741424809; cv=none; b=Bz30bdJRcBx241RWIKsSrWIyjXK29HdJI+IWD+yy0WBIbUzQpNkDTFaqt9hb6DQ/EbDoBNZ2gdo60ZuKFvW+ax9Pbs8GYM8jUrCac+gA4jADM9wWycp88g92+u6YS/GCUpXUBw5t1t6dsXKni+QEOK0/9QOd8jvQkcjVavqWMdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741424809; c=relaxed/simple;
	bh=nfhjE40xxkcPs3x/zKH+iuKpPgn5nQqIk3wcE5A/8bI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lKeQXQTBabj/PvJc6zFN9GfBKMj0V7Xj75FZx2dkTueQB906KRupJq3vVjeNI7Ew9+aQz1CKQcfgRu0SuMumIicoDFjSkC38Are9Bn+N8S1GZUh27RlJNuWlgeT+xW59/PSTG5BQlfQoueOXpWxVqJGjnvHfNRpEhhQ3KqFiW5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LdZdh0S2; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LdZdh0S2"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac256f4b3ecso249174566b.0
        for <regressions@lists.linux.dev>; Sat, 08 Mar 2025 01:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741424806; x=1742029606; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nfhjE40xxkcPs3x/zKH+iuKpPgn5nQqIk3wcE5A/8bI=;
        b=LdZdh0S21I1mkChucDF8vvHNUC9k0xYemCD35dvxwvBD5z2WaOAepX6pZTUQ4GO8q1
         Uz90vgQO1PQyonl4Ih9aNPthOj+NCy2IeIJH4OwJA7RnondzeFg0bt4QN16DD1rM46VF
         eVJ2s6faZS3mUoosoMHYlGgLXulBZsFJXC8jfJHyKh7Lr7zUmGCu+rAiw6lE8p0+Mqt+
         JUK/ZdwVoZ/S1q1N/Fcqa2a3aYNn04+lEDyj2C0o2WgW3khgqWIqiXmJ5keFSBZhSNPS
         csz/jS3V+zk8G5+90zeaPIlaivkwtdyJe4uOZ6yDzdO1W4GQAEjw7ffECCUkCd6Tdxus
         gnMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741424806; x=1742029606;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nfhjE40xxkcPs3x/zKH+iuKpPgn5nQqIk3wcE5A/8bI=;
        b=YkSvT8Kn5UF870U5bjZNXXKU4ocrhjlBKvxK97Rz0qqW6fbix0Ou8Qj25p0dD3gVex
         2NrDY8Qf1ti7QwLIvcDBIfBiTMMYog8O3K81hZArJRFzDpI2+EBbUi5sdpsWkNipKPoz
         sSdMtImCGOLkTGNbUOiIS2Qm2Z7Roy3SBuU7t8/rxJ5f9mc0dTgJDj1WbU6nByqQoBFW
         VTiAtaD3O3/UOyIlBbdTk7y5WPjGa1rZynvZk+auJc51jgmuHOvflc95Qf3AOtX0PUu3
         8TE/UiiJ1irpf/SbQt5nDuES7Jdwgsch1ZMQ8EuRvGIzEqU/4R5+qOSIH+Sh8ytQaUbo
         33nQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuPO2eCvkE2XHLgWhfjDn+954URDSwxUPxm2FlYIHD+1bw9owYSzWrgc2344TeYw4CcrB8LHTpdOIYow==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3pl3FobjQkvdCvyX1vctX07mAzO0h0Ugc536tL4X95oBcoExl
	qotpZeo1YBoJIb5gtVAya7yammGeDADVjasQ284sYGxB02jilSegV+sC0h+ZH0IvgLLgsdjjW0R
	DD296ReZnFtt291jf7BsStK6hV9I=
X-Gm-Gg: ASbGncsfc0cpwSZAz2cSydUvw+JyCDaRxAppkiwfSkBVH0bmnvM+/KmrAzX97LHMbLv
	valh0tjmlO7i5WPi6C5DL9MRsCdbBXBPE2YZlm8QH3P7KCg7JmedROIv7TEDyWkm3lPgw1K0tlL
	b4yH3e8VhOPhVQpXUTgqGk3vLS
X-Google-Smtp-Source: AGHT+IHkeM05YvQ3aCsNf4yKtzCuNpIM0jL/QQ2Us5+xQQOxNr0NPQZlyzAQUOEgBpZrXn/lKU5lNudpr9HcScj5mIU=
X-Received: by 2002:a17:907:9703:b0:ac0:4364:4083 with SMTP id
 a640c23a62f3a-ac26c55ad33mr318540966b.0.1741424805405; Sat, 08 Mar 2025
 01:06:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAMpRfLORiuJOgUmpmjgCC1LZC1Kp0KFzPGXd9KQZELtr35P+eQ@mail.gmail.com>
 <2025030559-radiated-reviver-eebb@gregkh> <CAMpRfLMQ=rWBpYCaco5X4Sh1ecHuiqa91TwsBo6m2MA_UMKM+g@mail.gmail.com>
 <CAMpRfLMakzeazr91DBVyZQnin7y6L9RB+sPFb59U1QZvY3+KBQ@mail.gmail.com>
 <2025030718-dwindle-degrading-94d3@gregkh> <CAMpRfLPLJA4TaJQCeYfn5XRFnVdqJ36yv-1LL7o=kjYOAj9u1Q@mail.gmail.com>
In-Reply-To: <CAMpRfLPLJA4TaJQCeYfn5XRFnVdqJ36yv-1LL7o=kjYOAj9u1Q@mail.gmail.com>
From: =?UTF-8?Q?Se=C3=AFfane_Idouchach?= <seifane53@gmail.com>
Date: Sat, 8 Mar 2025 17:06:29 +0800
X-Gm-Features: AQ5f1Jp1hvuPcDaUxTR56G33cLSG2ApeIhs0Aj6N0KUu2izrRwnaakZ21ArTRiA
Message-ID: <CAMpRfLOmXBFatrp-tuYF=XeruyDLUE=Dk=yxx7N_nHP7NsQ5jA@mail.gmail.com>
Subject: Re: [REGRESSION] Long boot times due to USB enumeration
To: Greg KH <gregkh@linuxfoundation.org>
Cc: dirk.behme@de.bosch.com, rafael@kernel.org, dakr@kernel.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Some development here,

I noticed today that while applying Dan's patch and reverting the
"bad" commit resolves the issue, it only does so on a reboot. The boot
is still slow on a cold boot.
As you said this might very well be a mix of different issues. It is
my own fault for not reporting this regression earlier thinking it
would be fixed.

As a sanity check I retested old LTS releases. I find that v6.1 does
not have the issue on cold boot while v6.6 does. The USB error
messages are there regardless, they just don't impede on the boot
process time.
I am almost 90% positive that those error messages have always been
present on this system, for what it's worth.
I have gone through the troubleshooting step of unplugging all USB
devices and headers and the errors are still present.

If I find the time I might run another bisect between v6.1 and v6.6
doing cold boots instead of reboots and report back. I am just afraid
I will just get back to the initial commit reported since this is what
I first did.

Thank you.
