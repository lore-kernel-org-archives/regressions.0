Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADEBA2E3AFB
	for <regressions@lists.linux.dev>; Thu,  3 Jul 2025 10:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751540314; cv=none; b=NiQyZBO6gbBl54b4GvWvrb8T9VeS5Ao9whsvZXW5BH6RcQBFy/MyBid/f5KD0TOGYKDOBq8F/GXIK4wFFA+XMJvyMN3AiZ1KRiw9qqr9gDVklFJ4WHFL0nls2CtGRv0pEoPKDx55O1hePID7Q8nGDgk2mSjz/39zbJbqJ8nSFoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751540314; c=relaxed/simple;
	bh=QT+UMTSngX/Y5p2qhC+hFL6HSZRCai4FY0HH6/GPYOk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ofLTkQJ414y0tVUoFEoBcetdQo/f9z2KXWTVGhNqgTlFRov/cbpwGjurywylHwOpc060DT6owk3zz08MvrH44GPLwdp7ruN/RlaC9eR0T5mqvYtnu2Z9YC6AYI3CtRSpgXaeSVQHPdwdr4vnyidCAZsivxfr5vt/O3JRvk/C2Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UUMtqbQ3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UUMtqbQ3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EDC2C4CEEB
	for <regressions@lists.linux.dev>; Thu,  3 Jul 2025 10:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751540314;
	bh=QT+UMTSngX/Y5p2qhC+hFL6HSZRCai4FY0HH6/GPYOk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UUMtqbQ3Q2tLXlhwGDUdoan9xc3WM2AN2sZk09QhjdZ6ePqDJIHhw2cq7nV7JmXrZ
	 cCFONrm9GtlYnZuMKwbylvB2YJ8e2rZnpJq6KrXJSOcdjrAshC08fsxWtq941XBUUZ
	 llTQ17F5I/J6tD6LlzE7kHKyWm3+bRujictY3LQApyRwCuF8jA3LA9hWnQFWMJSIFF
	 GckamwHVs3tKhXs5f0UGJ8KbM47CjtCJFPoCdXX4XUsTgx/wbsjPXq1Z5uIOO0+7eV
	 CbdbpUVR4FVaPypIv53FNeuvVlR68qir/bXbLDvC+pqsQR6Z4gKHiI9DtVbm1CLobY
	 TBwdynt5Uu7RQ==
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6113f0cafb2so2524524eaf.1
        for <regressions@lists.linux.dev>; Thu, 03 Jul 2025 03:58:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUOrklG0UPD6DjZzSPvqz0XMJ0+JjNnp7w5wkP5plsMpqHvCJQeOmGpQbMsuf7ZAw0OyJFQr1bdEp10Ig==@lists.linux.dev
X-Gm-Message-State: AOJu0YywozKbtKNstGm+370mmMQxdjNbOVGj0r3a6oJ3GZhtO6C7U8jA
	AreOPE8tRpG5unpuxOXXN63sY//VUtgREBgLBfKc8zSr94J+3nXctQiI8Xjr+UNkrjB6CEG0IZ7
	9jaurwZjgw5RgylxT5VJTDBZwoIB8As0=
X-Google-Smtp-Source: AGHT+IEkZIY74KxHtqE7rgWM1y5n2usPPPIJL/bq5hv2EkY0c5oJanY/D7gdAy71hBobfx5xsxXMvwili84lBtFf7Rw=
X-Received: by 2002:a05:6820:2083:b0:612:be:496 with SMTP id
 006d021491bc7-61200f9ca09mr3829652eaf.2.1751540313630; Thu, 03 Jul 2025
 03:58:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <87C1B2AF-D430-4568-B620-14B941A8ABA4@linux.dev>
In-Reply-To: <87C1B2AF-D430-4568-B620-14B941A8ABA4@linux.dev>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 3 Jul 2025 12:58:21 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0hvPs2hSP+68+dAgtG-iJR8TBptt4ObTbB5iCf2=EXe=A@mail.gmail.com>
X-Gm-Features: Ac12FXwk9R5RiEcUHk0ScgMN2y-X4qKTkjOo1EH-N_g8hmSYHRt3xtbFm79bzTc
Message-ID: <CAJZ5v0hvPs2hSP+68+dAgtG-iJR8TBptt4ObTbB5iCf2=EXe=A@mail.gmail.com>
Subject: Re: [REGRESSION] - Multiple userspace implementations of battery
 estimate broken after "ACPI: battery: negate current when discharging"
To: Matthew Schwartz <matthew.schwartz@linux.dev>
Cc: pmarheine@chromium.org, regressions@lists.linux.dev, 
	stable@vger.kernel.org, rafael.j.wysocki@intel.com, 
	linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jul 3, 2025 at 3:55=E2=80=AFAM Matthew Schwartz
<matthew.schwartz@linux.dev> wrote:
>
> Hello,
>
> I installed kernel 6.15.4 to find that my battery estimate on my handheld=
 gaming device was completely inaccurate, instead giving negative values an=
d an unknown estimated battery life in multiple places.
>
> After bisecting, I landed on "ACPI: battery: negate current when discharg=
ing=E2=80=9D as the bad commit. This commit breaks not one but several user=
space implementations of battery monitoring: Steam and MangoHud. Perhaps it=
 breaks more, but those are the two I have noticed so far.

Thanks for letting me know, I'm queuing up a revert of this one.
