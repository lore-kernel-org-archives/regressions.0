Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363DD13A275
	for <regressions@lists.linux.dev>; Sun, 14 Jul 2024 16:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720973129; cv=none; b=dCrhKOSu+oXjCuBjUl6A1KRh2BPiCLcMub35NjLqqTVCSvDe5u69Z5GhCxAQVd1gNk7gzMlGpb2CIrY+spf07pgfrikWC0f3UPy0Omt7/5NDuTQQRmCsy/k8MoG6oRnxTfxOci//+Uv2g3Ioixq/rTFnyl+tOffvnYN4cR6i33U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720973129; c=relaxed/simple;
	bh=BThKgLOyiZs0ED0qNul/PfREiwkcu0W/YUKGklz/5DU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aW0G0EgwkBbhWJ77ns06Q02k20RTdWF8cWUdW9pmK6nMFohrwEiLwnNLXYwT5ROzdGj0r2MW+661onV0oJUMwbb62nPUKlXfzaU1HKC+NHqrx2NXIHKhJdn2uDRXx28nefQH8U7HU7shHMGajjnUIPwSoBS30B4cpR9Lpp+vsC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L22cdTWB; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L22cdTWB"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5957040e32aso2265296a12.2
        for <regressions@lists.linux.dev>; Sun, 14 Jul 2024 09:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720973126; x=1721577926; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zzsOW3jPrt4WczAvScEktJZjwhVKZi7MkvjsHuWYwOI=;
        b=L22cdTWBEBF+ta4tnC5XzvXgok8BquOTE+d+8827BfYRcYUzYUwzt53OOWKzHhgSWH
         pkW6UGlr/DYR7DdJKM/IjfMwKZ4nZIcc7lDIDxNAfyxVOR+SUohm4McsU3fMg/Nl7WXu
         2bux01+XyF21cZiQkSAShuvCr3vOxw+Z+0Kfh1hWDJ+DPx+RwxBn6x6WuEZIiorkRen8
         EXzc2VOHqI2pGdqJtuU2YcAGko1CU64/9nogY4LhVmAR2zQAMtvxX27Y2JuSuiPoXaGP
         rV0JjyibkBCXcw4v8mYoKSt8SkWQTfzc6s6UVvDAUZAYnrF/4ovjeeaGEi+vd2jT0usc
         1HjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720973126; x=1721577926;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zzsOW3jPrt4WczAvScEktJZjwhVKZi7MkvjsHuWYwOI=;
        b=Rb7kC0QVF5SUPrCkif8CaA6jblVKxtvQQUivx6VHxyYZEP/ghvNjlMoClHO2rv3VEj
         UsZErPpoqcLfv1tEl8yChN+0GDmbK25c90JTDbeDrtaPo1uJ7u5ZZWs0Hh7jamAaUDB7
         7R59fD8ajvmk40h1Y+kpWOqgC4wz+IPfx+GJxBouEOeSJ2OaFYfigbvNNHAuq7inxW+Y
         TwK/J9OjanaZDlInUUdNVvU7/6miWoQQANrbw+PqDBPNRq31t1QeNC59xbyf37d0swQ/
         YSXgIcjr9UZWh+wHpJ9hxAYsYOginZxlqdfZYuSxRJ9yGuCHdh04c+6E7S1TE+PY+T7h
         ukRg==
X-Forwarded-Encrypted: i=1; AJvYcCVpG6BXqhw8apGjBFAe/LK2Ns5MnrTYzCwWiuJEBLAmOZc1wIiweG7DAY8Qa0qjZGjcg2s9aB541yLAQo8uCDB7KQmUk0jLZJ9Pqpc=
X-Gm-Message-State: AOJu0YwJt86QPnuWzQ4pSKYxtHV2TCSZGYKj1tIb3gk1huDVhZpl8kki
	ukmzhylB8u2SyBFT+trqp0oh4nqGs15WqhiuQjpABeUezkY8dHXR
X-Google-Smtp-Source: AGHT+IE0HZvjsq7HBzHlKX6FbekQ5XaoHXqLiwC3jNlpB+voSFxqC7aMQAWXjZQzIO5j1pfzY67A1g==
X-Received: by 2002:a05:6402:1eca:b0:57c:5d4a:4122 with SMTP id 4fb4d7f45d1cf-594bac74fbemr14077949a12.9.1720973126324;
        Sun, 14 Jul 2024 09:05:26 -0700 (PDT)
Received: from eldamar.lan (c-82-192-242-114.customer.ggaweb.ch. [82.192.242.114])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-59b255275bcsm2206984a12.48.2024.07.14.09.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jul 2024 09:05:25 -0700 (PDT)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id 0BF49BE2EE8; Sun, 14 Jul 2024 18:05:25 +0200 (CEST)
Date: Sun, 14 Jul 2024 18:05:25 +0200
From: Salvatore Bonaccorso <carnil@debian.org>
To: =?utf-8?Q?Micha=C5=82?= Pecio <michal.pecio@gmail.com>
Cc: elatllat@gmail.com, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	mathias.nyman@linux.intel.com, niklas.neronin@linux.intel.com,
	stable@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [PATCH 6.1 000/102] 6.1.98-rc1 review
Message-ID: <ZpP3RU-MKb4pMmZH@eldamar.lan>
References: <CA+3zgmsCgQs_LVV6fOwu3v2t_Vd=C3Wrv9QrbNpsmMq4RD=ZoQ@mail.gmail.com>
 <20240714173043.668756e4@foxbook>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240714173043.668756e4@foxbook>

Hi,

On Sun, Jul 14, 2024 at 05:32:39PM +0200, Michał Pecio wrote:
> This looks like bug 219039, please see if my suggested solution works.
> 
> The upstream commit is correct, because the call to inc_deq() has been
> moved outside handle_tx_event() so there is no longer this critical
> difference between doing 'goto cleanup' and 'return 0'. The intended
> change of this commit also makes sense to me.
> 
> This refactor is already present in v6.9 so I don't think the commit
> will have any effect besides fixing the isochronous bug which it is
> meant to fix.
> 
> But it is not present in v6.6 and v6.1, so they break/crash/hang/etc.
> Symptoms may vary, but I believe the root cause is the same because the
> code is visibly wrong.
> 
> 
> I would like to use this opportunity to point out that the xhci driver
> is currenty undergoing (much needed IMO) cleanups and refactors and
> this is not the first time when a naive, verbatim backport is attempted
> of a patch which works fine on upstream, but causes problems on earlier
> kernels. These things need special scrutiny, beyond just "CC:stable".

For tracking I guess this should go as well to the regressions list?

#regzbot introduced: 948554f1bb16e15b90006c109c3a558c66d4c4ac
#regzbot title: freezes on plugging USB connector due to 948554f1bb16 ("usb: xhci: prevent potential failure in handle_tx_event() for Transfer events without TRB")
#regzbot monitor: https://bugzilla.kernel.org/show_bug.cgi?id=219039

Thorsten I hope I got the most bits correctly, how would one inform
regzbot about the regresssion for 6.1.98 and 6.6.39 but not happening
in the upper versions?

Regards,
Salvatore
